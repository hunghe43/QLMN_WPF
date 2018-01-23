using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using QLMN_Librany.Objects;

namespace QLMN_Librany.DAO
{
    interface IHocPhiDao
    {
        //DataSet GetListHocPhi();
        List<HocPhi> GetListHocPhi();
        DataSet GetHocPhi(string id,string name,string loaihocphi);
        void AddHocPhi(HocPhi hocphi);
        void EditHocPhi(HocPhi hocphi);
        void DeleteHocPhi(string id);
        
    }
}
