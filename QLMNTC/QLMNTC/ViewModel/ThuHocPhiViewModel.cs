using QLMN_Librany.BLO.impl;
using QLMN_Librany.DAO.impl;
using QLMN_Librany.Objects;
using QLMNTC.Common;
using System;
using System.Collections.ObjectModel;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;

namespace QLMNTC.ViewModel
{
    public class ThuHocPhiViewModel
    {
        /// <summary>
        /// Tạo Icommand hiển thị học phí của học sinh
        /// </summary>
        public ICommand ViewHocPhi { get; set; }
        /// <summary>
        /// Tạo Icommand đóng dialog
        /// </summary>
        public ICommand CloseWindow { get; set; }
        /// <summary>
        /// Tạo danh sách học phí tháng
        /// </summary>
        public ObservableCollection<HocPhi> ListHocPhiTheoThang { get; set; }
        /// <summary>
        /// tạo danh sách học phí dịch vụ
        /// </summary>
        public ObservableCollection<DichVuNgoai> ListDichVu { get; set; }
        /// <summary>
        /// tạo danh sách học phí đầu năm
        /// </summary>
        public ObservableCollection<HocPhi> ListHocPhiDauNam { get; set; }
        public HocSinh HocSinh { get; set; }
        public HocSinh_TheoDoi Info { get; set; }
        public DateTime Date { get; set; }
        public decimal TongHPThang { get; set; }
        public decimal TongHPDauNam { get; set; }
        public decimal TongHPDichVu { get; set; }
        public decimal TongHPTheoDoi { get; set; }
        public decimal Tong
        {
            get { return TongHPThang + TongHPDauNam + TongHPDichVu + TongHPTheoDoi; }
        }
        HocPhiDaoImpl impl = new HocPhiDaoImpl();
        DichVuBloImpl blo = new DichVuBloImpl();
        PhieuTheoDoiBloImpl theodoiblo = new PhieuTheoDoiBloImpl();

        /// <summary>
        /// tạo Contructor ThuHocPhiViewModel
        /// </summary>
        /// <param name="hocsinh"></param>
        /// <param name="date"></param>
        public ThuHocPhiViewModel(HocSinh hocsinh, DateTime date)
        {
            Date = date;
            HocSinh = hocsinh;
            GetListHocPhi(hocsinh, date.ToString("MM/yyyy"));
            ViewHocPhi = new RelayCommand<object>(p => true, OnViewHocPhi);
            CloseWindow = new RelayCommand<Window>(p => p != null, OnClose);
        }
        /// <summary>
        /// Hàm đóng dialog
        /// </summary>
        /// <param name="window"></param>
        private void OnClose(Window window)
        {
            if (window != null)
                window.Close();
        }
        /// <summary>
        /// Hàm hiển thị màn hình
        /// </summary>
        /// <param name="parameter"></param>
        private void OnViewHocPhi(object parameter)
        {
            var obj = (object[])parameter;
            var window = (Window)obj[0];
            var datepicker = (DatePicker)obj[1];

            Date = datepicker.SelectedDate.Value;
            GetListHocPhi(HocSinh, Date.ToString("MM/yyyy"));
            window.DataContext = new ThuHocPhiViewModel(HocSinh, Date);
        }
        /// <summary>
        /// lấy danh sách học phí
        /// </summary>
        /// <param name="hocsinh"></param>
        /// <param name="month"></param>
        private void GetListHocPhi(HocSinh hocsinh, string month)
        {
            //get học phí đầu năm
            if (ListHocPhiDauNam == null)
                ListHocPhiDauNam = new ObservableCollection<HocPhi>();
            else
                ListHocPhiDauNam.Clear();
            impl.GetListHocPhi().FindAll(p => p.LoaiHocPhi == "LoaiHocPhi-20D1").ToList().ForEach(p => ListHocPhiDauNam.Add(p));
            impl.GetListHocPhi().FindAll(p => p.LoaiHocPhi == "LoaiHocPhi-20D1").ToList().ForEach(p => TongHPDauNam += p.ChiPhi);

            //get hoc phi thang
            if (ListHocPhiTheoThang == null)
                ListHocPhiTheoThang = new ObservableCollection<HocPhi>();
            else
                ListHocPhiTheoThang.Clear();
            impl.GetListHocPhi().FindAll(p => p.LoaiHocPhi == "LoaiHocPhi-2FAA").ToList().ForEach(p => ListHocPhiTheoThang.Add(p));
            impl.GetListHocPhi().FindAll(p => p.LoaiHocPhi == "LoaiHocPhi-2FAA").ToList().ForEach(p => TongHPThang += p.ChiPhi);

            // get hojc phis dich vu cua hojc sinh
            if (ListDichVu == null)
                ListDichVu = new ObservableCollection<DichVuNgoai>();
            else
                ListDichVu.Clear();
            blo.GetListDichVuHocSinh(hocsinh.MaHocSinh, month).ForEach(p => ListDichVu.Add(p));
            blo.GetListDichVuHocSinh(hocsinh.MaHocSinh, month).ForEach(p => TongHPDichVu += p.ChiPhi);

            //get info theo doi
            Info = theodoiblo.GetInfoTheoDoi(hocsinh.MaHocSinh, month);
            TongHPTheoDoi = Util.getHocPhiTheoDoi(Info.SoNgayVang, Info.SoNgayAnSang, Info.SoNgayAnTrua);


        }
    }
}
