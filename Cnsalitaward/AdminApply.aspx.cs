using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cnsalitaward
{
    public partial class AdminApply : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
		protected void Apply_Click(object sender, EventArgs e)
		{
			string userID = userId.Text;
			string userPW = userPw.Text;
			string userPW2 = userPw2.Text;
			string userPN = penName.Text;
			string userVerifyCode = verifyCode.Text;

			if (userVerifyCode != "CNs@ 1s amAzlng~~!")
			{
                Response.Write("<script>alert('인증코드가 일치하지 않습니다.');</script>");
            }
            else if (string.IsNullOrEmpty(userID.Trim())) // ID가 비어있을 경우
				Response.Write("<script>alert('아이디를 입력해주세요.');</script>");
			else if (string.IsNullOrEmpty(userPW.Trim())) // PW가 비어있을 경우
				Response.Write("<script>alert('비밀번호를 입력해주세요.');</script>");
			else if (string.IsNullOrEmpty(userPN.Trim())) // 필명이 비어있을 경우
				Response.Write("<script>alert('필명을 입력해주세요.');</script>");
			else
			{
				if (Session["AonlyId"] != null)
				{
					if (userPW == userPW2)
					{
						MySqlConnection con = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Cnsalitaward"].ConnectionString);
						con.Open();

						string sql = "INSERT INTO Adminaccount(UserID, UserPW, Penname) VALUES(?,?,?)";
						MySqlCommand cmd = new MySqlCommand(sql, con);

						Random r = new Random();
						r.Next();
						userPN = DateTime.Now.ToString("yy") + userPN + r.Next(1, 99);

						cmd.Parameters.Add("UserID", MySqlDbType.VarChar).Value = userID;
						cmd.Parameters.Add("UserPW", MySqlDbType.VarChar).Value = userPW;
						cmd.Parameters.Add("Penname", MySqlDbType.VarChar).Value = userPN;
						cmd.ExecuteNonQuery();

						Response.Redirect("/AdminLogin");
						con.Close();
					}
					else
					{
						pwcheck.Text = "※ 비밀번호가 일치하지 않습니다.";
						pwcheck.Style.Add("color", "red");
					}
				}
				else
				{
					Page.ClientScript.RegisterClientScriptBlock(typeof(Page), "Alert", "alert('중복확인이 완료되었는지 확인해주세요.')", true);
				}
			}

		
		}
		protected void CheckID_Click(object sender, EventArgs e)
		{
			string UserID = userId.Text;
			if (string.IsNullOrEmpty(UserID.Trim()))
				Response.Write("<script>alert('아이디를 입력해주세요.');</script>");
			else
			{
				MySqlConnection conn = null;
				// Connect to DB;
				conn = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Cnsalitaward"].ConnectionString);
				conn.Open();

				string sql = "SELECT * FROM Adminaccount WHERE UserID='" + userId.Text + "';";
				MySqlCommand cmd = new MySqlCommand(sql, conn);

				object obj = cmd.ExecuteScalar();

				if (obj != null)
				{
					onlyID.Text = "※ 중복된 아이디입니다.";
					onlyID.Style.Add("color", "red");
					Session["AonlyId"] = null;
					conn.Close();
				}
				else
				{
					onlyID.Text = "※ 사용가능한 아이디입니다.";
					onlyID.Style.Add("color", "green");
					Session["AonlyId"] = "ok";
					conn.Close();
				}
			}

		}
		
	
	}
}