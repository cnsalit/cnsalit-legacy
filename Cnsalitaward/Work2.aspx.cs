﻿using Cnsalitaward.Models;
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

            if (!Managers.WorkManager.ConfirmLike(User, kind, id))
            {
                Likebtn.Text = "추천됨";
            }

            Deletebtn.Style["visibility"] = "hidden";
            Modifybtn.Style["visibility"] = "hidden";
            downloadbtn.Style["visibility"] = "visible";
            replytxt.Style["visibility"] = "hidden";
            replybtn.Style["visibility"] = "hidden";

            var work = Cnsalitaward.Managers.WorkManager.GetWork(id, kind);
            Managers.WorkManager.Visitied(id, kind);
            if (Cnsalitaward.Managers.Account.CheckWorkAdministrator(id, User, true, false))
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
                replytxt.Style["visibility"] = "visible";
                replybtn.Style["visibility"] = "visible";
            }

            // 댓글 개수 보이기
            int replyLength = 0;
            List<Cnsalitaward.Models.Work> replyList = Cnsalitaward.Managers.WorkManager.GetReplyByPage(id, kind);
            foreach (var reply in replyList)
                replyLength++;
            replyNum.InnerText = replyLength.ToString();
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
            string userID = Session["UserID"].ToString();
            string kind = "prose";
            int workID = Convert.ToInt32(Request.QueryString["Id"].ToString());
            if (!Managers.WorkManager.PushLike(userID, kind, workID))
            {
                Response.Write("<script>alert('이미 추천하신 작품입니다.');</script>");
                return;
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