using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using QLMN_Librany.Objects;
namespace QLMN_Librany.DAO
{
    interface ICT_PhieuThu_HocSinhDao
    {
        DataSet GetListCT_PhieuThu_HocSinh();
        DataSet GetCT_PhieuThu_HocSinh(string id,string maphieuthu, string tenloaiphi);
        void AddCT_PhieuThu_HocSinh(CT_PhieuThu_HocSinh ct_phieuthu_hs);
        void EditCT_PhieuThu_HocSinh(CT_PhieuThu_HocSinh ct_phieuthu_hs);
        void DeleteCT_PhieuThu_HocSinh(string id);
    }
}
