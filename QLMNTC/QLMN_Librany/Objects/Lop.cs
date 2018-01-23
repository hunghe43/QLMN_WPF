using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QLMN_Librany.Objects
{
    public class Lop
    {
        public Lop()
        {
            HocSinh = new HashSet<HocSinh>();
            NhanVien = new HashSet<NhanVien>();
        }
        public string MaLop { get; set; }
        public string TenLop { get; set; }
        public string GhiChu { get; set; }
        public int SiSo { get; set; }

        public virtual ICollection<HocSinh> HocSinh { get; set; }
        public virtual ICollection<NhanVien> NhanVien { get; set; }
    }
}
