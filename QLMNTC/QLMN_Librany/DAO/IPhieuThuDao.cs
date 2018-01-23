using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using QLMN_Librany.Objects;
using System.Data;

namespace QLMN_Librany.DAO
{
    interface IPhieuThuDao
    {
        DataSet GetListPhieuThu();
        DataSet GetPhieuThu(string id, string ngay, string mahocsinh, string manhanvien);
        void AddPhieuThu(PhieuThu phieuthu);
        void EditPhieuThu(PhieuThu phieuthu);
        void DeletePhieuThu(string id);
        bool checkExistPhieuThu(PhieuThu phieuthu);
    }
}
