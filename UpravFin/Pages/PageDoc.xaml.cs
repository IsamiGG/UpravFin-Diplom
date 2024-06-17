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
using PdfiumViewer;
using System.IO;
using System.Windows.Forms.Integration;

namespace UpravFin.Pages
{
    /// <summary>
    /// Логика взаимодействия для PageDoc.xaml
    /// </summary>
    public partial class PageDoc : Page
    {
        private PdfViewer _pdfViewer;
        private string _currentPdfPath;
        private const string PdfFolder = "PdfFiles";
        private Doc DocObj = new Doc();

        public PageDoc(Doc selectedDoc)
        {
            InitializeComponent();
            InitializePdfViewer();
            LoadPdfFilesList();
            if (selectedDoc != null)
                DocObj = selectedDoc;

            DataContext = DocObj;

            Vidd.SelectedValuePath = "ID";
            Vidd.DisplayMemberPath = "Vid";
            Vidd.ItemsSource = FinAdo.entObj.Doc.ToList();
        }

        public string txt;

        private void InitializePdfViewer()
        {
            _pdfViewer = new PdfViewer();
            _pdfViewer.Dock = System.Windows.Forms.DockStyle.Fill;
            windowsFormsHost.Child = _pdfViewer;
        }

        private void SavePdfButton_Click(object sender, RoutedEventArgs e)
        {
            if (_pdfViewer.Document == null)
            {
                MessageBox.Show("No PDF loaded.");
                return;
            }

            if (string.IsNullOrEmpty(SavePathTextBox.Text))
            {
                MessageBox.Show("Please specify a path to save the PDF.");
                return;
            }

            SavePdf(SavePathTextBox.Text);
            LoadPdfFilesList();
        }

        private void SavePdf(string savePath)
        {
            string directoryPath = System.IO.Path.GetDirectoryName(savePath);
            if (!Directory.Exists(directoryPath))
            {
                Directory.CreateDirectory(directoryPath);
            }

            File.Copy(_currentPdfPath, savePath, true);
            MessageBox.Show($"PDF saved to {savePath}");
        }

        private void LoadPdfFilesList()
        {
            if (!Directory.Exists(PdfFolder))
            {
                Directory.CreateDirectory(PdfFolder);
            }

            var pdfFiles = Directory.GetFiles(PdfFolder, "*.pdf");
            FilesListBox.ItemsSource = pdfFiles.Select(f => System.IO.Path.GetFileName(f)).ToList();
        }

        private void LoadPdf(string filePath)
        {
            _pdfViewer.Document?.Dispose();
            _pdfViewer.Document = PdfDocument.Load(filePath);
        }

        private void LoadPdfButton_Click(object sender, RoutedEventArgs e)
        {
            OpenFileDialog openFileDialog = new OpenFileDialog
            {
                Filter = "PDF files (*.pdf)|*.pdf"
            };

            if (openFileDialog.ShowDialog() == true)
            {
                _currentPdfPath = openFileDialog.FileName;
                LoadPdf(_currentPdfPath);
                SavePathTextBox.Text = _currentPdfPath;
            }
        }

        private void FilesListBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (FilesListBox.SelectedItem != null)
            {
                string selectedFile = System.IO.Path.Combine(PdfFolder, FilesListBox.SelectedItem.ToString());
                LoadPdf(selectedFile);
                SavePathTextBox.Text = selectedFile;
            }
        }

        private void button3_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                Doc DocObj = new Doc()
                {
                    Vid = Vidd.Text,
                    Number = Convert.ToInt32(TxbLogin_Copy1.Text),
                    Date = Convert.ToDateTime(data.Text),
                    Name = TxbLogin_Copy.Text,
                    FileDoc = SavePathTextBox.Text,
                };

                FinAdo.entObj.Doc.Add(DocObj);
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
            openFileDialog.Filter = "Document files|*.doc;*.docx;*.pdf;*.txt;|All files|*.*";
            openFileDialog.FilterIndex = 1;

            if (openFileDialog.ShowDialog() == true)
            {
                txt = openFileDialog.FileName;
                SavePathTextBox.Text = txt;
            }
        }

        private void button4_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            _currentPdfPath = SavePathTextBox.Text;
            LoadPdf(_currentPdfPath);
            SavePathTextBox.Text = _currentPdfPath;
        }
    }
}
