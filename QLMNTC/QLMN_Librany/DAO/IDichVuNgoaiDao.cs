using QLMN_Librany.Objects;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QLMN_Librany.DAO
{
    interface IDichVuNgoaiDao
    {
        DataSet GetListDichVu();
        DataSet GetDichVu(string id,string name);
        void AddDichVu(DichVuNgoai dichvu);
        void EditDichVu(DichVuNgoai dichvu);
        void DeleteDichVu(string id);
        
    }
}
