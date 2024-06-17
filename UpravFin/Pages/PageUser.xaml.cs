using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
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
    /// Логика взаимодействия для PageUser.xaml
    /// </summary>
    public partial class PageUser : Page
    {
        public PageUser()
        {
            InitializeComponent();
        }

        private void DateLK_SelectedDatesChanged(object sender, SelectionChangedEventArgs e)
        {
            if (DateLK.SelectedDate.HasValue)
            {
                DateTime selectedDate = DateLK.SelectedDate.Value;
                var personalCabinetEntry = FinAdo.entObj.PersonalCabinet
                    .FirstOrDefault(p => p.Date == selectedDate);
                if (personalCabinetEntry != null && personalCabinetEntry.Role == Global.G)
                {
                    ZametkiLK.Text = personalCabinetEntry.Zametki;
                    Delo1.Text = personalCabinetEntry.DeloOne;
                    Delo2.Text = personalCabinetEntry.DeloTwo;
                    Delo3.Text = personalCabinetEntry.DeloThree;
                    Delo4.Text = personalCabinetEntry.DeloFour;
                    Delo5.Text = personalCabinetEntry.DeloFive;
                    Delo6.Text = personalCabinetEntry.DeloSix;
                }
                else
                {
                    ZametkiLK.Text = string.Empty;
                    Delo1.Text = string.Empty;
                    Delo2.Text = string.Empty;
                    Delo3.Text = string.Empty;
                    Delo4.Text = string.Empty;
                    Delo5.Text = string.Empty;
                    Delo6.Text = string.Empty;
                }
            }
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            try
            {


                PersonalCabinet PersonalCabinetObj = new PersonalCabinet()
                {

                    Date = DateLK.SelectedDate,
                    Zametki = ZametkiLK.Text,
                    DeloOne = Delo1.Text,
                    DeloTwo = Delo2.Text,
                    DeloThree = Delo3.Text,
                    DeloFour = Delo4.Text,
                    DeloFive = Delo5.Text,
                    DeloSix = Delo6.Text,
                    Role = Global.G,
                };

                FinAdo.entObj.PersonalCabinet.Add(PersonalCabinetObj);
                FinAdo.entObj.SaveChanges();

                MessageBox.Show("Результат добавлен в базу данных!", "Уведомление", MessageBoxButton.OK, MessageBoxImage.Information);
            }
            catch (DbEntityValidationException ex)
            {
                StringBuilder sb = new StringBuilder();

                foreach (var failure in ex.EntityValidationErrors)
                {
                    sb.AppendFormat("{0} failed validation\n", failure.Entry.Entity.GetType());
                    foreach (var error in failure.ValidationErrors)
                    {
                        sb.AppendFormat("- {0} : {1}", error.PropertyName, error.ErrorMessage);
                        sb.AppendLine();
                    }
                }

                MessageBox.Show(sb.ToString(), "Ошибки валидации данных", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ошибка работы приложения: " + ex.Message.ToString(), "Критический сбой работы приложения", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            try

            {
                DateTime today = DateTime.Today;
                DateLK.SelectedDate = today;
                DateLK_SelectedDatesChanged(this, null);

                var personalCabinetObj = FinAdo.entObj.PersonalCabinet.FirstOrDefault();
                if (personalCabinetObj != null)
                {
                    DateLK.SelectedDate = personalCabinetObj.Date;

                    ZametkiLK.Text = personalCabinetObj.Zametki;
                    Delo1.Text = personalCabinetObj.DeloOne;
                    Delo2.Text = personalCabinetObj.DeloTwo;
                    Delo3.Text = personalCabinetObj.DeloThree;
                    Delo4.Text = personalCabinetObj.DeloFour;
                    Delo5.Text = personalCabinetObj.DeloFive;
                    Delo6.Text = personalCabinetObj.DeloSix;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ошибка при загрузке данных: " + ex.Message, "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
    }
}
