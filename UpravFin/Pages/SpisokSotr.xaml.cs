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
    /// Логика взаимодействия для SpisokSotr.xaml
    /// </summary>
    public partial class SpisokSotr : Page
    {

        private List<Personal> allItems;
        public SpisokSotr()
        {
            InitializeComponent();
            allItems = FinAdo.entObj.Personal.ToList();

        }
        private void button3_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }

        private void button1_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new Sotr(null));
        }

        private void DgrSotr_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }
        private void Page_IsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            if (Visibility == Visibility.Visible)
            {
                FinAdo.entObj.ChangeTracker.Entries().ToList().ForEach(x => x.Reload());
                DgrSotr.ItemsSource = FinAdo.entObj.Personal.ToList();
            }
        }

        private void BtnEdit_Click(object sender, RoutedEventArgs e)
        {
           
        }

        private void TxbSearch_TextChanged(object sender, TextChangedEventArgs e)
        {
            try
            {
                DgrSotr.ItemsSource = FinAdo.entObj.Personal.Where(x => x.FIO.Contains(TxbSearch.Text)).Take(15).ToList();
                ResultTXB.Text = DgrSotr.Items.Count + "/" + FinAdo.entObj.Personal.Where(x => x.FIO.Contains(TxbSearch.Text)).Count().ToString();
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        private void CmbSort_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            {
                if (CmbSort.SelectedIndex == 0)
                {
                    List<Personal> sortMaterials = allItems.OrderBy(x => x.FIO).ToList();
                    DgrSotr.ItemsSource = sortMaterials;
                }
                else if (CmbSort.SelectedIndex == 1)
                {
                    List<Personal> sortMaterials = allItems.OrderBy(x => x.FIO).ToList();
                    DgrSotr.ItemsSource = sortMaterials;
                }
                else if (CmbSort.SelectedIndex == 2)
                {
                    List<Personal> sortMaterials = allItems.OrderBy(x => x.DateOfBirth).ToList();
                    DgrSotr.ItemsSource = sortMaterials;
                }
                else if (CmbSort.SelectedIndex == 3)
                {
                    List<Personal> sortMaterials = allItems.OrderBy(x => x.DateOfBirth).ToList();
                    DgrSotr.ItemsSource = sortMaterials;
                }
                else if (CmbSort.SelectedIndex == 4)
                {
                    List<Personal> sortMaterials = allItems.OrderByDescending(x => x.Pol).ToList();
                    DgrSotr.ItemsSource = sortMaterials;
                }
                else if (CmbSort.SelectedIndex == 5)
                {
                    List<Personal> sortMaterials = allItems.OrderByDescending(x => x.Pol).ToList();
                    DgrSotr.ItemsSource = sortMaterials;
                }
                else if (CmbSort.SelectedIndex == 6)
                {
                    List<Personal> sortMaterials = allItems.OrderBy(x => x.IDJobTittle).ToList();
                    DgrSotr.ItemsSource = sortMaterials;
                }
                else if (CmbSort.SelectedIndex == 7)
                {
                    List<Personal> sortMaterials = allItems.OrderBy(x => x.IDJobTittle).ToList();
                    DgrSotr.ItemsSource = sortMaterials;
                }
                else if (CmbSort.SelectedIndex == 8)
                {
                    List<Personal> sortMaterials = allItems.OrderBy(x => x.Address).ToList();
                    DgrSotr.ItemsSource = sortMaterials;
                }
                else if (CmbSort.SelectedIndex == 9)
                {
                    List<Personal> sortMaterials = allItems.OrderBy(x => x.Address).ToList();
                    DgrSotr.ItemsSource = sortMaterials;
                }
                else if (CmbSort.SelectedIndex == 10)
                {
                    List<Personal> sortMaterials = allItems.OrderBy(x => x.Telephone).ToList();
                    DgrSotr.ItemsSource = sortMaterials;
                }
                else if (CmbSort.SelectedIndex == 11)
                {
                    List<Personal> sortMaterials = allItems.OrderBy(x => x.Telephone).ToList();
                    DgrSotr.ItemsSource = sortMaterials;
                }
                else if (CmbSort.SelectedIndex == 12)
                {
                    List<Personal> sortMaterials = allItems.OrderBy(x => x.PassportData).ToList();
                    DgrSotr.ItemsSource = sortMaterials;
                }
                else if (CmbSort.SelectedIndex == 13)
                {
                    List<Personal> sortMaterials = allItems.OrderBy(x => x.PassportData).ToList();
                    DgrSotr.ItemsSource = sortMaterials;
                }
                else if (CmbSort.SelectedIndex == 14)
                {
                    List<Personal> sortMaterials = allItems.OrderBy(x => x.INN).ToList();
                    DgrSotr.ItemsSource = sortMaterials;
                }
                else if (CmbSort.SelectedIndex == 15)
                {
                    List<Personal> sortMaterials = allItems.OrderBy(x => x.INN).ToList();
                    DgrSotr.ItemsSource = sortMaterials;
                }
                else if (CmbSort.SelectedIndex == 16)
                {
                    List<Personal> sortMaterials = allItems.OrderBy(x => x.SNILS).ToList();
                    DgrSotr.ItemsSource = sortMaterials;
                }
                else if (CmbSort.SelectedIndex == 17)
                {
                    List<Personal> sortMaterials = allItems.OrderBy(x => x.SNILS).ToList();
                    DgrSotr.ItemsSource = sortMaterials;
                }
            }
        }

        private void DgrSotr_SelectionChanged_1(object sender, SelectionChangedEventArgs e)
        {

        }

        private void BtnEdit_Click_1(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new Sotr((sender as Button).DataContext as Personal));
        }
        private void Button2_Click_1(object sender, RoutedEventArgs e)
        {
            var SotrForRemoving = DgrSotr.SelectedItems.Cast<Personal>().ToList();
            try
            {
                FinAdo.entObj.Personal.RemoveRange(SotrForRemoving);
                FinAdo.entObj.SaveChanges();
                MessageBox.Show("Данные удалены.");

                DgrSotr.ItemsSource = FinAdo.entObj.Personal.ToList();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Подтвердите удаление " + ex.Message.ToString(),
                    "Уведомление",
                    MessageBoxButton.OK,
                    MessageBoxImage.Warning);
            }
        }
    }
}
