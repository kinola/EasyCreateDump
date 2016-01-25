using AesPackageFromScratch;
using MahApps.Metro.Controls;
using MahApps.Metro.Controls.Dialogs;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Diagnostics;
using System.IO;
using System.Runtime.InteropServices;
using System.Threading;
using System.Threading.Tasks;
using System.Windows;

namespace WpfApplication1
{
    public partial class MainWindow : MetroWindow
    {
        public MainWindow()
        {
            this.InitializeComponent();
        }

        private void ButtonClicked(object sender, RoutedEventArgs e)
        {
            this.SetConnectionString();
            this.SetComboboxAsync(false);
        }

        private void ButtonExport(object sender, RoutedEventArgs e)
        {
            var dicoToExport = new Dictionary<string, string>();

            foreach (System.Data.DataRowView dr in dataGrid.ItemsSource)
            {
                if ((bool)dr[0])
                {
                    dicoToExport.Add(dr[1].ToString(), dr[2].ToString());
                }
            }

            this.LaunchBackupAsync(comboBoxDatabase.Text, dicoToExport);
        }

        private void ComboBoxDatabaseSelectionChanged(object sender, EventArgs e)
        {
            var value = comboBoxDatabase.Text;

            if (!string.IsNullOrEmpty(value))
            {
                this.SetDatagrid(value);
            }
        }

        private void ComboBoxSelectionChanged(object sender, EventArgs e)
        {
            var value = comboBox.Text;

            if (!string.IsNullOrEmpty(value))
            {
                this.LaunchBackupAsync(value);
            }
        }

        private async void LaunchBackupAsync(string value, [Optional]Dictionary<string, string> dictionaryTables)
        {
            var connectionStringTemp = connectionString.Text;

            var controller = await this.ShowMessageAsync("Confirmation", $"Vous allez lancer le DUMP sur {value} ?", MessageDialogStyle.AffirmativeAndNegative);
            if (controller == MessageDialogResult.Affirmative)
            {
                using (var cancellationTokenSource = new CancellationTokenSource())
                {
                    var cancellationToken = cancellationTokenSource.Token;
                    var outDirectory = textBoxRepertoireSortie.Text;

                    var task = Task.Factory.StartNew(() =>
                    {
                        var timeStamp = DateTime.Now.ToString("yyyyMMddHHmmssffff");
                        var back = new Backup(string.Join(connectionStringTemp, $"database={value};", ";"), Path.Combine(outDirectory, $"{value}_{timeStamp}.sql"));
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

                    Process.Start(outDirectory);
                }
            }
        }

        private void MetroWindow_Loaded(object sender, RoutedEventArgs e)
        {
            this.SetTools();
            this.SetComboboxAsync(true);
            this.SetTextblock();
        }

        private void SelectNo(object sender, RoutedEventArgs e)
        {
            foreach (System.Data.DataRowView dr in dataGrid.ItemsSource)
            {
                dr[0] = true;
            }
        }

        private void SelectYes(object sender, RoutedEventArgs e)
        {
            foreach (System.Data.DataRowView dr in dataGrid.ItemsSource)
            {
                dr[0] = false;
            }
        }

        private async void SetComboboxAsync(bool firstLoad)
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
            connection.Dispose();
        }

        private void SetConnectionString()
        {
            connectionString.Text = $"server={textBoxServeur.Text};user={textBoxLogin.Text};pwd={textBoxPassword.Text}";
        }

        private void SetDatagrid(string value)
        {
            var connString = connectionString.Text;
            MySqlConnection connection = null;

            try
            {
                connection = new MySqlConnection($"{connString};database={value}");
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
                    using (var datatableAll = new DataTable())
                    {
                        datatableAll.Columns.Add("Choice", typeof(Boolean));
                        datatableAll.Columns.Add("Tables", typeof(string));
                        datatableAll.Columns.Add("SQL command", typeof(string));

                        for (int i = 0; i < datatableDatas.Rows.Count; i++)
                        {
                            datatableAll.Rows.Add(true, datatableDatas.Rows[i][0], $"SELECT * FROM {datatableDatas.Rows[i][0]}");
                        }

                        dataGrid.ItemsSource = datatableAll.AsDataView();
                    }
                }
                catch (MySqlException)
                {
                    return;
                }
            }

            connection.Close();
            connection.Dispose();
        }

        private void SetTools()
        {
            connectionString.Text = ConfigurationManager.AppSettings[nameof(connectionString)];
            textBoxServeur.Text = connectionString.Text.Split(';')[0].Replace("server=", string.Empty);
            textBoxLogin.Text = connectionString.Text.Split(';')[1].Replace("user=", string.Empty);
            textBoxPassword.Text = connectionString.Text.Split(';')[2].Replace("pwd=", string.Empty);
            textBoxRepertoireSortie.Text = System.AppDomain.CurrentDomain.BaseDirectory;
        }

        private void SetTextblock()
        {
            var listTablesExcluded = ConfigurationManager.AppSettings["tablesToExclude"].Split(';');
            textBlock.Text = string.Join(Environment.NewLine, listTablesExcluded);
        }

        private void comboBox_KeyDown(object sender, System.Windows.Input.KeyEventArgs e)
        {
            if (e.Key == System.Windows.Input.Key.Enter)
            {
                this.ComboBoxSelectionChanged(new object(), new EventArgs());
            }
        }

        private void comboBoxDatabase_KeyDown(object sender, System.Windows.Input.KeyEventArgs e)
        {
            if (e.Key == System.Windows.Input.Key.Enter)
            {
                this.ComboBoxDatabaseSelectionChanged(new object(), new EventArgs());
            }
        }
    }
}
