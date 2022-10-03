using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cnsalitaward
{
    public partial class DeleteReply : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Yes_Click(object sender, EventArgs e)
        {
            int Id = int.Parse(Request.QueryString["Id"]);
            int Work = int.Parse(Request.QueryString["Work"]);
            string Kind = Request.QueryString["Kind"];
            if (Kind == null)
            {
                Managers.CriticManager.DeleteReply(Id);
                ClientScriptManager cs = Page.ClientScript;

                Type csType = Page.GetType();
                string csKey = "distributorCompanyList";
                string script = "window.close(); opener.location.href='Critic.aspx?Id=" + Work + "' ;";

                cs.RegisterStartupScript(csType, csKey, script, true);
            }
            else
            {
                Managers.WorkManager.DeleteReply(Id, Kind);
                ClientScriptManager cs = Page.ClientScript;
                Type csType = Page.GetType();
                string csKey = "distributorCompanyList";
                if (Kind == "verse")
                {
                    string script = "window.close(); opener.location.href='Work1.aspx?Id=" + Work + "' ;";
                    cs.RegisterStartupScript(csType, csKey, script, true);

                }
                else
                {
                    string script = "window.close(); opener.location.href='Work2.aspx?Id=" + Work + "' ;";
                    cs.RegisterStartupScript(csType, csKey, script, true);

                }
            }
 



        }
        protected void No_Click(object sender, EventArgs e)
        {
            ClientScriptManager sm = Page.ClientScript;
            string script = "<script>window.opener='nothing';window.open('','_parent','');window.close();</script>";
            sm.RegisterStartupScript(this.GetType(), "sm", script);
        }
    }
}