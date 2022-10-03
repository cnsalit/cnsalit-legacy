using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;

namespace Cnsalitaward
{
    public partial class Check : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["IsNotStd"] != null)
			{
                Response.Write("<script>alert('재학생 확인 후 가입이 가능합니다.');</script>");
			}
			else
			{

			}

        }
        protected void Check_cnsa(object sender,EventArgs e)
		{
            string checkQ = Session["Q"].ToString();
            string answer = Answer.Text;
            
            if(checkQ == "중앙에 위치한 동은?")
			{
                if(answer == "N동")
				{
                    Session["Iscnsa"] = "Iscnsa";
                    Response.Redirect("/ApplyAccount");
				}
				else
				{
                    Page.ClientScript.RegisterClientScriptBlock(typeof(Page), "Alert", "alert('재학생이 아니면 가입할 수 없습니다.')", true);
                    Answer.Text = string.Empty;
                }
                
			}
            else if (checkQ =="본교 도서관의 이름은?")
			{
                if (answer == "다산관")
                {
                    Session["Iscnsa"] = "Iscnsa";
                    Response.Redirect("/ApplyAccount");
                }
                else
                {
                    Page.ClientScript.RegisterClientScriptBlock(typeof(Page), "Alert", "alert('재학생이 아니면 가입할 수 없습니다.')", true);
                    Answer.Text = string.Empty;
                }
            }
            else if (checkQ =="본교 체육관의 이름은?")
			{
                if (answer == "충무관")
                {
                    Session["Iscnsa"] = "Iscnsa";
                    Response.Redirect("/ApplyAccount");
                }
                else
                {
                    Page.ClientScript.RegisterClientScriptBlock(typeof(Page), "Alert", "alert('재학생이 아니면 가입할 수 없습니다.')", true);
                    Answer.Text = string.Empty;
                }
            }
			else
			{
                Response.Write("<script>alert('Error');</script>");
			}
		}
    }
}