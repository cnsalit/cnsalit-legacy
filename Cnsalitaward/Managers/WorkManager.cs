using Cnsalitaward.Models;
using MySql.Data.MySqlClient;
using MySqlX.XDevAPI.Common;
using Org.BouncyCastle.Utilities.Collections;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using static System.Data.Entity.Infrastructure.Design.Executor;

namespace Cnsalitaward.Managers
{
    public class WorkManager
    {
        public static Models.Work GetWork(int Id, string kind)
        {
            MySqlConnection conn = null;
            try
            {
                // Connect to DB;
                conn = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Cnsalitaward"].ConnectionString);
                conn.Open();

                string sql = "SELECT * FROM " + kind + " WHERE Id=" + Id + ";";
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                var rdr = cmd.ExecuteReader();
                Models.Work work = null;

                if (rdr.Read())
                {
                    work = new Models.Work
                    {
                        Id = (int)rdr["Id"],
                        UserID = (string)rdr["UserID"],
                        Author = (string)rdr["Penname"],
                        Brief = (string)rdr["Brief"],
                        Title = (string)rdr["Title"],
                        Content = (string)rdr["Content"],
                        Like = (int)rdr["Likes"],
                        View = (int)rdr["Views"],
                        Date = (DateTime)rdr["Work_At"]
                    };
                }
                rdr.Close();
                return work;
            }
            catch (Exception e)
            {
                // TODO: 예외 처리
                throw new Exception(e.Message);
            }
            finally
            {

                conn.Close();
            }
        }

        public static int UploadWork(Models.Work work, string kind)
        {
            // 제목 또는 내용이 비어 있을 경우 종료
            if (String.IsNullOrEmpty(work.Title.Trim()) || String.IsNullOrEmpty(work.Content.Trim()) || String.IsNullOrEmpty(work.Brief.Trim()))
                return -1;

            MySqlConnection conn = null;
            try
            {
                // Connect to DB;
                conn = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Cnsalitaward"].ConnectionString);
                conn.Open();

                int result = 0;

                // Connect to Database
                string sql = "INSERT INTO " + kind + "(UserID,Penname,Brief,Title,Content,FileName,Likes,Views,Work_At) VALUES (?, ?, ?, ?,?, ?,?,?,?)";
                MySqlCommand cmd = new MySqlCommand(sql, conn);

                // Add 
                cmd.Parameters.Add("UserID", MySqlDbType.VarChar).Value = work.UserID;
                cmd.Parameters.Add("Penname", MySqlDbType.VarChar).Value = work.Author;
                cmd.Parameters.Add("Brief", MySqlDbType.VarChar).Value = work.Brief;
                cmd.Parameters.Add("Title", MySqlDbType.VarChar).Value = work.Title;
                cmd.Parameters.Add("Content", MySqlDbType.VarChar).Value = work.Content.Replace("\r\n", "<br/>");
                cmd.Parameters.Add("FileName", MySqlDbType.VarChar).Value = work.FileName;

                cmd.Parameters.Add("Likes", MySqlDbType.Int32).Value = work.Like;
                cmd.Parameters.Add("Views", MySqlDbType.Int32).Value = work.View;

                cmd.Parameters.Add("Work_At", MySqlDbType.DateTime).Value = DateTime.Now.ToString("yyyy-MM-dd");



                result = cmd.ExecuteNonQuery();

                return result;
            }
            catch (Exception e)
            {
                // TODO: 예외 처리
                throw new Exception(e.Message);
            }
            finally
            {
                conn.Close();
            }
        }

