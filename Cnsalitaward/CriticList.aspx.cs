using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cnsalitaward
{
    public partial class CriticList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
                
                string check = Cnsalitaward.Managers.Account.CheckAdmin(Session["UserID"].ToString());
                if (check == "admin")
                {
                    if (Session["UserID"] == null)
                    {
                        Page.ClientScript.RegisterClientScriptBlock(typeof(Page), "Alert", "alert('로그인을 해주세요.'); window.location.href = 'Login.aspx';", true);
                    }
                    else
                    {

                    }
                   
                }
                else
                {
                   
                }


        }

        protected void RightButton_Click(object sender, EventArgs e)
        {
            int page;
            try
            {
                page = int.Parse(Request.QueryString["page"]);
            }
            catch (Exception ex)
            {
                page = 1;
            }

            if (page < Managers.CriticManager.GetPagesCount())
                Response.Redirect("/CriticList.aspx?page=" + (page + 1));
        }

        protected void LeftButton_Click(object sender, EventArgs e)
        {
            int page;
            try
            {
                page = int.Parse(Request.QueryString["page"]);
            }
            catch (Exception ex)
            {
                page = 1;
            }

            if (page > 1)
                Response.Redirect("/CriticList.aspx?page=" + (page - 1));
        }
        protected void Searching(object sender, EventArgs e)
        {
            if (TitleorContent.SelectedValue == "Title")
                Response.Redirect("/CriticList.aspx?titleSearch=" + Search.Text);
            else
                Response.Redirect("/CriticList.aspx?contentsSearch=" + Search.Text);
        }
        protected void WriteCritic_Click(object sender, EventArgs e)
        {
            Response.Redirect("/UploadCritic");
        }
    }
}