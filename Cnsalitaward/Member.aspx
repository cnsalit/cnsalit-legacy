<%@ Page Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Member.aspx.cs" Inherits="Cnsalitaward.Member" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server" ></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contents" runat="server">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

 <link rel="stylesheet" href="/assets/css/member.css" />
    <script type="text/javascript" src="http://code.jquery.com/jquery-3.2.0.min.js" ></script>
    </head>
    <body style="user-select:none;">
        <div class="now" style="margin-left:82.5vw;"></div>
        <div style="width:100%; height:14VW; margin-top:3VW; background-image:url(/assets/img/banner.jpg); background-size:100VW 14VW;"></div>
        <div id="start"  class ="title">만든이</div>
        <div style="height:45.083333333333336VW">
            <div class = "line"></div>
            <script>
                $(document).ready(function () {
                // Handler for .ready() called.
                $('html, body').animate({
                scrollTop: $('#start').offset().top
                }, 'slow');
                });
            </script>
            <div class="underline"></div>
            <div  class="area" style="background-image:url('/assets/img/member.jpg'); background-size:100% 70.083333333333336VW;" >      
            <ul class="circles">
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
            </ul>
            </div>
        </div>
        <div style="width:100vw; height:30vw; margin-top: -40vw; display:inline-block">
            <br>
            <br>
            <br>
            <!-- 1대 개발자 -->
            <div class="home-title text" style="margin:0; margin-left:10vw; width: 40vw; color:white; display:inline-block">
                <div style="display:flex; justify-content:center; align-items:center; flex-direction:column; width:40vw;">
                    <div class="tracking-in-contract origin" style="margin:0;">[ 큰별문학상 페이지 1대 개발자 ]</div>
                    <div class="tracking-in-expand role" style="margin-top:6vw; margin-left:-1Vw">Back-End Developer <h class="name">&nbsp;&nbsp;&nbsp;5기 김병준</h></div>
                    <div class="tracking-in-expand role" style="margin-top:3.5vw;margin-left:-1Vw">Front-End Developer <h class="name">&nbsp;&nbsp;&nbsp; 5기 김병준 &  6기 송유진</h></div>
                    <div class="tracking-in-expand role"  style="margin-top:3.5vw;margin-left:-1Vw">Designer <h class="name">&nbsp;&nbsp;&nbsp; 5기 이서윤</h></div>
                </div>
            </div>
            <!-- 2대 개발자 -->
            <div class="home-title text" style="margin:0; width: 40vw; color:white; display:inline-block">
                <div style="display:flex; justify-content:center; align-items:center; flex-direction:column; width:40vw;">
                    <div class="tracking-in-contract origin" style="margin:0;" >[ 큰별문학상 페이지 2대 개발자 ]</div>
                    <div class="tracking-in-expand role" style="margin-top:6vw; margin-left:-1Vw">Back-End Developer <h class="name">&nbsp;&nbsp;&nbsp;6기 장우정</h></div>
                    <div class="tracking-in-expand role" style="margin-top:3.5vw;margin-left:-1Vw">Front-End Developer <h class="name">&nbsp;&nbsp;&nbsp; 6기 박예지</h></div>
                    <div class="tracking-in-expand role"  style="margin-top:3.5vw;margin-left:-1Vw">Designer <h class="name">&nbsp;&nbsp;&nbsp; 5기 이서윤</h></div>
                </div>
            </div>
            <br>
            <br>
            <br>
            <br>
            <br>
            <!-- 3대 개발자 -->
            <div class="home-title text" style="margin:0; margin-left:10vw; margin-top:5vw; width: 40vw; color:white; display:inline-block">
                <div style="display:flex; justify-content:center; align-items:center; flex-direction:column; width:40vw;">
                    <div class="tracking-in-contract2 origin" style="margin:0;">[ 큰별문학상 페이지 3대 개발자 ]</div>
                    <div class="tracking-in-expand2 role" style="margin-top:6vw; margin-left:-1Vw">Back-End Developer <h class="name">&nbsp;&nbsp;&nbsp;7기 김민아</h></div>
                    <div class="tracking-in-expand2 role" style="margin-top:3.5vw;margin-left:-1Vw">Front-End Developer <h class="name">&nbsp;&nbsp;&nbsp;7기 김도영</h></div>
                    <div class="tracking-in-expand2 role"  style="margin-top:3.5vw;margin-left:-1Vw">Designer <h class="name">&nbsp;&nbsp;&nbsp; 5기 이서윤</h></div>
                </div>
            </div>
            <!-- 4대 개발자 -->
            <div class="home-title text" style="margin:0; width: 40vw; color:white; display:inline-block">
                <div style="display:flex; justify-content:center; align-items:center; flex-direction:column; width:40vw;">
                    <div class="tracking-in-contract2 origin" style="margin:0;" >[ 큰별문학상 페이지 4대 개발자 ]</div>
                    <div class="tracking-in-expand2 role" style="margin-top:6vw; margin-left:-1Vw">Back-End Developer <h class="name">&nbsp;&nbsp;&nbsp;8기 임진성 & 8기 안철민</h></div>
                    <div class="tracking-in-expand2 role" style="margin-top:3.5vw;margin-left:-1Vw">Front-End Developer <h class="name">&nbsp;&nbsp;&nbsp;8기 임진성 & 8기 정윤승</h></div>
                    <div class="tracking-in-expand2 role"  style="margin-top:3.5vw;margin-left:-1Vw">Designer <h class="name">&nbsp;&nbsp;&nbsp;5기 이서윤 & 8기 정윤승</h></div>
                </div>
            </div>
        </div>
                
    </body>

</asp:Content>

<%--<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 290 1700 400" class="tablebox"><defs><path d="M530 225h320v450H50V225h80" class="rec" id="a"/></defs><use xlink:href="#a" fill-opacity="0" stroke="#000" stroke-width="6"/></svg>--%>