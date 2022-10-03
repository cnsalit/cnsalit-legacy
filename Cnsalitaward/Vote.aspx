<%@ Page Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Vote.aspx.cs" Inherits="Cnsalitaward.Vote" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contents"  runat="server">
    <head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="stylesheet" href="/assets/css/vote.css" />
         <script type="text/javascript" src="http://code.jquery.com/jquery-3.2.0.min.js" ></script>
</head>


        <div class="now" style="margin-left:71.6vw !important;"></div>

            <div style="width:100%; height:14VW; margin-top:3VW; background-image:url(/assets/img/banner.jpg); background-size:100VW 14VW;"></div>

              <script>
                $(document).ready(function () {
    // Handler for .ready() called.
    $('html, body').animate({
        scrollTop: $('#start').offset().top
    }, 'slow');
});
            </script>
    <div class="container">
     <div  style="overflow:hidden;position:absolute;" class="auroral-northern"></div>
            <div style="position:absolute" class="auroral-stars"></div>

        </div>
        <div class="height" style="
    width: 100%;
    margin-top: -40vw;
    margin-bottom: 10vw;
">
            <div class="bighover">
  <div id="start" class="scene" style="cursor:pointer ;top: 100px;" onclick="location.href='https://forms.gle/1ANa8DfXJtc8GHaG9'"> <% //여기 onclick href %>
    <div class="upper">
      <div class="moon">
        <div class="crater1"></div>
        <div class="crater2"></div>
          <div style="text-align: center;margin-top: 126px;font-size: 39px" class="Dokdo">투표하기</div>
      </div>
      <div class="star1"></div>
      <div class="star2"></div>
      <div class="star3"></div>
      <div class="cloud1">
        <div class="circle"></div>
        <div class="filler"></div>
      </div>
      <div class="cloud2">
        <div class="circle"></div>
        <div class="filler"></div>
      </div>
      <div class="tail">
        <div class="left"></div>
        <div class="right"></div>
        <div class="body"></div>
      </div>

      <div class="drop"></div>

    </div>
    <div class="lower">
      <div class="whale">
        <div class="eye"></div>
        <div class="detail1">
          <div class="detail2"></div>
        </div>

      </div>
      <div class="fin"></div>
    </div>
  </div>
            <blockquote class="oval-speech-border" style="
    width: 200px;
    height: 0px;
    margin-left: 65vw;    top: 22px;cursor:pointer
">
	<p class="Dokdo" style="margin-top:-30px;font-size: 29px;width: 200px;margin-left: -37px;">지금 바로 투표하고래</p>

	                                     <div style="font-size:29px" class="Dokdo">꼭 투표하고래!</div>
</blockquote>
</div>
            </div>

        </asp:Content>

