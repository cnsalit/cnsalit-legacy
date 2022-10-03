<%@ Page Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Critic.aspx.cs" Inherits="Cnsalitaward.Critic" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contents" runat="server">

    <head>
     
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="stylesheet" href="/assets/css/work.css" />
</head>
 <body style="user-select:none;">
          <script>
            function pop(url, width, height) {
                        window.open(url,width,height);  
              
            }
        </script>
             <div class="now" style="margin-left:64.55vw !important; margin-top:4.5vw;"></div>

      <div style="width:100%; height:14VW; margin-top:3VW; background-image:url(/assets/img/banner.jpg); background-size:100VW 14VW;"></div>

    <%
        int id;
        try {
            id = int.Parse(Request.QueryString["id"]);
        } catch (Exception e) {
            id = 1;
        }
        var work = Cnsalitaward.Managers.CriticManager.GetCritic(id);
       
        %>


<!--- 비평문 --->
<div class = "text_verse" style="margin-left:47vw">비평문</div>
<div class = "underline"></div>


 
<!--- 본문 --->
<div class = "body">
<div class = "title"><%=work.Title%></div>
  <div class = "grayline"></div>
    <div class="title" style="float:left">비평작품 : </div>
        <div class="title" style="overflow:hidden"><%=work.Work %></div>
  <div class = "writer" style = "float:left"> 작가 </div>
  <div class = "realwriter" style = "float:left"><%=work.Author %></div>
  <div class = "verticalline" style = "float:left"></div>

  <div class = "date" style = "float:left"> 작성일 </div>
  <div class = "realdate" style = "float:left"><%=work.Date.Date.ToString("yy.MM.dd") %></div>

        <asp:Button runat="server" Text="수정" ID="Modifybtn" Onclick="Modify_Click" class = "rewrite" style = "margin-left:60vw; border:1px solid white; font-size:1.3vw;  visibility:visible; float:left"></asp:Button>
        <asp:Button runat="server" Text="삭제" ID="Deletebtn" OnClick="Delete_Click"  onclientclick="return DeleteItem();" class = "delete" style = "margin-left:0vw; width:5vw; border:1px solid white; font-size:1.3vw; float:right;"></asp:Button>
  <div class = "blueline"></div>
  
  <div class = "maintext"><%=work.Content %>
        <div class = "blueline" style = "margin-top:2.81VW;"></div>
            

      <%  

          List<Cnsalitaward.Models.Work> workList = null;
          int Id = int.Parse(Request.QueryString["Id"]);
            string User = Session["UserID"].ToString();
          string Admin = Cnsalitaward.Managers.Account.CheckAdmin(User);
          %>
    <!--<button Text="추천하기" OnClick="#" class=" list" style="cursor:pointer; float:left; margin-left:59vw">추천</button> -->
    <asp:Button runat="server" Text="목록" ID="Listbtn" OnClick="List_Click" class = "list" style = " cursor:pointer; float:left;margin-left:65vw;margin-bottom:4vw; margin-top:-4.85vw"></asp:Button>

  </div>
          
       <script type="text/javascript">
                    function DeleteItem() {
            if (confirm("삭제 하시겠습니까?")) {
                return true;
            }
            return false;
        }
 </script>

    </body>
    </asp:Content>
