using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using QLMN_Librany.Objects;
namespace QLMN_Librany.DAO
{
    interface IPhieuChiTieuDao
    {
        //DataSet GetListPhieuChiTieu();
        List<PhieuChiTieu> GetListPhieuChiTieu();
        DataSet GetPhieuChiTieu(string id, DateTime ngaytao,string manhanvien,string lydo);
        void AddPhieuChiTieu(PhieuChiTieu phieuchitieu);
        void EditPhieuChiTieu(PhieuChiTieu phieuchitieu);
        void DeletePhieuChiTieu(string id);
    }
}
