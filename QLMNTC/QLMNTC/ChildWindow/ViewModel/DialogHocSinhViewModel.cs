using MahApps.Metro.Controls;
using QLMN_Librany.DAO.impl;
using QLMN_Librany.Objects;
using QLMNTC.View;
using QLMNTC.ViewModel;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;

namespace QLMNTC.ChildWindow.ViewModel
{
    public class DialogHocSinhViewModel
    {
        /// <summary>
        /// tạo Icommand Save Học sinh
        /// </summary>
        public ICommand SaveHocSinh { get; set; }
        /// <summary>
        /// Tạo Icommand đóng dialog
        /// </summary>
        public ICommand CloseDialog { get; set; }
        /// <summary>
        /// Tạo danh sách Lớp
        /// </summary>
        public ObservableCollection<Lop> ListLop { get; set; }
        public HocSinh hocsinh { get; set; }
        public Lop lop { get; set; }
        /// <summary>
        /// Tạo Contructor DialogHocSinhViewModel
        /// </summary>
        public DialogHocSinhViewModel()
        {
            GetListLop();
            CloseDialog = new RelayCommand<Window>((p) => true, OnClosingDialog);
            SaveHocSinh = new RelayCommand<object>((p) => true, OnSave);
        }
        public DialogHocSinhViewModel(object hocsinhParameter)
        {
            GetListLop();
            hocsinh = hocsinhParameter as HocSinh;
            lop = ListLop.FirstOrDefault(p => p.MaLop == hocsinh.MaLop);
            CloseDialog = new RelayCommand<Window>((p) => true, OnClosingDialog);
            SaveHocSinh = new RelayCommand<object>((p) => true, OnSave);
        }
        /// <summary>
        /// Tạo hàm lấy danh sách lớp
        /// </summary>
        private void GetListLop()
        {
            LopDaoImpl impl = new LopDaoImpl();
            if (ListLop == null)
                ListLop = new ObservableCollection<Lop>();
            else
                ListLop.Clear();
            impl.GetListLop().ForEach(p => ListLop.Add(p));
        }
        private void OnClosingDialog(Window window)
        {
            if (window != null)
            {
                window.Close();
            }
        }
        /// <summary>
        /// Tạo hàm lưu
        /// </summary>
        /// <param name="parameter"></param>
        private void OnSave(object parameter)
        {
            var value = (object[])parameter;
            var childWindow = (Window)value[0];
            var stack = (StackPanel)value[1];
            HocSinhDaoImpl impl = new HocSinhDaoImpl();
            HocSinh newHocsinh = new HocSinh();
            try
            {
                foreach (object child in stack.Children)
                {
                    string childname = null;
                    if (child is FrameworkElement)
                    {
                        childname = (child as FrameworkElement).Name;
                        switch (childname)
                        {
                            case "txtMaHocSinh":
                                newHocsinh.MaHocSinh = (child as TextBox).Text;
                                break;
                            case "txtTenHocSinh":
                                newHocsinh.Ten = (child as TextBox).Text;
                                break;
                            case "dpNgaySinh":
                                newHocsinh.NgaySinh = (child as DatePicker).SelectedDate.Value;
                                break;
                            case "nbChieuCao":
                                newHocsinh.ChieuCao = (int)(child as NumericUpDown).Value.GetValueOrDefault();
                                break;
                            case "nbCanNang":
                                newHocsinh.CanNang = (int)(child as NumericUpDown).Value.GetValueOrDefault();
                                break;
                            case "txtTenPhuHuynh":
                                newHocsinh.TenPhuHuynh = (child as TextBox).Text;
                                break;
                            case "txtDiaChi":
                                newHocsinh.DiaChi = (child as TextBox).Text;
                                break;
                            case "txtSdt":
                                newHocsinh.sdt = (child as TextBox).Text;
                                break;
                            case "txtEmail":
                                newHocsinh.Email = (child as TextBox).Text;
                                break;
                            case "dpNgaySinhph":
                                newHocsinh.NgaySinhPhuHuynh = (child as DatePicker).SelectedDate.Value;
                                break;
                            case "txtGioiTinh":
                                newHocsinh.GioiTinh = (child as TextBox).Text;
                                break;
                            case "txtTinhTrang":
                                newHocsinh.TinhTrang = (child as TextBox).Text;
                                break;
                            case "txtSoCmt":
                                newHocsinh.SoCmt = (child as TextBox).Text;
                                break;
                            case "txtGhiChu":
                                newHocsinh.GhiChu = (child as TextBox).Text;
                                break;
                            case "cbxMaLop":
                                newHocsinh.MaLop = ((child as ComboBox).SelectedItem as Lop).MaLop;
                                break;
                        }
                    }
                }
                if (string.IsNullOrEmpty(newHocsinh.MaHocSinh))
                {
                    impl.AddHocSinh(newHocsinh);
                }
                else
                {
                    impl.EditHocSinh(newHocsinh);
                }
                MessageBox.Show("Susscess!");
                childWindow.Close();
                foreach (Window win in Application.Current.Windows)
                {
                    if (win.Name == "WindowHocSinh")
                    {
                        win.DataContext = new HocSinhViewModel();
                    }
                }
            }
            catch
            {
                MessageBox.Show("Fail!");
            }
        }

    }
}
