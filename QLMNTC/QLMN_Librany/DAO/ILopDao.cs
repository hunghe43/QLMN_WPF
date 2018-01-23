using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using QLMN_Librany.Objects;

namespace QLMN_Librany.DAO
{
    interface ILopDao
    {
        //DataSet GetListLop();
        List<Lop> GetListLop();
        DataSet GetLop(string id,string name);
        void AddLop(Lop lop);
        void EditLop(Lop lop);
        void DeleteLop(string id);
    }
}
