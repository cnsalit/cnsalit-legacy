using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cnsalitaward
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Login_Click(object sender, EventArgs e)
        {

            if (string.IsNullOrEmpty(UserID.Text.Trim())) // ID가 비어있을 경우
                Response.Write("<script>alert('ID를 입력해주세요.');</script>");
            else if (string.IsNullOrEmpty(UserPW.Text.Trim())) // PW가 비어있을 경우
                Response.Write("<script>alert('PW를 입력해주세요.');</script>");
            else
            {
                MySqlConnection con = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Cnsalitaward"].ConnectionString);
                con.Open();
                string sql = "SELECT * FROM account WHERE UserID = @ID and UserPW = @PW";
                MySqlCommand cmd = new MySqlCommand(sql, con);
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@ID", UserID.Text);
                cmd.Parameters.AddWithValue("@PW", UserPW.Text);

                object obj = cmd.ExecuteScalar();
                MySqlDataReader rdr = cmd.ExecuteReader();

                if (obj != null)
				{
                    Session["UserID"] = UserID.Text;
                    while (rdr.Read())
                    { 
                        Session["PenName"] = (string)rdr["Penname"];
                    }
                    
                    Response.Redirect("/Default.aspx");
                    con.Close();
				}   
				else
				{ 
                    Response.Write("<script>alert('아이디 또는 비밀번호가 올바르지 않습니다.');</script>");
				}
            }
        }

        protected void Apply_Move(object sender, EventArgs e)
		{
            Response.Redirect("/Check.aspx");
        }
        public class LoginWebClient : WebClient
        {
            public CookieContainer CookieContainer {
                get; set;
            }

            public LoginWebClient()
            {
                CookieContainer = new CookieContainer();
            }

            protected override WebRequest GetWebRequest(Uri address)
            {
                //WebRequest 생성
                WebRequest request = base.GetWebRequest(address);

                //패킷 속성 설정
                if (request is HttpWebRequest)
                {
                    //패킷 Cookie 쿠키 설정
                    (request as HttpWebRequest).CookieContainer = this.CookieContainer;
                    //Connect: Kepp-Alive 
                    (request as HttpWebRequest).KeepAlive = true;
                }
               

                //HttpWebRequest.AutomaticDecompression 속성 설정 
                HttpWebRequest httpRequest = (HttpWebRequest)request;
                httpRequest.AutomaticDecompression = DecompressionMethods.GZip | DecompressionMethods.Deflate;

                //https 인증서 설정
                httpRequest.ServerCertificateValidationCallback += (sender, certificate, chain, sslPolicyErrors) => true;

                return httpRequest;
            }

        }
    }
}