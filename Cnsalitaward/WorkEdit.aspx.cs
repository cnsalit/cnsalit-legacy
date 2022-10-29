using Cnsalitaward.Models;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cnsalitaward
{
    public partial class WorkEdit : System.Web.UI.Page
    {
        int workId = -1;
        string writter = "";
        string kind = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
                Response.Redirect("/Login");

            string check = Cnsalitaward.Managers.Account.CheckAdmin(Session["UserID"].ToString());

            kind = Request.QueryString["kind"].ToString();
            string number = Request.QueryString["Id"].ToString();
            workId = Convert.ToInt32(number);

            bool isProse = false;
            bool isVerse = false;

            if (Session["UserID"] == null)
            {
                Page.ClientScript.RegisterClientScriptBlock(typeof(Page), "Alert", "alert('로그인을 해주세요.'); window.location.href = 'Login.aspx';", true);
            }

            if (kind == "prose")
                isProse = true;
            else if (kind == "verse")
                isVerse = true;
            else
                Response.Redirect("/Error");

            // 글 관리 권한이 있을시 실행(참고: CheckWorkAdminstrator는 Non-greedy=탐욕스럽지않으며 post가 존재하지 않으면 false를 반환함.)
            if (Cnsalitaward.Managers.Account.CheckWorkAdministrator(workId, Session["UserID"].ToString(), isProse, isVerse))
            {
                DisplayData();
            }
            else//없을 경우
            {   
                Response.Redirect("/Error");
            }

        }

                          
        private void DisplayData()
        {
            //string sql = "SELECT UserID, Title, Brief, Content FROM verse WHERE Id=39 && UserID=\"abcd\"";
            // string insertQuery = string.Format("INSERT INTO accounts_table (name, phone) VALUES ('{0}', '{1}');", textBoxName.Text, textBoxPhone.Text);
            string sql = string.Format("SELECT UserID, Title, Brief, Content FROM {2} WHERE Id={0} && UserID='{1}'", workId, writter, kind);
            MySqlConnection con = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Cnsalitaward"].ConnectionString);
            con.Open();

            MySqlCommand cmd = new MySqlCommand(sql, con);
            MySqlDataReader reader = cmd.ExecuteReader();

            string title = "";
            string brief = "";
            string content = "";

            if (reader.Read())
            {
                writter = reader["UserID"].ToString();
                title = reader["Title"].ToString();
                brief = reader["Brief"].ToString();
                content = reader["Content"].ToString();
            }

            if (kind == "verse")
                showingKind.InnerText = "운문";
            else if (kind == "prose")
                showingKind.InnerText = "산문";
            Titletxt.Text = title;
            Brieftxt.Text = brief.Replace("<br/>", "\r\n");
            Contenttxt.Text = content.Replace("<br/>", "\r\n");

            con.Close();
        }


        protected int UploadFile(string kind)
        {

            string fileName = System.IO.Path.GetFileName(File.PostedFile.FileName);
            string path = Server.MapPath("~/Uploads/" + fileName);
            FileInfo file = new FileInfo(path);
            if (File.HasFile)
            {
                if (file.Exists)
                {
                    file.Delete();
                    File.PostedFile.SaveAs(Server.MapPath("~/Uploads/" + kind + "/" + fileName));
                }
                else
                {
                    File.PostedFile.SaveAs(Server.MapPath("~/Uploads/" + kind + "/" + fileName));
                }
                return 0;
            }
            else
            {
                return -1;
            }

        }
        protected void SaveFile(string kind, string part)
        {

            string fileName = System.IO.Path.GetFileName(File.PostedFile.FileName);
            string path = Server.MapPath("~/Uploads/" + part + "/" + fileName);
            FileInfo file = new FileInfo(path);
            if (File.HasFile)
            {
                file.Delete();
                File.PostedFile.SaveAs(Server.MapPath("~/Uploads/" + kind + "/" + fileName));


            }



        }


        protected void Upload_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(Titletxt.Text) && !String.IsNullOrEmpty(Contenttxt.Text) && !String.IsNullOrEmpty(Brieftxt.Text))
            {
                Cnsalitaward.Managers.WorkManager.ModifyWork(workId, Titletxt.Text, Brieftxt.Text, Contenttxt.Text, kind);

                string href2go = "";
                if (kind == "verse")
                    href2go = "/Work1?Id=";
                else if (kind == "prose")
                    href2go =  "/Work2?Id=";
                else
                    Response.Redirect("/Error");
                href2go += workId.ToString();
                
                Page.ClientScript.RegisterClientScriptBlock(typeof(Page), "Alert", "alert('수정되었습니다.'); document.location.href=\"" + href2go + "\";", true);
            }
            else
            {
                Page.ClientScript.RegisterClientScriptBlock(typeof(Page), "Alert", "alert('양식을 모두 입력해 주세요.')", true);

            }
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            if (kind != "")
            {
                string part = Request.QueryString["Kind"].ToString();

                int id = Convert.ToInt32(Request.QueryString["Id"].ToString());
                var work = Managers.WorkManager.GetWork(id, part);
                Managers.WorkManager.DeleteQuestion(id, part);

                Managers.WorkManager.UploadWork(new Models.Work
                {
                    Title = Titletxt.Text,
                    Brief = Brieftxt.Text,
                    Content = Contenttxt.Text,
                    Author = Session["PenName"].ToString(),
                    Id = work.Id,
                    Date = work.Date,
                    Like = work.Like,
                    View = work.View,
                    UserID = work.UserID
                }, kind);

                Page.ClientScript.RegisterClientScriptBlock(typeof(Page), "Alert", "alert('수정되었습니다.')", true);

            }
            else
            {
                Page.ClientScript.RegisterClientScriptBlock(typeof(Page), "Alert", "alert('응모 부문을 선택해 주세요.')", true);
            }

        }
        protected void Download_Click(object sender, EventArgs e)
        {
            string downPath = "/Uploads/큰별문학상표지(양식).hwp";



            Response.Clear();

            Response.AddHeader("Content-Disposition", "attachment;filename="
            + Server.UrlEncode("큰별문학상표지(양식).hwp").Replace("+", "%20"));

            Response.ContentType = "application/octet-stream";

            Response.TransmitFile(downPath);


            Response.End();






        }
    }
}