        //작품 수정
        public static int ModifyWork(int workId, string title, string brief, string content, string kind)
        {
            MySqlConnection con = null;
            string sql = "";
            try
            {
                // Connect to DB;
                con = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Cnsalitaward"].ConnectionString);
                con.Open();

                // Connect to Database
                // UPDATE verse SET Title = "운문", Brief = "요약", Content = "본문" WHERE Id = 39;
                sql = string.Format("UPDATE {0} SET Title='{2}', Brief='{3}', Content='{4}' WHERE Id={1}", kind, workId, title, brief, content);
                //sql = string.Format("UPDATE {0} SET Title='{2}', Brief='{3}', Content='{4}' WHERE Id={1}", kind, workId, title, brief, content.Replace("\r\n", "<br/>"));
                MySqlCommand cmd = new MySqlCommand(sql, con);

                return cmd.ExecuteNonQuery();
            }
            catch (Exception e)
            {
                // TODO: 예외 처리
                throw new Exception(sql);
                //throw new Exception(e.Message);
            }
            finally
            {
                con.Close();
            }
        }
        public static int ModifyFile(Models.Work work, string kind)
        {
            MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["Cnsalitaward"].ConnectionString);
            MySqlCommand cmd = new MySqlCommand("update " + kind + " Set  FileName= @FileName where Id=" + work.Id, con);

