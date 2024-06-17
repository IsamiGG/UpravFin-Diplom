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
    /// Логика взаимодействия для Reg.xaml
    /// </summary>
    public partial class Reg : Page
    {
        public Reg()
        {
            InitializeComponent();
        }

       

        private void Button_RegReg_Click(object sender, RoutedEventArgs e)
        {
            

            if (FinAdo.entObj.User.Count(x => x.Login == TxbLogin.Text) > 0)
            {
                MessageBox.Show("Такой пользователь уже есть!",
                "Уведомление",
                MessageBoxButton.OK,
               MessageBoxImage.Information);
                return;
            }
            else
            {
                try
                {
                    User userObj = new User()
                    {
                        Login = TxbLogin.Text,
                        Password = Pas1.Password,
                        IDRole = 1
                    };
                    FinAdo.entObj.User.Add(userObj);
                    FinAdo.entObj.SaveChanges();

                    MessageBox.Show("Пользователь создан!",
                    "Уведомление",
                    MessageBoxButton.OK,
                   MessageBoxImage.Information);
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Ошибка работы приложения: " + ex.Message.ToString(),
                        "Критический сбой работы приложения",
                        MessageBoxButton.OK,
                        MessageBoxImage.Warning);
                }
            }
        }

        private void Button_RegNazad_Click(object sender, RoutedEventArgs e)
        {
          NavigationService.Navigate(new Avtoriz());
        }

       
        private void Pas2_PasswordChanged(object sender, RoutedEventArgs e)
        {
            if ((TxbLogin.Text != "") && (Pas1.Password == Pas2.Password))
                Button_RegReg.IsEnabled = true;
            if (Pas1.Password != Pas2.Password)
                Pas2.Background = Brushes.Red;
            else
                Pas2.Background = Brushes.White;
        }

        private void Pas1_PasswordChanged(object sender, RoutedEventArgs e)
        {

        }
    }
}
