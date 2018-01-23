﻿using MahApps.Metro.Controls;
using QLMNTC.Common;
using QLMNTC.ViewModel;
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

namespace QLMNTC.View
{
    /// <summary>
    /// Interaction logic for NhanVienWindow.xaml
    /// </summary>
    public partial class NhanVienWindow : MetroWindow
    {
        public NhanVienWindow()
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