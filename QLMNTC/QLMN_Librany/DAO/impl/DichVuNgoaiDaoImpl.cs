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
    public class DichVuNgoaiDaoImpl : IDichVuNgoaiDao
    {
        string connString;
        SqlConnection conn;
        public DichVuNgoaiDaoImpl()
        {
            connString = ConfigurationManager.ConnectionStrings["connString"].ConnectionString;
            conn = new SqlConnection(connString);
        }
        /// <summary>
        /// get list
        /// </summary>
        /// <returns></returns>
        public DataSet GetListDichVu()
        {
            using (conn )
            {
                if (conn.State == ConnectionState.Closed)
                    conn.Open();
                SqlCommand command = conn.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "GetListDichVu";
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataSet dataset = new DataSet();
                adapter.Fill(dataset);

                return dataset;
            }
        }

        public DataSet GetDichVu(string id, string name)
        {
            using (conn )
            {
                if (conn.State != ConnectionState.Open)
                    conn.Open();
                SqlCommand command = conn.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "GetDichVu";
                command.Parameters.Add("@MaDichVu", SqlDbType.VarChar, 20).Value = id;
                command.Parameters.Add("@TenDichVu", SqlDbType.NVarChar, 50).Value = name;
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
        /// <param name="dichvu"></param>
        public void AddDichVu(DichVuNgoai dichvu)
        {
            using (conn )
            {
                if (conn.State != ConnectionState.Open)
                    conn.Open();
                SqlCommand command = conn.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "InsertUpdateDichVuNgoai";
                command.Parameters.Add("@MaDichVu", SqlDbType.VarChar, 20).Value = dichvu.MaDichVu;
                command.Parameters.Add("@TenDichVu", SqlDbType.NVarChar, 50).Value = dichvu.TenDV;
                command.Parameters.Add("@ChiPhi", SqlDbType.Int).Value = dichvu.ChiPhi;
                command.Parameters.Add("@GhiChu", SqlDbType.Decimal).Value = dichvu.GhiChu;
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
        /// <param name="dichvu"></param>
        public void EditDichVu(DichVuNgoai dichvu)
        {
            using (conn )
            {
                if (conn.State != ConnectionState.Open)
                    conn.Open();
                SqlCommand command = conn.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "InsertUpdateDichVuNgoai";
                command.Parameters.Add("@MaDichVu", SqlDbType.VarChar, 20).Value = dichvu.MaDichVu;
                command.Parameters.Add("@TenDichVu", SqlDbType.NVarChar, 50).Value = dichvu.TenDV;
                command.Parameters.Add("@ChiPhi", SqlDbType.Int).Value = dichvu.ChiPhi;
                command.Parameters.Add("@GhiChu", SqlDbType.Decimal).Value = dichvu.GhiChu;
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
        public void DeleteDichVu(string id)
        {
            using (conn )
            {
                if (conn.State != ConnectionState.Open)
                    conn.Open();
                SqlCommand command = conn.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "DeleteDichVuNgoai";
                command.Parameters.Add("@MaDichVu", SqlDbType.VarChar, 20).Value = id;
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
