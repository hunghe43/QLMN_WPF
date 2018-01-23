using QLMN_Librany.DAO.impl;
using QLMNTC.Common;
using QLMNTC.View;
using System;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;

namespace QLMNTC.ViewModel
{
    public class LoginViewModel
    {
        /// <summary>
        /// tạo icommand thực hiện login
        /// </summary>
        public ICommand Login { get; set; }
        /// <summary>
        /// tạo contructor cho LoginModel
        /// </summary>
        public LoginViewModel()
        {
            Login = new RelayCommand<object>((p) => true, OnLogin);
        }
        /// <summary>
        /// hàm thục hiện Login
        /// </summary>
        /// <param name="parameter"></param>
        private void OnLogin(object parameter)
        {
            var value = (object[])parameter;
            var childWindow = (Window)value[0];
            var wrap = (WrapPanel)value[1];
            string email = "", pass = "";
            try
            {
                foreach (var child in wrap.Children)
                {
                    string name = null;
                    if (child is FrameworkElement)
                    {
                        name = (child as FrameworkElement).Name;
                        switch (name)
                        {
                            case "txtEmail":
                                email = (child as TextBox).Text;
                                break;
                            case "txtPassword":
                                pass = (child as PasswordBox).Password.ToString();
                                break;
                        }
                    }
                }
                NhanVienDaoImpl impl = new NhanVienDaoImpl();
                var nhanvien = impl.checklogin(email, pass);
                if (nhanvien != null)
                {
                    MessageBox.Show("Xin chào" + nhanvien.TenNhanVien);
                    MainWindow mainwindow = new MainWindow() { DataContext = new MainViewModel(nhanvien) };
                    mainwindow.Show();                    
                    childWindow.Close();
                }
                else
                {
                    MessageBox.Show("Login không thành công!");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }
    }
}
