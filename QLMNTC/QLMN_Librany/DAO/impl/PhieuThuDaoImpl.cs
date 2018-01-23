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
    public class PhieuThuDaoImpl : IPhieuThuDao
    {
        string connString;
        SqlConnection conn;
        public PhieuThuDaoImpl()
        {
            connString = ConfigurationManager.ConnectionStrings["connString"].ConnectionString;
            conn = new SqlConnection(connString);
        }
        /// <summary>
        /// get list
        /// </summary>
        /// <returns></returns>
        public DataSet GetListPhieuThu()
        {
            using (conn)
            {
                if (conn.State == ConnectionState.Closed)
                    conn.Open();
                SqlCommand command = conn.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "GetListPhieuThu";
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataSet dataset = new DataSet();
                adapter.Fill(dataset);

                return dataset;
            }
        }

        public DataSet GetPhieuThu(string id, string ngay, string mahocsinh, string manhanvien)
        {
            using (conn)
            {
                if (conn.State != ConnectionState.Open)
                    conn.Open();
                SqlCommand command = conn.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "GetPhieuThu";
                command.Parameters.Add("@MaPhieuThu", SqlDbType.VarChar, 20).Value = id;
                command.Parameters.Add("@NgayTaoPhieu", SqlDbType.VarChar, 20).Value = ngay;
                command.Parameters.Add("@MaHocSinh", SqlDbType.Date).Value = mahocsinh;
                command.Parameters.Add("@MaNhanVien", SqlDbType.Decimal).Value = manhanvien;
                try
                {
                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    DataSet dataset = new DataSet();
                    adapter.Fill(dataset);

                    return dataset;
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
        /// <param name="phieuthu"></param>
        public void AddPhieuThu(PhieuThu phieuthu)
        {
            using (conn)
            {
                if (conn.State != ConnectionState.Open)
                    conn.Open();
                SqlCommand command = conn.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "InsertUpdatePhieuThu";
                command.Parameters.Add("@MaPhieuThu", SqlDbType.VarChar, 20).Value = phieuthu.MaPhieuThu;
                command.Parameters.Add("@NgayTaoPhieu", SqlDbType.VarChar, 20).Value = phieuthu.NgayTaoPhieu;
                command.Parameters.Add("@MaHocSinh", SqlDbType.Date).Value = phieuthu.MaHocSinh;
                command.Parameters.Add("@MaNhanVien", SqlDbType.Decimal).Value = phieuthu.MaNhanVien;
                command.Parameters.Add("@GhiChu", SqlDbType.Decimal).Value = phieuthu.GhiChu;
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
        /// <param name="phieuthu"></param>
        public void EditPhieuThu(PhieuThu phieuthu)
        {
            using (conn)
            {
                if (conn.State != ConnectionState.Open)
                    conn.Open();
                SqlCommand command = conn.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "InsertUpdatePhieuThu";
                command.Parameters.Add("@MaPhieuThu", SqlDbType.VarChar, 20).Value = phieuthu.MaPhieuThu;
                command.Parameters.Add("@NgayTaoPhieu", SqlDbType.VarChar, 20).Value = phieuthu.NgayTaoPhieu;
                command.Parameters.Add("@MaHocSinh", SqlDbType.Date).Value = phieuthu.MaHocSinh;
                command.Parameters.Add("@MaNhanVien", SqlDbType.Decimal).Value = phieuthu.MaNhanVien;
                command.Parameters.Add("@GhiChu", SqlDbType.Decimal).Value = phieuthu.GhiChu;
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
        public void DeletePhieuThu(string id)
        {
            using (conn)
            {
                if (conn.State != ConnectionState.Open)
                    conn.Open();
                SqlCommand command = conn.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "DeletePhieuThu";
                command.Parameters.Add("@MaPhieuThu", SqlDbType.VarChar, 20).Value = id;
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

        public bool checkExistPhieuThu(PhieuThu phieuthu)
        {
            using (conn)
            {
                if (conn.State != ConnectionState.Open)
                    conn.Open();
                SqlCommand command = conn.CreateCommand();
                try
                {                    
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "GetPhieuThu";
                    command.Parameters.Add("@MaHocSinh", SqlDbType.VarChar, 20).Value = phieuthu.MaHocSinh;
                    command.Parameters.Add("@date", SqlDbType.VarChar, 7).Value = phieuthu.NgayTaoPhieu;
                    //command.;
                    return true;
                }
                catch (Exception ex)
                {
                    return false;
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
