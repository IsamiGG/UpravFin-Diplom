using Microsoft.Win32;
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
    /// Логика взаимодействия для Sotr.xaml
    /// </summary>
    public partial class Sotr : Page
    {
        private Personal PersonalObj = new Personal();
        string fallbackImagePath = @"..\zagl.jpg";

        public Sotr(Personal selectedPersonal)
        {
            InitializeComponent();
            if (selectedPersonal != null)
                PersonalObj = selectedPersonal;

            DataContext = PersonalObj;

            Job.SelectedValuePath = "ID";
            Job.DisplayMemberPath = "Name";
            Job.ItemsSource = FinAdo.entObj.JobTittles.ToList();
        }
        private void button3_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                var jobObj = FinAdo.entObj.JobTittles.FirstOrDefault(x => x.Name == Job.Text);
                PersonalObj.IDJobTittle = Convert.ToInt32(jobObj.ID);
                PersonalObj.DateOfBirth = (Convert.ToDateTime(Dpick2.Text).Date);
                  PersonalObj.Photo = kartinka.Source.ToString();  
                  FinAdo.entObj.Personal.Add(PersonalObj);
                  FinAdo.entObj.SaveChanges();
                 
                  MessageBox.Show("Результат добавлен в базу данных!", "Уведомление", MessageBoxButton.OK, MessageBoxImage.Information);
            }
            catch (Exception ex)
            {
                  MessageBox.Show("Ошибка работы приложения: " + ex.Message.ToString(), "Критический сбой работы приложения", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
        }

        private void Button_Click_3(object sender, RoutedEventArgs e)
        {
          OpenFileDialog openFileDialog = new OpenFileDialog();
            openFileDialog.Filter = "Image files|*.bmp;*.jpg,*.jpeg;*.png;*.tif|All files|*.*";
            openFileDialog.FilterIndex = 1;

            if (openFileDialog.ShowDialog() == true)
            {
                Uri imageUri = new
                    Uri(openFileDialog.FileName);
                kartinka.Source = new BitmapImage(imageUri);
            }
         
        }

        private void Job_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }

        private void button4_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
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

        private void TxbLogin_Copy4_TextChanged(object sender, TextChangedEventArgs e)
        {

        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {

            try
            {
                Uri imageUri = new
                    Uri(PersonalObj.Photo);
                kartinka.Source = new BitmapImage(imageUri);
            }
            catch (Exception)
            {
                Uri fallbackUri = new Uri(fallbackImagePath, UriKind.RelativeOrAbsolute);
                kartinka.Source = new BitmapImage(fallbackUri);
            }

        }

        private void Dpick2_TextChanged(object sender, TextChangedEventArgs e)
        {
            
        }
    }
}
