using System;
using System.Collections.ObjectModel;
using System.Windows.Input;
using QLMN_Librany.DAO.impl;
using QLMN_Librany.Objects;
using System.Windows;
using QLMNTC.View;
using QLMNTC.ChildWindow.View;
using QLMNTC.Common;
using QLMNTC.ChildWindow.ViewModel;

namespace QLMNTC.ViewModel
{
    public class HocSinhViewModel
    {
        /// <summary>
        /// tạo Icommand Xóa hóc sinh
        /// </summary>
        public ICommand DeleteHocSinh { get; set; }
        /// <summary>
        /// tạo icommand hiển thị dialog học sinh
        /// </summary>
        public ICommand ShowDialog { get; set; }
        /// <summary>
        /// tạo icommand hiển thị dialog hịc phí
        /// </summary>
        public ICommand HocPhiView { get; set; }
        /// <summary>
        /// tạo icommand hiển thị danh sách học sinh
        /// </summary>
        public ObservableCollection<HocSinh> ListHocSinh { get; set; }
        public HocSinhViewModel()
        {
            GetListHocSinh();
            DeleteHocSinh = new RelayCommand<HocSinh>((p) => p != null, OnDelete);
            ShowDialog = new RelayCommand<object>((p) => true, OnOpeningDialog);
            HocPhiView = new RelayCommand<object>(p => true, OnHocPhiView);
        }
        /// <summary>
        /// hàm mở dialog học phí
        /// </summary>
        /// <param name="parameter"></param>
        private void OnHocPhiView(object parameter)
        {
            ThuPhiHocSinhWindow window = new ThuPhiHocSinhWindow() { DataContext = new ThuHocPhiViewModel(parameter as HocSinh, DateTime.Now.Date) };
            window.ShowDialog();
        }
        /// <summary>
        /// hàm lấy danh sách học sinh
        /// </summary>
        public void GetListHocSinh()
        {
            HocSinhDaoImpl impl = new HocSinhDaoImpl();
            if (ListHocSinh == null)
                ListHocSinh = new ObservableCollection<HocSinh>();
            else
                ListHocSinh.Clear();
            impl.GetListHocSinh().ForEach(p => ListHocSinh.Add(p));
        }
        /// <summary>
        /// hàm mở dialog học sinh
        /// </summary>
        /// <param name="parameter"></param>
        private void OnOpeningDialog(object parameter)
        {
            try
            {
                if (parameter == null)
                {
                    Util.ShowDialog(new DialogWindowHocSinh() { DataContext = new DialogHocSinhViewModel() });
                }
                else
                {
                    Util.ShowDialog(new DialogWindowHocSinh() { DataContext = new DialogHocSinhViewModel(parameter as HocSinh) });
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }
        /// <summary>
        /// hàm xóa học sinh
        /// </summary>
        /// <param name="parameter"></param>
        private void OnDelete(object parameter)
        {
            try
            {
                HocSinhDaoImpl impl = new HocSinhDaoImpl();
                HocSinh hocsinh = parameter as HocSinh;
                //delete in database
                impl.DeleteHocSinh(hocsinh.MaHocSinh);
                //delete in datagrid
                GetListHocSinh();
                MessageBox.Show("Delete Sussess!");
            }
            catch
            {
                MessageBox.Show("Delete fail!");
            }
        }
    }
}
