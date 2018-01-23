using QLMN_Librany.DAO.impl;
using QLMN_Librany.Objects;
using QLMNTC.ChildWindow.View;
using QLMNTC.ChildWindow.ViewModel;
using QLMNTC.Common;
using System.Collections.ObjectModel;
using System.Windows;
using System.Windows.Input;

namespace QLMNTC.ViewModel
{
    public class NhanVienViewModel
    {
        /// <summary>
        /// tạo Icommand Xóa nhân viên
        /// </summary>
        public ICommand DeleteNhanVien { get; set; }
        /// <summary>
        /// tạo Icommand đóng cửa sổ
        /// </summary>
        public ICommand ShowDialog { get; set; }
        /// <summary>
        /// tạo danh sách nhân viên
        /// </summary>
        public ObservableCollection<NhanVien> ListNhanVien { get; set; }
        /// <summary>
        /// tạo danh sách chức vụ
        /// </summary>
        public ObservableCollection<ChucVu> ListChucVu { get; set; }
        /// <summary>
        /// Tạo Contructor cho NhanVienViewModel
        /// </summary>
        public NhanVienViewModel()
        {
            ListChucVu = GetListChucVu();
            ListNhanVien = GetListNhanVien();
            DeleteNhanVien = new RelayCommand<NhanVien>((p) => p != null, OnDelete);
            ShowDialog = new RelayCommand<object>((p) => true, OnOpeningDialog);
        }
        /// <summary>
        /// Hàm lấy danh sách nhân viên
        /// </summary>
        /// <returns></returns>
        public ObservableCollection<NhanVien> GetListNhanVien()
        {
            NhanVienDaoImpl impl = new NhanVienDaoImpl();
            if (ListNhanVien == null)
                ListNhanVien = new ObservableCollection<NhanVien>();
            else
                ListNhanVien.Clear();
            impl.GetListNhanVien().ForEach(p => ListNhanVien.Add(p));
            return ListNhanVien;
        }
        /// <summary>
        /// Hàm lấy danh sách chức vụ
        /// </summary>
        /// <returns></returns>
        public ObservableCollection<ChucVu> GetListChucVu()
        {
            ObservableCollection<ChucVu> ListChucVu = new ObservableCollection<ChucVu>();
            ChucVuDaoImpl impl = new ChucVuDaoImpl();
            if (ListChucVu != null)
                ListChucVu.Clear();
            impl.GetListChucVu().ForEach(p => ListChucVu.Add(p));
            return ListChucVu;
        }
        /// <summary>
        /// hàm mở dialog
        /// </summary>
        /// <param name="parameter"></param>
        private void OnOpeningDialog(object parameter)
        {
            if (parameter == null)
            {
                Util.ShowDialog(new DialogWindowNhanVien() { DataContext = new DialogNhanVienModel() });
            }
            else
            {
                Util.ShowDialog(new DialogWindowNhanVien() { DataContext = new DialogNhanVienModel(parameter as NhanVien) });
            }
        }
        /// <summary>
        /// hàm xóa nhan viên
        /// </summary>
        /// <param name="parameter"></param>
        private void OnDelete(object parameter)
        {
            try
            {
                NhanVienDaoImpl impl = new NhanVienDaoImpl();
                NhanVien NhanVien = parameter as NhanVien;
                //delete in database
                impl.DeleteNhanVien(NhanVien.MaNhanVien);
                //delete in datagrid
                GetListNhanVien();
                MessageBox.Show("Delete Sussess!");
            }
            catch
            {
                MessageBox.Show("Delete fail!");
            }
        }
    }
}