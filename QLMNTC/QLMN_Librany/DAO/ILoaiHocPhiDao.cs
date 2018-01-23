using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using QLMN_Librany.Objects;
namespace QLMN_Librany.DAO
{
    interface ILoaiHocPhiDao
    {
        //DataSet GetListLoaiHocPhi();
        List<LoaiHocPhi> GetListLoaiHocPhi();
        DataSet GetLoaiHocPhi(string id,string name);
        void AddLoaiHocPhi(LoaiHocPhi loaihocphi);
        void EditLoaiHocPhi(LoaiHocPhi loaihocphi);
        void DeleteLoaiHocPhi(string id);
    }
}
