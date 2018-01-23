using QLMN_Librany.Objects;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QLMN_Librany.DAO
{
    interface IHocSinhDao
    {
        //DataSet GetListHocSinh();
        List<HocSinh> GetListHocSinh();
        DataSet GetHocSinh(string mahocsinh,string tenhocsinh,string diachi,string tenphuhuynh,string sdt,string email,string malop,bool doitruongmta,bool trangthai);        
        void AddHocSinh(HocSinh hocsinh);
        void EditHocSinh(HocSinh hocsinh);
        void DeleteHocSinh(string id);
    }
}
