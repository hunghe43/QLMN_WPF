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
    public class CT_PhieuThu_HocSinhDaoImpl : ICT_PhieuThu_HocSinhDao
    {
        string connString;
        SqlConnection conn;
        public CT_PhieuThu_HocSinhDaoImpl()
        {
            connString = ConfigurationManager.ConnectionStrings["connString"].ConnectionString;
            conn = new SqlConnection(connString);
        }
        /// <summary>
        /// get list
        /// </summary>
        /// <returns></returns>
        public DataSet GetListCT_PhieuThu_HocSinh()
        {
            using (conn )
            {
                if (conn.State == ConnectionState.Closed)
                    conn.Open();
                SqlCommand command = conn.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "GetListCT_PhieuThu_HocSinh";
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataSet dataset = new DataSet();
                adapter.Fill(dataset);

                return dataset;
            }
        }

        public DataSet GetCT_PhieuThu_HocSinh(string id, string maphieuthu, string tenloaiphi)
        {
            using (conn )
            {
                if (conn.State != ConnectionState.Open)
                    conn.Open();
                SqlCommand command = conn.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "GetCT_PhieuThu_HocSinh";
                command.Parameters.Add("@MaCT_PhieuThu_HocSinh", SqlDbType.VarChar, 20).Value = id;
                command.Parameters.Add("@TenLoaiPhi", SqlDbType.NVarChar, 50).Value = maphieuthu;
                command.Parameters.Add("@MaPhieuThu", SqlDbType.VarChar,20).Value = tenloaiphi;
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
        /// <param name="ct_phieuthu_hs"></param>
        public void AddCT_PhieuThu_HocSinh(CT_PhieuThu_HocSinh ct_phieuthu_hs)
        {
            using (conn )
            {
                if (conn.State != ConnectionState.Open)
                    conn.Open();
                SqlCommand command = conn.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "InsertUpdateCT_PhieuThu_HocSinh";
                command.Parameters.Add("@MaCT_PhieuThu_HocSinh", SqlDbType.VarChar, 20).Value = ct_phieuthu_hs.MaCT_PhieuThu_HocSinh;
                command.Parameters.Add("@TenLoaiPhi", SqlDbType.NVarChar, 50).Value = ct_phieuthu_hs.TenLoaiPhi;
                command.Parameters.Add("@SoLuong", SqlDbType.Int).Value = ct_phieuthu_hs.SoLuong;
                command.Parameters.Add("@ChiPhi", SqlDbType.Decimal).Value = ct_phieuthu_hs.ChiPhi;
                command.Parameters.Add("@MaPhieuThu", SqlDbType.VarChar,20).Value = ct_phieuthu_hs.MaPhieuThu;
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
        /// <param name="ct_phieuthu_hs"></param>
        public void EditCT_PhieuThu_HocSinh(CT_PhieuThu_HocSinh ct_phieuthu_hs)
        {
            using (conn )
            {
                if (conn.State != ConnectionState.Open)
                    conn.Open();
                SqlCommand command = conn.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "InsertUpdateCT_PhieuThu_HocSinh";
                command.Parameters.Add("@MaCT_PhieuThu_HocSinh", SqlDbType.VarChar, 20).Value = ct_phieuthu_hs.MaCT_PhieuThu_HocSinh;
                command.Parameters.Add("@TenLoaiPhi", SqlDbType.NVarChar, 50).Value = ct_phieuthu_hs.TenLoaiPhi;
                command.Parameters.Add("@SoLuong", SqlDbType.Int).Value = ct_phieuthu_hs.SoLuong;
                command.Parameters.Add("@ChiPhi", SqlDbType.Decimal).Value = ct_phieuthu_hs.ChiPhi;
                command.Parameters.Add("@MaPhieuThu", SqlDbType.VarChar, 20).Value = ct_phieuthu_hs.MaPhieuThu;
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
        public void DeleteCT_PhieuThu_HocSinh(string id)
        {
            using (conn )
            {
                if (conn.State != ConnectionState.Open)
                    conn.Open();
                SqlCommand command = conn.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "DeleteCT_PhieuThu_HocSinh";
                command.Parameters.Add("@MaCT_PhieuThu_HocSinh", SqlDbType.VarChar, 20).Value = id;
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
