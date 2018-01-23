using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using QLMN_Librany.DAO;
using QLMN_Librany.Objects;

using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace QLMN_Librany.DAO.impl
{
    public class PhieuTheoDoiDaoImpl: IPhieuTheoDoiDao
    {
        string connString;
        SqlConnection conn;
        public PhieuTheoDoiDaoImpl()
        {
            connString = ConfigurationManager.ConnectionStrings["connString"].ConnectionString;
            conn = new SqlConnection(connString);
        }
        /// <summary>
        /// get list
        /// </summary>
        /// <returns></returns>
        public DataSet GetListPhieuTheoDoi()
        {
            using (conn )
            {
                if (conn.State == ConnectionState.Closed)
                    conn.Open();
                SqlCommand command = conn.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "GetListPhieuTheoDoi";
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataSet dataset = new DataSet();
                adapter.Fill(dataset);

                return dataset;
            }
        }

        public DataTable GetPhieuTheoDoi(string magiaovien, DateTime ngay)
        {
            using (conn = new SqlConnection(connString))
            {
                if (conn.State != ConnectionState.Open)
                    conn.Open();
                SqlCommand command = conn.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "GetPhieuTheoDoi";
                command.Parameters.Add("@MaGiaoVien", SqlDbType.VarChar, 20).Value = magiaovien;
                command.Parameters.Add("@NgayTheoDoi", SqlDbType.Date).Value = ngay;
                try
                {
                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    DataTable dt = new DataTable();
                    adapter.Fill(dt);
                    return dt;
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
        /// <summary>
        /// add
        /// </summary>
        /// <param name="phieutheodoi"></param>
        public void AddPhieuTheoDoi(PhieuTheoDoi phieutheodoi)
        {
            using (conn )
            {
                if (conn.State != ConnectionState.Open)
                    conn.Open();
                SqlCommand command = conn.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "InsertUpdatePhieuTheoDoi";
                command.Parameters.Add("@MaPhieuTheoDoi", SqlDbType.VarChar, 20).Value = phieutheodoi.MaPhieuTheoDoi;
                command.Parameters.Add("@MaGiaoVien", SqlDbType.VarChar,20).Value = phieutheodoi.MaGiaoVien;
                command.Parameters.Add("@NgayTheoDoi", SqlDbType.Date).Value = phieutheodoi.NgayTheoDoi;
                command.Parameters.Add("@ChiPhiDuTinh", SqlDbType.Decimal).Value = phieutheodoi.ChiPhiDuTinh;
                command.Parameters.Add("@Action", SqlDbType.VarChar, 10).Value = "Insert";
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
        /// <summary>
        /// edit
        /// </summary>
        /// <param name="phieutheodoi"></param>
        public void EditPhieuTheoDoi(PhieuTheoDoi phieutheodoi)
        {
            using (conn )
            {
                if (conn.State != ConnectionState.Open)
                    conn.Open();
                SqlCommand command = conn.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "InsertUpdatePhieuTheoDoi";
                command.Parameters.Add("@MaPhieuTheoDoi", SqlDbType.VarChar, 20).Value = phieutheodoi.MaPhieuTheoDoi;
                command.Parameters.Add("@MaGiaoVien", SqlDbType.VarChar, 20).Value = phieutheodoi.MaGiaoVien;
                command.Parameters.Add("@NgayTheoDoi", SqlDbType.Date).Value = phieutheodoi.NgayTheoDoi;
                command.Parameters.Add("@ChiPhiDuTinh", SqlDbType.Decimal).Value = phieutheodoi.ChiPhiDuTinh;
                command.Parameters.Add("@Action", SqlDbType.VarChar, 10).Value = "Update";
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
        /// <summary>
        /// delete
        /// </summary>
        /// <param name="id"></param>
        public void DeletephieuTheoDoi(string id)
        {
            using (conn )
            {
                if (conn.State != ConnectionState.Open)
                    conn.Open();
                SqlCommand command = conn.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "DeletePhieuTheoDoi";
                command.Parameters.Add("@MaPhieuTheoDoi", SqlDbType.VarChar, 20).Value = id;
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
