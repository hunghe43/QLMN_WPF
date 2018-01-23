using QLMN_Librany.Objects;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QLMN_Librany.DAO
{
    public interface IChucVuDao
    {
        /// <summary>
        /// lấy danh sách tất cả chức vụ
        /// </summary>
        /// <returns> DataSet</returns>
        //DataSet GetListChucVu();
        List<ChucVu> GetListChucVu();

        /// <summary>
        /// lấy chức vụ theo mã và tên
        /// </summary>
        /// <param name="maChucVu"></param>
        /// <param name="tenChucVu"></param>
        /// <returns></returns>
        DataSet GetChucVu(string maChucVu, string tenChucVu);
        /// <summary>
        /// thêm  mới chwucs vụ
        /// </summary>
        /// <param name="chucvu"></param>
        void AddChucVu(ChucVu chucvu);
        /// <summary>
        /// sửa chwucs vụ
        /// </summary>
        /// <param name="chucvu"></param>
        void EditChucVu(ChucVu chucvu);
        /// <summary>
        /// xóa chức vụ
        /// </summary>
        /// <param name="machucvu"></param>
        void DeleteChucVu(string machucvu);
    }
}
