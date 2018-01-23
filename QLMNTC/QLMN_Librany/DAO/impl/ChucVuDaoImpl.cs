using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using QLMN_Librany.Objects;
using QLMN_Librany.DAO;
using System.Configuration;

namespace QLMN_Librany.DAO.impl
{
    public class ChucVuDaoImpl : IChucVuDao
    {
        string connString;
        SqlConnection conn;
        public ChucVuDaoImpl()
        {
            connString = ConfigurationManager.ConnectionStrings["connString"].ConnectionString;
            conn = new SqlConnection(connString);
        }
        /// <summary>
        /// lấy danh sách chức vụ
        /// </summary>
        /// <returns> dataset</returns>
        //public DataSet GetListChucVu()
        //{
        //    using (conn)
        //    {
        //        if (conn.State != ConnectionState.Open)
        //            conn.Open();
        //        SqlCommand command = conn.CreateCommand();
        //        command.CommandType = CommandType.StoredProcedure;
        //        command.CommandText = "getAllChucVu";
        //        SqlDataAdapter adapter = new SqlDataAdapter(command);
        //        DataSet dataset = new DataSet();
        //        adapter.Fill(dataset);

        //        return dataset;
        //    }
        //}
        public List<ChucVu> GetListChucVu()
        {
            List<ChucVu> list = new List<ChucVu>();
            using (conn = new SqlConnection(connString))
            {
                if (conn.State == ConnectionState.Closed)
                    conn.Open();
                SqlCommand command = conn.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "getAllChucVu";
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                ChucVu hs;
                foreach (DataRow dr in dt.Rows)
                {
                    hs = new ChucVu();
                    hs.MaChucVu = Convert.ToString(dr["MaChucVu"]);
                    hs.TenChucVu = Convert.ToString(dr["TenChucVu"]);
                    list.Add(hs);
                }
            }
            return list;
        }
        /// <summary>
        /// lấy chức vụ theo id vaf ten truyền vào
        /// </summary>
        /// <param name="id"></param>
        /// <returns>DataSet</returns>        
        public DataSet GetChucVu(string id, string name)
        {

            using (conn)
            {
                if (conn.State != ConnectionState.Open)
                    conn.Open();
                SqlCommand command = conn.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "GetChucVu";
                command.Parameters.Add("@MaChucVu", SqlDbType.VarChar, 20).Value = id;
                command.Parameters.Add("@TenChucVu", SqlDbType.NVarChar, 50).Value = name;
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataSet dataset = new DataSet();
                adapter.Fill(dataset);

                return dataset;
            }
        }


        public void AddChucVu(ChucVu chucvu)
        {
            using (conn)
            {
                if (conn.State != ConnectionState.Open)
                    conn.Open();
                SqlCommand command = conn.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "InsertUpdateChucVu";
                command.Parameters.Add("@MaChucVu", SqlDbType.VarChar, 20).Value = chucvu.MaChucVu;
                command.Parameters.Add("@TenChucVu", SqlDbType.VarChar, 20).Value = chucvu.TenChucVu;
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

        public void EditChucVu(ChucVu chucvu)
        {

            using (conn)
            {
                if (conn.State != ConnectionState.Open)
                    conn.Open();
                SqlCommand command = conn.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "InsertUpdateChucVu";
                command.Parameters.Add("@MaChucVu", SqlDbType.VarChar, 20).Value = chucvu.MaChucVu;
                command.Parameters.Add("@TenChucVu", SqlDbType.NVarChar, 50).Value = chucvu.TenChucVu;
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

        public void DeleteChucVu(string machucvu)
        {

            using (conn)
            {
                if (conn.State != ConnectionState.Open)
                    conn.Open();
                SqlCommand command = conn.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "DeleteChucVu";
                command.Parameters.Add("@MaChucVu", SqlDbType.VarChar, 20).Value = machucvu;
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
