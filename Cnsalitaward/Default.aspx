<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/User.Master" CodeBehind="Default.aspx.cs" Inherits="Cnsalitaward.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contents" runat="server">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="/assets/css/default.css" />

        <style>
            .layerPopup img {
                margin-bottom: 20px;
            }

            .layerPopup:before {
                display: block;
                content: "";
                position: fixed;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                background: rgba(0,0,0,.5);
                z-index: 9000
            }

            .layerPopup .layerBox {
                z-index: 10000;
                position: absolute;
                left: 50%;
                top: 50%;
                transform: translate(-50%, -50%);
                padding: 30px;
                background: #fff;
                border-radius: 6px;
            }

                .layerPopup .layerBox .title {
                    margin-bottom: 10px;
                    padding-bottom: 10px;
                    font-weight: 600;
                    border-bottom: 1px solid #d9d9d9;
                }

                .layerPopup .layerBox .btnTodayHide {
                    font-size: 14px;
                    font-weight: 600;
                    color: black;
                    float: left;
                    text-decoration: none;
                    width: 150px;
                    height: 30px;
                    line-height: 30px;
                    border: black solid 1px;
                    text-align: center;
                    text-decoration: none;
                }

            .layerPopup div {
                display: inline;
            }

            .layerPopup form {
                margin-top: 5px;
                font-size: 16px;
                font-weight: 600;
                height: 30px;
                line-height: 30px
            }

            .layerPopup #close {
                font-size: 16px;
                font-weight: 600;
                width: 40px;
                height: 30px;
                color: black;
                float: right;
                line-height: 30px;
                text-align: center;
                text-decoration: underline;
            }

            .layerPopup a {
                text-decoration: none;
                color: black;
                width: 50px;
                height: 40px;
            }
        </style>
    </head>

    <%--<script language="javascript" type="text/javascript">
            function openWin() {
                window.open("Notice.aspx", "_self", 'width=650px, height=350px,menubar=no,resizable=no,location=no,scrollbars=no,toolbar=no,status=no;');
            }
        </script>
        <body onload="openWin();"></body>--%>

    <body style="user-select: none;">
        <div class="layerPopup" id="layer_popup" style="visibility: visible;">
            <div class="layerBox">
                <h4 class="title">투표 부탁드립니다</h4>
                <div class="cont">
                    <p>
                        <button onclick="CLK();">
                            <img src="/assets/img/survey.png" alt="" style="width: 320px; height: 320px"></button>
                    </p>
                </div>
                <form name="pop_form">
                    <div id="check">
                        <input type="checkbox" name="chkbox" value="checkbox" id='chkbox'>
                        <label for="chkbox">&nbsp&nbsp오늘 하루동안 보지 않기</label>
                    </div>
                    <div id="close"><a href="javascript:closePop();">닫기</a></div>
                </form>
            </div>
        </div>


        <div style="margin-top: 1.6VW;">
            <table frame="void" style="width: 70VW; height: 42VW; float: left; margin-left: 16VW; margin-top: 3VW; border-spacing: 0px 0px; border-style: none; padding: 0px">
                <tr>
                    <td colspan="3" style="border-spacing: 0px; border-style: none; padding: 0px">
                        <div id="carousel" class="carousel slide" data-ride="carousel">
                            <ol class="carousel-indicators">
                                <li data-target="#carousel" data-slide-to="0" class="active"></li>
                                <li data-target="#carousel" data-slide-to="1"></li>
                                <li data-target="#carousel" data-slide-to="2"></li>
                                <li data-target="#carousel" data-slide-to="3"></li>
                                <li data-target="#carousel" data-slide-to="4"></li>

                            </ol>
                            <!-- Carousel items -->
                            <div class="carousel-inner">
                                <div class="carousel-item active">
                                    <img style="width: 100%; height: 14VW" src="assets/img/care3.jpg" alt="Slide One ;">
                                </div>
                                <div class="carousel-item">
                                    <img style="width: 100%; height: 14VW" src="assets/img/care2.jpg" alt="Slide One ;">
                                </div>
                                <div class="carousel-item">
                                    <img style="width: 100%; height: 14VW" src="assets/img/care4.png" alt="Slide One ;">
                                </div>
                                <div class="carousel-item">
                                    <img style="width: 100%; height: 14VW" src="assets/img/care5.png" alt="Slide One ;">
                                </div>
                                <div class="carousel-item">
                                    <img style="width: 100%; height: 14VW" src="assets/img/care8.png" alt="Slide One;" />
                                </div>

                            </div>
                            <!-- Carousel nav -->
                            <a class="carousel-control-prev" href="#carousel" data-slide="prev">
                                <span class="carousel-control-prev-icon"></span>

                            </a>
                            <a class="carousel-control-next" href="#carousel" data-slide="next">
                                <span class="carousel-control-next-icon"></span>

                            </a>
                        </div>
                    </td>
                    <td <%--onclick="location.href='Vote.aspx'"--%> onclick="alert('현재는 투표할 수 없습니다.')" style="cursor: pointer; width: 20%; height: 14VW; background-image: url('/assets/img/vote.jpg'); background-size: contain; border: none"></td>
                    <td style="width: 20%; height: 14VW; border: none; background-image: url('/assets/img/default1.jpg'); background-size: contain;"></td>



                </tr>
                <tr>
                    <td style="cursor: pointer; background-image: url('/assets/img/default2.jpg'); background-size: contain;"></td>
                    <td onclick="location.href='WorkList.aspx?page=1'" <%--onclick="alert('현재는 조회할 수 없습니다.')"--%> style="cursor: pointer; background-image: url('/assets/img/see.jpg'); background-size: contain;"></td>
                    <td onclick="location.href='UploadCritic.aspx'" <%--onclick="alert('현재는 비평할 수 없습니다.')"--%> style="cursor: pointer; background-image: url('/assets/img/critic.jpg'); background-size: contain;"></td>
                    <td style="background-image: url('/assets/img/default3.jpg'); background-size: contain;"></td>
                    <td onclick="location.href='Member.aspx'" style="cursor: pointer; background-image: url('/assets/img/make.jpg'); background-size: contain;"></td>
                </tr>
                <tr>
                    <td colspan="5" style="background-image: url('/assets/img/default4.jpg'); background-size: contain;"></td>

                </tr>



            </table>
            <table style="float: left; width: 100%; height: 3VW;">
                <tr>
                    <td></td>
                </tr>
            </table>
        </div>

        <script language="JavaScript">
            checkBox = document.getElementById("chkbox")
            layerPopup = document.getElementById("layer_popup")

            cookiedata = document.cookie;
            if (cookiedata.indexOf("maindiv=done") < 0) {
                layerPopup.style.visibility = "visible";
            }
            else {
                layerPopup.style.visibility = "hidden";
            }


            function setCookie(name, value, expiredays) {
                var todayDate = new Date();
                todayDate.setDate(todayDate.getDate() + expiredays);
                document.cookie = name + "=" + escape(value) + "; path=/; expires=" + todayDate.toGMTString() + ";"
            }
            function closePop() {
                if (checkBox.checked) {
                    setCookie("maindiv", "done", 1);
                }
                layerPopup.style.visibility = "hidden";
            }
            function CLK() {
                location.href = "https://forms.gle/yhsriSY4u5jbsx7g6";
            }
        </script>
    </body>
</asp:Content>


