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
using UpravFin.Pages;

namespace UpravFin
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public static MainWindow Instance { get; private set; }
        public MainWindow()
        {
           InitializeComponent();
            Instance = this;
            FrameApp.frameObj = FrmMain;
           FrmMain.Navigate(new Avtoriz());
           FinAdo.entObj = new UpravFinSostEntities();
           Global.G = "0";
            if (Global.G == "0") 
            {
                Cadri.IsEnabled = false;
                TeleSprav.IsEnabled = false;
                Doc.IsEnabled = false;
                FinSt.IsEnabled = false;
            }

        }

        public void EnableUserButton()
        {
            FinSt.IsEnabled = true;
            TeleSprav.IsEnabled = true;
            Doc.IsEnabled = true;
        }

        public void EnableAdminButton()
        {
            Cadri.IsEnabled = true;
            FinSt.IsEnabled = true;
            TeleSprav.IsEnabled = true;
            Doc.IsEnabled = true;
        }

        public void EnableOtkButton()
        {
            Cadri.IsEnabled = true;
            TeleSprav.IsEnabled = true;
            Doc.IsEnabled = true;
        }

        public bool LogAdm;
        public int G;

        private void Button4_Click(object sender, RoutedEventArgs e)
        {
            FrmMain.Navigate(new AnalizFinSpisok());
        }

       
        private void Button2_Click(object sender, RoutedEventArgs e)
        {
            FrmMain.Navigate(new SpisokSotr());
        }

        private void Button1_Click(object sender, RoutedEventArgs e)
        {
            FrmMain.Navigate(new Budjet()); 
        }

        private void Button5_Click(object sender, RoutedEventArgs e)
        {
            FrmMain.Navigate(new DocSpisok());
        }

        private void Button3_Click(object sender, RoutedEventArgs e)
        {
            FrmMain.Navigate(new TelSpravSpisok());
        }

        private void Button6_Click(object sender, RoutedEventArgs e)
        {
            FrmMain.Navigate(new Avtoriz());

            Cadri.IsEnabled = false;
            TeleSprav.IsEnabled = false;
            Doc.IsEnabled = false;
            FinSt.IsEnabled = false;

        }

        private void Button10_Click(object sender, RoutedEventArgs e)
        {

        }

        private void FrmMain_Navigated(object sender, NavigationEventArgs e)
        {

        }

        private void FrmMain_Navigating(object sender, NavigatingCancelEventArgs e)
        {
           /* if (Global.G == 1)
            {
                Cadri.IsEnabled = true;
            } */
        }

        private void HyperClick(object sender, RoutedEventArgs e)
        {
            FrmMain.Navigate(new Info());
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {

        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            FrmMain.Navigate(new Info());
        }
    }
}
