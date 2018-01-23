using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QLMN_Librany.Objects
{
    public class HocSinh: IDataErrorInfo
    {
        public string MaHocSinh { get; set; }
        public string Ten { get; set; }
        public DateTime NgaySinh { get; set; }
        public string GioiTinh { get; set; }
        public string DiaChi { get; set; }
        public string TinhTrang { get; set; }
        public int ChieuCao { get; set; }
        public int CanNang { get; set; }
        public string TenPhuHuynh { get; set; }
        public string SoCmt { get; set; }
        public string sdt { get; set; }
        public string Email { get; set; }
        public DateTime NgaySinhPhuHuynh { get; set; }
        public string GhiChu { get; set; }
        public string MaLop { get; set; }
        public bool DoiTuongMTA { get; set; }
        public bool TrangThai { get; set; }
        public virtual Lop Lop { get; set; }
        public string this[string columnName]
        {
            get
            {
                string result = string.Empty;
                if (columnName == "Ten")
                {
                    if (string.IsNullOrEmpty(this.Ten))
                    {
                        result = "Không được để trống!";
                    }
                }
                if (columnName == "TenPhuHuynh")
                {
                    if (string.IsNullOrEmpty(this.TenPhuHuynh))
                    {
                        result = "Không được để trống!";
                    }
                }
                return result;
            }
        }
        public string Error
        {
            get
            {
                return null;
            }
        }
    }
}
