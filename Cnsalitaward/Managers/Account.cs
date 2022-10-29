using Cnsalitaward.Models;
using MySql.Data.MySqlClient;
using MySqlX.XDevAPI.Common;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace Cnsalitaward.Managers
{
    public class Account
    {
        public static int AddPenName(Models.Account account)
        {
            MySqlConnection conn = null;
            try
            {
                // Connect to DB;
                conn = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Cnsalitaward"].ConnectionString);
                conn.Open();

                int result = 0;

                string sql = "INSERT INTO account(Number, UserID,UserPW,Penname) VALUES (?,?, ?,?);";
                MySqlCommand cmd = new MySqlCommand(sql, conn);

                // Add  
                cmd.Parameters.Add("Penname", MySqlDbType.VarChar).Value = account.Penname;
                cmd.Parameters.Add("UserID", MySqlDbType.VarChar).Value = account.UserID;
                cmd.Parameters.Add("UserPW", MySqlDbType.VarChar).Value = account.UserPW;
                cmd.Parameters.Add("Number", MySqlDbType.Int32).Value = account.Number;
                

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

        public static string CheckAdmin(string UserID)
        {
            MySqlConnection conn = null;
            // Connect to DB;
            conn = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Cnsalitaward"].ConnectionString);
            conn.Open();

            string sql = "SELECT * FROM Adminaccount WHERE UserID='" + UserID + "';";
            MySqlCommand cmd = new MySqlCommand(sql, conn);

            object obj = cmd.ExecuteScalar();

        	if (obj != null)
		    {
                conn.Close();
                return "admin";
			}
			else
			{
                conn.Close();
                return "User";
			}
        }
        public static string CheckID(string UserID)
        {
            MySqlConnection conn = null;
            // Connect to DB;
            conn = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Cnsalitaward"].ConnectionString);
            conn.Open();

            string sql = "SELECT * FROM account WHERE UserID='" + UserID + "';";
            MySqlCommand cmd = new MySqlCommand(sql, conn);

            object obj = cmd.ExecuteScalar();

            if (obj != null)
            {
                conn.Close();
                return "notonly";
            }
            else
            {
                conn.Close();
                return "only";
            }
        }
        public static string CheckNum(string RealNum)
        {
            MySqlConnection conn = null;
            // Connect to DB;
            conn = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Cnsalitaward"].ConnectionString);
            conn.Open();

            string sql = "SELECT * FROM account WHERE RealNum='" + RealNum + "';";
            MySqlCommand cmd = new MySqlCommand(sql, conn);

            object obj = cmd.ExecuteScalar();

            if (obj != null)
            {
                conn.Close();
                return "notonly";
            }
            else
            {
                conn.Close();
                return "only";
            }
        }
        public static string CheckPenname(string RealPen)
        {
            MySqlConnection conn = null;
            // Connect to DB;
            conn = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Cnsalitaward"].ConnectionString);
            conn.Open();

            string sql = "SELECT * FROM account WHERE Penname='" + RealPen + "';";
            MySqlCommand cmd = new MySqlCommand(sql, conn);

            object obj = cmd.ExecuteScalar();

            if (obj != null)
            {
                conn.Close();
                return "notonly";
            }
            else
            {
                conn.Close();
                return "only";
            }
        }
        protected string GetIPAddress()
        {
            System.Web.HttpContext context = System.Web.HttpContext.Current;
            string ipAddress = context.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];

            if (!string.IsNullOrEmpty(ipAddress))
            {
                string[] addresses = ipAddress.Split(',');
                if (addresses.Length != 0)
                {
                    return addresses[0];
                }
            }

            return context.Request.ServerVariables["REMOTE_ADDR"];
        }

        public static bool CheckWorkAdministrator(int workId, string userId, bool prose=false, bool verse=false)
        {
            // 관리자 예외
            if(CheckAdmin(userId) == "admin")
            {
                return true;
            }

            // 일반 사용자, 본인 확인.
            else
            {
                MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["Cnsalitaward"].ConnectionString);
                con.Open();

                //ex) SELECT EXISTS(SELECT * FROM verse WHERE Id=39 && UserID="abcd" LIMIT 1) AS SUCCESS
                MySqlCommand cmd = new MySqlCommand("SELECT EXISTS(SELECT * FROM @kind WHERE Id=@workId && UserID=\"@userId\" LIMIT 1) AS SUCCESS", con);
                cmd.Parameters.AddWithValue("@workId", workId);
                cmd.Parameters.AddWithValue("@userId", userId);

                //부문 입력
                if (prose == true)
                    cmd.Parameters.AddWithValue("@kind", "prose");

                else if (verse == true)
                    cmd.Parameters.AddWithValue("@kind", "verse");

                else
                    con.Close();
                    return false;
                MySqlDataReader reader = cmd.ExecuteReader();

                reader.Read();
                bool isMine = reader["SUCCESS"].Equals(1);      //본인일 시 true, 아니면  false
                reader.Close();

                con.Close();
                if (isMine)
                    return true;
                else
                    return false;
            }
        }

    }
}