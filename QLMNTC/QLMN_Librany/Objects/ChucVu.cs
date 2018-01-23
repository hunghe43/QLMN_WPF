using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QLMN_Librany.Objects
{
    public  class ChucVu
    {
        public ChucVu()
        {
            NhanVien = new HashSet<NhanVien>();
        }
        public string MaChucVu { get; set; }
        public string TenChucVu { get; set; }
        public virtual ICollection<NhanVien> NhanVien { get; set; }
    }
}
