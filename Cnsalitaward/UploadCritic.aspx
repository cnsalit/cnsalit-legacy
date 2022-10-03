<%@ Page Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="UploadCritic.aspx.cs" Inherits="Cnsalitaward.UploadCritic" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contents" runat="server">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="/assets/css/apply.css" />
    <link rel="stylesheet" href="/assets/css/font.css" />
     <link rel="stylesheet" href="/assets/css/default.css" />
</head>
    <body style="user-select:none;">
               <div style=" margin-left: 64.5vw !important; margin-top: 4.5vw !important;    width: 4.5vw !important;" class="now"></div>
                          <div style="width:100%; height:14VW; margin-top:6vw; background-image:url(/assets/img/banner.jpg); background-size:100VW 14VW;"></div>

        <div class ="apply">작품 비평하기</div>
        <a href="PenName.aspx" style="display:none;">PenName.aspx</a>
<!--- 밑줄 --->
<div class = "bar" style="margin-bottom:7vw;"></div>


<!--- 응모 내용 --->
<div class = "write">
  <div class = "check"> 
    <div class = "checktype NotoM" style = "float:left;">비평 작품</div>
    <div class = "verticalline" style = "float:left;"></div>
      
 <asp:DropDownList ID="criticwork"  runat="server"  CssClass="dropdown" style="height:1.8vw; width: 21vw;margin-top: 0.6vw;margin-left: 1vw;">
 </asp:DropDownList>
  </div>
           <div style="float: left;border:none #002897 0.05VW;margin-left: 1.95vw;margin-right: 0.8VW;width: 21vw;height:0.2VW;background-color:#002897;"></div>

  
  <!--- 중간 선 --->
  <div class = "line" style="margin-top:1vw"></div>
  
  <!--- 작품 제목 --->
    <div class = "title NotoM" style = "float:left;">제목</div>
    <div class = "verticalline" style = "float:left; margin-top:1.718VW;"></div>
    <asp:TextBox ID="Titletxt" runat="server" style="width:69VW; height:5vw;" CSSclass = "texttitle"></asp:TextBox>
  
  <!--- 본문 --->
  <div class = "maintext NotoM" style = "float:left;">본문</div> 
    
  <div class = "verticalline" style = "float:left; margin-left:0.859VW; margin-top:1.69VW;"></div>
   <div style="margin-top:1.9vw; margin-left:6vw;">   비평하기 전에, 원색적인 비난이나 비방이 아니라 작품과 작가에 대한 존중을 바탕으로 비평을 부탁드립니다♡</div>
  <asp:TextBox ID="Contenttxt" runat="server" Textmode="MultiLine" CSSclass = "writemaintext"></asp:TextBox>
  
  
 
  <!---- 등록 --->
   <asp:Button ID="Savebtn"  OnClick="Save_Click" runat="server" CSsclass = "save Noto" style=" cursor:pointer" Text="저장"></asp:Button>
  <asp:Button ID="Uploadbtn" style="margin-top:2vw; border-radius:2vw;  cursor:pointer; font-size:1vw;" OnClick="Upload_Click"  runat="server" CSsclass = "submit Noto" Text="등록"></asp:Button>
    
  </div>
        </body>
    </asp:Content>


