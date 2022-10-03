using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
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

    }
}