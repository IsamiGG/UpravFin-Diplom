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
    /// Логика взаимодействия для AnalizFin.xaml
    /// </summary>
    public partial class AnalizFin : Page
    {
        private FinSostoyanie FinObj = new FinSostoyanie();
        public AnalizFin(FinSostoyanie selectedFinSostoyanie)
        {
            InitializeComponent();
            if (selectedFinSostoyanie != null)
                FinObj = selectedFinSostoyanie;

            DataContext = FinObj;
        }

        int sk0, voa0, dkz0, kkz0, z0, Sos, Sdi, Oiz, dSos, dSdi, dOiz;

        private void Button4_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new AnalizFinSpisok());
        }

        static public string Sostoyanie(double x, double y, double z)
        {
            if (x >= 0 && y >= 0 && z >= 0)
            {
                return (" Абсолютная финансовая устойчивость. Высокий уровень платежеспособности. Предприятие не зависит от внешних кредиторов");
            }
            else if (x < 0 && y >= 0 && z >= 0)
            {
                return (" Нормальная финансовая устойчивость. Нормальная платежеспособность. Рациональное использование заемных средств. Высокая доходность текущей деятельности");
            }
            else if (x < 0 && y < 0 && z >= 0)
            {
                return ("Неустойчивое финансовое положение. Нарушение нормальной платежеспособности. Возникает необходимость привлечения дополнительных источников финансирования. Возможно восстановление платежеспособности");
            }
            else if (x < 0 && y < 0 && z < 0)
            {
                return ("Кризисное (критическое) финансовое состояние. Предприятие полностью неплатежеспособно. И находится на грани банкротства");
            }
            else
            {
                return (" Неопределенное состояние");
            }
        }


        static public int VivodIzm(string Pole1, string Pole2)
        {
           int Zn1, Zn2, Zn0;
            Zn1 = Convert.ToInt32(Pole1);
            Zn2 = Convert.ToInt32(Pole2);
            Zn0 = Zn2 - Zn1;
            return (Zn0);
        }


        private void Button1_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                sk0 = VivodIzm(textBox1.Text, textBox2.Text); //СК – собственный капитал(раздел III баланса «Капитал и резервы»)
                textBox15.Text = Convert.ToString(sk0);
                voa0 = VivodIzm(textBox3.Text, textBox4.Text); //ВОА – внеоборотные активы(раздел I баланса «Внеоборотные активы»)
                textBox14.Text = Convert.ToString(voa0);
                dkz0 = VivodIzm(textBox5.Text, textBox6.Text); //ДКЗ – долгосрочные кредиты и займы (раздел IV баланса «Долгосрочные обязательства»)
                textBox13.Text = Convert.ToString(dkz0);
                kkz0 = VivodIzm(textBox7.Text, textBox8.Text); //ККЗ – краткосрочные кредиты и займы (раздел V баланса «Краткосрочные обязательства»)
                textBox12.Text = Convert.ToString(kkz0);
                z0 = VivodIzm(textBox9.Text, textBox10.Text); //З – запасы(раздел II баланса)
                textBox11.Text = Convert.ToString(z0);
                // Наличие собственных оборотных средств на конец расчетного периода устанавливается по формуле:СОС = СК – ВОА
                // где СОС – собственные оборотные средства (чистый оборотный капитал);
                Sos = sk0 - voa0;
                // Наличие собственных и долгосрочных заемных источников финансирования запасов определяется по формуле:СДИ = СК – ВОА + ДКЗ = СОС + ДКЗ
                //где СДИ – собственные и долгосрочные заемные источники;
                Sdi = Sos + dkz0;
                // Общая величина основных источников формирования запасов по формуле:  ОИЗ = СДИ + ККЗ, где ОИЗ – общая величина источников формирования запасов;
                Oiz = Sdi + kkz0;
                //Можно определить три показателя обеспеченности запасов источниками их финансирования:
                //1) излишек(+), недостаток(–) собственных оборотных средств: ∆СОС = СОС – З, ∆СОС – прирост(излишек)собственных оборотных средств;
                dSos = Sos - z0;
                //2) излишек(+), недостаток(-) собственных и долгосрочных источников финансирования запасов: 
                //∆СДИ = СДИ – З, ∆СДИ – прирост(излишек) собственных и долгосрочных источников финансирования запасов;
                dSdi = Sdi - z0;
                //3) излишек(+), недостаток(-) общей величины основных источников покрытия запасов: 
                //∆ОИЗ = ОИЗ – З, ∆ОИЗ – прирост(излишек) общей величины основных источников покрытия запасов.
                dOiz = Oiz - z0;
                textBox16.Text = Sostoyanie(dSos, dSdi, dOiz);

            }
            catch (Exception)
            {
                MessageBox.Show("Введены некорректные данные");
            }
        }
        private void Button2_Click(object sender, RoutedEventArgs e)
        {
            textBox1.Text = "";
            textBox2.Text = "";
            textBox3.Text = "";
            textBox4.Text = "";
            textBox5.Text = "";
            textBox6.Text = "";
            textBox7.Text = "";
            textBox8.Text = "";
            textBox9.Text = "";
            textBox10.Text = "";
            textBox11.Text = "";
            textBox12.Text = "";
            textBox13.Text = "";
            textBox14.Text = "";
            textBox15.Text = "";
            textBox16.Text = "Состояние: ";
            Dpick1.Text = "";
            Dpick2.Text = "";
        }

        private void Button3_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                FinSostoyanie FinSostoyanieObj = new FinSostoyanie()
                {
                    DateBegin = Convert.ToDateTime(Dpick1.Text),
                    DateEnd = Convert.ToDateTime(Dpick2.Text),
                    SK = Convert.ToInt32(textBox15.Text),
                    VOA = Convert.ToInt32(textBox14.Text),
                    DKZ = Convert.ToInt32(textBox13.Text),
                    KKZ = Convert.ToInt32(textBox12.Text),
                    SZ = Convert.ToInt32(textBox11.Text),
                    FinanceSostoyanie = textBox16.Text,
                };

                FinAdo.entObj.FinSostoyanie.Add(FinSostoyanieObj);
                FinAdo.entObj.SaveChanges();

                MessageBox.Show("Результат добавлен в базу данных!", "Уведомление", MessageBoxButton.OK, MessageBoxImage.Information);
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ошибка работы приложения: "+ex.Message.ToString(), "Критический сбой работы приложения", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
        }
    }
}
