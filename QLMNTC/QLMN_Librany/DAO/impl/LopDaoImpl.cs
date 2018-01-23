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
    public class LopDaoImpl : ILopDao
    {
        string connString;
        SqlConnection conn;
        public LopDaoImpl()
        {
            connString = ConfigurationManager.ConnectionStrings["connString"].ConnectionString;
            conn = new SqlConnection(connString);
        }
        ///// <summary>
        ///// get list
        ///// </summary>
        ///// <returns></returns>
        //public DataSet GetListLop()
        //{
        //    using (conn )
        //    {
        //        if (conn.State == ConnectionState.Closed)
        //            conn.Open();
        //        SqlCommand command = conn.CreateCommand();
        //        command.CommandType = CommandType.StoredProcedure;
        //        command.CommandText = "GetListLop";
        //        SqlDataAdapter adapter = new SqlDataAdapter(command);
        //        DataSet dataset = new DataSet();
        //        adapter.Fill(dataset);

        //        return dataset;
        //    }
        //}
        public List<Lop> GetListLop()
        {
            List<Lop> list = new List<Lop>();
            using (conn = new SqlConnection(connString))
            {
                if (conn.State == ConnectionState.Closed)
                    conn.Open();
                SqlCommand command = conn.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "GetListLop";
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                Lop hs;
                foreach (DataRow dr in dt.Rows)
                {
                    hs = new Lop();
                    hs.MaLop = Convert.ToString(dr["MaLop"]);
                    hs.GhiChu = Convert.ToString(dr["GhiChu"]);
                    hs.TenLop = Convert.ToString(dr["TenLop"]);
                    hs.SiSo = Convert.ToInt32(dr["SiSo"]);                    
                    list.Add(hs);
                }
            }
            return list;
        }

        public DataSet GetLop(string id, string name)
        {
            using (conn )
            {
                if (conn.State != ConnectionState.Open)
                    conn.Open();
                SqlCommand command = conn.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "GetLop";
                command.Parameters.Add("@MaLop", SqlDbType.VarChar, 20).Value = id;
                command.Parameters.Add("@TenLop", SqlDbType.NVarChar, 50).Value = name;
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
        /// <param name="lop"></param>
        public void AddLop(Lop lop)
        {
            using (conn )
            {
                if (conn.State != ConnectionState.Open)
                    conn.Open();
                SqlCommand command = conn.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "InsertUpdateLop";
                command.Parameters.Add("@MaLop", SqlDbType.VarChar, 20).Value = lop.MaLop;
                command.Parameters.Add("@TenLop", SqlDbType.NVarChar, 50).Value = lop.TenLop;
                command.Parameters.Add("@GhiChu", SqlDbType.NVarChar, 100).Value = lop.GhiChu;
                command.Parameters.Add("@SiSo", SqlDbType.Int).Value = lop.SiSo;
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
        /// <param name="lop"></param>
        public void EditLop(Lop lop)
        {
            using (conn )
            {
                if (conn.State != ConnectionState.Open)
                    conn.Open();
                SqlCommand command = conn.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "InsertUpdateLop";
                command.Parameters.Add("@MaLop", SqlDbType.VarChar, 20).Value = lop.MaLop;
                command.Parameters.Add("@TenLop", SqlDbType.NVarChar, 50).Value = lop.TenLop;
                command.Parameters.Add("@GhiChu", SqlDbType.NVarChar, 100).Value = lop.GhiChu;
                command.Parameters.Add("@SiSo", SqlDbType.Int).Value = lop.SiSo;
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
        /// <param name="lop"></param>
        public void DeleteLop(string id)
        {
            using (conn )
            {
                if (conn.State != ConnectionState.Open)
                    conn.Open();
                SqlCommand command = conn.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "DeleteLop";
                command.Parameters.Add("@MaLop", SqlDbType.VarChar, 20).Value = id;
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
