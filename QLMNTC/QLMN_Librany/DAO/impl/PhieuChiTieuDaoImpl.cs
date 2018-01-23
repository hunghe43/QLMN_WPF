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
    public class PhieuChiTieuDaoImpl: IPhieuChiTieuDao
    {
        string connString;
        SqlConnection conn;
        public PhieuChiTieuDaoImpl()
        {
            connString = ConfigurationManager.ConnectionStrings["connString"].ConnectionString;
            conn = new SqlConnection(connString);
        }
        ///// <summary>
        ///// get list
        ///// </summary>
        ///// <returns></returns>
        //public DataSet GetListPhieuChiTieu()
        //{
        //    using (conn )
        //    {
        //        if (conn.State == ConnectionState.Closed)
        //            conn.Open();
        //        SqlCommand command = conn.CreateCommand();
        //        command.CommandType = CommandType.StoredProcedure;
        //        command.CommandText = "GetListPhieuChiTieu";
        //        SqlDataAdapter adapter = new SqlDataAdapter(command);
        //        DataSet dataset = new DataSet();
        //        adapter.Fill(dataset);

        //        return dataset;
        //    }
        //}

        public List<PhieuChiTieu> GetListPhieuChiTieu()
        {
            List<PhieuChiTieu> list = new List<PhieuChiTieu>();
            using (conn = new SqlConnection(connString))
            {
                if (conn.State == ConnectionState.Closed)
                    conn.Open();
                SqlCommand command = conn.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "GetListPhieuChiTieu";
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                PhieuChiTieu hs;
                foreach (DataRow dr in dt.Rows)
                {
                    hs = new PhieuChiTieu();
                    hs.MaNhanVien = Convert.ToString(dr["MaNhanVien"]);
                    hs.MaPhieuChiTieu = Convert.ToString(dr["MaPhieuChiTieu"]);
                    hs.NgayTaoPhieu = Convert.ToDateTime(dr["NgayTaoPhieu"]);
                    hs.LyDo = Convert.ToString(dr["LyDo"]);
                    hs.ChiPhi = Convert.ToDecimal(dr["ChiPhi"]);
                    list.Add(hs);
                }
            }
            return list;
        }

        public DataSet GetPhieuChiTieu(string id, DateTime ngaytao, string manhanvien,string lydo)
        {
            using (conn = new SqlConnection(connString))
            {
                if (conn.State != ConnectionState.Open)
                    conn.Open();
                SqlCommand command = conn.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "GetPhieuChiTieu";
                command.Parameters.Add("@MaPhieuChiTieu", SqlDbType.VarChar, 20).Value = id;
                command.Parameters.Add("@NgayTaoPhieu", SqlDbType.Date).Value = ngaytao;
                command.Parameters.Add("@MaNhanVien", SqlDbType.VarChar, 20).Value = manhanvien;
                command.Parameters.Add("@LyDo", SqlDbType.VarChar, 20).Value = lydo;

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
        /// <param name="phieuchitieu"></param>
        public void AddPhieuChiTieu(PhieuChiTieu phieuchitieu)
        {
            phieuchitieu.MaPhieuChiTieu = AutoIdPhieuChiTieu();
            using (conn = new SqlConnection(connString))
            {
                if (conn.State != ConnectionState.Open)
                    conn.Open();
                SqlCommand command = conn.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "InsertUpdatePhieuChiTieu";
                command.Parameters.AddWithValue("@MaPhieuChiTieu", phieuchitieu.MaPhieuChiTieu);
                command.Parameters.AddWithValue("@NgayTaoPhieu", phieuchitieu.NgayTaoPhieu);
                command.Parameters.AddWithValue("@MaNhanVien",phieuchitieu.MaNhanVien);
                command.Parameters.AddWithValue("@LyDo", phieuchitieu.LyDo);
                command.Parameters.AddWithValue("@ChiPhi",phieuchitieu.ChiPhi);  
                command.Parameters.AddWithValue("@Action","Insert");
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
        /// <param name="phieuchitieu"></param>
        public void EditPhieuChiTieu(PhieuChiTieu phieuchitieu)
        {
            using (conn = new SqlConnection(connString))
            {
                if (conn.State != ConnectionState.Open)
                    conn.Open();
                SqlCommand command = conn.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "InsertUpdatePhieuChiTieu";
                command.Parameters.Add("@MaPhieuChiTieu", SqlDbType.VarChar, 20).Value = phieuchitieu.MaPhieuChiTieu;
                command.Parameters.Add("@NgayTaoPhieu", SqlDbType.Date).Value = phieuchitieu.NgayTaoPhieu;
                command.Parameters.Add("@MaNhanVien", SqlDbType.VarChar, 20).Value = phieuchitieu.MaNhanVien;
                command.Parameters.Add("@LyDo", SqlDbType.NVarChar, 100).Value = phieuchitieu.LyDo;
                command.Parameters.Add("@ChiPhi", SqlDbType.Money).Value = phieuchitieu.ChiPhi;
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
        public void DeletePhieuChiTieu(string id)
        {
            using (conn = new SqlConnection(connString))
            {
                if (conn.State != ConnectionState.Open)
                    conn.Open();
                SqlCommand command = conn.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "DeletePhieuChiTieu";
                command.Parameters.Add("@MaPhieuChiTieu", SqlDbType.VarChar, 20).Value = id;
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
        public string AutoIdPhieuChiTieu()
        {
            using (conn = new SqlConnection(connString))
            {
                if (conn.State != ConnectionState.Open)
                    conn.Open();
                SqlCommand command = conn.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add("@ma_next", SqlDbType.VarChar, 20).Direction = ParameterDirection.Output;
                command.CommandText = "sp_PhieuChiTieu_NewID";
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
