<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Notice2.aspx.cs" Inherits="Cnsalitaward.Notice" %>

<!DOCTYPE html>
<link rel="stylesheet" href="/assets/css/font.css" />
<link rel="stylesheet" href="/assets/css/notice.css" />
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body style="background: url('/assets/img/background3.jpg'); background-size:cover; display:flex; justify-content:center; align-content:center; overflow:hidden; user-select:none;">
    
<form id="form2" runat="server">
  
       <div style=" height:49vw;">
           <%--투표 기간에 사용하는 화면--%>
            <div style="width:101vw; color:white; margin-top: 3vw; margin-left:1vw; text-align:center;color:white !important;margin-right:1vw;">
                <div style="font-size:6vw; margin-bottom:1vw;" class="Dokdo">투표하셨나요?</div>
                <div style="color:white; margin-left:10vw; margin-right:10vw; margin-top:2vw; font-size:1.5vw" class="Noto">아직도 <span class="NotoB" style="font-weight:bold; color:darkblue">투표</span>하지 않았다면?</div>
          
                <asp:Label ID="Label1" runat="server" Text="" CssClass="NotoB" style="font-size:2.5vw; margin-top:3vw"></asp:Label>

                <span style="font-size:1vw; color:midnightblue; cursor:pointer" class="NotoB">지금 당장</span>
                <div style="font-size:2vw; color:midnightblue; cursor:pointer" class="NotoB" onclick="location.href='/Vote'" >투표 하러가기</div>
                
                <div style="color:white; margin-left:10vw; margin-right:10vw; margin-top:2vw; font-size:1.5vw" class="Noto">이미 투표했다면?</div>
          
                <div style="font-size:2vw; color:midnightblue; cursor:pointer" class="NotoB" onclick="location.href='/WorkList'" >작품 보러가기</div>

                <asp:Label ID="Label2" runat="server" Text="" CssClass="NotoB" style="font-size:2.5vw; margin-top:3vw"></asp:Label>
                
                <asp:Button ID="check2" runat="server" Text="확인했어요!" CssClass="btn btn-1" style="height:4vw; width:15vw; padding:0; " OnClick="Move_Click" />
            </div>  
            </div>
</>
    </form></body>
    
