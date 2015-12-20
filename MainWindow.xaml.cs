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

        private async void ComboBoxSelectionChanged(object sender, EventArgs e)
        {
            string connectionStringTemp = connectionString.Text;

            var value = comboBox.Text;

            if (!string.IsNullOrEmpty(value))
            {
                var controller = await this.ShowMessageAsync("Confirmation", string.Format("Vous allez lancer le DUMP sur {0} ?", value), MessageDialogStyle.AffirmativeAndNegative);
                if (controller == MessageDialogResult.Affirmative)
                {
                    CancellationTokenSource cancellationTokenSource = new CancellationTokenSource();
                    CancellationToken cancellationToken = cancellationTokenSource.Token;

                    Task task = Task.Factory.StartNew(() =>
                    {
                        var back = new Backup(string.Join(connectionStringTemp, string.Format("database={0};", value), ";"), Path.Combine(System.AppDomain.CurrentDomain.BaseDirectory, string.Format("{0}.sql", value)));
                        back.GenerateBackup();
                    }, cancellationToken);

                    task.Wait();

                    await this.ShowMessageAsync("Validation", "Export terminé dans le répertoire courant");

                    Process.Start(System.AppDomain.CurrentDomain.BaseDirectory);
                }
            }
        }

        private void MetroWindow_Loaded(object sender, RoutedEventArgs e)
        {
            SetTools();
            SetDatagrid();
            SetCombobox(true);
        }

        private void SetDatagrid()
        {
            var connString = connectionString.Text;
            MySqlConnection connection = null;

            try
            {
                connection = new MySqlConnection(connString);
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
                    var datatableDatas = QueryExpress.GetTable(commandSql, "show databases");
                    var datatableAll = new DataTable();

                    datatableAll.Columns.Add("Choice", typeof(Boolean));
                    datatableAll.Columns.Add("Database", typeof(string));
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
        

        private void ButtonRefresh(object sender, RoutedEventArgs e)
        {
            SetDatagrid();
        }

        private void ButtonExport(object sender, RoutedEventArgs e)
        {

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

        private void ToolsClicked(object sender, RoutedEventArgs e)
        {
            tabControl.SelectedIndex = 2;
        }
    }
}
