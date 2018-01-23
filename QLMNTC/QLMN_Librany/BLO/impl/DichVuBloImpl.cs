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
    public class DichVuBloImpl
    {
        string connString;
        SqlConnection conn;
        public DichVuBloImpl()
        {
            connString = ConfigurationManager.ConnectionStrings["connString"].ConnectionString;
            conn = new SqlConnection(connString);
        }
        /// <summary>
        /// Hàm lấy danh sách dịch vụ của học sinh theo tháng
        /// </summary>
        /// <param name="mahocsinh"></param>
        /// <param name="thang"></param>
        /// <returns></returns>
        public List<DichVuNgoai> GetListDichVuHocSinh(string mahocsinh, string thang)
        {
            List<DichVuNgoai> list;
            using (conn = new SqlConnection(connString))
            {
                if (conn.State == ConnectionState.Closed)
                    conn.Open();
                SqlCommand command = conn.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "getListDichVuNgoai_HocSinh";
                command.Parameters.AddWithValue("@MaHocSinh", mahocsinh);
                command.Parameters.AddWithValue("@Thang", thang);
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                DichVuNgoai hs;
                list = new List<DichVuNgoai>();
                foreach (DataRow dr in dt.Rows)
                {
                    hs = new DichVuNgoai();
                    hs.MaDichVu = Convert.ToString(dr["MaDichVu"]);
                    hs.TenDV = Convert.ToString(dr["TenDV"]);
                    hs.ChiPhi = Convert.ToDecimal(dr["ChiPhi"]);
                    hs.GhiChu = Convert.ToString(dr["GhiChu"]);
                    list.Add(hs);
                }
            }
            return list;
        }

    }
}