            try
            {
                con.Open();
                int result = 0;


                cmd.Parameters.AddWithValue("@FileName", work.FileName);
           
                result = cmd.ExecuteNonQuery();


                return result;

            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
            finally
            {
                con.Close();
            }


        }
        public static int DeleteQuestion(int Id, string kind)
        {
            MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["Cnsalitaward"].ConnectionString);
            MySqlCommand cmd = new MySqlCommand();
            int result = 0;
            try
            {
                con.Open();
                cmd.Connection = con;
                cmd.CommandText = string.Format("DELETE FROM " + kind + " WHERE Id=" + Id);
                cmd.CommandType = System.Data.CommandType.Text;
                result = cmd.ExecuteNonQuery();
                return result;
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
            finally
            {

                con.Close();
            }
        }
        /// <summary>
        /// Get Pages Count
        /// </summary>
        public static int GetPagesCount(string kind, int hcount)
        {
            MySqlConnection conn = null;
            try
            {
                // Connect to DB;
                conn = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Cnsalitaward"].ConnectionString);
                conn.Open();

                // Get Notices Count
                string sql = "SELECT count(*) FROM " + kind + ";";
                ; MySqlCommand cmd = new MySqlCommand(sql, conn);
                int workCount = Convert.ToInt32(cmd.ExecuteScalar()) + hcount;

                //  갯수의 1의 자리가 0일 경우
                if (workCount % 10 != 0)
                {
                    return workCount / 10 +1;
                }
                else
                {
                    return workCount / 10;
                }
            }
            catch (Exception e)
            {
                // TODO: 예외 처리
                throw new Exception(e.Message);
            }
            finally
            {
                conn.Close();
            }
        }
        public static int GetWorksCount(string kind)
        {
            MySqlConnection conn = null;
            try
            {
                // Connect to DB;
                conn = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Cnsalitaward"].ConnectionString);
                conn.Open();

                // Get Count
                string sql = "SELECT COUNT(*) FROM " + kind + ";";
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                int workCount = Convert.ToInt32(cmd.ExecuteScalar());

               
                return workCount;
            }
            catch (Exception e)
            {
                // TODO: 예외 처리
                throw new Exception(e.Message);
            }
            finally
            {
                conn.Close();
            }
        }
        public static int GetHotPagesCount(string kind)
        {
            MySqlConnection conn = null;
            try
            {
                // Connect to DB;
                conn = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Cnsalitaward"].ConnectionString);
                conn.Open();

                // Get Count
                string sql = "SELECT count(*) FROM " + kind + " Where Likes > 5 ORDER By Likes DESC LIMIT 3;";
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                int workCount = Convert.ToInt32(cmd.ExecuteScalar());

                return workCount;
            }
            catch (Exception e)
            {
                // TODO: 예외 처리
                throw new Exception(e.Message);
            }
            finally
            {
                conn.Close();
            }
        }
        //공지 목록 가져오기
        public static List<Models.Work> GetWorksByPage(int page,int count,string kind)
        {

            MySqlConnection conn = null;
            try
            {
                // Connect to DB;
                conn = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Cnsalitaward"].ConnectionString);
                conn.Open();
   
                    List<Models.Work> works = new List<Models.Work>();
                if (count == 0) count = 10;
                if (count == 1) count = 9;
                if (count == 2) count = 8;
                if (count == 3) count = 7;
                string sql = "SELECT COUNT(*) FROM " + kind + "; ";
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                int WorkCount = Convert.ToInt32(cmd.ExecuteScalar());
                
                sql = "SELECT Id,Penname,Title,Likes,Views,Work_At FROM " + kind + " ORDER BY Id DESC LIMIT "+count+" OFFSET " + ((page-1)*10) + ";";
                cmd.CommandText = sql;

                var dr = cmd.ExecuteReader();
    
                while (dr.Read())
                {
                    works.Add(new Models.Work
                    {
                        Id = (int)dr["Id"],
                        Title = (string)dr["Title"],
                        Author = (string)dr["Penname"],

                        Like = (int)dr["Likes"],
                        View = (int)dr["Views"],
                        Date = (DateTime)dr["Work_At"]
                    });
                }
                dr.Close();
                return works;
            }
            catch (Exception e)
            {
                // TODO: 예외 처리
                throw new Exception(e.Message);
            }
            finally
            {
                conn.Close();
            }
        }
        public static List<Models.Work> GetWorksByPage2(int page, int count, string kind)
        {

            MySqlConnection conn = null;
            try
            {
                // Connect to DB;
                conn = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Cnsalitaward"].ConnectionString);
                conn.Open();

                List<Models.Work> works = new List<Models.Work>();

                string sql = "SELECT count(*) FROM " + kind + "; ";
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                int WorkCount = Convert.ToInt32(cmd.ExecuteScalar());
      
                sql = "SELECT Id, Penname,Title,Likes,Views,Work_At FROM " + kind + " ORDER BY Id DESC LIMIT " + "10" + " OFFSET " + (((page - 1) * 10) -count) + ";";
                cmd.CommandText = sql;

                var dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    works.Add(new Models.Work
                    {
                        Id = (int)dr["Id"],
                        Title = (string)dr["Title"],
                        Author = (string)dr["Penname"],

                        Like = (int)dr["Likes"],
                        View = (int)dr["Views"],
                        Date = (DateTime)dr["Work_At"]
                    });
                }
                dr.Close();

                return works;
            }
            catch (Exception e)
            {
                // TODO: 예외 처리
                throw new Exception(e.Message);
            }
            finally { 
            
                conn.Close();
            }
        }
        public static List<Models.Work> GetHotWorksPage(string kind) //핫한글 3개 목록 가져오기
        {
            MySqlConnection conn = null;
            try
            {
                // Connect to DB;
                conn = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Cnsalitaward"].ConnectionString);
                conn.Open();

                List<Models.Work> works = new List<Models.Work>();

                // Get Count
                string sql = "SELECT count(*) FROM " + kind +" Where Likes > 0 ORDER By Likes DESC LIMIT 3;";
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                int HotCount = Convert.ToInt32(cmd.ExecuteScalar());
                
                // Get 
                sql = "SELECT Id, Penname,Title,Likes,Views,Work_At FROM " + kind + " Where Likes > 5 ORDER BY Likes DESC LIMIT 3";//추천수 5개 이상
                cmd.CommandText = sql;

                var dr = cmd.ExecuteReader();
       
                while (dr.Read())
                {
                    works.Add(new Models.Work
                    {
                   
                        Id = (int)dr["Id"],
                        Title = (string)dr["Title"],
                        Author = (string)dr["Penname"],

                        Like = (int)dr["Likes"],
                        View = (int)dr["Views"],
                        Date = (DateTime)dr["Work_At"]
                    });
                }
                dr.Close();
                return works;
            }
            catch (Exception e)
            {
                // TODO: 예외 처리
                throw new Exception(e.Message);
            }
            finally
            {
                conn.Close();
            }
        }
        public static Models.Work GetWorkByID(int id,string kind)
        {
            MySqlConnection conn = null;
            try
            {
                // Connect to DB;
                conn = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Cnsalitaward"].ConnectionString);
                conn.Open();

                string sql = "SELECT * FROM " + kind + " WHERE Id=" + id + ";";
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                var dr = cmd.ExecuteReader();
                dr.Read();
                Models.Work work = new Models.Work
                {

                    Id = (int)dr["Id"],
                    Title = (string)dr["Title"],
                    Author = (string)dr["Penname"],
                    Content = (string)dr["Content"],
                    Like = (int)dr["Likes"],
                    View = (int)dr["Views"],

                    Date = (DateTime)dr["Work_At"]

                };
                dr.Close();





                return work;

            }
            catch (Exception e)
            {
                // TODO: 예외 처리
                throw new Exception(e.Message);
            }
            finally
            {
                conn.Close();

            }
        }

