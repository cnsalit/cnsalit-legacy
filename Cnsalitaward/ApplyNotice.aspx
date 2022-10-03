<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ApplyNotice.aspx.cs" Inherits="Cnsalitaward.ApplyNotice" MasterPageFile="~/User.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contents"  runat="server">
    <head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="stylesheet" href="/assets/css/vote.css" />
         <script type="text/javascript" src="http://code.jquery.com/jquery-3.2.0.min.js" ></script>
        <title>큰별문학상</title>
</head>
    <body style="user-select:none;">
                <div style=" margin-left: 52.2vw !important;
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
<div id="start" class= "title">큰별문학상</div>

<div class = "line"></div>
        <div class="subtitle">
<div style="margin-left:-1vw;margin-top:3vw;font-size:1.5vw;font-weight:800; margin-bottom:1vw">작품을 응모할 수 없습니다.</div>
<div style="margin-bottom:1vw;margin-left:-3vw">지금은 작품을 감상하고 비평하는 기간입니다.</div>
            </div>
    </body>
    </asp:Content>

