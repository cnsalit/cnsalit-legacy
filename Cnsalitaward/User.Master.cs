using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cnsalitaward
{
    public partial class UserMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           if (Session["UserID"] == null)
           {
               Response.Redirect("/login.aspx");
           }

           string admin = Managers.Account.CheckAdmin(Session["UserID"].ToString());
           Session["Admin"] = admin;


        }
        protected void Logout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("/Login.aspx");
        }
	}
}