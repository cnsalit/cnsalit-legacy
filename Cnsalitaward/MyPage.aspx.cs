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
    public partial class MyPage : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            //로그인 확인
            if (Session["UserID"] == null)
                Response.Redirect("/Login");
        }


        protected void RightButton_Click(object sender, EventArgs e)
        {
            string kind = "verse";
           
           
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
            catch(Exception ex)
            {
                hcount = 0;
            }
            if (page < Managers.WorkManager.GetPagesCount(kind,hcount))
                Response.Redirect("/WorkList?page=" + (page + 1));
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
                Response.Redirect("/WorkList?page=" + (page - 1));
        }
    }
    }
