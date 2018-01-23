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
using System.Windows.Shapes;
using QLMN_Librany.Objects;
using QLMNTC.ViewModel;
using MahApps.Metro.Controls;
using QLMN_Librany.DAO.impl;
using System.Collections.ObjectModel;
using QLMNTC.Common;
using System.ComponentModel;

namespace QLMNTC.ChildWindow.View
{
    /// <summary>
    /// Interaction logic for DialogWindowNhanVien.xaml
    /// </summary>
    public partial class DialogWindowNhanVien : MetroWindow
    {
       
        public DialogWindowNhanVien()
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
    }
}
