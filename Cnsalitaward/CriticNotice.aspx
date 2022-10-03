<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CriticNotice.aspx.cs" Inherits="Cnsalitaward.CriticNotice" MasterPageFile="~/User.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contents"  runat="server">
    <head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="stylesheet" href="/assets/css/vote.css" />
         <script type="text/javascript" src="http://code.jquery.com/jquery-3.2.0.min.js" ></script>
</head>
                <div style="margin-left:51.45vw !important;
    margin-top: 4.5vw !important;    width: 3.5vw !important;
" class="now"></div>

            <div style="width:100%; height:14VW; margin-top:3VW; background-image:url(/assets/img/banner.jpg); background-size:100VW 14VW;"></div>

              <script>
                $(document).ready(function () {
    // Handler for .ready() called.
    $('html, body').animate({
        scrollTop: $('#start').offset().top
    }, 'slow');
});
            </script>
<!--- 삼성문학상 --->
<div style="display:flex; align-items:center; flex-direction:column; height:50vw;">
<div id="start" style="margin-left:0; margin-bottom:1vw; "class= "title">큰별문학상</div>
    <hr style="width:20vw; margin-bottom:2vw;"/>
       
<a style="font-size:1.5vw;font-weight:800; margin-bottom:1vw;">작품을 비평할 수 없습니다.</a>
<a style="font-size:1.0vw;font-weight:500; margin-left:-0.3vw;">지금은 작품을 응모하는 기간입니다.</a>

    </div>
    </asp:Content>
   
