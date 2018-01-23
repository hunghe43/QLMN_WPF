using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using QLMN_Librany.Objects;

namespace QLMN_Librany.DAO
{
    interface IQuyenDao
    {
        DataSet GetListQuyen();
        DataSet GetQuyen(string id,string parentId);
        void AddQuyen(Quyen quyen);
        void EditQuyen(Quyen quyen);
        void DeleteQuyen(string id);
    }
}