        public static List<Models.Work> GetWorksBySearching(int page, string text, bool isContents, string kind)
        {
            MySqlConnection conn = null;
            try
            {
                // Connect to DB;
                conn = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Cnsalitaward"].ConnectionString);
                conn.Open();

                List<Models.Work> workList = new List<Models.Work>();

                // SetColumName
                string columName = "";
                if (isContents)
                    columName = "Content";
                else
                    columName = "Title";

                // Get Count
                string sql = "SELECT count(*) FROM " + kind + " WHERE " + columName + " LIKE '%" + text + "%';";
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                int workCount = Convert.ToInt32(cmd.ExecuteScalar());

                // Get 
                sql = "SELECT Id, Title, Penname,Likes,Views,Work_At FROM " + kind + " WHERE " + columName + " LIKE '%" + text + "%' ORDER BY Id DESC LIMIT 10 OFFSET " + ((page - 1) * 10) + ";";
                cmd.CommandText = sql;

                var rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    workList.Add(new Models.Work
                    {
                        Id = (int)rdr["Id"],
                        Title = (string)rdr["Title"],
                        Author = (string)rdr["Penname"],
                        Like = (int)rdr["Likes"],
                        View = (int)rdr["Views"],
                        Date = (DateTime)rdr["Work_At"]
                    });
                }
                rdr.Close();
                return workList;
            }
            catch (Exception e)
            {
                // TODO: 예외 처리
                throw new Exception(e.Message);
            }
            finally
            {
                
                conn.Close();
            }
        }

        public static List<Models.Work> GetWorkByUser(string userID, string kind)
        {
            List<Models.Work> workList = new List<Models.Work>();
            string sql = "";
            MySqlCommand cmd = null;

            // Connect to DB;
            MySqlConnection con = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Cnsalitaward"].ConnectionString);
            con.Open();

            sql = String.Format("SELECT Id, Title, Penname, Views, Likes, Work_At FROM {1} WHERE USerID=\"{0}\"", userID, kind);
            cmd = new MySqlCommand(sql, con);

            var reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                workList.Add(new Models.Work
                {
                    Id = (int)reader["Id"],
                    Title = (string)reader["Title"],
                    Author = (string)reader["Penname"],
                    Like = (int)reader["Likes"],
                    View = (int)reader["Views"],
                    Date = (DateTime)reader["Work_At"]
                });
            }
            reader.Close();
            con.Close();

            return workList;
        }

        /// Get Works by Searching
        /// 목록 렌더링을 위해 제목과 글번호만 반환
        /// </summary>
        public static int GetPagesCountBySearching(int page, string text, bool isContents, string kind)
        {
            MySqlConnection conn = null;
            try
            {
                // Connect to DB;
                conn = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Cnsalitaward"].ConnectionString);
                conn.Open();

                // SetColumName
                string columName = "";
                if (isContents)
                    columName = "Content";
                else
                    columName = "Title";

                string sql = "SELECT count(*) FROM " + kind + " WHERE " + columName + " LIKE '%" + text + "%';";
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                int workCount = Convert.ToInt32(cmd.ExecuteScalar());

                // 공지 갯수의 1의 자리가 0일 경우
                if (workCount % 10 != 0)
                {
                    return workCount / 10 + 1;
                }
                else
                {
                    return workCount / 10;
                }
            }
            catch (Exception e)
            {
                // TODO: 예외 처리
                throw new Exception(e.Message);
            }
            finally
            {
                conn.Close();
            }
        }
        public static void Visitied(int Id, string kind) // 조회수 증가
        {
            MySqlConnection conn = null;

            // Connect to DB;
            conn = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Cnsalitaward"].ConnectionString);
            conn.Open();
            int id = 0;
            MySqlCommand cmd = new MySqlCommand("Update " + kind + " Set Views = Views + 1 where Id=" + Id, conn);
            cmd.CommandType = CommandType.Text;
            cmd.ExecuteNonQuery();
            conn.Close();

        }

        public static void Liked(int Id, string kind) // 추천 증가
        {
            MySqlConnection conn = null;

            // Connect to DB;
            conn = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Cnsalitaward"].ConnectionString);
            conn.Open();
            int id = 0;
            MySqlCommand cmd = new MySqlCommand("UPDATE " + kind + " SET Likes = Likes + 1 WHERE Id=" + Id, conn);
            cmd.CommandType = CommandType.Text;
            cmd.ExecuteNonQuery();
            
            conn.Close();

        }
        public static string FileName(string kind, int Id)
        {
            MySqlConnection conn = null;
            // Connect to DB;
            conn = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Cnsalitaward"].ConnectionString);
            conn.Open();

            string sql = "SELECT FileName FROM "+kind+" WHERE Id='" + Id + "';";
            MySqlCommand cmd = new MySqlCommand(sql, conn);
            object obj = cmd.ExecuteScalar();
            var rdr = cmd.ExecuteReader();
            if(obj != null)
			{
                rdr.Read();
                string FileName = (string)rdr["FileName"];
                rdr.Close();
                return FileName;
			}
			else
			{ 
                conn.Close();
                return "null";
			}
           
        }

        public static List<Models.Work> GetReply (int Id, string kind)
        {
            MySqlConnection conn = null;
            try
            {
                // Connect to DB;
                conn = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Cnsalitaward"].ConnectionString);
                conn.Open();
                List<Models.Work> works = new List<Models.Work>();
                string sql = "SELECT * FROM reply_" + kind + " WHERE Id=" + Id + ";";
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                var rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    works.Add(new Models.Work
                    {
                        Id = (int)rdr["Work"],
                        UserID = (string)rdr["UserID"],
                        Author = (string)rdr["Penname"],
                        Content = (string)rdr["Content"],
                        Date = (DateTime)rdr["Date"]
                    });
                }
                rdr.Close();

                return works;
            }
            catch (Exception e)
            {
                // TODO: 예외 처리
                throw new Exception(e.Message);
            }
            finally
            {

                conn.Close();
            }
        }
        
        public static List<Models.Work> GetReplyByPage(int id,string kind)
        {

            MySqlConnection conn = null;
            try
            {
                // Connect to DB;
                conn = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Cnsalitaward"].ConnectionString);
                conn.Open();

                List<Models.Work> works = new List<Models.Work>();

                string sql = "SELECT count(*) FROM reply;";
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                int WorkCount = Convert.ToInt32(cmd.ExecuteScalar());

                sql = "SELECT Id,UserID,Penname,Work,Content,Date FROM reply_"+kind+" where Work=" + id + " ORDER BY Date DESC ;";
                cmd.CommandText = sql;

                var dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    works.Add(new Models.Work
                    {
                        Id = (int)dr["Id"],
                        UserID = (string)dr["UserID"],
                        Reply = (int)dr["Work"],
                        Author = (string)dr["Penname"],
                        Content = (string)dr["Content"],
                        Date = (DateTime)dr["Date"]
                    });
                }
                dr.Close();
                return works;
            }
            catch (Exception e)
            {
                // TODO: 예외 처리
                throw new Exception(e.Message);
            }
            finally
            {

                conn.Close();
            }
        }
        public static int UploadReply(Models.Work work, string kind)
        {
            // 제목 또는 내용이 비어 있을 경우 종료
            if (String.IsNullOrEmpty(work.Content.Trim()))
                return -1;

            MySqlConnection conn = null;
            try
            {
                // Connect to DB;
                conn = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Cnsalitaward"].ConnectionString);
                conn.Open();

                int result = 0;

            
                string sql = "INSERT INTO reply_"+kind+"(UserID,Penname,Work,Content,Date) VALUES (?, ?, ?,?, ?)";
                MySqlCommand cmd = new MySqlCommand(sql, conn);

                // Add 
                cmd.Parameters.Add("UserID", MySqlDbType.VarChar).Value = work.UserID;
                cmd.Parameters.Add("Penname", MySqlDbType.VarChar).Value = work.Author;
                cmd.Parameters.Add("Work", MySqlDbType.Int32).Value = work.Reply;
                cmd.Parameters.Add("Content", MySqlDbType.VarChar).Value = work.Content.Replace("\r\n", "<br/>");
                cmd.Parameters.Add("Date", MySqlDbType.DateTime).Value = DateTime.Now.ToString("yyyy-MM-dd");
                result = cmd.ExecuteNonQuery();

                return result;
            }
            catch (Exception e)
            {
                // TODO: 예외 처리
                throw new Exception(e.Message);
            }
            finally
            {
                conn.Close();
            }
        }
        public static int DeleteReply(int Id,string kind)
        {
            MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["Cnsalitaward"].ConnectionString);
            MySqlCommand cmd = new MySqlCommand();
            int result = 0;
            try
            {
                con.Open();
                cmd.Connection = con;
                cmd.CommandText = string.Format("DELETE FROM reply_"+kind+" WHERE Id=" + Id);
                cmd.CommandType = System.Data.CommandType.Text;
                result = cmd.ExecuteNonQuery();
                return result;
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
            finally
            {

                con.Close();
            }
        }
        public static int GetReplyCount(int id,string kind)
        {
            MySqlConnection conn = null;
            try
            {
                // Connect to DB;
                conn = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Cnsalitaward"].ConnectionString);
                conn.Open();

                // Get Count
                string sql = "SELECT count(*) FROM reply_" + kind + " Where Work="+id+";";
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                int workCount = Convert.ToInt32(cmd.ExecuteScalar());

                return workCount;
            }
            catch (Exception e)
            {
                // TODO: 예외 처리
                throw new Exception(e.Message);
            }
            finally
            {
                conn.Close();
            }
        }
        public static bool PushLike(string userID, string kind, int workID)
        {
            MySqlConnection con = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Cnsalitaward"].ConnectionString);

            if (!ConfirmLike(userID, kind, workID))
            {
                return false;
            }

            string sql = string.Format("INSERT INTO likeMemory VALUES ('{0}', '{1}', {2})", userID, kind, workID.ToString());
            MySqlCommand cmd = new MySqlCommand(sql, con);
            cmd.ExecuteNonQuery();

            Liked(workID, kind);

            return true;
        }
        public static bool ConfirmLike(string userID, string kind, int workID)
        {
            MySqlConnection con = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Cnsalitaward"].ConnectionString);
            con.Open();

            // sql = string.Format("UPDATE {0} SET Title='{2}', Brief='{3}', Content='{4}' WHERE Id={1}", UserID);
            //ex) SELECT EXISTS(SELECT * FROM verse WHERE Id=39 && UserID="abcd" LIMIT 1) AS SUCCESS
            MySqlCommand cmd = new MySqlCommand(
                string.Format("SELECT EXISTS(SELECT * FROM likeMemory WHERE userID='{0}'&&kind='{1}'&&workID={2} LIMIT 1) AS SUCCESS", userID, kind, workID),
                con
            );

            MySqlDataReader reader = cmd.ExecuteReader();

            bool canPushLike = false;
            if (reader.Read())
                canPushLike = reader["SUCCESS"].Equals(Convert.ToInt64(1));      //추천을 누를 수 있을 시 true, 아니면  false

            reader.Close();
            con.Close();

            return canPushLike;
        }
    }
}