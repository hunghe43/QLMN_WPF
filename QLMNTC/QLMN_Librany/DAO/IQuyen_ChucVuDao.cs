using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using QLMN_Librany.Objects;
using System.Data;

namespace QLMN_Librany.DAO
{
    interface IQuyen_ChucVuDao
    {
        DataSet GetListQuyen_ChucVu();
        void AddQuyen_ChucVu(Quyen_ChucVu quyen_chucvu);
        void EditQuyen_ChucVu(Quyen_ChucVu quyen_chucvu);
        void DeleteQuyen_ChucVu(string MaChucVu, string MaQuyen);
    }
}
