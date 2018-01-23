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
    public class NhanVienDaoImpl: INhanVienDao
    {
        string connString;
        SqlConnection conn;
        public NhanVienDaoImpl()
        {
            connString = ConfigurationManager.ConnectionStrings["connString"].ConnectionString;
            conn = new SqlConnection(connString);
        }
       
        ///// <summary>
        ///// get list
        ///// </summary>
        ///// <returns></returns>
        //public DataSet GetListNhanVien()
        //{
        //    using (conn )
        //    {
        //        if (conn.State == ConnectionState.Closed)
        //            conn.Open();
        //        SqlCommand command = conn.CreateCommand();
        //        command.CommandType = CommandType.StoredProcedure;
        //        command.CommandText = "GetListNhanVien";
        //        SqlDataAdapter adapter = new SqlDataAdapter(command);
        //        DataSet dataset = new DataSet();
        //        adapter.Fill(dataset);

        //        return dataset;
        //    }
        //}

        public DataSet getNhanVien(string id, string tenNV, string diachi, string sdt, string email, string machucvu, string malop)
        {
            using (conn = new SqlConnection(connString))
            {
                if (conn.State != ConnectionState.Open)
                    conn.Open();
                SqlCommand command = conn.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "GetNhanVien";
                command.Parameters.Add("@MaNhanVien", SqlDbType.VarChar, 20).Value = id;
                command.Parameters.Add("@TenNhanVien", SqlDbType.NVarChar, 50).Value = tenNV;
                command.Parameters.Add("@DiaChi", SqlDbType.NVarChar, 100).Value = diachi;
                command.Parameters.Add("@Sdt", SqlDbType.NVarChar, 20).Value = sdt;
                command.Parameters.Add("@Email", SqlDbType.NVarChar, 20).Value = email;
                command.Parameters.Add("@MaChucVu", SqlDbType.VarChar, 20).Value = machucvu;
                command.Parameters.Add("@MaLop", SqlDbType.VarChar, 20).Value = malop;
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
        /// <param name="nhanvien"></param>
        public void AddNhanVien(NhanVien nhanvien)
        {
            nhanvien.MaNhanVien= AutoIdNhanVien();
            using (conn = new SqlConnection(connString))
            {
                if (conn.State != ConnectionState.Open)
                    conn.Open();
                SqlCommand command = conn.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "InsertUpdateNhanVien";
                command.Parameters.Add("@MaNhanVien", SqlDbType.VarChar, 20).Value = nhanvien.MaNhanVien;
                command.Parameters.Add("@TenNhanVien", SqlDbType.NVarChar, 50).Value = nhanvien.TenNhanVien;
                command.Parameters.Add("@DiaChi", SqlDbType.NVarChar, 100).Value = nhanvien.DiaChi;
                command.Parameters.Add("@Sdt", SqlDbType.NVarChar,20).Value = nhanvien.Sdt;
                command.Parameters.Add("@Email", SqlDbType.NVarChar,20).Value = nhanvien.Email;
                command.Parameters.Add("@MaChucVu", SqlDbType.VarChar,20).Value = nhanvien.MaChucVu;
                command.Parameters.Add("@MaLop", SqlDbType.VarChar,20).Value = nhanvien.MaLop;
                command.Parameters.Add("@Password", SqlDbType.NVarChar,50).Value = nhanvien.Password;
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
        /// <param name="nhanvien"></param>
        public void EditNhanVien(NhanVien nhanvien)
        {
            using (conn = new SqlConnection(connString))
            {
                if (conn.State != ConnectionState.Open)
                    conn.Open();
                SqlCommand command = conn.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "InsertUpdateNhanVien";
                command.Parameters.Add("@MaNhanVien", SqlDbType.VarChar, 20).Value = nhanvien.MaNhanVien;
                command.Parameters.Add("@TenNhanVien", SqlDbType.NVarChar, 50).Value = nhanvien.TenNhanVien;
                command.Parameters.Add("@DiaChi", SqlDbType.NVarChar, 100).Value = nhanvien.DiaChi;
                command.Parameters.Add("@Sdt", SqlDbType.NVarChar, 20).Value = nhanvien.Sdt;
                command.Parameters.Add("@Email", SqlDbType.NVarChar, 20).Value = nhanvien.Email;
                command.Parameters.Add("@MaChucVu", SqlDbType.VarChar, 20).Value = nhanvien.MaChucVu;
                command.Parameters.Add("@MaLop", SqlDbType.VarChar, 20).Value = nhanvien.MaLop;
                command.Parameters.Add("@Password", SqlDbType.NVarChar, 50).Value = nhanvien.Password;
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
        public void DeleteNhanVien(string id)
        {
            using (conn = new SqlConnection(connString))
            {
                if (conn.State != ConnectionState.Open)
                    conn.Open();
                SqlCommand command = conn.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "DeleteNhanVien";
                command.Parameters.Add("@MaNhanVien", SqlDbType.VarChar, 20).Value = id;
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
        public List<NhanVien> GetListNhanVien()
        {
            List<NhanVien> list = new List<NhanVien>();
            using (conn = new SqlConnection(connString))
            {
                if (conn.State == ConnectionState.Closed)
                    conn.Open();
                SqlCommand command = conn.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "GetListNhanVien";
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                NhanVien hs;
                foreach (DataRow dr in dt.Rows)
                {
                    hs = new NhanVien();
                    hs.MaNhanVien = Convert.ToString(dr["MaNhanVien"]);
                    hs.MaLop = Convert.ToString(dr["MaLop"]);
                    hs.MaChucVu = Convert.ToString(dr["MaChucVu"]);
                    hs.Email = Convert.ToString(dr["Email"]);
                    hs.DiaChi = Convert.ToString(dr["DiaChi"]);
                    hs.TenNhanVien = Convert.ToString(dr["TenNhanVien"]);
                    hs.Sdt = Convert.ToString(dr["Sdt"]);
                    hs.Password = Convert.ToString(dr["Password"]);
                    list.Add(hs);
                }
            }
            return list;
        }
        public string AutoIdNhanVien()
        {
            using (conn = new SqlConnection(connString))
            {
                if (conn.State != ConnectionState.Open)
                    conn.Open();
                SqlCommand command = conn.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add("@ma_next", SqlDbType.VarChar, 20).Direction = ParameterDirection.Output;
                command.CommandText = "sp_NhanVien_NewID";
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
        public NhanVien checklogin(string email,string pass)
        {
            List<NhanVien> list = new List<NhanVien>();
            using (conn = new SqlConnection(connString))
            {
                if (conn.State == ConnectionState.Closed)
                    conn.Open();
                SqlCommand command = conn.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "getNhanVienLogin";
                command.Parameters.Add("@email", SqlDbType.NVarChar, 50).Value = email;
                command.Parameters.Add("@password", SqlDbType.NVarChar, 50).Value = pass;
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                NhanVien hs;
                foreach (DataRow dr in dt.Rows)
                {
                    hs = new NhanVien();
                    hs.MaNhanVien = Convert.ToString(dr["MaNhanVien"]);
                    hs.MaLop = Convert.ToString(dr["MaLop"]);
                    hs.MaChucVu = Convert.ToString(dr["MaChucVu"]);
                    hs.Email = Convert.ToString(dr["Email"]);
                    hs.DiaChi = Convert.ToString(dr["DiaChi"]);
                    hs.TenNhanVien = Convert.ToString(dr["TenNhanVien"]);
                    hs.Sdt = Convert.ToString(dr["Sdt"]);
                    hs.Password = Convert.ToString(dr["Password"]);
                    list.Add(hs);
                }
            }
            var nhanvien = list.SingleOrDefault(p => p.Email == email && p.Password == pass);
            return nhanvien;
        }
    }
}
