using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cnsalitaward
{
    public partial class PenName : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string User = Session["UserID"].ToString();
            string check;
            try
            {
                check = Managers.Account.CheckPenname(User);
            }
            catch (Exception ex)
            {
                check = null;
            }
            if (check !=null)
            {
                Response.Redirect("/Default");
            }
        }
        protected void Register_Click(object sender, EventArgs e)
        {
            string tc;
            try
            {
                 tc = Session["Teacher"].ToString();
            }
            catch(Exception ex)
            {
                 tc = "user";
            }
            string name = Random();
            int ch=0;
            Session["PenName"] = name;
            if(tc == "admin")
            {
                stdnumber.Text = "0";
            }
            if (Encoding.Default.GetByteCount(Name.Text) > 10 || String.IsNullOrEmpty(Name.Text.Trim()) || String.IsNullOrEmpty(stdnumber.Text.Trim()))
            {

                Page.ClientScript.RegisterClientScriptBlock(typeof(Page), "Alert", "alert('다시 입력해주세요.')", true);



            }
            else
            {  ch = Convert.ToInt32(stdnumber.Text);
                
                
                Managers.Account.AddPenName(new Models.Account
                {
                   UserID = Session["UserID"].ToString(),
                        UserPW = Session["UserPW"].ToString(),
                        Number = ch,
                    Penname = name
                });
                Response.Redirect("/Default");
            }
     
          
        }
        protected string Random()
        {
            string name = Name.Text;
            Random r = new Random();
            r.Next();
 
            int count = 0;
            name = DateTime.Now.ToString("yy") + name + r.Next(1, 99);
            object obj;
            MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["Cnsalitaward"].ConnectionString);
            con.Open();

            MySqlCommand cmd = new MySqlCommand("Select Penname from account ", con);
            obj = cmd.ExecuteScalar();
            MySqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                if (name == reader["Penname"].ToString())
                {
                    
                        return Random();
                    
                } 
       
                
            }
            con.Close();
            return name;
        }
    }
}