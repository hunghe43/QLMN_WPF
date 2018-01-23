using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QLMN_Librany.Objects
{
    public class NhanVien
    {
        public string MaNhanVien { get; set; }
        public string TenNhanVien { get; set; }
        public string DiaChi { get; set; }
        public string Sdt { get; set; }
        public string Email { get; set; }
        public string MaChucVu { get; set; }
        public string MaLop { get; set; }
        public string Password { get; set; }
        public virtual Lop Lop { get; set; }
        public virtual ChucVu ChucVu { get; set; }
    }
}
