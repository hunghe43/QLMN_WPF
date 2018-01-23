using MahApps.Metro.Controls;
using QLMN_Librany.DAO.impl;
using QLMN_Librany.Objects;
using System;
using System.Collections.ObjectModel;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;

namespace QLMNTC.ViewModel
{
    public class PhieuChiTieuViewModel
    {
        /// <summary>
        /// Tạo danh sách phiếu chi tiêu
        /// </summary>
        public ObservableCollection<PhieuChiTieu> ListPhieuChiTieu { get; set; }
        /// <summary>
        /// Tạo Icommand excute phiếu chi tiêu
        /// </summary>
        public ICommand ExcutePhieuChiTieu { get; set; }
        /// <summary>
        /// Tạo Icommand xóa phiếu chi tiêu
        /// </summary>
        public ICommand DeletePhieuChiTieu { get; set; }
        /// <summary>
        /// Tạo Contructor
        /// </summary>
        public PhieuChiTieuViewModel()
        {
            ListPhieuChiTieu = getListPTC();
            ExcutePhieuChiTieu = new RelayCommand<object>(p => true, OnExcutePTC);
            DeletePhieuChiTieu = new RelayCommand<object>(p => true, OnDeletePTC);

        }
        /// <summary>
        /// hàm delete
        /// </summary>
        /// <param name="parameter"></param>
        private void OnDeletePTC(object parameter)
        {
            var obj = (object[])parameter;
            var window = (Window)obj[0];
            var datagrid = (DataGrid)obj[1];
            PhieuChiTieuDaoImpl impl = new PhieuChiTieuDaoImpl();
            try
            {
                PhieuChiTieu ptc = new PhieuChiTieu();
                ptc = datagrid.SelectedItem as PhieuChiTieu;
                impl.DeletePhieuChiTieu(ptc.MaPhieuChiTieu);
                window.DataContext = new PhieuChiTieuViewModel();
                MessageBox.Show("Xóa thành công!");

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }
        /// <summary>
        /// hàm thục thi excute
        /// </summary>
        /// <param name="parameter"></param>
        private void OnExcutePTC(object parameter)
        {
            var obj = (object[])parameter;
            var window = (Window)obj[0];
            var wrap = (WrapPanel)obj[1];
            PhieuChiTieuDaoImpl impl = new PhieuChiTieuDaoImpl();
            PhieuChiTieu ptc = new PhieuChiTieu();
            try
            {
                foreach (var item in (wrap as WrapPanel).Children)
                {
                    string name = null;
                    if (item is FrameworkElement)
                    {
                        name = (item as FrameworkElement).Name;
                        switch (name)
                        {
                            case "txbMaPhieu":
                                ptc.MaPhieuChiTieu = (item as TextBlock).Text;
                                break;
                            case "dtNgay":
                                ptc.NgayTaoPhieu = (item as DatePicker).SelectedDate.Value;
                                break;
                            case "txtMaNV":
                                ptc.MaNhanVien = (item as TextBox).Text;
                                break;
                            case "nbChiPhi":
                                ptc.ChiPhi = (decimal)(item as NumericUpDown).Value.GetValueOrDefault();
                                break;
                            case "txtLyDo":
                                ptc.LyDo = (item as TextBox).Text;
                                break;
                        }
                    }
                }
                if (string.IsNullOrEmpty(ptc.MaPhieuChiTieu))
                {
                    // theem moi
                    impl.AddPhieuChiTieu(ptc);
                    MessageBox.Show("Thêm mói thành công");
                }
                else
                {
                    // suawr
                    impl.EditPhieuChiTieu(ptc);
                    MessageBox.Show("Sửa thành công");
                }
                window.DataContext = new PhieuChiTieuViewModel();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }
        /// <summary>
        /// hàm lấy danh sách phiếu chi tiêu
        /// </summary>
        /// <returns></returns>
        private ObservableCollection<PhieuChiTieu> getListPTC()
        {
            ObservableCollection<PhieuChiTieu> list = new ObservableCollection<PhieuChiTieu>();
            PhieuChiTieuDaoImpl impl = new PhieuChiTieuDaoImpl();
            if (list != null)
            {
                list.Clear();
                impl.GetListPhieuChiTieu().ForEach(p => list.Add(p));
            }
            return list;
        }
    }
}
