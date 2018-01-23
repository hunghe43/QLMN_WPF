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
    public class HocPhiDaoImpl : IHocPhiDao
    {
        string connString;
        SqlConnection conn;
        public HocPhiDaoImpl()
        {
            connString = ConfigurationManager.ConnectionStrings["connString"].ConnectionString;
            conn = new SqlConnection(connString);
        }
        //public DataSet GetListHocPhi()
        //{
        //    using (conn )
        //    {
        //        if (conn.State == ConnectionState.Closed)
        //            conn.Open();
        //        SqlCommand command = conn.CreateCommand();
        //        command.CommandType = CommandType.StoredProcedure;
        //        command.CommandText = "GetListHocPhi";
        //        SqlDataAdapter adapter = new SqlDataAdapter(command);
        //        DataSet dataset = new DataSet();
        //        adapter.Fill(dataset);

        //        return dataset;
        //    }
        //}


        public List<HocPhi> GetListHocPhi()
        {
            List<HocPhi> list = new List<HocPhi>();
            using (conn = new SqlConnection(connString))
            {
                if (conn.State == ConnectionState.Closed)
                    conn.Open();
                SqlCommand command = conn.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "GetListHocPhi";
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                HocPhi hp;
                foreach (DataRow dr in dt.Rows)
                {
                    hp = new HocPhi();
                    hp.MaHocPhi = Convert.ToString(dr["MaHocPhi"]);
                    hp.TenhocPhi = Convert.ToString(dr["TenhocPhi"]);
                    hp.ChiPhi = Convert.ToInt32(dr["ChiPhi"]);
                    hp.LoaiHocPhi = Convert.ToString(dr["LoaiHocPhi"]);
                    list.Add(hp);
                }
            }
            return list;
        }


        /// <summary>
        /// add
        /// </summary>
        /// <param name="hocphi"></param>
        public void AddHocPhi(HocPhi hocphi)
        {
            hocphi.MaHocPhi = AutoIdHocPhi();
            using (conn = new SqlConnection(connString))
            {
                if (conn.State != ConnectionState.Open)
                    conn.Open();
                SqlCommand command = conn.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "InsertUpdateHocPhi";
                command.Parameters.Add("@MaHocPhi", SqlDbType.VarChar, 20).Value = hocphi.MaHocPhi;
                command.Parameters.Add("@TenHocPhi", SqlDbType.NVarChar, 50).Value = hocphi.TenhocPhi;
                command.Parameters.Add("@ChiPhi", SqlDbType.Decimal).Value = hocphi.ChiPhi;
                command.Parameters.Add("@GhiChu", SqlDbType.NVarChar, 100).Value = hocphi.GhiChu;
                command.Parameters.Add("@LoaiHocPhi", SqlDbType.VarChar, 20).Value = hocphi.LoaiHocPhi;
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
        /// <param name="hocphi"></param>
        public void EditHocPhi(HocPhi hocphi)
        {
            using (conn = new SqlConnection(connString))
            {
                if (conn.State != ConnectionState.Open)
                    conn.Open();
                SqlCommand command = conn.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "InsertUpdateHocPhi";
                command.Parameters.Add("@MaHocPhi", SqlDbType.VarChar, 20).Value = hocphi.MaHocPhi;
                command.Parameters.Add("@TenHocPhi", SqlDbType.NVarChar, 50).Value = hocphi.TenhocPhi;
                command.Parameters.Add("@ChiPhi", SqlDbType.Decimal).Value = hocphi.ChiPhi;
                command.Parameters.AddWithValue("@GhiChu", string.IsNullOrEmpty(hocphi.GhiChu) ? (object)DBNull.Value : hocphi.GhiChu);
                command.Parameters.Add("@LoaiHocPhi", SqlDbType.VarChar, 20).Value = hocphi.LoaiHocPhi;
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
        public void DeleteHocPhi(string id)
        {
            using (conn = new SqlConnection(connString))
            {
                if (conn.State != ConnectionState.Open)
                    conn.Open();
                SqlCommand command = conn.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "DeleteHocPhi";
                command.Parameters.Add("@MaHocPhi", SqlDbType.VarChar, 20).Value = id;
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

        public DataSet GetHocPhi(string id, string name, string loaihocphi)
        {
            using (conn)
            {
                if (conn.State != ConnectionState.Open)
                    conn.Open();
                SqlCommand command = conn.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "GetHocPhi";
                command.Parameters.Add("@MaHocPhi", SqlDbType.VarChar, 20).Value = id;
                command.Parameters.Add("@TenhocPhi", SqlDbType.NVarChar, 50).Value = name;
                command.Parameters.Add("@LoaiHocPhi", SqlDbType.Decimal).Value = loaihocphi;
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
        public string AutoIdHocPhi()
        {
            using (conn = new SqlConnection(connString))
            {
                if (conn.State != ConnectionState.Open)
                    conn.Open();
                SqlCommand command = conn.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add("@ma_next", SqlDbType.VarChar, 20).Direction = ParameterDirection.Output;
                command.CommandText = "sp_HocPhi_NewID";
                try
                {
                    command.ExecuteNonQuery();
                    return command.Parameters["@ma_next"].Value.ToString();
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
