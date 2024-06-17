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
    /// Логика взаимодействия для AnalizFinSpisok.xaml
    /// </summary>
    public partial class AnalizFinSpisok : Page
    {
        private List<FinSostoyanie> allItems;
        public AnalizFinSpisok()
        {
            InitializeComponent();
            allItems = FinAdo.entObj.FinSostoyanie.ToList();
        }

        private void Button2_Click(object sender, RoutedEventArgs e)
        {
            var FinSostojanieForRemoving = DgrFinSost.SelectedItems.Cast<FinSostoyanie>().ToList();
            try
            {
                FinAdo.entObj.FinSostoyanie.RemoveRange(FinSostojanieForRemoving);
                FinAdo.entObj.SaveChanges();
                MessageBox.Show("Данные удалены.");

                DgrFinSost.ItemsSource = FinAdo.entObj.FinSostoyanie.ToList();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Подтвердите удаление " + ex.Message.ToString(),
                    "Уведомление",
                    MessageBoxButton.OK,
                    MessageBoxImage.Warning);
            }
        }

        private void Page_IsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        { 
            
                if (Visibility == Visibility.Visible)
                {
                    FinAdo.entObj.ChangeTracker.Entries().ToList().ForEach(x => x.Reload()); 
                    DgrFinSost.ItemsSource = FinAdo.entObj.FinSostoyanie.ToList();
                }

           // if (LogAdm == true)
            {
                Button1.IsEnabled = true;
                Button2.IsEnabled = true;
            }
        }

        private void Button1_Click(object sender, RoutedEventArgs e)
        {
           NavigationService.Navigate(new AnalizFin(null));
        }

        private void Button3_Click(object sender, RoutedEventArgs e)
        {
           NavigationService.GoBack();
        }

        private void TxbSearch_TextChanged(object sender, TextChangedEventArgs e)
        {
            try
            {
                DgrFinSost.ItemsSource = FinAdo.entObj.FinSostoyanie.Where(x => x.FinanceSostoyanie.Contains(TxbSearch.Text)).Take(15).ToList();
                ResultTXB.Text = DgrFinSost.Items.Count + "/" + FinAdo.entObj.FinSostoyanie.Where(x => x.FinanceSostoyanie.Contains(TxbSearch.Text)).Count().ToString();
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
                    List<FinSostoyanie> sortMaterials = allItems.OrderBy(x => x.DateBegin).ToList();
                    DgrFinSost.ItemsSource = sortMaterials;
                }
                else if (CmbSort.SelectedIndex == 1)
                {
                    List<FinSostoyanie> sortMaterials = allItems.OrderBy(x => x.DateBegin).ToList();
                    DgrFinSost.ItemsSource = sortMaterials;
                }
                else if (CmbSort.SelectedIndex == 2)
                {
                    List<FinSostoyanie> sortMaterials = allItems.OrderBy(x => x.DateEnd).ToList();
                    DgrFinSost.ItemsSource = sortMaterials;
                }
                else if (CmbSort.SelectedIndex == 3)
                {
                    List<FinSostoyanie> sortMaterials = allItems.OrderBy(x => x.DateEnd).ToList();
                    DgrFinSost.ItemsSource = sortMaterials;
                }
                else if (CmbSort.SelectedIndex == 4)
                {
                    List<FinSostoyanie> sortMaterials = allItems.OrderByDescending(x => x.SK).ToList();
                    DgrFinSost.ItemsSource = sortMaterials;
                }
                else if (CmbSort.SelectedIndex == 5)
                {
                    List<FinSostoyanie> sortMaterials = allItems.OrderByDescending(x => x.SK).ToList();
                    DgrFinSost.ItemsSource = sortMaterials;
                }
                else if (CmbSort.SelectedIndex == 6)
                {
                    List<FinSostoyanie> sortMaterials = allItems.OrderBy(x => x.VOA).ToList();
                    DgrFinSost.ItemsSource = sortMaterials;
                }
                else if (CmbSort.SelectedIndex == 7)
                {
                    List<FinSostoyanie> sortMaterials = allItems.OrderBy(x => x.VOA).ToList();
                    DgrFinSost.ItemsSource = sortMaterials;
                }
                else if (CmbSort.SelectedIndex == 8)
                {
                    List<FinSostoyanie> sortMaterials = allItems.OrderBy(x => x.DKZ).ToList();
                    DgrFinSost.ItemsSource = sortMaterials;
                }
                else if (CmbSort.SelectedIndex == 9)
                {
                    List<FinSostoyanie> sortMaterials = allItems.OrderBy(x => x.DKZ).ToList();
                    DgrFinSost.ItemsSource = sortMaterials;
                }
                else if (CmbSort.SelectedIndex == 10)
                {
                    List<FinSostoyanie> sortMaterials = allItems.OrderBy(x => x.KKZ).ToList();
                    DgrFinSost.ItemsSource = sortMaterials;
                }
                else if (CmbSort.SelectedIndex == 11)
                {
                    List<FinSostoyanie> sortMaterials = allItems.OrderBy(x => x.KKZ).ToList();
                    DgrFinSost.ItemsSource = sortMaterials;
                }
                else if (CmbSort.SelectedIndex == 12)
                {
                    List<FinSostoyanie> sortMaterials = allItems.OrderBy(x => x.SZ).ToList();
                    DgrFinSost.ItemsSource = sortMaterials;
                }
                else if (CmbSort.SelectedIndex == 13)
                {
                    List<FinSostoyanie> sortMaterials = allItems.OrderBy(x => x.SZ).ToList();
                    DgrFinSost.ItemsSource = sortMaterials;
                }
            }
        }

        private void BtnEdit1_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new AnalizFin((sender as Button).DataContext as FinSostoyanie));
        }

        private void Button2_Click_1(object sender, RoutedEventArgs e)
        {
            var SpravForRemoving = DgrFinSost.SelectedItems.Cast<FinSostoyanie>().ToList();
            try
            {
                FinAdo.entObj.FinSostoyanie.RemoveRange(SpravForRemoving);
                FinAdo.entObj.SaveChanges();
                MessageBox.Show("Данные удалены.");

                DgrFinSost.ItemsSource = FinAdo.entObj.FinSostoyanie.ToList();
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
