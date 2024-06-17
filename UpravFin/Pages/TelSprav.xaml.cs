using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace UpravFin.Pages
{
    /// <summary>
    /// Логика взаимодействия для TelSprav.xaml
    /// </summary>
    public partial class TelSprav : Page
    {
        private Spravochnik SpravochnikObj = new Spravochnik();
        public TelSprav(Spravochnik selectedSpravochnik)
        {
            InitializeComponent();
            if (selectedSpravochnik != null)
                SpravochnikObj = selectedSpravochnik;

            DataContext = SpravochnikObj;

            Job12.SelectedValuePath = "ID";
            Job12.DisplayMemberPath = "Name";
            Job12.ItemsSource = FinAdo.entObj.JobTittles.ToList();
        }  
        private void Button4_Click(object sender, RoutedEventArgs e)
        {

            try
            {

                var jobObj = FinAdo.entObj.JobTittles.FirstOrDefault(x => x.Name == Job12.Text);
                

                Spravochnik SpravochnikObj = new Spravochnik()
                {

                    FIO =TxbLogin12.Text,
                    IDJobTittle = Convert.ToInt32(jobObj.ID),
                    Nkabineta = Convert.ToInt32(TxbLogin_Copy1.Text),
                    Telephone = TxbLogin_Copy3.Text,
                    
                };

                FinAdo.entObj.Spravochnik.Add(SpravochnikObj);
                FinAdo.entObj.SaveChanges();

                MessageBox.Show("Результат добавлен в базу данных!", "Уведомление", MessageBoxButton.OK, MessageBoxImage.Information);
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ошибка работы приложения: " + ex.Message.ToString(), "Критический сбой работы приложения", MessageBoxButton.OK, MessageBoxImage.Warning);
            }  
        }

        private void Button3_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }

        private void Job_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }

        private void button5_Click(object sender, RoutedEventArgs e)
        {
            try
            {

                FinAdo.entObj.SaveChanges();

                MessageBox.Show("Данные сохранены!", "Уведомление", MessageBoxButton.OK, MessageBoxImage.Information);
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ошибка работы приложения: " + ex.Message.ToString(), "Критический сбой работы приложения", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
        }
    }
}
