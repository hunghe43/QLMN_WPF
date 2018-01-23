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
    public class Quyen_ChucVuDaoImpl: IQuyen_ChucVuDao
    {
        string connString;
        SqlConnection conn;
        public Quyen_ChucVuDaoImpl()
        {
            connString = ConfigurationManager.ConnectionStrings["connString"].ConnectionString;
            conn = new SqlConnection(connString);
        }

        public DataSet GetListQuyen_ChucVu()
        {
            using (conn )
            {
                if (conn.State == ConnectionState.Closed)
                    conn.Open();
                SqlCommand command = conn.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "GetListQuyen_ChucVu";
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataSet dataset = new DataSet();
                adapter.Fill(dataset);

                return dataset;
            }
        }

        public DataSet GetQuyen_ChucVu(string MaChucVu, string MaQuyen)
        {
            throw new NotImplementedException();
        }
        public void AddQuyen_ChucVu(Quyen_ChucVu quyen_chucvu)
        {
            using (conn )
            {
                if (conn.State != ConnectionState.Open)
                    conn.Open();
                SqlCommand command = conn.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "InsertUpdateQuyen_ChucVu";
                command.Parameters.Add("@MaChucVu", SqlDbType.VarChar, 20).Value = quyen_chucvu.MaChucVu;
                command.Parameters.Add("@MaQuyen", SqlDbType.VarChar, 20).Value = quyen_chucvu.MaQuyen;

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

        public void EditQuyen_ChucVu(Quyen_ChucVu quyen_chucvu)
        {
            using (conn )
            {
                if (conn.State != ConnectionState.Open)
                    conn.Open();
                SqlCommand command = conn.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "InsertUpdateQuyen_ChucVu";
                command.Parameters.Add("@MaChucVu", SqlDbType.VarChar, 20).Value = quyen_chucvu.MaChucVu;
                command.Parameters.Add("@MaQuyen", SqlDbType.VarChar, 20).Value = quyen_chucvu.MaQuyen;

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
        public void DeleteQuyen_ChucVu(string MaChucVu, string MaQuyen)
        {
            using (conn )
            {
                if (conn.State != ConnectionState.Open)
                    conn.Open();
                SqlCommand command = conn.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "DeleteQuyen_ChucVu";
                command.Parameters.Add("@MaChucVu", SqlDbType.VarChar, 20).Value = MaChucVu;
                command.Parameters.Add("@MaQuyen", SqlDbType.VarChar, 20).Value = MaQuyen;
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
