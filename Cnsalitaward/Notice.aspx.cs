using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cnsalitaward
{
    public partial class Notice : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }
        protected void Move_Click(object sender,EventArgs e)
		{
            Response.Redirect("/Default");
		}
        protected void Goverse(object sender, EventArgs e)
		{
            int id1 = (int)Session["ID1"];
            Response.Redirect("/Work1?="+id1+"&kind=verse");
		}
        protected void Goprose(object sender, EventArgs e)
        {
            int id2 = (int)Session["ID2"];
            Response.Redirect("/Work2?="+id2+"&kind=prose");
        }



    }
}