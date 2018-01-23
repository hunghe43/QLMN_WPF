using QLMN_Librany.Objects;
using QLMNTC.View;
using System;
using System.Windows.Input;

namespace QLMNTC.ViewModel
{
    public class MainViewModel
    {
        /// <summary>
        /// Tạo Icommand hiển thị màn hình quản lý nhân viên
        /// </summary>
        public ICommand ViewQuanLyNhanVien { get; set; }
        /// <summary>
        /// Tạo Icommand hiển thị màn hình quản lý học sinh
        /// </summary>
        public ICommand ViewQuanLyHocSinh { get; set; }
        /// <summary>
        /// Tạo Icommand hiển thị màn hình quản lý học phí
        /// </summary>
        public ICommand ViewQuanLyHocPhi { get; set; }
        /// <summary>
        /// Tạo Icommand hiển thị màn hình điểm danh
        /// </summary>
        public ICommand ViewDiemDanh { get; set; }
        /// <summary>
        /// Tạo Icommand hiển thị màn hình đăng nhập
        /// </summary>
        public ICommand Logout { get; set; }
        /// <summary>
        /// Tạo Icommand hiển thị màn hình quản lý phiếu chi tiêu
        /// </summary>
        public ICommand ViewPhieuChiTieu { get; set; }
        /// <summary>
        /// sesionLogin
        /// </summary>        
        public NhanVien SessionNhanVien { get; set; }

        /// <summary>
        /// Tạo contructor cho MainViewModel
        /// </summary>
        /// <param name="nhanvien"></param>
        public MainViewModel(NhanVien nhanvien)
        {
            SessionNhanVien = nhanvien;
            ViewQuanLyNhanVien = new RelayCommand(OnViewQuanLyNhanVien);
            ViewQuanLyHocSinh = new RelayCommand(OnViewQuanLyHocSinh);
            ViewQuanLyHocPhi = new RelayCommand(OnViewQuanLyHocPhi);
            ViewDiemDanh = new RelayCommand(OnViewDiemDanh);
            ViewPhieuChiTieu = new RelayCommand(OnViewPhieuChiTieu);
            Logout = new RelayCommand(OnLogout);
        }
        /// <summary>
        /// hàm hiển thị màn hình chi tiêu
        /// </summary>
        /// <param name="parameter"></param>
        private void OnViewPhieuChiTieu(object parameter)
        {
            PhieuChiTieuWindow window = new PhieuChiTieuWindow() { DataContext = new PhieuChiTieuViewModel() };
            window.ShowDialog();
        }
        /// <summary>
        /// hàm hiển thị màn hình điểm danh
        /// </summary>
        /// <param name="parameter"></param>
        private void OnViewDiemDanh(object parameter)
        {
            DiemDanhWindow window = new DiemDanhWindow() { DataContext = new DiemDanhViewModel(SessionNhanVien, DateTime.Now.Date) };
            window.ShowDialog();
        }
        /// <summary>
        /// hàm hiển thị màn hình Login
        /// </summary>
        /// <param name="parameter"></param>
        private void OnLogout(object parameter)
        {
            LoginWindow loginwindow = new LoginWindow() { DataContext = new LoginViewModel() };

            for (int intCounter = App.Current.Windows.Count - 1; intCounter >= 0; intCounter--)
            {
                if (App.Current.Windows[intCounter].Name == "loginwindowName")
                {
                    loginwindow.Show();
                }
                else
                {
                    App.Current.Windows[intCounter].Close();
                }
            }
        }
        /// <summary>
        /// hàm hiển thị màn hình Quản lý nhân viên
        /// </summary>
        /// <param name="parameter"></param>
        private void OnViewQuanLyNhanVien(object parameter)
        {
            NhanVienWindow window = new NhanVienWindow() { DataContext = new NhanVienViewModel() };
            window.ShowDialog();
        }
        /// <summary>
        /// hàm hiển thị màn hình Quản lý học sinh
        /// </summary>
        /// <param name="parameter"></param>
        private void OnViewQuanLyHocSinh(object parameter)
        {
            HocSinhWindow window = new HocSinhWindow() { DataContext = new HocSinhViewModel() };
            window.ShowDialog();
        }
        /// <summary>
        /// Hàm hiển thị màn hình quản lý học phí
        /// </summary>
        /// <param name="parameter"></param>
        private void OnViewQuanLyHocPhi(object parameter)
        {
            MetadataHocPhiWindow window = new MetadataHocPhiWindow() { DataContext = new MetadataHocPhiViewModel() };
            window.ShowDialog();
        }
    }

}
