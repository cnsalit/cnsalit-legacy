using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cnsalitaward
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            object obj;
            MySqlConnection conn = new MySqlConnection(ConfigurationManager.ConnectionStrings["Cnsalitaward"].ConnectionString);
            conn.Open();
            int id = 0;
     
            DateTime today = DateTime.Now;
            string Date = today.ToString("yyyy-MM-dd");
            MySqlCommand cmdd = new MySqlCommand("Select * from Visits where Date=@Date", conn);
            cmdd.CommandType = CommandType.Text;
            cmdd.Parameters.AddWithValue("@Date", Date);
            obj = cmdd.ExecuteScalar();
            MySqlDataReader reader = cmdd.ExecuteReader();
            reader.Close();
          
            if (obj != null)
            {
                MySqlCommand cmd = new MySqlCommand("Update Visits Set Count = Count + 1 where Date=str_to_date(@Date,'%Y-%m-%d')", conn);
                cmd.Parameters.AddWithValue("@Date", Date);



                cmd.CommandType = CommandType.Text;

                cmd.ExecuteNonQuery();




                conn.Close();

            }
            else
            {

                string sql = "Insert Into Visits (Count, Date) VALUES (?,?);";
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                cmd.Parameters.Add("Count", MySqlDbType.Int32).Value = 1;
                cmd.Parameters.Add("Date", MySqlDbType.DateTime).Value = Date;

                cmd.ExecuteNonQuery();
                conn.Close();

            }
            if (Session["UserID"] != null)
			{
                
			}
			else
			{
                Page.ClientScript.RegisterClientScriptBlock(typeof(Page), "Alert", "alert('로그인을 해주세요.'); window.location.href = 'Login.aspx';", true);
			}

           
        }
    }
}