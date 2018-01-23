using QLMN_Librany.DAO.impl;
using QLMN_Librany.Objects;
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
    public class DialogNhanVienModel
    {
        /// <summary>
        /// Tạo Icommand sửa nhân viên
        /// </summary>
        public ICommand EditNhanVien { get; set; }
        /// <summary>
        /// Tạo Icommand lưu nhân viên
        /// </summary>
        public ICommand SaveNhanVien { get; set; }
        /// <summary>
        /// Tạo Icommand đóng dialog
        /// </summary>
        public ICommand CloseDialog { get; set; }
        public ObservableCollection<Lop> ListLop { get; set; }
        public ObservableCollection<ChucVu> ListChucVu { get; set; }
        public NhanVien NhanVien { get; set; }
        public Lop lop { get; set; }
        public ChucVu chucvu { get; set; }
        /// <summary>
        /// Tạo contructor DialogNhanVienModel
        /// </summary>
        public DialogNhanVienModel()
        {
            GetListLop();
            GetListChucVu();
            CloseDialog = new RelayCommand<Window>((p) => true, onClosingDialog);
            SaveNhanVien = new RelayCommand<object>((p) => true, onSave);
        }
        public DialogNhanVienModel(NhanVien nhanVienParameter)
        {
            GetListLop();
            GetListChucVu();
            lop = ListLop.FirstOrDefault(p => p.MaLop == nhanVienParameter.MaLop);
            chucvu = ListChucVu.FirstOrDefault(p => p.MaChucVu == nhanVienParameter.MaChucVu);

            NhanVien = nhanVienParameter;
            CloseDialog = new RelayCommand<Window>((p) => true, onClosingDialog);
            SaveNhanVien = new RelayCommand<object>((p) => true, onSave);
        }
        /// <summary>
        /// hàm lấy danh sách chức vụ
        /// </summary>
        private void GetListChucVu()
        {
            ChucVuDaoImpl impl = new ChucVuDaoImpl();
            if (ListChucVu == null)
                ListChucVu = new ObservableCollection<ChucVu>();
            else
                ListChucVu.Clear();
            impl.GetListChucVu().ForEach(p => ListChucVu.Add(p));
        }
        /// <summary>
        /// hàm lấy danh sách lớp
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
        /// <summary>
        /// hàm đóng dialog
        /// </summary>
        /// <param name="window"></param>
        private void onClosingDialog(Window window)
        {
            if (window != null)
            {
                window.Close();
            }
        }

        /// <summary>
        /// hàm lưu thông tin nhân viên
        /// </summary>
        /// <param name="parameter"></param>
        private void onSave(object parameter)
        {
            var value = (object[])parameter;
            var childWindow = (Window)value[0];
            var stack = (StackPanel)value[1];
            NhanVienDaoImpl impl = new NhanVienDaoImpl();
            NhanVien newNhanVien = new NhanVien();
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
                            case "txtMaNhanVien":
                                newNhanVien.MaNhanVien = (child as TextBox).Text;
                                break;
                            case "txtTenNhanVien":
                                newNhanVien.TenNhanVien = (child as TextBox).Text;
                                break;
                            case "txtDiaChi":
                                newNhanVien.DiaChi = (child as TextBox).Text;
                                break;
                            case "txtSdt":
                                newNhanVien.Sdt = (child as TextBox).Text;
                                break;
                            case "txtEmail":
                                newNhanVien.Email = (child as TextBox).Text;
                                break;
                            case "cbxMaChucVu":
                                newNhanVien.MaChucVu = ((child as ComboBox).SelectedItem as ChucVu).MaChucVu;
                                break;
                            case "cbxMaLop":
                                newNhanVien.MaLop = ((child as ComboBox).SelectedItem as Lop).MaLop;
                                break;
                            case "txtPassword":
                                newNhanVien.Password = (child as TextBox).Text;
                                break;
                        }
                    }
                }
                if (string.IsNullOrEmpty(newNhanVien.MaNhanVien))
                {                    
                        impl.AddNhanVien(newNhanVien);                   
                }
                else
                {
                    impl.EditNhanVien(newNhanVien);
                }
                MessageBox.Show("Susscess!");
                childWindow.Close();
                foreach (Window win in Application.Current.Windows)
                {
                    if (win.Name == "NhanVienWindowName")
                    {
                        win.DataContext = new NhanVienViewModel();
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
