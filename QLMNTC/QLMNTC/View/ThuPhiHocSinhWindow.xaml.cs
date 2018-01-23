using MahApps.Metro.Controls;
using QLMNTC.Common;
using System;
using System.Collections.Generic;
using System.ComponentModel;
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
using System.Windows.Shapes;
using Spire.Doc;
using Spire.Doc.Documents;
namespace QLMNTC.View
{
    /// <summary>
    /// Interaction logic for ThuPhiHocSinhWindow.xaml
    /// </summary>
    public partial class ThuPhiHocSinhWindow : MetroWindow
    {
        public ThuPhiHocSinhWindow()
        {
            InitializeComponent();
            var pos = Common.Util.setLocationWindow(this.Name);
            this.Top = pos[0];
            this.Left = pos[1];
        }
        void DataWindow_Closing(object sender, CancelEventArgs e)
        {
            Util.SaveLocation(this);
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            //create a new document using spire.Doc
            Document document = new Document();

            //add one paragraph
            Spire.Doc.Documents.Paragraph paragraph = document.AddSection().AddParagraph();
            paragraph.AppendText("Hello, World!");


            //save the document
            document.SaveToFile(@"..\..\sample.doc", FileFormat.Doc);

            //launch the document
            System.Diagnostics.Process.Start(@"..\..\sample.doc");

        }
    }
}
