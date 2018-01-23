using MahApps.Metro.Controls;
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
    public class MetadataHocPhiViewModel
    {
        /// <summary>
        /// tạo Icommand Lưu học phí
        /// </summary>
        public ICommand SaveHocPhi { get; set; }
        /// <summary>
        /// tạo Icommand Thêm học phí
        /// </summary>
        public ICommand AddHocPhi { get; set; }
        /// <summary>
        /// tạo Icommand đóng cửa sổ
        /// </summary>
        public ICommand CloseDialog { get; set; }
        /// <summary>
        /// tạo Icommand xóa học phí
        /// </summary>
        public ICommand DeleteHocPhi { get; set; }
        public ObservableCollection<HocPhi> ListHocPhiDauNam { get; set; }
        public ObservableCollection<HocPhi> ListHocPhiTheoThang { get; set; }
        public ObservableCollection<HocPhi> ListHocPhiDichVu { get; set; }
        public ObservableCollection<LoaiHocPhi> ListLoaiHocPhi { get; set; }

        public HocPhi HocPhi { get; set; }
        /// <summary>
        /// Tạo contructor MetadataHocPhiViewModel
        /// </summary>
        public MetadataHocPhiViewModel()
        {
            GetListHocPhi();
            getListLoaiHocPhi();
            SaveHocPhi = new RelayCommand<UIElementCollection>(p => p != null, OnSaveHocPhi);
            AddHocPhi = new RelayCommand<object>(p => p != null, OnAddHocPhi);
            CloseDialog = new RelayCommand<Window>((p) => true, OnClosingDialog);
            DeleteHocPhi = new RelayCommand<object>((p) => p != null, OnDeleteHocPhi);
        }
        private void OnDeleteHocPhi(object parameter)
        {
            try
            {
                var values = (object[])parameter;
                var window = (Window)values[0];
                var listhocphi = (ListBox)values[1];
                HocPhi hocphi = listhocphi.SelectedItem as HocPhi;
                HocPhiDaoImpl impl = new HocPhiDaoImpl();
                impl.DeleteHocPhi(hocphi.MaHocPhi);
                window.DataContext = new MetadataHocPhiViewModel();
                MessageBox.Show("Susscess!");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }
        /// <summary>
        /// Hàm thực hiện thêm mới học phí
        /// </summary>
        /// <param name="parameter"></param>
        private void OnAddHocPhi(object parameter)
        {
            var values = (object[])parameter;
            var window = (Window)values[0];
            var stack = (StackPanel)values[1];
            try
            {
                HocPhiDaoImpl impl = new HocPhiDaoImpl();
                HocPhi hocphi = new HocPhi();
                foreach (var child in stack.Children)
                {
                    string name = null;
                    if (child is FrameworkElement)
                    {
                        name = (child as FrameworkElement).Name.ToString();

                        switch (name)
                        {
                            case "txtTenHocPhi":
                                hocphi.TenhocPhi = (child as TextBox).Text;
                                break;
                            case "txtChiPhi":
                                hocphi.ChiPhi = (int)(child as NumericUpDown).Value.GetValueOrDefault(); ;
                                break;
                            case "txtGhiChu":
                                hocphi.GhiChu = (child as TextBox).Text;
                                break;
                            case "cbxLoaiHocPhi":
                                hocphi.LoaiHocPhi = (child as ComboBox).SelectedValue.ToString();
                                break;
                        }
                    }
                }
                impl.AddHocPhi(hocphi);
                window.DataContext = new MetadataHocPhiViewModel();
                MessageBox.Show("Susscess!");

            }
            catch 
            {
                MessageBox.Show("Fail!");
            }
        }
        /// <summary>
        /// tạo hàm đóng cửa sổ
        /// </summary>
        /// <param name="window"></param>
        private void OnClosingDialog(Window window)
        {
            if (window != null)
            {
                window.Close();
            }
        }
        /// <summary>
        /// Hàm lưu học phí
        /// </summary>
        /// <param name="parameter"></param>
        private void OnSaveHocPhi(UIElementCollection parameter)
        {
            try
            {
                foreach (var child in parameter)
                {
                    if (child is ListBox)
                    {
                        foreach (var obj in (child as ListBox).Items.SourceCollection)
                        {
                            HocPhiDaoImpl impl = new HocPhiDaoImpl();
                            HocPhi hocphi = new HocPhi();
                            hocphi = obj as HocPhi;
                            impl.EditHocPhi(hocphi);
                        }
                    }
                }
                MessageBox.Show("Save sussess!");
            }
            catch 
            {
                MessageBox.Show("Fail!");
            }
        }
        /// <summary>
        /// hàm Lấy danh sách học phi
        /// </summary>
        public void getListLoaiHocPhi()
        {
            LoaiHocPhiDaoImpl impl = new LoaiHocPhiDaoImpl();
            if (ListLoaiHocPhi == null)
                ListLoaiHocPhi = new ObservableCollection<LoaiHocPhi>();
            else
                ListLoaiHocPhi.Clear();
            impl.GetListLoaiHocPhi().ForEach(p => ListLoaiHocPhi.Add(p));
        }
        /// <summary>
        /// Hàm lấy dánh sách học phí
        /// </summary>
        public void GetListHocPhi()
        {
            HocPhiDaoImpl impl = new HocPhiDaoImpl();
            //get học phí đầu năm
            if (ListHocPhiDauNam == null)
                ListHocPhiDauNam = new ObservableCollection<HocPhi>();
            else
                ListHocPhiDauNam.Clear();
            impl.GetListHocPhi().FindAll(p => p.LoaiHocPhi == "LoaiHocPhi-20D1").ToList().ForEach(p => ListHocPhiDauNam.Add(p));

            //get hoc phi thang
            if (ListHocPhiTheoThang == null)
                ListHocPhiTheoThang = new ObservableCollection<HocPhi>();
            else
                ListHocPhiTheoThang.Clear();
            impl.GetListHocPhi().FindAll(p => p.LoaiHocPhi == "LoaiHocPhi-2FAA").ToList().ForEach(p => ListHocPhiTheoThang.Add(p));

            // get hojc phis dich vu
            if (ListHocPhiDichVu == null)
                ListHocPhiDichVu = new ObservableCollection<HocPhi>();
            else
                ListHocPhiDichVu.Clear();
            impl.GetListHocPhi().FindAll(p => p.LoaiHocPhi == "LoaiHocPhi-472E").ToList().ForEach(p => ListHocPhiDichVu.Add(p));
        }
    }
}
