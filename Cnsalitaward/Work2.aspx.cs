using Cnsalitaward.Models;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cnsalitaward
{
    public partial class Work2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //로그인 확인
            if (Session["UserID"] == null)
                Response.Redirect("/Login");

            string kind = "prose";
            string User = Session["UserID"].ToString();
            int id;

            string Admin = Managers.Account.CheckAdmin(User);
            
            string number = Request.QueryString["Id"].ToString();
            id = Convert.ToInt32(number);
            downloadbtn.Style["visibility"] = "hidden";
            Deletebtn.Style["visibility"] = "hidden";
            Modifybtn.Style["visibility"] = "hidden";
            replytxt.Style["visibility"] = "hidden";
            replybtn.Style["visibility"] = "hidden";

            if (!Page.IsPostBack)

            {
                Managers.WorkManager.Visitied(id, kind);
                var work = Cnsalitaward.Managers.WorkManager.GetWork(id, kind);
                if (Cnsalitaward.Managers.Account.CheckWorkAdministrator(id, User, false, true))
                {
                    Modifybtn.Style["visibility"] = "visible";
                    Deletebtn.Style["visibility"] = "visible";
                    if (User != work.UserID)
                    {
                        replytxt.Style["visibility"] = "visible";
                        replybtn.Style["visibility"] = "visible";
                    }
                }
                else
                {
                    Response.Redirect("/Error");
                }
            }
            else
            {
                var work = Cnsalitaward.Managers.WorkManager.GetWork(id, kind);
                if (Admin != "admin" && User == work.UserID)
                {
                    downloadbtn.Style["visibility"] = "visible";
                    //Modifybtn.Style["visibility"] = "visible";
                    //Deletebtn.Style["visibility"] = "visible";
                }
                else if (Admin == "admin" && User != work.UserID)
                {
                    downloadbtn.Style["visibility"] = "visible";
                    Modifybtn.Style["visibility"] = "visible";
                    Deletebtn.Style["visibility"] = "visible";
                    replytxt.Style["visibility"] = "visible";
                    replybtn.Style["visibility"] = "visible";

                }
                else if (Admin == "admin" && User == work.UserID)
                {
                    downloadbtn.Style["visibility"] = "visible";
                    Modifybtn.Style["visibility"] = "visible";
                    Deletebtn.Style["visibility"] = "visible";
                    replytxt.Style["visibility"] = "visible";
                    replybtn.Style["visibility"] = "visible";

                }
                else if (Admin != "admin" && User != work.UserID)
                {
                    downloadbtn.Style["visibility"] = "visible";
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
            if (kind == "verse") Response.Redirect("/WorkList.aspx?page=" + id);
            else
            {
                Response.Redirect("/WorkList2.aspx?page=" + id);
            }
        }

        protected void Modify_Click(object sender, EventArgs e)
        {
            string id = Request.QueryString["Id"];
            Response.Redirect("/WorkEdit.aspx?Id=" + id + "&Kind=prose");
        }

        protected void Delete_Click(object sender, EventArgs e)
        {
            string kind = "prose";
            int id = Convert.ToInt32(Request.QueryString["Id"].ToString());
            int page = id / 10 + 1;

            // 글 관리 권한이 없을시 실행(참고: CheckWorkAdminstrator는 Non-greedy=탐욕스럽지않으며 post가 존재하지 않으면 false를 반환함.)
            if (!Cnsalitaward.Managers.Account.CheckWorkAdministrator(id, Session["UserID"].ToString(), true, false))
            {
                Response.Redirect("/Error");
            }

            Cnsalitaward.Managers.WorkManager.DeleteQuestion(id, kind);

            if (kind == "verse") Response.Redirect("/WorkList.aspx?page=" + id);
            if (kind == "prose") Response.Redirect("/WorkList2.aspx?page=" + id);
        }

        protected void Like_Click(object sender, EventArgs e)
        {
            string kind = Request.QueryString["Kind"];
            int id;

            string number = Request.QueryString["Id"].ToString();
            id = Convert.ToInt32(number);

            string rmduser = Session["UserID"].ToString() + kind + id;

            string check;
            try
            {
                check = Request.Cookies[rmduser].Value;
            }
            catch (Exception ex)
            {
                check = "no";
            }
            if (check == "no")
            {
                Managers.WorkManager.Liked(id, kind);

                HttpCookie cookie = new HttpCookie(rmduser);
                cookie.Value = "1";
                cookie.Expires = DateTime.Now.AddYears(1);
                Response.Cookies.Add(cookie);
            }
            else
            {
                Response.Write("<script>alert('이미 추천하신 글입니다.');</script>");
            }

        }
        protected void Download_Click(object sender, EventArgs e)
        {
            string kind = "prose";
            string User = Session["UserID"].ToString();
            string number = Request.QueryString["Id"].ToString();
            int id = Convert.ToInt32(number);

            MySqlConnection con = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Cnsalitaward"].ConnectionString);
            con.Open();

            string sql = "SELECT * FROM prose WHERE Id='" + number + "';";

            MySqlCommand cmd = new MySqlCommand(sql, con);
            var rdr = cmd.ExecuteReader();

            rdr.Read();
            string FileName = (string)rdr["FileName"];
            rdr.Close();

            if (FileName == "")
                Response.Write("<script>alert('등록된 파일이 없습니다.');</script>");

            else
            {
                string downPath = "/Uploads/prose/" + FileName;

                Response.Clear();

                Response.AddHeader("Content-Disposition", "attachment;filename="
                + Server.UrlEncode(FileName).Replace("+", "%20"));

                Response.ContentType = "application/octet-stream";

                Response.TransmitFile(downPath);


                Response.End();
            }
        }

        protected void Reply_Click(object sender, EventArgs e)
        {
            string kind = "prose";
            string number = Request.QueryString["Id"].ToString();
            int id = Convert.ToInt32(number);
            string User = Session["UserID"].ToString();
            Managers.WorkManager.UploadReply(new Models.Work
            {
                UserID = User,
                Author = Session["PenName"].ToString(),
                Content = replytxt.Text,
                Reply = id
            }, kind);
        }

    }
}