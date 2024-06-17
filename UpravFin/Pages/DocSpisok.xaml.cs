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
    /// Логика взаимодействия для DocSpisok.xaml
    /// </summary>
    public partial class DocSpisok : Page
    {
        private List<Doc> allItems;
        public DocSpisok()
        {
            InitializeComponent();
            allItems = FinAdo.entObj.Doc.ToList();
        }

        private void button1_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new PageDoc(null));
        }

        private void Button2_Click(object sender, RoutedEventArgs e)
        {
            var DocForRemoving = DgrDoc.SelectedItems.Cast<Doc>().ToList();
            try
            {
                FinAdo.entObj.Doc.RemoveRange(DocForRemoving);
                FinAdo.entObj.SaveChanges();
                MessageBox.Show("Данные удалены.");

                DgrDoc.ItemsSource = FinAdo.entObj.Doc.ToList();
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
           DgrDoc.ItemsSource = FinAdo.entObj.Doc.ToList();
          }
        }

        private void TxbSearch_TextChanged(object sender, TextChangedEventArgs e)
        {
            try
            {
                DgrDoc.ItemsSource = FinAdo.entObj.Doc.Where(x => x.Name.Contains(TxbSearch.Text)).Take(15).ToList();
                ResultTXB.Text = DgrDoc.Items.Count + "/" + FinAdo.entObj.Doc.Where(x => x.Name.Contains(TxbSearch.Text)).Count().ToString();
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
                    List<Doc> sortMaterials = allItems.OrderBy(x => x.Vid).ToList();
                    DgrDoc.ItemsSource = sortMaterials;
                }
                else if (CmbSort.SelectedIndex == 1)
                {
                    List<Doc> sortMaterials = allItems.OrderBy(x => x.Vid).ToList();
                    DgrDoc.ItemsSource = sortMaterials;
                }
                else if (CmbSort.SelectedIndex == 2)
                {
                    List<Doc> sortMaterials = allItems.OrderBy(x => x.Number).ToList();
                    DgrDoc.ItemsSource = sortMaterials;
                }
                else if (CmbSort.SelectedIndex == 3)
                {
                    List<Doc> sortMaterials = allItems.OrderBy(x => x.Number).ToList();
                    DgrDoc.ItemsSource = sortMaterials;
                }
                else if (CmbSort.SelectedIndex == 4)
                {
                    List<Doc> sortMaterials = allItems.OrderByDescending(x => x.Date).ToList();
                    DgrDoc.ItemsSource = sortMaterials;
                }
                else if (CmbSort.SelectedIndex == 5)
                {
                    List<Doc> sortMaterials = allItems.OrderByDescending(x => x.Date).ToList();
                    DgrDoc.ItemsSource = sortMaterials;
                }
                else if (CmbSort.SelectedIndex == 6)
                {
                    List<Doc> sortMaterials = allItems.OrderBy(x => x.Name).ToList();
                    DgrDoc.ItemsSource = sortMaterials;
                }
                else if (CmbSort.SelectedIndex == 7)
                {
                    List<Doc> sortMaterials = allItems.OrderBy(x => x.Name).ToList();
                    DgrDoc.ItemsSource = sortMaterials;
                }
            }
        }

        private void BtnEdit1_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new PageDoc((sender as Button).DataContext as Doc));
        }

        private void Button2_Click_1(object sender, RoutedEventArgs e)
        {
            var SpisokForRemoving = DgrDoc.SelectedItems.Cast<Doc>().ToList();
            try
            {
                FinAdo.entObj.Doc.RemoveRange(SpisokForRemoving);
                FinAdo.entObj.SaveChanges();
                MessageBox.Show("Данные удалены.");

                DgrDoc.ItemsSource = FinAdo.entObj.Doc.ToList();
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
