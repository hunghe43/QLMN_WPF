using QLMN_Librany.BLO.impl;
using QLMN_Librany.DAO.impl;
using QLMN_Librany.Objects;
using System;
using System.Collections.ObjectModel;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;

namespace QLMNTC.ViewModel
{
    public class DiemDanhViewModel
    {
        /// <summary>
        /// tạo Icommand Lấy danh sách điểm danh
        /// </summary>
        public ICommand GetDiemDanh { get; set; }
        /// <summary>
        /// tạo icommand thực thi điểm danh
        /// </summary>
        public ICommand DiemDanh { get; set; }
        /// <summary>
        /// Lấy danh sách học sinh điểm danh
        /// </summary>
        public ObservableCollection<HocSinh> ListHocSinh { get; set; }
        /// <summary>
        /// Lấy danh sách điểm danh cũ
        /// </summary>
        public ObservableCollection<CT_NgayTheoDoi> ListTheoDoi { get; set; }
        public NhanVien GiaoVien { get; set; }
        public DateTime Date { get; set; }

        PhieuTheoDoiBloImpl blo = new PhieuTheoDoiBloImpl();
        PhieuTheoDoiDaoImpl dao = new PhieuTheoDoiDaoImpl();
        /// <summary>
        /// Khai báo contructor cho class
        /// </summary>
        /// <param name="giaovien"></param>
        /// <param name="date"></param>
        public DiemDanhViewModel(NhanVien giaovien, DateTime date)
        {
            Date = date;
            GiaoVien = giaovien;
            ListHocSinh = GetListHocSinh(giaovien.MaLop);
            GetListTheoDoi(giaovien.MaLop, date);
            DiemDanh = new RelayCommand<object>((p) => true, OnDiemDanh);
            GetDiemDanh = new RelayCommand<object>(p => true, OnGetDiemDanh);
        }

        /// <summary>
        /// Hàm lấy danh sách điểm danh
        /// </summary>
        /// <param name="parameter"></param>
        private void OnGetDiemDanh(object parameter)
        {
            var obj = (object[])parameter;
            var date = (DatePicker)obj[0];
            var window = (Window)obj[1];

            DateTime ngay = (date as DatePicker).SelectedDate.Value;
            Date = ngay;
            GetListTheoDoi(GiaoVien.MaLop, ngay);

            window.DataContext = new DiemDanhViewModel(GiaoVien, Date);

        }
        /// <summary>
        /// hàm thực thi điểm danh
        /// </summary>
        /// <param name="parameter"></param>
        private void OnDiemDanh(object parameter)
        {
            var obj = (object[])parameter;
            var date = (DatePicker)obj[1];
            var datagrid = (DataGrid)obj[0];

            var ngay = (date as DatePicker).SelectedDate.Value;
            try
            {
                //check điểm danh
                if (dao.GetPhieuTheoDoi(GiaoVien.MaNhanVien, ngay).Rows.Count != 0)
                {
                    MessageBox.Show("Đã Điểm Danh rồi!");
                }
                else
                {
                    for (int i = 0; i < datagrid.Items.Count; i++)
                    {
                        var item = datagrid.Items[i];

                        var MaHocSinh = (datagrid.Columns[0].GetCellContent(item) as TextBlock).Text;
                        var Vang = (bool)(datagrid.Columns[1].GetCellContent(item) as CheckBox).IsChecked;
                        var AnSang = (bool)(datagrid.Columns[2].GetCellContent(item) as CheckBox).IsChecked;
                        var AnTrua = (bool)(datagrid.Columns[3].GetCellContent(item) as CheckBox).IsChecked;
                        blo.DiemDanh(GiaoVien.MaNhanVien, ngay, MaHocSinh, Vang, AnSang, AnTrua);
                    }
                    MessageBox.Show("Điểm danh thành công!");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }
        /// <summary>
        /// Hàm lấy danh sách học sinh điểm danh
        /// </summary>
        /// <param name="maLop"></param>
        /// <returns></returns>
        public ObservableCollection<HocSinh> GetListHocSinh(string maLop)
        {
            HocSinhDaoImpl impl = new HocSinhDaoImpl();
            if (ListHocSinh == null)
                ListHocSinh = new ObservableCollection<HocSinh>();
            else
                ListHocSinh.Clear();
            impl.GetListHocSinh().FindAll(p => p.MaLop == maLop).ForEach(p => ListHocSinh.Add(p));
            return ListHocSinh;
        }

        /// <summary>
        /// Hàm lấy danh sách điểm danh cũ
        /// </summary>
        /// <param name="maLop"></param>
        /// <param name="date"></param>
        public void GetListTheoDoi(string maLop, DateTime date)
        {
            if (ListTheoDoi == null)
                ListTheoDoi = new ObservableCollection<CT_NgayTheoDoi>();
            else
                ListTheoDoi.Clear();

            blo.GetAll_CT_NgayTheoDoi(GiaoVien.MaNhanVien, date).ForEach(p => ListTheoDoi.Add(p));
            if (ListTheoDoi.Count() == 0)
            {
                CT_NgayTheoDoi ct;
                foreach (var item in GetListHocSinh(GiaoVien.MaLop))
                {
                    ct = new CT_NgayTheoDoi();
                    ct.MaHocSinh = item.MaHocSinh;
                    ct.DDVang = false;
                    ct.DDAnSang = false;
                    ct.DDAnTrua = false;
                    ListTheoDoi.Add(ct);
                }
            }
        }
    }
}
