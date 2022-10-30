using MySql.Data.MySqlClient;
using System;
using System.Web.UI;
//Hash를 위해 추가
using System.Security.Cryptography;
using System.Text;

static class Constants
{
	public const string verifyCode = "CNs@ 1s amAzlng~~!";
}

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

			if (userVerifyCode != Constants.verifyCode)
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
				if (Session["AonlyId"] != null && Session["onlyPenname"] != null)
				{
					if (userPW == userPW2)
					{
						MySqlConnection con = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Cnsalitaward"].ConnectionString);
						con.Open();

                        string sql = "INSERT INTO account(UserID, UserPW, PenName, Admin) VALUES(?,?,?,?)";
                        // string sql = "INSERT INTO Adminaccount(UserID, UserPW, Penname) VALUES(?,?,?)";
                        MySqlCommand cmd = new MySqlCommand(sql, con);

                        //비밀번호 SHA256 Hash
                        SHA256 sha = new SHA256Managed();
                        byte[] hashedUserPW_bytes = sha.ComputeHash(Encoding.ASCII.GetBytes(userPW));
                        string hashedUserPW_string = Convert.ToBase64String(hashedUserPW_bytes, 0, hashedUserPW_bytes.Length);

                        cmd.Parameters.Add("UserID", MySqlDbType.VarChar).Value = userID;
						cmd.Parameters.Add("UserPW", MySqlDbType.VarChar).Value = hashedUserPW_string;
                        cmd.Parameters.Add("Penname", MySqlDbType.VarChar).Value = userPN;
                        cmd.Parameters.Add("Admin", MySqlDbType.VarChar).Value = Constants.verifyCode;
                        cmd.ExecuteNonQuery();

                        con.Close();
                        Response.Redirect("/login");
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

				string sql = "SELECT * FROM account WHERE UserID='" + userId.Text + "';";
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
        protected void CheckPenname_Click(object sender, EventArgs e)
        {
            string IsOnly = Cnsalitaward.Managers.Account.CheckPenname(penName.Text);
            string RealPen = penName.Text;
            if (string.IsNullOrEmpty(RealPen.Trim()))
                Response.Write("<script>alert('닉네임을 입력해주세요.');</script>");
            else
            {
                if (IsOnly == "only")
                {
                    onlyPN.Text = "※ 가입 가능한 닉네임입니다.";
                    onlyPN.Style.Add("color", "green");
                    Session["onlyPenname"] = "ok";
                }
                else
                {
                    onlyPN.Text = "※ 중복된 닉네임입니다.";
                    onlyPN.Style.Add("color", "red");
                    Session["onlyPenname"] = null;
                }
            }
        }


    }
}