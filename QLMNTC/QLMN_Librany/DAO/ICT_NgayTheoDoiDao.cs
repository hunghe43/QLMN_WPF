using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using QLMN_Librany.Objects;
namespace QLMN_Librany.DAO
{
    interface ICT_NgayTheoDoiDao
    {
        DataSet GetListCT_NgayTheoDoi();
        DataSet GetCT_NgayTheoDoi(string maphieutheodoi, string mahocsinh);
        void AddCT_NgayTheoDoi(CT_NgayTheoDoi ct_ngaytheodoi);
        void EditCT_NgayTheoDoi(CT_NgayTheoDoi ct_ngaytheodoi);
        void DeleteCT_NgayTheoDoi(string id);
    }
}
