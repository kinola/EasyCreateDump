﻿using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;

namespace AesPackageFromScratch
{
    public class Backup
    {
        private string connexionString = string.Empty;

        public string ConnexionString
        {
            get
            {
                return this.connexionString;
            }

            set
            {
                this.connexionString = value;
            }
        }

        public string FileBackup
        {
            get
            {
                return this.fileBackup;
            }

            set
            {
                this.fileBackup = value;
            }
        }

        private string fileBackup = string.Empty;

        private MySqlConnection connexion;

        public Backup(string connexionString, string fileBackup)
        {
            this.ConnexionString = connexionString;
            this.InitConnexion();
            this.FileBackup = fileBackup;
        }

        private void InitConnexion()
        {
            this.connexion = new MySqlConnection(this.ConnexionString);
            try
            {
                this.connexion.Open();
            }
            catch (MySqlException exc)
            {
                throw new Exception($"Impossible d'ouvrir une connexion ({this.ConnexionString}) : {exc.Message}");
            }
        }

        private static List<string> GetListToExclude()
        {
            return new List<string>(ConfigurationManager.AppSettings["tablesToExclude"].Split(new char[] { ';' }));
        }

        private static Dictionary<string, string> GetDictionaryTables(DataTable datatableAll)
        {
            var listToExclude = GetListToExclude();
            var dictionaryTables = new Dictionary<string, string>();

            for (int i = 0; i < datatableAll.Rows.Count; i++)
            {
                var table = datatableAll.Rows[i][0].ToString();
                if (!listToExclude.Where(x => table.StartsWith(x)).ToList().Any())
                {
                    dictionaryTables.Add(table, $"SELECT * FROM `{table}`");
                }
                else
                {
                    dictionaryTables.Add(table, $"SELECT * FROM `{table}` where enreg=0");
                }
            }

            return dictionaryTables;
        }

        public static void DeleteComments(string file)
        {
            var lines = File.ReadAllLines(file).Where(a => !a.StartsWith("/*!")).ToList();
            File.WriteAllLines($"{file}_rpl", lines);
            File.Delete(file);
            File.Move($"{file}_rpl", file);
        }

        public void GenerateBackup()
        {
            using (MySqlCommand commandSql = new MySqlCommand())
            {
                using (MySqlBackup backup = new MySqlBackup(commandSql))
                {
                    commandSql.Connection = this.connexion;
                    var datatableAll = QueryExpress.GetTable(commandSql, "SHOW FULL TABLES");
                    var dictionaryTables = GetDictionaryTables(datatableAll);
                    backup.ExportInfo.TablesToBeExportedDic = dictionaryTables;

                    try
                    {
                        backup.ExportToFile(this.FileBackup);
                    }
                    catch (Exception exc)
                    {
                        throw new Exception($"Impossible de générer l'export dans le fichier demandé ({FileBackup}) : {exc.Message}");
                    }
                    finally
                    {
                        this.connexion.Close();
                    }

                    DeleteComments(this.FileBackup);
                }
            }
        }

        public void GenerateBackup(Dictionary<string, string> dictionaryTables)
        {
            using (MySqlCommand commandSql = new MySqlCommand())
            {
                using (MySqlBackup backup = new MySqlBackup(commandSql))
                {
                    commandSql.Connection = this.connexion;
                    var datatableAll = QueryExpress.GetTable(commandSql, "SHOW FULL TABLES");
                    backup.ExportInfo.TablesToBeExportedDic = dictionaryTables;

                    try
                    {
                        backup.ExportToFile(this.FileBackup);
                    }
                    catch (Exception exc)
                    {
                        throw new Exception($"Impossible de générer l'export dans le fichier demandé ({this.FileBackup}) : {exc.Message}");
                    }
                    finally
                    {
                        this.connexion.Close();
                    }
                }
            }
        }
    }
}
