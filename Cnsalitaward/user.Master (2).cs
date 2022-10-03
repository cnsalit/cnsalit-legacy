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
            string name = Managers.Account.CheckPenname(Session["UserID"].ToString());
           Session["Penname"] = name;
           string admin = Managers.Account.CheckAdmin(Session["UserID"].ToString());
           Session["Admin"] = admin;


      }
    }
}