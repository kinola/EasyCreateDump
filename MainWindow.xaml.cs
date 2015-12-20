using MySql.Data.MySqlClient;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using MahApps.Metro.Controls;
using MahApps.Metro.Controls.Dialogs;
using System.Data;
using System.Configuration;
using System.Threading.Tasks;
using AesPackageFromScratch;
using System.Threading;
using System.ComponentModel;
using System;
using System.IO;
using System.Diagnostics;
using System.Collections.Generic;
using System.Collections;
using System.Runtime.InteropServices;

namespace WpfApplication1
{
    /// <summary>
    /// Logique d'interaction pour MainWindow.xaml
    /// </summary>
    public partial class MainWindow : MetroWindow
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void ComboBoxSelectionChanged(object sender, EventArgs e)
        {
            var value = comboBox.Text;

            if (!string.IsNullOrEmpty(value))
            {
                LaunchBackup(value);
            }
        }

        private void ComboBoxDatabaseSelectionChanged(object sender, EventArgs e)
        {
            var value = comboBoxDatabase.Text;

            if (!string.IsNullOrEmpty(value))
            {
                SetDatagrid(value);
            }
        }

        private async void LaunchBackup(string value, [Optional]Dictionary<string, string> dictionaryTables)
        {
            string connectionStringTemp = connectionString.Text;

            var controller = await this.ShowMessageAsync("Confirmation", string.Format("Vous allez lancer le DUMP sur {0} ?", value), MessageDialogStyle.AffirmativeAndNegative);
            if (controller == MessageDialogResult.Affirmative)
            {
                CancellationTokenSource cancellationTokenSource = new CancellationTokenSource();
                CancellationToken cancellationToken = cancellationTokenSource.Token;

                Task task = Task.Factory.StartNew(() =>
                {
                    var back = new Backup(string.Join(connectionStringTemp, string.Format("database={0};", value), ";"), Path.Combine(System.AppDomain.CurrentDomain.BaseDirectory, string.Format("{0}.sql", value)));
                    if (dictionaryTables == null)
                    {
                        back.GenerateBackup();
                    }
                    else
                    {
                        back.GenerateBackup(dictionaryTables);
                    }
                }, cancellationToken);

                task.Wait();

                await this.ShowMessageAsync("Validation", "Export terminé dans le répertoire courant");

                Process.Start(System.AppDomain.CurrentDomain.BaseDirectory);
            }
        }

        private void MetroWindow_Loaded(object sender, RoutedEventArgs e)
        {
            SetTools();
            SetCombobox(true);
        }

        private void SetDatagrid(string value)
        {
            var connString = connectionString.Text;
            MySqlConnection connection = null;

            try
            {
                connection = new MySqlConnection(string.Format("{0};database={1}", connString, value));
            }
            catch (ArgumentException)
            {
                return;
            }

            using (MySqlCommand commandSql = new MySqlCommand())
            {
                commandSql.Connection = connection;
                try
                {
                    var datatableDatas = QueryExpress.GetTable(commandSql, "show tables");
                    var datatableAll = new DataTable();

                    datatableAll.Columns.Add("Choice", typeof(Boolean));
                    datatableAll.Columns.Add("Tables", typeof(string));
                    datatableAll.Columns.Add("SQL command", typeof(string));

                    for (int i = 0; i < datatableDatas.Rows.Count; i++)
                    {
                        datatableAll.Rows.Add(true, datatableDatas.Rows[i][0], string.Format("SELECT * FROM {0}", datatableDatas.Rows[i][0]));
                    }
                    dataGrid.ItemsSource = datatableAll.AsDataView();
                }
                catch (MySqlException)
                {
                    return;
                }
            }

            connection.Close();
        }

        private void ButtonExport(object sender, RoutedEventArgs e)
        {
            Dictionary<string, string> dicoToExport = new Dictionary<string, string>();

            foreach (System.Data.DataRowView dr in dataGrid.ItemsSource)
            {
                dicoToExport.Add(dr[1].ToString(), dr[2].ToString());
            }

            LaunchBackup(comboBoxDatabase.Text, dicoToExport);
        }

        private void SetTools()
        {
            connectionString.Text = ConfigurationManager.AppSettings["connectionString"];
            textBoxServeur.Text = connectionString.Text.Split(';')[0].Replace("server=", string.Empty);
            textBoxLogin.Text = connectionString.Text.Split(';')[1].Replace("user=", string.Empty);
            textBoxPassword.Text = connectionString.Text.Split(';')[2].Replace("pwd=", string.Empty);
        }

        private async void SetCombobox(bool firstLoad)
        {
            var connString = connectionString.Text;
            MySqlConnection connection = null;

            try
            {
                connection = new MySqlConnection(connString);
            }
            catch (ArgumentException)
            {
                await this.ShowMessageAsync("Erreur", "Attention, les informations fournies sont erronées");
                return;
            }

            using (MySqlCommand commandSql = new MySqlCommand())
            {
                commandSql.Connection = connection;
                try
                {
                    var datatableAll = QueryExpress.GetTable(commandSql, "show databases");
                    comboBox.ItemsSource = datatableAll.DefaultView;
                    comboBoxDatabase.ItemsSource = datatableAll.DefaultView;
                }
                catch (MySqlException)
                {
                    await this.ShowMessageAsync("Erreur", "Attention, les informations fournies sont erronées");
                    return;
                }

                if (!firstLoad)
                {
                    await this.ShowMessageAsync("Validation", "Les informations fournies sont correctes");
                }
            }

            connection.Close();
        }

        private void SetConnectionString()
        {
            connectionString.Text = string.Format("server={0};user={1};pwd={2}", textBoxServeur.Text, textBoxLogin.Text, textBoxPassword.Text);
        }

        private void ButtonClicked(object sender, RoutedEventArgs e)
        {
            SetConnectionString();
            SetCombobox(false);
        }
    }
}
