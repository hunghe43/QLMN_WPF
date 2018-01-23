using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using QLMN_Librany.Objects;
namespace QLMN_Librany.DAO
{
    interface IPhieuTheoDoiDao
    {
        DataSet GetListPhieuTheoDoi();
        DataTable GetPhieuTheoDoi(string magiaovien,DateTime ngay);
        void AddPhieuTheoDoi(PhieuTheoDoi phieutheodoi);
        void EditPhieuTheoDoi(PhieuTheoDoi phieutheodoi);
        void DeletephieuTheoDoi(string id);
    }
}
