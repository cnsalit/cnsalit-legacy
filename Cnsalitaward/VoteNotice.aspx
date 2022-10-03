<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VoteNotice.aspx.cs" Inherits="Cnsalitaward.VoteNotice" MasterPageFile="~/User.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contents"  runat="server">
    <head runat="server">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="/assets/css/vote.css" />
         <script type="text/javascript" src="http://code.jquery.com/jquery-3.2.0.min.js" ></script>
    </head>
        <body style="user-select:none;">
                <div style=" margin-left: 71.7vw !important;
    margin-top: 4.5vw !important;    width: 8vw !important;
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
<div id="start" style="margin-left:0; margin-bottom:1vw; " class= "title">큰별문학상</div>
    <hr style="width:20vw; margin-bottom:2vw;"/>
       
<a style="font-size:1.5vw;font-weight:800; margin-bottom:1vw;">작품에 투표할 수 없습니다.</a>
<a style="font-size:1.0vw;font-weight:500;">추후 투표를 위한 링크를 공지하도록 하겠습니다.</a>

    </div>

            </body>
    </asp:Content>
   

