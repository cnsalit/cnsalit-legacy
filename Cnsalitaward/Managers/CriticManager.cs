using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;

namespace Cnsalitaward.Managers
{
    public class CriticManager
    {
       
        public static Models.Critic GetCritic(int Id) 
        {
            MySqlConnection conn = null;
            try
            {
                // Connect to DB;
                conn = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Cnsalitaward"].ConnectionString);
                conn.Open();

                string sql = "SELECT * FROM critic WHERE Id=" + Id + ";";
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                var rdr = cmd.ExecuteReader();
                rdr.Read();
                Models.Critic work = new Models.Critic
                {
                    Id = (int)rdr["Id"],
                    UserID =(string)rdr["UserID"],
                    Author = (string)rdr["Penname"],
                    Work = (string)rdr["Work"],
                    Title = (string)rdr["Title"],
                    Content = (string)rdr["Content"],
                    Like = (int)rdr["Likes"],
                    View = (int)rdr["Views"],
                    Date = (DateTime)rdr["Date"]
                };
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

        public static int UploadCritic(Models.Critic work)
        {
            // 제목 또는 내용이 비어 있을 경우 종료
            if (String.IsNullOrEmpty(work.Title.Trim()) || String.IsNullOrEmpty(work.Content.Trim()))
                return -1;

            MySqlConnection conn = null;
            try
            {
                // Connect to DB;
                conn = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Cnsalitaward"].ConnectionString);
                conn.Open();

                int result = 0;

                string sql = "INSERT INTO critic(Work,Title,Content,UserID,Penname,Date,Work_at,Likes,Views) VALUES (?, ?, ?,?, ?, ?,?, ?,?)";
                MySqlCommand cmd = new MySqlCommand(sql, conn);

                // Add
                cmd.Parameters.Add("Work", MySqlDbType.VarChar).Value = work.Work;
                cmd.Parameters.Add("Title", MySqlDbType.VarChar).Value = work.Title;
                cmd.Parameters.Add("Content", MySqlDbType.VarChar).Value =  work.Content.Replace("\r\n", "<br/>");
                cmd.Parameters.Add("UserID", MySqlDbType.VarChar).Value = work.UserID;
                cmd.Parameters.Add("Penname", MySqlDbType.VarChar).Value = work.Author;

                cmd.Parameters.Add("Date", MySqlDbType.DateTime).Value = DateTime.Now.ToString("yyyy-MM-dd");
                cmd.Parameters.Add("Work_at", MySqlDbType.DateTime).Value = DateTime.Now.ToString("yyyy-MM-dd");
                cmd.Parameters.Add("Likes", MySqlDbType.Int32).Value = work.Like;
                cmd.Parameters.Add("Views", MySqlDbType.Int32).Value = work.View;


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
        public static int ModifyWork(Models.Critic work)
        {
            MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["Cnsalitaward"].ConnectionString);
            MySqlCommand cmd = new MySqlCommand("UPDATE critic SET Title= @Title, Content= @Content WHERE Id=" + work.Id, con);

            con.Open();
            int result = 0;


            cmd.Parameters.AddWithValue("@Title", work.Title);
            cmd.Parameters.AddWithValue("@Content", work.Content.Replace("\r\n", "<br/>"));
            result = cmd.ExecuteNonQuery();
            
            con.Close();
            return result;

        }
        
        public static int DeleteQuestion(int Id)
        {
            MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["Cnsalitaward"].ConnectionString);
            MySqlCommand cmd = new MySqlCommand();
            int result = 0;
            try
            {
                con.Open();
                cmd.Connection = con;
                cmd.CommandText = string.Format("DELETE FROM critic WHERE Id=" + Id);
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
        public static int GetPagesCount()
        {
            MySqlConnection conn = null;
            try
            {
                // Connect to DB;
                conn = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Cnsalitaward"].ConnectionString);
                conn.Open();

                // Get Count
                string sql = "SELECT count(*) FROM critic;";
                ; MySqlCommand cmd = new MySqlCommand(sql, conn);
                int workCount = Convert.ToInt32(cmd.ExecuteScalar());

                //  갯수의 1의 자리가 0일 경우
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
        public static int GetWorksCount()
        {
            MySqlConnection conn = null;
            try
            {
                // Connect to DB;
                conn = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Cnsalitaward"].ConnectionString);
                conn.Open();

                // Get Count
                string sql = "SELECT count(*) FROM critic;";
                ; MySqlCommand cmd = new MySqlCommand(sql, conn);
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
       
        // 목록 가져오기
        public static List<Models.Critic> GetWorksByPage(int page)
        {

            MySqlConnection conn = null;
            try
            {
                // Connect to DB;
                conn = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Cnsalitaward"].ConnectionString);
                conn.Open();

                List<Models.Critic> works = new List<Models.Critic>();

                string sql = "SELECT count(*) FROM critic; ";
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                int WorkCount = Convert.ToInt32(cmd.ExecuteScalar());

                sql = "SELECT Id, Work,Title,Penname,Date,Likes,Views FROM critic ORDER BY Id DESC LIMIT 10 OFFSET " + ((page - 1) * 10) + ";";
                cmd.CommandText = sql;

                var dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    works.Add(new Models.Critic
                    {
                        Id = (int)dr["Id"],
                        Work = (string)dr["Work"],
                        Title = (string)dr["Title"],
                        Author = (string)dr["Penname"],
                        Like = (int)dr["Likes"],
                        View = (int)dr["Views"],
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
       
      
        public static Models.Critic GetWorkByID(int id)
        {
            MySqlConnection conn = null;
            try
            {
                // Connect to DB;
                conn = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Cnsalitaward"].ConnectionString);
                conn.Open();

                string sql = "SELECT * FROM critic WHERE Id=" + id + ";";
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                var dr = cmd.ExecuteReader();
                dr.Read();
                Models.Critic work = new Models.Critic
                {

                    Id = (int)dr["Id"],
                    Title = (string)dr["Title"],
                    Author = (string)dr["Penname"],
                    Content = (string)dr["Content"],
                    Like = (int)dr["Likes"],
                    View = (int)dr["Views"],

                    Date = (DateTime)dr["Date"]

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

        public static List<Models.Critic> GetWorksBySearching(int page, string text, bool isContents)
        {
            MySqlConnection conn = null;
            try
            {
                // Connect to DB;
                conn = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Cnsalitaward"].ConnectionString);
                conn.Open();

                List<Models.Critic> workList = new List<Models.Critic>();

                // SetColumName
                string columName = "";
                if (isContents)
                    columName = "Content";
                else
                    columName = "Title";

                // Get  Count
                string sql = "SELECT count(*) FROM critic WHERE " + columName + " LIKE '%" + text + "%';";
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                int workCount = Convert.ToInt32(cmd.ExecuteScalar());

                // Get 
                sql = "SELECT Id, Title, Penname,Likes,Views,Work_At FROM critic WHERE " + columName + " LIKE '%" + text + "%' ORDER BY Id DESC LIMIT 10 OFFSET " + ((page - 1) * 10) + ";";
                cmd.CommandText = sql;

                var rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    workList.Add(new Models.Critic
                    {
                        Id = (int)rdr["Id"],
                        Title = (string)rdr["Title"],
                        Author = (string)rdr["Penname"],
                        Like = (int)rdr["Likes"],
                        View = (int)rdr["Views"],
                        Date = (DateTime)rdr["Date"]
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

  
        
        public static int GetPagesCountBySearching(int page, string text, bool isContents)
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

                string sql = "SELECT count(*) FROM critic WHERE " + columName + " LIKE '%" + text + "%';";
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                int workCount = Convert.ToInt32(cmd.ExecuteScalar());

                //  갯수의 1의 자리가 0일 경우
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
        public static void Visitied(int Id) // 조회수 증가
        {
            MySqlConnection conn = null;

            // Connect to DB;
            conn = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Cnsalitaward"].ConnectionString);
            conn.Open();
            int id = 0;
            MySqlCommand cmd = new MySqlCommand("Update critic Set Views = Views + 1 where Id=" + Id, conn);
            cmd.CommandType = CommandType.Text;
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            conn.Close();

        }

        public static void Liked(int Id) // 추천 증가
        {
            MySqlConnection conn = null;

            // Connect to DB;
            conn = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Cnsalitaward"].ConnectionString);
            conn.Open();
            int id = 0;
            MySqlCommand cmd = new MySqlCommand("Update critic Set Likes = Likes + 1 where Id=" + Id, conn);
            cmd.CommandType = CommandType.Text;
            cmd.ExecuteNonQuery();

            cmd.Dispose();
            conn.Close();

        }
        public static List<Models.Work> GetReplyByPage(int id)
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

                sql = "SELECT Id,UserID,Penname,Work,Content,Date FROM reply where Work="+id+" ORDER BY Date DESC ;";
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
        public static int UploadReply(Models.Work work)
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

          
                string sql = "INSERT INTO reply(UserID,Penname,Work,Content,Date) VALUES (?, ?, ?,?, ?)";
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
        public static int DeleteReply(int Id)
        {
            MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["Cnsalitaward"].ConnectionString);
            MySqlCommand cmd = new MySqlCommand();
            int result = 0;
            try
            {
                con.Open();
                cmd.Connection = con;
                cmd.CommandText = string.Format("DELETE FROM reply WHERE Id=" + Id);
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
        public static int GetReplyCount(int id)
        {
            MySqlConnection conn = null;
            try
            {
                // Connect to DB;
                conn = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Cnsalitaward"].ConnectionString);
                conn.Open();

                // Get  Count
                string sql = "SELECT count(*) FROM reply Where Work=" + id + ";";
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
        public static int GetWorkId(string title)
		{
            MySqlConnection con = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Cnsalitaward"].ConnectionString);
            try
            {
                con.Open();
                string sql = "SELECT * FROM verse WHERE Title=" + title + ";";
                MySqlCommand cmd = new MySqlCommand(sql, con);
                var rdr = cmd.ExecuteReader();
                rdr.Read();
                int Id = (int)rdr["Id"];
                rdr.Close();
                return Id;
            }
			catch
			{
                string sql = "SELECT * FROM prose WHERE Title=" + title + ";";
                MySqlCommand cmd = new MySqlCommand(sql, con);
                var dr = cmd.ExecuteReader();
                dr.Read();
                int Id = (int)dr["Id"];
                dr.Close();
                return Id;
            }
			finally
			{
                con.Close();
			}
		}
        public static string randomTitleV(int id)
		{
            MySqlConnection con = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Cnsalitaward"].ConnectionString);
            con.Open();
            string sql = "SELECT * FROM verse WHERE Id=" + id + ";";
            MySqlCommand cmd = new MySqlCommand(sql, con);
            var rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            string Title = "Title";
            while(rdr.Read())
            {
                Title = (string)rdr["Title"];
                //string Author = (string)rdr["Penname"];
                //rdr.Close();
            }
            con.Close();
            return Title;
      
        }
            
       
        public static string randomTitleP(int id)
        {
            using (MySqlConnection con = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Cnsalitaward"].ConnectionString))
            {
                con.Open();
                string sql = "SELECT * FROM prose WHERE Id=" + id + ";";
                MySqlCommand cmd = new MySqlCommand(sql, con);
                var rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                string Title = "title";
                while (rdr.Read())
                {
                    Title = (string)rdr["Title"];
                    //rdr.Close();
                }
                return Title;
                con.Close();
            }
        }

    }
}