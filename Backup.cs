using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;

namespace AesPackageFromScratch
{
    public class Backup
    {
        private string connexionString = string.Empty;
        public string ConnexionString
        {
            get
            {
                return connexionString;
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
                return fileBackup;
            }

            set
            {
                this.fileBackup = value;
            }
        }
        private string fileBackup = string.Empty;

        private MySqlConnection connexion = null;

        public Backup()
        {

        }

        public Backup(string connexionString, string fileBackup)
        {
            ConnexionString = connexionString;
            InitConnexion();
            FileBackup = fileBackup;
        }

        private void InitConnexion()
        {
            connexion = new MySqlConnection(ConnexionString);
            try
            {
                connexion.Open();
            }
            catch (MySqlException exc)
            {
                throw new Exception(string.Format("Impossible d'ouvrir une connexion ({0}) : {1}", ConnexionString, exc.Message));
            }
        }

        private List<string> GetListToExclude()
        {
            return new List<string>(ConfigurationManager.AppSettings["tablesToExclude"].Split(new char[] { ';' }));
        }

        private Dictionary<string, string> GetDictionaryTables(DataTable datatableAll)
        {
            var listToExclude = GetListToExclude();
            var dictionaryTables = new Dictionary<string, string>();

            for (int i = 0; i < datatableAll.Rows.Count; i++)
            {
                var table = datatableAll.Rows[i][0].ToString();
                if (!listToExclude.Where(x => table.StartsWith(x)).ToList().Any())
                {
                    dictionaryTables.Add(table, string.Format("SELECT * FROM `{0}`", table));
                }
                else
                {
                    dictionaryTables.Add(table, string.Format("SELECT * FROM `{0}` where enreg=0", table));
                }
            }

            return dictionaryTables;
        }

        public void GenerateBackup()
        {
            using (MySqlCommand commandSql = new MySqlCommand())
            {
                using (MySqlBackup backup = new MySqlBackup(commandSql))
                {
                    commandSql.Connection = connexion;
                    var datatableAll = QueryExpress.GetTable(commandSql, "SHOW FULL TABLES");
                    Dictionary<string, string> dictionaryTables = GetDictionaryTables(datatableAll);
                    backup.ExportInfo.TablesToBeExportedDic = dictionaryTables;

                    try
                    {
                        backup.ExportToFile(FileBackup);
                    }
                    catch (Exception exc)
                    {
                        throw new Exception(string.Format("Impossible de générer l'export dans le fichier demandé ({0}) : {1}", FileBackup, exc.Message));
                    }
                    finally
                    {
                        connexion.Close();
                    }
                }
            }
        }

        public void GenerateBackup(Dictionary<string, string> dictionaryTables)
        {
            using (MySqlCommand commandSql = new MySqlCommand())
            {
                using (MySqlBackup backup = new MySqlBackup(commandSql))
                {
                    commandSql.Connection = connexion;
                    var datatableAll = QueryExpress.GetTable(commandSql, "SHOW FULL TABLES");
                    backup.ExportInfo.TablesToBeExportedDic = dictionaryTables;

                    try
                    {
                        backup.ExportToFile(FileBackup);
                    }
                    catch (Exception exc)
                    {
                        throw new Exception(string.Format("Impossible de générer l'export dans le fichier demandé ({0}) : {1}", FileBackup, exc.Message));
                    }
                    finally
                    {
                        connexion.Close();
                    }
                }
            }
        }
    }
}
