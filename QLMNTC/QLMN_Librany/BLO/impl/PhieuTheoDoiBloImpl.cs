using QLMN_Librany.Objects;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QLMN_Librany.BLO.impl
{
    public class PhieuTheoDoiBloImpl
    {
        string connString;
        SqlConnection conn;
        public PhieuTheoDoiBloImpl()
        {
            connString = ConfigurationManager.ConnectionStrings["connString"].ConnectionString;
            conn = new SqlConnection(connString);
        }
        /// <summary>
        /// Hàm lấy thông tin điểm danh của học sinh trong tháng
        /// </summary>
        /// <param name="mahs"></param>
        /// <param name="thang"></param>
        /// <returns></returns>
        public HocSinh_TheoDoi GetInfoTheoDoi(string mahs, string thang)
        {
            try
            {
                using (conn = new SqlConnection(connString))
                {
                    if (conn.State != ConnectionState.Open)
                        conn.Open();
                    SqlCommand command = conn.CreateCommand();
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "Get_Infor_TheoDoi";
                    command.Parameters.AddWithValue("@MaHocSinh", mahs);
                    command.Parameters.AddWithValue("@date", thang);

                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    DataTable datatable = new DataTable();
                    adapter.Fill(datatable);

                    HocSinh_TheoDoi info = new HocSinh_TheoDoi();
                    foreach (DataRow row in datatable.Rows)
                    {
                        info.date = Convert.ToString(row[0]);
                        info.MaHocSinh = Convert.ToString(row[1]);
                        info.SoNgayVang = Convert.ToInt32(row[2]);
                        info.SoNgayAnSang = Convert.ToInt32(row[3]);
                        info.SoNgayAnTrua = Convert.ToInt32(row[4]);
                    }
                    return info;
                }
            }
            catch
            {
                throw;
            }

        }
        /// <summary>
        /// lấy thông tin theo dõi của các học sinh trong tháng
        /// </summary>
        /// <param name="magv"></param>
        /// <param name="date"></param>
        /// <returns></returns>
        public List<CT_NgayTheoDoi> GetAll_CT_NgayTheoDoi(string magv, DateTime date)
        {
            List<CT_NgayTheoDoi> list = new List<CT_NgayTheoDoi>();
            using (conn = new SqlConnection(connString))
            {
                if (conn.State != ConnectionState.Open)
                    conn.Open();
                SqlCommand command = conn.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "getAll_CT_NgayTheoDoi";
                command.Parameters.AddWithValue("@MaGiaoVien", magv);
                command.Parameters.AddWithValue("@NgayTheoDoi", date);

                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable dataset = new DataTable();
                adapter.Fill(dataset);


                CT_NgayTheoDoi ct;
                foreach (DataRow row in dataset.Rows)
                {
                    ct = new CT_NgayTheoDoi();
                    ct.MaHocSinh = (string)row["MaHocSinh"];
                    ct.DDVang = (bool)row["DDVang"];
                    ct.DDAnSang = (bool)row["DDAnSang"];
                    ct.DDAnTrua = (bool)row["DDAnTrua"];
                    list.Add(ct);
                }
            }
            return list;
        }
        /// <summary>
        /// Hàm thực hiện điểm danh và lưu lại
        /// </summary>
        /// <param name="magv"></param>
        /// <param name="date"></param>
        /// <param name="mahs"></param>
        /// <param name="vang"></param>
        /// <param name="ansang"></param>
        /// <param name="antrua"></param>
        public void DiemDanh(string magv, DateTime date, string mahs, bool vang, bool ansang, bool antrua)
        {
            using (conn = new SqlConnection(connString))
            {
                if (conn.State != ConnectionState.Open)
                    conn.Open();
                SqlCommand command = conn.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "DiemDanhProc";
                command.Parameters.AddWithValue("@MaGiaoVien", magv);
                command.Parameters.AddWithValue("@NgayTheoDoi", date);
                command.Parameters.AddWithValue("@MaHocSinh", mahs);
                command.Parameters.AddWithValue("@ddVang", vang);
                command.Parameters.AddWithValue("@ddAnSang", ansang);
                command.Parameters.AddWithValue("@ddAnTrua", antrua);
                try
                {
                    command.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    throw ex;
                }
                finally
                {
                    command.Dispose();
                    conn.Dispose();
                }
            }
        }

    }
}
