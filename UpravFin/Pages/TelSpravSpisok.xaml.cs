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
    /// Логика взаимодействия для TelSpravSpisok.xaml
    /// </summary>
    public partial class TelSpravSpisok : Page
    {
        private List<Spravochnik> allItems;
        public TelSpravSpisok()
        {
            InitializeComponent();
            allItems = FinAdo.entObj.Spravochnik.ToList();
        }

        private void button1_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new TelSprav(null));
        }

        private void Button2_Click(object sender, RoutedEventArgs e)
        {
            var SpravForRemoving = DgrSprav.SelectedItems.Cast<Spravochnik>().ToList();
            try
            {
                FinAdo.entObj.Spravochnik.RemoveRange(SpravForRemoving);
                FinAdo.entObj.SaveChanges();
                MessageBox.Show("Данные удалены.");

                DgrSprav.ItemsSource = FinAdo.entObj.Spravochnik.ToList();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Подтвердите удаление " + ex.Message.ToString(),
                    "Уведомление",
                    MessageBoxButton.OK,
                    MessageBoxImage.Warning);

            }
        }

        private void button3_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }
        private void Page_IsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
             if (Visibility == Visibility.Visible)
            {
                FinAdo.entObj.ChangeTracker.Entries().ToList().ForEach(x => x.Reload());
                DgrSprav.ItemsSource = FinAdo.entObj.Spravochnik.ToList();
            }
        }

        private void TxbSearch_TextChanged(object sender, TextChangedEventArgs e)
        {
            try
            {
                DgrSprav.ItemsSource = FinAdo.entObj.Spravochnik.Where(x => x.FIO.Contains(TxbSearch.Text)).Take(15).ToList();
                ResultTXB.Text = DgrSprav.Items.Count + "/" + FinAdo.entObj.Spravochnik.Where(x => x.FIO.Contains(TxbSearch.Text)).Count().ToString();
            }
            catch (Exception ex)    
            {
                throw;
            }
        }

        private void DgrSprav_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }

        private void CmbSort_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            {
                if (CmbSort.SelectedIndex == 0)
                {
                    List<Spravochnik> sortMaterials = allItems.OrderBy(x => x.FIO).ToList();
                    DgrSprav.ItemsSource = sortMaterials;
                }
                else if (CmbSort.SelectedIndex == 1)
                {
                    List<Spravochnik> sortMaterials = allItems.OrderBy(x => x.FIO).ToList();
                    DgrSprav.ItemsSource = sortMaterials;
                }
                else if (CmbSort.SelectedIndex == 2)
                {
                    List<Spravochnik> sortMaterials = allItems.OrderBy(x => x.IDJobTittle).ToList();
                    DgrSprav.ItemsSource = sortMaterials;
                }
                else if (CmbSort.SelectedIndex == 3)
                {
                    List<Spravochnik> sortMaterials = allItems.OrderBy(x => x.IDJobTittle).ToList();
                    DgrSprav.ItemsSource = sortMaterials;
                }
                else if (CmbSort.SelectedIndex == 4)
                {
                    List<Spravochnik> sortMaterials = allItems.OrderByDescending(x => x.Nkabineta).ToList();
                    DgrSprav.ItemsSource = sortMaterials;
                }
                else if (CmbSort.SelectedIndex == 5)
                {
                    List<Spravochnik> sortMaterials = allItems.OrderByDescending(x => x.Nkabineta).ToList();
                    DgrSprav.ItemsSource = sortMaterials;
                }
                else if (CmbSort.SelectedIndex == 6)
                {
                    List<Spravochnik> sortMaterials = allItems.OrderBy(x => x.Telephone).ToList();
                    DgrSprav.ItemsSource = sortMaterials;
                }
                else if (CmbSort.SelectedIndex == 7)
                {
                    List<Spravochnik> sortMaterials = allItems.OrderBy(x => x.Telephone).ToList();
                    DgrSprav.ItemsSource = sortMaterials;
                }
            }
        }

        private void Button2_Click1(object sender, RoutedEventArgs e)
        {

        }

        private void BtnEdit_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new TelSprav((sender as Button).DataContext as Spravochnik));
            
        }
    }
}
