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
    public class LoaiHocPhiDaoImpl: ILoaiHocPhiDao
    {
        string connString;
        SqlConnection conn;
        public LoaiHocPhiDaoImpl()
        {
            connString = ConfigurationManager.ConnectionStrings["connString"].ConnectionString;
            conn = new SqlConnection(connString);
        }

        //public DataSet GetListLoaiHocPhi()
        //{
        //    using (conn )
        //    {
        //        if (conn.State == ConnectionState.Closed)
        //            conn.Open();
        //        SqlCommand command = conn.CreateCommand();
        //        command.CommandType = CommandType.StoredProcedure;
        //        command.CommandText = "GetListLoaiHocPhi";
        //        SqlDataAdapter adapter = new SqlDataAdapter(command);
        //        DataSet dataset = new DataSet();
        //        adapter.Fill(dataset);

        //        return dataset;
        //    }
        //}
        public List<LoaiHocPhi> GetListLoaiHocPhi()
        {
            List<LoaiHocPhi> list = new List<LoaiHocPhi>();
            using (conn = new SqlConnection(connString))
            {
                if (conn.State == ConnectionState.Closed)
                    conn.Open();
                SqlCommand command = conn.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "GetListLoaiHocPhi";
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                LoaiHocPhi hp;
                foreach (DataRow dr in dt.Rows)
                {
                    hp = new LoaiHocPhi();
                    hp.MaLoai = Convert.ToString(dr["MaLoai"]);
                    hp.TenLoai = Convert.ToString(dr["TenLoai"]);
                    hp.GhiChu = Convert.ToString(dr["GhiChu"]);                    
                    list.Add(hp);
                }
            }
            return list;
        }
        public DataSet GetLoaiHocPhi(string id, string name)
        {
            using (conn )
            {
                if (conn.State != ConnectionState.Open)
                    conn.Open();
                SqlCommand command = conn.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "GetLoaiHocPhi";
                command.Parameters.Add("@MaLoai", SqlDbType.VarChar, 20).Value = id;
                command.Parameters.Add("@TenLoai", SqlDbType.NVarChar, 50).Value = name;
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

        public void AddLoaiHocPhi(LoaiHocPhi loaihocphi)
        {
            using (conn )
            {
                if (conn.State != ConnectionState.Open)
                    conn.Open();
                SqlCommand command = conn.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "InsertUpdateLoaiHocPhi";
                command.Parameters.Add("@MaLoai", SqlDbType.VarChar, 20).Value = loaihocphi.MaLoai;
                command.Parameters.Add("@TenLoai", SqlDbType.NVarChar, 50).Value = loaihocphi.TenLoai;
                command.Parameters.Add("@GhiChu", SqlDbType.NVarChar,100).Value = loaihocphi.GhiChu;
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

        public void EditLoaiHocPhi(LoaiHocPhi loaihocphi)
        {
            using (conn )
            {
                if (conn.State != ConnectionState.Open)
                    conn.Open();
                SqlCommand command = conn.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "InsertUpdateLoaiHocPhi";
                command.Parameters.Add("@MaLoai", SqlDbType.VarChar, 20).Value = loaihocphi.MaLoai;
                command.Parameters.Add("@TenLoai", SqlDbType.NVarChar, 50).Value = loaihocphi.TenLoai;
                command.Parameters.Add("@GhiChu", SqlDbType.NVarChar,100).Value = loaihocphi.GhiChu;
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

        public void DeleteLoaiHocPhi(string id)
        {
            using (conn )
            {
                if (conn.State != ConnectionState.Open)
                    conn.Open();
                SqlCommand command = conn.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "DeleteLoaiHocPhi";
                command.Parameters.Add("@MaLoai", SqlDbType.VarChar, 20).Value = id;
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
