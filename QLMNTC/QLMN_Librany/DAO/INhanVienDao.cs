using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using QLMN_Librany.Objects;
namespace QLMN_Librany.DAO
{
    interface INhanVienDao
    {
        //DataSet GetListNhanVien();
        List<NhanVien> GetListNhanVien();
        DataSet getNhanVien(string id,string tenNV,string diachi,string sdt,string email,string machucvu,string malop);
        void AddNhanVien(NhanVien nhanvien);
        void EditNhanVien(NhanVien nhanvien);
        void DeleteNhanVien(string id);
    }
}
