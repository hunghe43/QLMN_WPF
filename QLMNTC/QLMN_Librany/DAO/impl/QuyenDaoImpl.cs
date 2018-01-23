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
    public class QuyenDaoImpl: IQuyenDao
    {
        string connString;
        SqlConnection conn;
        public QuyenDaoImpl()
        {
            connString = ConfigurationManager.ConnectionStrings["connString"].ConnectionString;
            conn = new SqlConnection(connString);
        }

        public DataSet GetListQuyen()
        {
            using (conn )
            {
                if (conn.State == ConnectionState.Closed)
                    conn.Open();
                SqlCommand command = conn.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "GetListQuyen";
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataSet dataset = new DataSet();
                adapter.Fill(dataset);

                return dataset;
            }
        }

        public DataSet GetQuyen(string id, string parentId)
        {
            throw new NotImplementedException();
        }

        public void AddQuyen(Quyen quyen)
        {
            using (conn )
            {
                if (conn.State != ConnectionState.Open)
                    conn.Open();
                SqlCommand command = conn.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "InsertUpdateQuyen";
                command.Parameters.Add("@MaQuyen", SqlDbType.VarChar, 20).Value = quyen.MaQuyen;
                command.Parameters.Add("@Mota", SqlDbType.NVarChar, 50).Value = quyen.MoTa;
                command.Parameters.Add("@ParentId", SqlDbType.VarChar, 20).Value = quyen.ParentId;

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

        public void EditQuyen(Quyen quyen)
        {
            using (conn )
            {
                if (conn.State != ConnectionState.Open)
                    conn.Open();
                SqlCommand command = conn.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "InsertUpdateQuyen";

                command.Parameters.Add("@MaQuyen", SqlDbType.VarChar, 20).Value = quyen.MaQuyen;
                command.Parameters.Add("@Mota", SqlDbType.NVarChar, 50).Value = quyen.MoTa;
                command.Parameters.Add("@ParentId", SqlDbType.VarChar, 20).Value = quyen.ParentId;
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

        public void DeleteQuyen(string id)
        {
            using (conn )
            {
                if (conn.State != ConnectionState.Open)
                    conn.Open();
                SqlCommand command = conn.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "DeleteQuyen";
                command.Parameters.Add("@MaChucVu", SqlDbType.VarChar, 20).Value = id;
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
