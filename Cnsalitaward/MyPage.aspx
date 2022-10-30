<%@ Page Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="MyPage.aspx.cs" Inherits="Cnsalitaward.MyPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contents" runat="server">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="https://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="/assets/css/font.css" />
        <link rel="stylesheet" href="/assets/css/default.css" />
    </head>
    <body style="user-select: none; width: 100vw;">
        <div class="now" style="margin-left: 57.6vw !important;"></div>
            <div class="Dokdo" style="font-size: 3.5VW; padding-top: 2.2VW; margin-left: 48VW">내가 쓴 글</div>
            <div style="margin-left: 48.9VW; border: solid black 0.05VW; background-color: black; width: 2.18VW; height: 0.156VW"></div>

            <table style="margin-left: 14.68VW; width: 70.67VW; border: solid #5A5A5A 0.05VW; border-spacing: 0px 0px; border-style: none; padding: 0px">
                <tr>
                    <td class="Noto" style="font-size: 0.8VW; text-align: center; width: 42.203VW; border: solid 0.05VW;">제목</td>
                    <td class="Noto" style="font-size: 0.8VW; text-align: center; border: solid 0.05VW;">추천</td>
                    <td class="Noto" style="font-size: 0.8VW; text-align: center; border: solid 0.05VW;">작성일</td>
                    <td class="Noto" style="font-size: 0.8VW; text-align: center; width: 12vw; border: solid 0.05VW;">부문</td>
                </tr>
            </table>
            <div style="border: solid white 0.05VW; margin-top: -2.5VW; margin-left: 14.68VW; width: 0.05VW; height: 2.6VW;"></div>
            <div style="border: solid white 0.05VW; margin-top: -2.6VW; margin-left: 85.3VW; width: 0.05VW; height: 2.6VW;"></div>



            <%
                string UserID = Session["UserID"].ToString();
                List<Cnsalitaward.Models.Work> verseList = Cnsalitaward.Managers.WorkManager.GetWorkByUser(UserID, "verse");
                List<Cnsalitaward.Models.Work> proseList = Cnsalitaward.Managers.WorkManager.GetWorkByUser(UserID, "prose");

                int i = 1;
                foreach (var work in verseList)
                {
                    // Write on Page
                    Response.Write("<a href='/Work1?Id=" + work.Id.ToString() + "'><div style=\"float:left; width:72.6VW ;height:2.8VW; margin-left:14.75VW;\">");
                    Response.Write("<div class=\"Noto\" style=\"cursor:pointer;text-align: center; float:left;width:42.203VW; font-color:#5A5A5A ;padding:0.88VW ;height:2.8VW\";>" + work.Title + "</div>");

                    Response.Write("<div class=\"Noto\" style=\"text-align: center; float:left; width:6.3VW; font-color:#5A5A5A ;padding:0.88VW ;height:2.8VW\";>" + work.Like + "</div>");
                    Response.Write("<div class=\"Noto\" style=\"text-align: center; float:left; width:10vw; font-color:#5A5A5A ;padding:0.88VW ;height:2.8VW\";>" + work.Date.Date.ToString("yy.MM.dd") + "</div>");
                    Response.Write("<div class=\"Noto\" style=\"text-align: center;float:left;width:11.9VW; font-color:#5A5A5A ;padding:0.88VW ;height:2.8VW\";>" + "운문" + "</div>");
                    Response.Write("<div style=\"border:solid #5A5A5A 0.05VW; width:70.6VW;margin-top:2.8VW\";></div>");
                    Response.Write("</div></a>");

                    i+=1;
                }
                foreach (var work in proseList)
                {
                    // Write on Page
                    Response.Write("<a href='/Work2?Id=" + work.Id.ToString() + "'><div style=\"float:left; width:72.6VW ;height:2.8VW; margin-left:14.75VW;\">");
                    Response.Write("<div class=\"Noto\" style=\"cursor:pointer;text-align: center; float:left;width:42.203VW; font-color:#5A5A5A ;padding:0.88VW ;height:2.8VW\";>" + work.Title + "</div>");

                    Response.Write("<div class=\"Noto\" style=\"text-align: center; float:left; width:6.3VW; font-color:#5A5A5A ;padding:0.88VW ;height:2.8VW\";>" + work.Like + "</div>");
                    Response.Write("<div class=\"Noto\" style=\"text-align: center; float:left; width:10vw; font-color:#5A5A5A ;padding:0.88VW ;height:2.8VW\";>" + work.Date.Date.ToString("yy.MM.dd") + "</div>");
                    Response.Write("<div class=\"Noto\" style=\"text-align: center;float:left;width:11.9VW; font-color:#5A5A5A ;padding:0.88VW ;height:2.8VW\";>" + "산문" + "</div>");
                    Response.Write("<div style=\"border:solid #5A5A5A 0.05VW; width:70.6VW;margin-top:2.8VW\";></div>");
                    Response.Write("</div></a>");

                    i+=1;
                }
            %>
        </div>
    </body>
</asp:Content>
