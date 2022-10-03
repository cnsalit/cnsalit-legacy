<%@ Page Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="CriticList.aspx.cs" Inherits="Cnsalitaward.CriticList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contents" runat="server">
    <head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
   <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  <script src="https://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="/assets/css/worklist.css" />
<link rel="stylesheet" href="/assets/css/font.css" />
<link rel="stylesheet" href ="/assets/css/default.css" />

</head>
 <body style="user-select:none;">
             <div class="now" style="margin-left:64.55vw !important"></div>

      <div style="width:100%; height:14VW; margin-top:6vw; background-image:url(/assets/img/banner.jpg); background-size:100VW 14VW;"></div>
      <div style="text-align:center">
     <div style="font-size:3vw;margin-top:2vw;" class="Dokdo  ">최고의 비평가를 뽑습니다</div>
     <div style="font-size:1vw" class="Noto">- <span class="NotoB">최고의 비평문을 작성</span> 한 학생을 선정하여 CNSA 문학제에서 시상합니다.</div>
     <div style="font-size:1vw" class="Noto">- 정식 대회 시상은 아니지만, <span class="NOtoB">생기부에 해당 내용이 기록</span>됩니다.</div>
     <div style="font-size:1vw" class="Noto">- <span class="NOtoB">감상/비평의 질을 참고</span>하여 시상 여부를 결정할 예정입니다.</div>
   
  </div>
       <div  class="Dokdo" style="font-size:3.5VW; padding-top: 2.2VW; margin-left:47VW">비평문</div>
        <div style="margin-left: 48.9VW;border:solid black 0.05VW;background-color:black ;width:2.18VW; height:0.156VW"></div>
      
        <table style="margin-left: 14.68VW; width: 70.67VW; border: solid #5A5A5A 0.05VW;border-spacing:0px 0px;border-style:none;padding:0px">
            <div style="float: left; margin-bottom:0.8VW">
              
            <div style="float: left;border:none #002897 0.05VW;margin-left: 62VW;margin-right: 0.8VW; width:7.44vw; height:0.2VW; background-color:#002897; margin-top:1.66VW;"></div>
                <asp:TextBox ID="Search" runat="server" style="float:left; border:solid 0.05VW;width:14.89VW;height:1.875VW" placeholder="검색어를 입력하세요." ></asp:TextBox>
                <asp:Imagebutton ImageUrl="/assets/img/search.jpg" runat="server" OnClick="Searching" style="cursor:pointer ;width:0.625VW; height:0.625VW; position:absolute;z-index:3;margin-left:-1.0416666666666665VW; margin-top:0.625VW"></asp:Imagebutton>
                <asp:DropDownList ID="TitleorContent" AutoPostBack="false" style="float:left;font-size:0.9375VW;color:#5A5A5A ;margin-left:62.86VW;width:6.77VW;height:1.875VW;margin-top:-2.08VW; border:none" runat="server">
                    <asp:ListItem Selected="True" Value="Title">제목</asp:ListItem>
                    <asp:ListItem Value="Contents">내용</asp:ListItem>
                </asp:DropDownList>
            </div>
                 <div style="border:solid #002897 0.07VW; background-color:#002897;width:70.67VW;margin-top:2.6VW;margin-left:14.68VW;"></div>
       
          
        <tr>
   
            <td class="Noto" style=" font-size:0.8VW ;text-align: center;width:4.4VW; height: 2.5VW;border: solid 0.05VW;">No.</td>
            <td class="Noto" style="font-size:0.8VW;text-align: center;width:23.875vw;border: solid 0.05VW;">비평작품</td>
            <td class="Noto" style="font-size:0.8VW;text-align: center;width:17vw;border: solid 0.05VW;">제목</td>
            <td class="Noto" style="font-size:0.8VW;text-align: center;width:12vw;   border: solid 0.05VW;">작가</td>
         
            <td class="Noto" style="font-size:0.8VW;text-align: center;border: solid 0.05VW;">작성일</td>
	    <td class="Noto" style="font-size:0.8VW;text-align: center; border: solid 0.05VW;">추천수</td>
            </tr>
        </table>
            <div style="border:solid white 0.05VW;margin-top:-2.5VW; margin-left:14.68VW; width:0.05VW; height:2.6VW;"></div>
           <div style="border:solid white 0.05VW; margin-top:-2.6VW;margin-left:85.3VW; width:0.05VW; height:2.6VW;"></div>
        
           <%


               try
               {
                   int rPage;
                   int rc;
                   try
                   {
                       rPage = int.Parse(Request.QueryString["page"]);
                   }
                   catch (Exception e)
                   {
                       rPage = 1;
                   }
                   int count = 0;
                   int count2 = Cnsalitaward.Managers.CriticManager.GetWorksCount();
                   List<Cnsalitaward.Models.Critic> workList = null;
                   if (Request.QueryString["titleSearch"] != null)
                   {
                       int pageCounts = Cnsalitaward.Managers.CriticManager.GetPagesCountBySearching(rPage, Request.QueryString["titleSearch"], false);
                       if (rPage > pageCounts)
                           rPage = 1;
                       int nc = 1;
                       workList = Cnsalitaward.Managers.CriticManager.GetWorksBySearching(rPage, Request.QueryString["titleSearch"], false);
                       foreach (var work in workList)
                       {
                           int workid = Cnsalitaward.Managers.CriticManager.GetWorkId(work.Work);
                           // Write on Page
                           Response.Write("<div style=\"float:left; width:70.6VW ;height:2.8VW; margin-left:14.75VW;\">");
                           Response.Write("<div class=\"Noto\" style=\"text-align: center; float:left; width:4.453VW;font-color:#5A5A5A;padding:0.88VW ;height:2.8VW\";>" + nc + "</div>");
                           Response.Write("<div onclick=\"location.href='Critic.aspx?Id=" + work.Id +"'\" class=\"Noto\" style=\"text-align: center; cursor:pointer; float:left;width:23.9VW; font-color:#5A5A5A ;padding:0.88VW ;height:2.8VW\";>" + work.Work + "</div>");
                            Response.Write("<div onclick=\"location.href='Critic.aspx?Id=" + work.Id +"'\" class=\"Noto\" style=\"cursor:pointer;text-align: center; float:left;width:16.5VW; font-color:#5A5A5A ;padding:0.88VW ;height:2.8VW\";>" + work.Title+"</div>");

                           Response.Write("<div class=\"Noto\" style=\"text-align: center;float:left;width:12VW; font-color:#5A5A5A ;padding:0.88VW ;height:2.8VW\";>" + work.Author + "</div>");

                           Response.Write("<div class=\"Noto\" style=\"text-align: left; float:left; margin-left: 0.5vw; width:12.5vw; font-color:#5A5A5A ;padding:0.88VW ;height:2.8VW\"; >" + work.Date.Date.ToString("yy.MM.dd") + "</div>");
                           Response.Write("<div style=\"border:solid #5A5A5A 0.05VW; width:70.6VW;margin-top:2.8VW\";></div>");
                           Response.Write("</div>");
                           ++ nc;


                       }
                   }
                   else if (Request.QueryString["contentsSearch"] != null)
                   {
                       int pageCounts = Cnsalitaward.Managers.CriticManager.GetPagesCountBySearching(rPage, Request.QueryString["contentsSearch"], true);
                       if (rPage > pageCounts)
                           rPage = 1;
                       int nc = 1;

                       workList = Cnsalitaward.Managers.CriticManager.GetWorksBySearching(rPage, Request.QueryString["contentsSearch"], true);
                       foreach (var work in workList)
                       {

                           // Write on Page
                           Response.Write("<div style=\"float:left; width:70.6VW ;height:2.8VW; margin-left:14.75VW;\">");
                           Response.Write("<div class=\"Noto\" style=\"text-align: center; float:left; width:4.453VW;font-color:#5A5A5A;padding:0.88VW ;height:2.8VW\";>" + nc + "</div>");
                           Response.Write("<div onclick=\"location.href='Critic.aspx?Id=" + work.Id +"'\" class=\"Noto\" style=\"text-align: center; cursor:pointer; float:left;width:23.9VW; font-color:#5A5A5A ;padding:0.88VW ;height:2.8VW\";>" + work.Work + "</div>");
                             Response.Write("<div onclick=\"location.href='Critic.aspx?Id=" + work.Id +"'\" class=\"Noto\" style=\"cursor:pointer;text-align: center; float:left;width:16.5VW; font-color:#5A5A5A ;padding:0.88VW ;height:2.8VW\";>" + work.Title+"</div>");

                           Response.Write("<div class=\"Noto\" style=\"text-align: center;float:left;width:12VW; font-color:#5A5A5A ;padding:0.88VW ;height:2.8VW\";>" + work.Author + "</div>");

                           Response.Write("<div class=\"Noto\" style=\"text-align: left; float:left; width:12.5vw; margin-left: 0.5vw; font-color:#5A5A5A ;padding:0.88VW ;height:2.8VW\";>" + work.Date.Date.ToString("yy.MM.dd") + "</div>");
                           Response.Write("<div style=\"border:solid #5A5A5A 0.05VW; width:70.6VW;margin-top:2.8VW\";></div>");
                           Response.Write("</div>");
                           ++ nc;

                       }
                   }
                   else
                   {
                       int pageCounts = Cnsalitaward.Managers.CriticManager.GetPagesCount();
                       if (rPage > pageCounts)
                           rPage = 1;
                       if (rPage == 1)
                       {

                           workList = Cnsalitaward.Managers.CriticManager.GetWorksByPage(rPage);

                           count = 0;
                           foreach (var work in workList)
                           {

                               // Write on Page
                               Response.Write("<div style=\"float:left; width:70.6VW ;height:2.8VW; margin-left:14.75VW;\">");
                               Response.Write("<div class=\"Noto\" style=\"text-align: center; float:left; width:4.453VW;font-color:#5A5A5A;padding:0.88VW ;height:2.8VW\";>" + (count2-count) + "</div>");
                               Response.Write("<div onclick=\"location.href='Critic.aspx?Id=" + work.Id +"'\" class=\"Noto\" style=\"text-align: center; cursor:pointer; float:left;width:23.9VW; font-color:#5A5A5A ;padding:0.88VW ;height:2.8VW\";>" + work.Work + "</div>");
                                Response.Write("<div onclick=\"location.href='Critic.aspx?Id=" + work.Id +"'\" class=\"Noto\" style=\"cursor:pointer;text-align: center; float:left;width:16.5VW; font-color:#5A5A5A ;padding:0.88VW ;height:2.8VW\";>" + work.Title+"</div>");

                               Response.Write("<div class=\"Noto\" style=\"text-align: center;float:left;width:12VW; font-color:#5A5A5A ;padding:0.88VW ;height:2.8VW\";>" + work.Author + "</div>");

                               Response.Write("<div class=\"Noto\" style=\"text-align: left; float:left; width:12.5vw; font-color:#5A5A5A ;padding:0.88VW ;height:2.8VW\";>" + work.Date.Date.ToString("yy.MM.dd") + "</div>");
                               Response.Write("<div style=\"border:solid #5A5A5A 0.05VW; width:70.6VW;margin-top:2.8VW\";></div>");
                               Response.Write("</div>");
                               ++ count;


                           }
                           Session["count"] = count;


                       }
                       else
                       {

                           workList = Cnsalitaward.Managers.CriticManager.GetWorksByPage(rPage);
                           count = int.Parse(Session["count"].ToString());
                           rc = 0;
                           foreach (var work in workList)
                           {

                               // Write on Page
                               Response.Write("<div style=\"float:left; width:70.6VW ;height:2.8VW; margin-left:14.75VW;\">");
                               Response.Write("<div class=\"Noto\" style=\"text-align: center; float:left; width:4.453VW;font-color:#5A5A5A;padding:0.88VW ;height:2.8VW\";>" +(count2-count) + "</div>");
                               Response.Write("<div onclick=\"location.href='Critic.aspx?Id=" + work.Id +"'\" class=\"Noto\" style=\"text-align: center; cursor:pointer; float:left;width:23.9VW; font-color:#5A5A5A ;padding:0.88VW ;height:2.8VW\";>" + work.Work + "</div>");
                                Response.Write("<div onclick=\"location.href='Critic.aspx?Id=" + work.Id +"'\" class=\"Noto\" style=\"cursor:pointer;text-align: center; float:left;width:16.5VW; font-color:#5A5A5A ;padding:0.88VW ;height:2.8VW\";>" + work.Title+"</div>");

                               Response.Write("<div class=\"Noto\" style=\"text-align: center;float:left;width:12VW; font-color:#5A5A5A ;padding:0.88VW ;height:2.8VW\";>" + work.Author + "</div>");

                               Response.Write("<div class=\"Noto\" style=\"text-align: left; float:left; width:12.5vw; margin-left: 0.5vw; font-color:#5A5A5A ;padding:0.88VW ;height:2.8VW\";>" + work.Date.Date.ToString("yy.MM.dd") + "</div>");
                               Response.Write("<div style=\"border:solid #5A5A5A 0.05VW; width:70.6VW;margin-top:2.8VW\";></div>");
                               Response.Write("</div>");
                               ++count;

                           }
                       }

                   }
               }catch(Exception ex)
               {

               }


               %> 
   <!--  <div style="height: 2.5vw; display:flex; align-items:center; justify-content:center; cursor:pointer;margin-top:32vw;margin-left:79vw;background-color:#002897;color:white; border-radius:20px; font-size:1vw; display:inline;" onclick="location.href='UploadCritic.aspx'"class="writecritic" >비평하기</div>-->
           <div style="text-align: center; height:3vw; margin-top:30vw;">
               <span>
                   <strong><b>
                       <asp:LinkButton runat="server" OnClick="LeftButton_Click" Text="<" ForeColor="#400101" />
                   </b></strong>
               </span>

               <%
                       string queryText = "";
                       int page = 1;
                       int pageCount = 10;
                       if (Request.QueryString["titleSearch"] != null)
                       {
                           pageCount = Cnsalitaward.Managers.CriticManager.GetPagesCountBySearching(page, Request.QueryString["titleSearch"], false);
                           try
                           {
                               page = int.Parse(Request.QueryString["page"]);
                           }
                           catch (Exception e)
                           {
                               page = 1;
                           }

                           queryText = "&titleSearch=" + Request.QueryString["titleSearch"];
                       }
                       else if (Request.QueryString["contentsSearch"] != null)
                       {
                           pageCount = Cnsalitaward.Managers.CriticManager.GetPagesCountBySearching(page, Request.QueryString["contentsSearch"], true);
                           try
                           {
                               page = int.Parse(Request.QueryString["page"]);
                           }
                           catch (Exception e)
                           {
                               page = 1;
                           }

                           queryText = "&contentsSearch=" + Request.QueryString["contentsSearch"];
                       }
                       else
                       {
                           pageCount = Cnsalitaward.Managers.CriticManager.GetPagesCount( );
                           try
                           {
                               page = int.Parse(Request.QueryString["page"]);
                           }
                           catch (Exception e)
                           {
                               page = 1;
                           }
                       }

                       // 정상적인 페이지 요청일 경우
                       if (page <= pageCount)
                       {
                           // 요청한 페이지가 마지막 장일경우
                           if (pageCount / 10 == page / 10)
                           {
                               if (page % 10 != 0)
                               {
                                   for (int i = 1; i <= pageCount % 10; i++)
                                   {
                                       string pageStyle = "";
                                       string textStyle = " style=\"color: #343434;\"";
                                       if (i + ((page / 10) * 10) == page)
                                       {
                                           pageStyle = " class=\"this-page\"";
                                           textStyle = " style=\"color: white;\"";
                                       }

                                       Response.Write("<span" + pageStyle + " style=\"padding: 0.15VW 0.46VW; margin: 0.15VW;\">");
                                       Response.Write("<a" + textStyle + " href=\"/CriticList.aspx?page=" + (i + ((page / 10) * 10)) + queryText + "\">" + (i + ((page / 10) * 10)) + "</a>");
                                       Response.Write("</span>");
                                   }
                               }
                               else
                               {
                                   // 마지막 페이지의 일의 자릿 수가 0일 경우
                                   for (int i = 1; i <= 10; i++)
                                   {
                                       string pageStyle = "";
                                       string textStyle = " style=\"color: #343434;\"";
                                       if (i + page - 10 == page)
                                       {
                                           pageStyle = " class=\"this-page\"";
                                           textStyle = " style=\"color: white;\"";
                                       }

                                       Response.Write("<span" + pageStyle + " style=\"padding: 0.15VW 0.46VW; margin: 0.15VW;\">");
                                       Response.Write("<a" + textStyle + " href=\"/CriticList.aspx?page=" + (i + page - 10) + queryText + "\">" + (i + page - 10) + "</a>");
                                       Response.Write("</span>");
                                   }
                               }
                           }
                           else
                           {
                               for (int i = 1; i <= 10; i++)
                               {
                                   string pageStyle = "";
                                   string textStyle = " style=\"color: #343434;\"";
                                   if (i + ((page / 10) * 10) == page)
                                   {
                                       pageStyle = " class=\"this-page\"";
                                       textStyle = " style=\"color: white;\"";
                                   }

                                   Response.Write("<span" + pageStyle + " style=\"padding: 0.15VW 0.46VW; margin: 0.15VW;\">");
                                   Response.Write("<a" + textStyle + " href=\"/CriticList.aspx?page=" + (i + ((page / 10) * 10)) + queryText + "\">" + (i + ((page / 10) * 10)) + "</a>");
                                   Response.Write("</span>");
                               }
                           }
                       }
                       else
                       {
                           // 첫 목록
                           for (int i = 1; i <= 10; i++)
                           {
                               string pageStyle = "";
                               string textStyle = " style=\"color: #343434;\"";
                               if (i == 1)
                               {
                                   pageStyle = " class=\"this-page\"";
                                   textStyle = " style=\"color: white;\"";
                               }

                               Response.Write("<span" + pageStyle + " style=\"padding: 0.15VW 0.46VW; margin: 0.15VW;\">");
                               Response.Write("<a" + textStyle + " href=\"/CriticList.aspx?page=" + i + queryText + "\">" + i + "</a>");
                               Response.Write("</span>");
                           }
                       }

                   %>
               <span>
                   <strong><b>
                       <asp:LinkButton runat="server" OnClick="RightButton_Click" Text=">" ForeColor="#400101" />
                   </b></strong>
               </span>
           </div>
		

    </body>
    </asp:Content>
