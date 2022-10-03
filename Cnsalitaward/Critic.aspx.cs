using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cnsalitaward
{
    public partial class Critic : System.Web.UI.Page
    {
      
            protected void Page_Load(object sender, EventArgs e)
            {
              string User = Session["UserID"].ToString();

                int id;
                string Admin = Managers.Account.CheckAdmin(User);

                string number = Request.QueryString["Id"].ToString();
                id = Convert.ToInt32(number);

                Modifybtn.Style["visibility"] = "hidden";
                Deletebtn.Style["visibility"] = "hidden";

            if (!Page.IsPostBack)

            {
                Managers.CriticManager.Visitied(id);
                var work = Cnsalitaward.Managers.CriticManager.GetCritic(id);
                
                if (Admin != "admin" && User == work.UserID)
                {
                    Modifybtn.Style["visibility"] = "visible";
                    Deletebtn.Style["visibility"] = "visible";
                }
                else if (Admin == "admin" && User != work.UserID)
                {
                    Modifybtn.Style["visibility"] = "visible";
                    Deletebtn.Style["visibility"] = "visible";

                }
                else if (Admin == "admin" && User == work.UserID)
                {
                    Modifybtn.Style["visibility"] = "visible";
                    Deletebtn.Style["visibility"] = "visible";

                }
                else if (Admin != "admin" && User != work.UserID)
                {

                }

			}
			else
			{

                var work = Cnsalitaward.Managers.CriticManager.GetCritic(id);
                if (Admin != "admin" && User == work.UserID)
                {
                    Deletebtn.Style["visibility"] = "visible";
                }
                else if (Admin == "admin" && User != work.UserID)
                {
                    Deletebtn.Style["visibility"] = "visible";

                }
                else if (Admin == "admin" && User == work.UserID)
                {
                    Deletebtn.Style["visibility"] = "visible";

                }
                else if (Admin != "admin" && User != work.UserID)
                {

                }
            }


            }


            protected void List_Click(object sender, EventArgs e)
            {
                string kind = Request.QueryString["Kind"];
                int id;
                try
                {
                    string number = Request.QueryString["Id"].ToString();
                    id = Convert.ToInt32(number);
                    id = id / 10;
                    if (id == 0) id = 1;
                }
                catch (Exception a)
                {
                    id = 1;
                }
            
                    Response.Redirect("/CriticList.aspx?page=" + id);
                
            }

            protected void Modify_Click(object sender, EventArgs e)
            {
                string id = Request.QueryString["Id"];
                Response.Redirect("/UploadCritic.aspx?Id=" + id );
            }

            protected void Delete_Click(object sender, EventArgs e)
            {
                string number = Request.QueryString["Id"].ToString();
                int id = Convert.ToInt32(number);
                Cnsalitaward.Managers.CriticManager.DeleteQuestion(id);
                try
                {

                    id = id / 10;
                    if (id == 0) id = 1;
                }
                catch (Exception a)
                {
                    id = 1;
                }
              Response.Redirect("/CriticList.aspx?page=" +id);
            }
          
        
    }
}