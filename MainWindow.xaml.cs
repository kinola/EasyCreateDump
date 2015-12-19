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
                }
            }
        }

        private void MetroWindow_Loaded(object sender, RoutedEventArgs e)
        {
            connectionString.Text = ConfigurationManager.AppSettings["connectionString"];
            LoadCombobox(true);
        }

        private async void LoadCombobox(bool firstLoad)
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

        private void ButtonClicked(object sender, RoutedEventArgs e)
        {
            LoadCombobox(false);
        }
    }
}
