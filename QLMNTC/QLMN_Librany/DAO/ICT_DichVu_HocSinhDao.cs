using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using QLMN_Librany.Objects;
using System.Data;
namespace QLMN_Librany.DAO
{
    interface ICT_DichVu_HocSinhDao
    {
        DataSet GetListCT_DichVu_HocSinh();
        DataSet GetCT_DichVu_HocSinh(string id,string mahocsinh,string madichvu,string thangdk);
        void AddCT_DichVu_HocSinh(CT_DichVu_HocSinh ct_dv_hs);
        void EditCT_DichVu_HocSinh(CT_DichVu_HocSinh ct_dv_hs);
        void DeleteCT_DichVu_HocSinh(string id);
    }
}
