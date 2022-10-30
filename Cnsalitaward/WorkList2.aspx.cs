using MySql.Data.MySqlClient;
using Org.BouncyCastle.Asn1.Ocsp;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cnsalitaward
{
    public partial class WorkList2 : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)

            {

                Search.Attributes.Add("onkeypress", "if(event.keyCode == 13) { "

                + Page.ClientScript.GetPostBackEventReference(Searchbtn, "") + "; return false;}");

            }
        }


        protected void RightButton_Click(object sender, EventArgs e)
        {
            string kind = "prose";


            int page;
            try
            {
                page = int.Parse(Request.QueryString["page"]);
            }
            catch (Exception ex)
            {
                page = 1;
            }
            int hcount;
                try
            {
                hcount = int.Parse(Session["hc"].ToString());
            }
            catch(Exception ex){
                hcount = 0;
            }
            if (page < Managers.WorkManager.GetPagesCount(kind,hcount))
                Response.Redirect("/WorkList2?page=" + (page + 1));
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
                Response.Redirect("/WorkList2?page=" + (page - 1));
        }
        protected void Searching(object sender, EventArgs e)
        {
            string kind = Request.QueryString["Kind"];
            if (TitleorContent.SelectedValue == "Title")
                Response.Redirect("/WorkList2?titleSearch=" + Search.Text);
            else
                Response.Redirect("/WorkList2?contentsSearch=" + Search.Text);
        }
    }
}
