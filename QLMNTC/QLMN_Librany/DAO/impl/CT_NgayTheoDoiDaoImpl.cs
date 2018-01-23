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
    public class CT_NgayTheoDoiDaoImpl : ICT_NgayTheoDoiDao
    {
        string connString;
        SqlConnection conn;
        public CT_NgayTheoDoiDaoImpl()
        {
            connString = ConfigurationManager.ConnectionStrings["connString"].ConnectionString;
            conn = new SqlConnection(connString);
        }
        /// <summary>
        /// get list
        /// </summary>
        /// <returns></returns>
        public DataSet GetListCT_NgayTheoDoi()
        {
            using (conn )
            {
                if (conn.State != ConnectionState.Open)
                    conn.Open();
                SqlCommand command = conn.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "GetListCT_NgayTheoDoi";
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataSet dataset = new DataSet();
                adapter.Fill(dataset);

                return dataset;
            }
        }

        public DataSet GetCT_NgayTheoDoi(string maphieutheodoi, string mahocsinh)
        {
            using (conn )
            {
                if (conn.State != ConnectionState.Open)
                    conn.Open();
                SqlCommand command = conn.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "GetCT_NgayTheoDoi";
                command.Parameters.Add("@MaPhieuTheoDoi", SqlDbType.VarChar, 20).Value = maphieutheodoi;
                command.Parameters.Add("@MaHocSinh", SqlDbType.VarChar, 20).Value = mahocsinh;
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
        /// Add
        /// </summary>
        /// <param name="ct_ngaytheodoi"></param>
        public void AddCT_NgayTheoDoi(CT_NgayTheoDoi ct_ngaytheodoi)
        {
            using (conn )
            {
                if (conn.State != ConnectionState.Open)
                    conn.Open();
                SqlCommand command = conn.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "InsertUpdateCT_NgayTheoDoi";
                command.Parameters.Add("@MaPhieuTheoDoi", SqlDbType.VarChar, 20).Value = ct_ngaytheodoi.MaPhieuTheoDoi;
                command.Parameters.Add("@MaHocSinh", SqlDbType.VarChar, 20).Value = ct_ngaytheodoi.MaHocSinh;
                command.Parameters.Add("@DDVang", SqlDbType.Bit).Value = ct_ngaytheodoi.DDVang;
                command.Parameters.Add("@DDAnSang", SqlDbType.Bit).Value = ct_ngaytheodoi.DDAnSang;
                command.Parameters.Add("@DDAnTrua", SqlDbType.Bit).Value = ct_ngaytheodoi.DDAnTrua;
                command.Parameters.Add("@GhiChu", SqlDbType.NVarChar, 100).Value = ct_ngaytheodoi.GhiChu;
                command.Parameters.Add("@ChiPhi", SqlDbType.Money).Value = ct_ngaytheodoi.ChiPhi;
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
        /// Edit
        /// </summary>
        /// <param name="ct_ngaytheodoi"></param>
        public void EditCT_NgayTheoDoi(CT_NgayTheoDoi ct_ngaytheodoi)
        {
            using (conn )
            {
                if (conn.State != ConnectionState.Open)
                    conn.Open();
                SqlCommand command = conn.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "InsertUpdateCT_NgayTheoDoi";
                command.Parameters.Add("@MaPhieuTheoDoi", SqlDbType.VarChar, 20).Value = ct_ngaytheodoi.MaPhieuTheoDoi;
                command.Parameters.Add("@MaHocSinh", SqlDbType.VarChar, 20).Value = ct_ngaytheodoi.MaHocSinh;
                command.Parameters.Add("@DDVang", SqlDbType.Bit).Value = ct_ngaytheodoi.DDVang;
                command.Parameters.Add("@DDAnSang", SqlDbType.Bit).Value = ct_ngaytheodoi.DDAnSang;
                command.Parameters.Add("@DDAnTrua", SqlDbType.Bit).Value = ct_ngaytheodoi.DDAnTrua;
                command.Parameters.Add("@GhiChu", SqlDbType.NVarChar, 100).Value = ct_ngaytheodoi.GhiChu;
                command.Parameters.Add("@ChiPhi", SqlDbType.Money).Value = ct_ngaytheodoi.ChiPhi;
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
        public void DeleteCT_NgayTheoDoi(string id)
        {
            using (conn )
            {
                if (conn.State != ConnectionState.Open)
                    conn.Open();
                SqlCommand command = conn.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "DeleteCT_NgayTheoDoi";
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
