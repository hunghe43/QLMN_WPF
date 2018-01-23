using QLMN_Librany.DAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using QLMN_Librany.Objects;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace QLMN_Librany.DAO.impl
{
    public class CT_DichVu_HocSinhDaoImpl : ICT_DichVu_HocSinhDao
    {
        string connString;
        SqlConnection conn;
        public CT_DichVu_HocSinhDaoImpl()
        {
            connString = ConfigurationManager.ConnectionStrings["connString"].ConnectionString;
            conn = new SqlConnection(connString);
        }
        /// <summary>
        /// Add
        /// </summary>
        /// <param name="ct_dv_hs"></param>
        public void AddCT_DichVu_HocSinh(CT_DichVu_HocSinh ct_dv_hs)
        {
            using (conn)
            {
                if (conn.State != ConnectionState.Open)
                    conn.Open();
                SqlCommand command = conn.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "InsertUpdateCT_DichVu_HocSinh";
                command.Parameters.Add("@MaCT_DV_HS", SqlDbType.VarChar, 20).Value = ct_dv_hs.MaCT_DV_HS;
                command.Parameters.Add("@MaHocSinh", SqlDbType.VarChar, 20).Value = ct_dv_hs.MaHocSinh;
                command.Parameters.Add("@MaDichVu", SqlDbType.VarChar, 20).Value = ct_dv_hs.MaDichVu;
                command.Parameters.Add("@ThangDangKy", SqlDbType.VarChar, 7).Value = ct_dv_hs.ThangDangKy;
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
        /// delete
        /// </summary>
        /// <param name="id"></param>
        public void DeleteCT_DichVu_HocSinh(string id)
        {
            using (conn)
            {
                if (conn.State != ConnectionState.Open)
                    conn.Open();
                SqlCommand command = conn.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "DeleteCT_DichVu_HocSinh";
                command.Parameters.Add("@MaCT_DV_HS", SqlDbType.VarChar, 20).Value = id;
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
        /// <param name="ct_dv_hs"></param>
        public void EditCT_DichVu_HocSinh(CT_DichVu_HocSinh ct_dv_hs)
        {
            using (conn)
            {
                if (conn.State != ConnectionState.Open)
                    conn.Open();
                SqlCommand command = conn.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "InsertUpdateCT_DichVu_HocSinh";
                command.Parameters.Add("@MaCT_DV_HS", SqlDbType.VarChar, 20).Value = ct_dv_hs.MaCT_DV_HS;
                command.Parameters.Add("@MaHocSinh", SqlDbType.VarChar, 20).Value = ct_dv_hs.MaHocSinh;
                command.Parameters.Add("@MaDichVu", SqlDbType.VarChar, 20).Value = ct_dv_hs.MaDichVu;
                command.Parameters.Add("@ThangDangKy", SqlDbType.VarChar, 7).Value = ct_dv_hs.ThangDangKy;
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

        public DataSet GetCT_DichVu_HocSinh(string id, string mahocsinh, string madichvu, string thangdk)
        {
            using (conn)
            {
                if (conn.State != ConnectionState.Open)
                    conn.Open();
                SqlCommand command = conn.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "GetCT_DichVu_HocSinh";
                command.Parameters.Add("@MaCT_DV_HS", SqlDbType.VarChar, 20).Value = id;
                command.Parameters.Add("@MaHocSinh", SqlDbType.VarChar, 20).Value = mahocsinh;
                command.Parameters.Add("@MaDichVu", SqlDbType.VarChar, 20).Value = madichvu;
                command.Parameters.Add("@ThangDangKy", SqlDbType.VarChar, 20).Value = thangdk;
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataSet dataset = new DataSet();
                adapter.Fill(dataset);

                return dataset;
            }
        }
        /// <summary>
        /// get list ct_dv_hs
        /// </summary>
        /// <returns></returns>
        public DataSet GetListCT_DichVu_HocSinh()
        {
            using (conn)
            {
                SqlCommand cmd = new SqlCommand("GetListCT_DichVu_HocSinh", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlDataAdapter adapter = new SqlDataAdapter();
                adapter.SelectCommand = cmd;
                DataSet dataSet = new DataSet();
                adapter.Fill(dataSet);
                return dataSet;
            }
        }
    }
}
