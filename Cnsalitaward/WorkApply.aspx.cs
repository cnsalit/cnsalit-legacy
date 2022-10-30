using Cnsalitaward.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cnsalitaward
{
    public partial class WorkApply : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //로그인 확인
            if (Session["UserID"] == null)
                Response.Redirect("/Login");

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
                if (!Page.IsPostBack)
                {
                    // 넘겨져 온 번호값에 해당하는 글 출력
                    //DisplayData();
                }
                else
                {

                }
            }
			else
			{
                if (!Page.IsPostBack)
                {
                    // 넘겨져 온 번호값에 해당하는 글 출력
                    //DisplayData();
                }
                else
                {

                }
                //Response.Redirect("CriticNotice");
            }

        }

                          
        private void DisplayData()
        {
            try
            {
                string kind = Request.QueryString["Kind"].ToString();
                string number = Request.QueryString["Id"].ToString();
                string User = Session["UserID"].ToString();
                string Admin = Session["Admin"].ToString();
                int id = Convert.ToInt32(number);
                var work = Managers.WorkManager.GetWork(id, kind);

                if(Admin == "admin"|| User == work.UserID)
                {

                    Titletxt.Text = work.Title;
                    Brieftxt.Text = work.Brief; 
                    Contenttxt.Text = work.Content.Replace("<br/>", "\r\n");
                    Uploadbtn.Style["visibility"] = "hidden"; 
                }
				else
				{
                    
				}

            }
            catch (Exception ex)
            {
                Savebtn.Style["visibility"] = "hidden";
            }
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
            string kind = "";
            int result;
            kind = kindlist.SelectedValue.ToString();

            if (kind != "")
            {
                string fileName = System.IO.Path.GetFileName(File.PostedFile.FileName);

                result = UploadFile(kind);
                if (!String.IsNullOrEmpty(Titletxt.Text) && !String.IsNullOrEmpty(Contenttxt.Text) && !String.IsNullOrEmpty(Brieftxt.Text))
                {
                    if (fileName != null)
                    {
                        Cnsalitaward.Managers.WorkManager.UploadWork(new Models.Work
                        {
                            Author = Session["PenName"].ToString(),
                            Title = Titletxt.Text,
                            Brief = Brieftxt.Text,
                            Content = Contenttxt.Text,
                            UserID = Session["UserID"].ToString(),
                            Like = 0,
                            View = 0,
                            FileName = fileName

                        }, kind);
                        //Response.Redirect("/Notice.aspx");
                        Page.ClientScript.RegisterClientScriptBlock(typeof(Page), "Alert", "alert('제출되었습니다.')", true);

                    }
                    else 
                    {
                        Cnsalitaward.Managers.WorkManager.UploadWork(new Models.Work
                        {
                            Author = Session["PenName"].ToString(),
                            Title = Titletxt.Text,
                            Brief = Brieftxt.Text,
                            Content = Contenttxt.Text,
                            UserID = Session["UserID"].ToString(),
                            Like = 0,
                            View = 0,
                            FileName = null

                        }, kind);
                        //Response.Redirect("/Notice.aspx");
                        string href2go = "";
                        if (kind == "verse")
                            href2go = "/WorkList";
                        else if (kind == "prose")
                            href2go = "/WorkList2";
                        else
                            Response.Redirect("/Error");

                        Page.ClientScript.RegisterClientScriptBlock(typeof(Page), "Alert", "alert('제출되었습니다.'); document.location.href=\"" + href2go + "\";", true);

                    }
                }
                else
                {
                    Page.ClientScript.RegisterClientScriptBlock(typeof(Page), "Alert", "alert('양식을 완성해 주세요.')", true);

                }

            }
            else
            {
                Page.ClientScript.RegisterClientScriptBlock(typeof(Page), "Alert", "alert('응모 부문을 선택해 주세요.')", true);

            }
        }

        protected void Save_Click(object sender, EventArgs e)
        {

           string  kind = kindlist.SelectedValue.ToString();
            if (kind != "")
            {

                string part = Request.QueryString["Kind"].ToString();
                 kind = kindlist.SelectedValue.ToString();
             
                int id = Convert.ToInt32(Request.QueryString["Id"].ToString());
                if (part == kind)
                {
                }
                else
                {
                    if (File.HasFile)
                    {
                        string fileName = System.IO.Path.GetFileName(File.PostedFile.FileName); Managers.WorkManager.ModifyFile(new Models.Work
                        {
                            FileName = fileName



                        }, kind);

                        SaveFile(kind, part);
                            
                    }

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
                }
                //Response.Redirect("/Notice");
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