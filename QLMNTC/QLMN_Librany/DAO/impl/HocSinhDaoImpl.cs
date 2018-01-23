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
using System.Collections.ObjectModel;

namespace QLMN_Librany.DAO.impl
{
    public class HocSinhDaoImpl : IHocSinhDao
    {
        string connString;
        SqlConnection conn;
        public HocSinhDaoImpl()
        {
            connString = ConfigurationManager.ConnectionStrings["connString"].ConnectionString;
        }
        ///// <summary>
        ///// get list
        ///// </summary>
        ///// <returns></returns>
        //public DataSet GetListHocSinh()
        //{
        //    using (conn = new SqlConnection(connString))
        //    {
        //        if (conn.State == ConnectionState.Closed)
        //            conn.Open();
        //        SqlCommand command = conn.CreateCommand();
        //        command.CommandType = CommandType.StoredProcedure;
        //        command.CommandText = "GetListHocSinh";
        //        SqlDataAdapter adapter = new SqlDataAdapter(command);
        //        DataSet dataset = new DataSet();
        //        adapter.Fill(dataset);

        //        return dataset;
        //    }
        //}
        public List<HocSinh> GetListHocSinh()
        {
            List<HocSinh> list = new List<HocSinh>();
            using (conn = new SqlConnection(connString))
            {
                if (conn.State == ConnectionState.Closed)
                    conn.Open();
                SqlCommand command = conn.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "GetListHocSinh";
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                HocSinh hs;
                foreach (DataRow dr in dt.Rows)
                {                   
                        hs = new HocSinh();
                        hs.CanNang = Convert.ToInt32(dr["CanNang"]);
                        hs.ChieuCao = Convert.ToInt32(dr["ChieuCao"]);
                        hs.DiaChi = Convert.ToString(dr["DiaChi"]);
                        hs.DoiTuongMTA = Convert.ToBoolean(dr["DoiTuongMTA"]);
                        hs.Email = Convert.ToString(dr["Email"]);
                        hs.GhiChu = Convert.ToString(dr["GhiChu"]);
                        hs.GioiTinh = Convert.ToString(dr["GioiTinh"]);
                        hs.MaHocSinh = Convert.ToString(dr["MaHocSinh"]);
                        hs.MaLop = Convert.ToString(dr["MaLop"]);
                        hs.NgaySinh = Convert.ToDateTime(dr["NgaySinh"]);
                        hs.NgaySinhPhuHuynh = Convert.ToDateTime(dr["NgaySinhPhuHuynh"]);
                        hs.sdt = Convert.ToString(dr["sdt"]);
                        hs.SoCmt = Convert.ToString(dr["SoCmt"]);
                        hs.Ten = Convert.ToString(dr["Ten"]);
                        hs.TenPhuHuynh = Convert.ToString(dr["TenPhuHuynh"]);
                        hs.TinhTrang = Convert.ToString(dr["TinhTrang"]);
                        hs.TrangThai = Convert.ToBoolean(dr["TrangThai"]);
                    list.Add(hs);
                }
            }
            return list;
        }
        public DataSet GetHocSinh(string mahocsinh, string tenhocsinh, string diachi, string tenphuhuynh, string sdt, string email, string malop, bool doitruongmta, bool trangthai)
        {
            using (conn = new SqlConnection(connString))
            {
                if (conn.State != ConnectionState.Open)
                    conn.Open();
                SqlCommand command = conn.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "GetHocSinh";
                command.Parameters.Add("@MaHocSinh", SqlDbType.VarChar, 20).Value = mahocsinh;
                command.Parameters.Add("@Ten", SqlDbType.NVarChar, 50).Value = tenhocsinh;
                command.Parameters.Add("@DiaChi", SqlDbType.NVarChar, 200).Value = diachi;
                command.Parameters.Add("@TenPhuHuynh", SqlDbType.NVarChar, 50).Value = tenphuhuynh;
                command.Parameters.Add("@Sdt", SqlDbType.NVarChar, 20).Value = sdt;
                command.Parameters.Add("@Email", SqlDbType.NVarChar, 50).Value = email;
                command.Parameters.Add("@MaLop", SqlDbType.VarChar, 20).Value = malop;
                command.Parameters.Add("@DoiTuongMta", SqlDbType.Bit).Value = doitruongmta;
                command.Parameters.Add("@TrangThai", SqlDbType.Bit).Value = trangthai;
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
        /// <param name="hocsinh"></param>
        public void AddHocSinh(HocSinh hocsinh)
        {
            hocsinh.MaHocSinh = AutoIdHocSinh();
            using (conn = new SqlConnection(connString))
            {
                if (conn.State != ConnectionState.Open)
                    conn.Open();
                SqlCommand command = conn.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "InsertUpdateHocSinh";
                command.Parameters.AddWithValue("@MaHocSinh", hocsinh.MaHocSinh);
                command.Parameters.AddWithValue("@Ten", hocsinh.Ten);
                command.Parameters.AddWithValue("@NgaySinh", hocsinh.NgaySinh);
                command.Parameters.AddWithValue("@GioiTinh", hocsinh.GioiTinh);
                command.Parameters.AddWithValue("@DiaChi", hocsinh.DiaChi);
                command.Parameters.AddWithValue("@TinhTrang", hocsinh.TinhTrang);
                command.Parameters.AddWithValue("@ChieuCao", hocsinh.ChieuCao);
                command.Parameters.AddWithValue("@CanNang", hocsinh.CanNang);
                command.Parameters.AddWithValue("@TenPhuHuynh", hocsinh.TenPhuHuynh);
                command.Parameters.AddWithValue("@SoCmt", hocsinh.SoCmt);
                command.Parameters.AddWithValue("@Sdt", hocsinh.sdt);
                command.Parameters.AddWithValue("@Email", hocsinh.Email);
                command.Parameters.AddWithValue("@NgaySinhPhuHuynh", hocsinh.NgaySinhPhuHuynh);
                command.Parameters.AddWithValue("@GhiChu", hocsinh.GhiChu);
                command.Parameters.AddWithValue("@MaLop", hocsinh.MaLop);
                command.Parameters.AddWithValue("@DoiTuongMta", hocsinh.DoiTuongMTA);
                command.Parameters.AddWithValue("@TrangThai", hocsinh.TrangThai);
                command.Parameters.AddWithValue("@Action", "Insert");
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
        /// <param name="hocsinh"></param>
        public void EditHocSinh(HocSinh hocsinh)
        {
            using (conn = new SqlConnection(connString))
            {
                if (conn.State != ConnectionState.Open)
                    conn.Open();
                SqlCommand command = conn.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "InsertUpdateHocSinh";
                command.Parameters.Add("@MaHocSinh", SqlDbType.VarChar, 20).Value = hocsinh.MaHocSinh;
                command.Parameters.Add("@Ten", SqlDbType.NVarChar, 50).Value = hocsinh.Ten;
                command.Parameters.Add("@NgaySinh", SqlDbType.Date).Value = hocsinh.NgaySinh;
                command.Parameters.Add("@GioiTinh", SqlDbType.NVarChar, 5).Value = hocsinh.GhiChu;
                command.Parameters.Add("@DiaChi", SqlDbType.NVarChar, 200).Value = hocsinh.GioiTinh;
                command.Parameters.Add("@TinhTrang", SqlDbType.NVarChar, 50).Value = hocsinh.TinhTrang;
                command.Parameters.Add("@ChieuCao", SqlDbType.Int).Value = hocsinh.ChieuCao;
                command.Parameters.Add("@CanNang", SqlDbType.Int).Value = hocsinh.CanNang;
                command.Parameters.Add("@TenPhuHuynh", SqlDbType.NVarChar, 50).Value = hocsinh.TenPhuHuynh;
                command.Parameters.Add("@SoCmt", SqlDbType.NVarChar, 20).Value = hocsinh.SoCmt;
                command.Parameters.Add("@Sdt", SqlDbType.NVarChar, 20).Value = hocsinh.sdt;
                command.Parameters.Add("@Email", SqlDbType.NVarChar, 50).Value = hocsinh.Email;
                command.Parameters.Add("@NgaySinhPhuHuynh", SqlDbType.Date).Value = hocsinh.NgaySinhPhuHuynh;
                command.Parameters.Add("@GhiChu", SqlDbType.NVarChar, 100).Value = hocsinh.GhiChu;
                command.Parameters.Add("@MaLop", SqlDbType.VarChar, 20).Value = hocsinh.MaLop;
                command.Parameters.Add("@DoiTuongMta", SqlDbType.Bit).Value = hocsinh.DoiTuongMTA;
                command.Parameters.Add("@TrangThai", SqlDbType.Bit).Value = hocsinh.TrangThai;
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
        public void DeleteHocSinh(string id)
        {
            using (conn = new SqlConnection(connString))
            {
                if (conn.State != ConnectionState.Open)
                    conn.Open();
                SqlCommand command = conn.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "DeleteHocSinh";
                command.Parameters.Add("@MaHocSinh", SqlDbType.VarChar, 20).Value = id;
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
        public string AutoIdHocSinh()
        {
            using (conn = new SqlConnection(connString))
            {
                if (conn.State != ConnectionState.Open)
                    conn.Open();
                SqlCommand command = conn.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add("@ma_next", SqlDbType.VarChar, 20).Direction = ParameterDirection.Output;
                command.CommandText = "sp_HocSinh_NewID";
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

