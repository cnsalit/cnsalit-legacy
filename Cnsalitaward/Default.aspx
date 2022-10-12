<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/User.Master" CodeBehind="Default.aspx.cs" Inherits="Cnsalitaward.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contents" runat="server">
    <head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
   <link rel="stylesheet"  href="/assets/css/default.css" />
</head>

        <%--<script language="javascript" type="text/javascript">
            function openWin() {
                window.open("Notice.aspx", "_self", 'width=650px, height=350px,menubar=no,resizable=no,location=no,scrollbars=no,toolbar=no,status=no;');
            }
        </script>
        <body onload="openWin();"></body>--%>

    <body style="user-select:none;">
     
<div style="margin-top:1.6VW;" >
        <table frame=void style="width:70VW; height: 42VW;float:left;margin-left: 16VW; margin-top:3VW;border-spacing:0px 0px;border-style:none;padding:0px">
            <tr >
       <td colspan="3" style="border-spacing:0px;border-style:none;padding:0px"><div id="carousel" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
        <li data-target="#carousel" data-slide-to="0" class="active"></li>
        <li data-target="#carousel" data-slide-to="1"></li>
        <li data-target="#carousel" data-slide-to="2"></li>
        <li data-target="#carousel" data-slide-to="3"></li>
        <li data-target="#carousel" data-slide-to="4"></li>

    </ol>
    <!-- Carousel items -->
    <div class="carousel-inner">
        <div class="carousel-item active"><img style="width:100% ;height:14VW" src="assets/img/notice.png" alt="Slide One ;"></div>
        <div class="carousel-item"><img style="width:100% ;height:14VW" src="assets/img/care3.jpg" alt="Slide One ;"></div>
        <div class="carousel-item"><img style="width:100% ;height:14VW" src="assets/img/care2.jpg" alt="Slide One ;"></div>
        <div class="carousel-item"><img style="width:100% ;height:14VW" src="assets/img/care4.png" alt="Slide One ;"></div>
        <div class="carousel-item"><img style="width:100% ;height:14VW" src="assets/img/care5.png" alt="Slide One;"</div>

    </div>
    <!-- Carousel nav -->
      <a class="carousel-control-prev" href="#carousel" data-slide="prev">
          <span class="carousel-control-prev-icon"></span>
       
        </a>
    <a class="carousel-control-next" href="#carousel"  data-slide="next">
          <span class="carousel-control-next-icon" ></span>
   
        </a>
</div>
                </td>
                    <td <%--onclick="location.href='Vote.aspx'"--%>  onclick="alert('현재는 투표할 수 없습니다.')" style="cursor:pointer; width:20% ;height:14VW;background-image:url('/assets/img/vote.jpg'); background-size:contain; border:none" >
                </td>
                <td  style=" width:20% ;height:14VW; border:none; background-image:url('/assets/img/default1.jpg'); background-size:contain;" >
                </td>
            
                

             </tr>
        <tr >
            <td  style="cursor:pointer; background-image :url('/assets/img/default2.jpg'); background-size:contain;"> 
            </td>
            <td  <%--onclick="location.href='WorkList.aspx'"--%> onclick="alert('현재는 조회할 수 없습니다.')"  style="cursor:pointer; background-image:url('/assets/img/see.jpg'); background-size:contain;">
            </td>
            <td  <%--onclick="location.href='CriticList.aspx'"--%> onclick="alert('현재는 비평할 수 없습니다.')" style="cursor:pointer;background-image:url('/assets/img/critic.jpg'); background-size:contain;" >
            </td>
            <td style="background-image:url('/assets/img/default3.jpg'); background-size:contain;">
            </td>
            <td   onclick="location.href='Member.aspx'"  style="cursor:pointer;background-image:url('/assets/img/make.jpg'); background-size:contain;" >
            </td>   
                        </tr>
                        <tr >
                        <td  colspan="5" style="background-image:url('/assets/img/default4.jpg'); background-size:contain;"> </td>
                       
                        </tr>
                
       
                    
        </table>
    <table style="float:left; width:100%; height:3VW;">
        <tr>
            <td>

            </td>
        </tr>
    </table>


  



        </div>
        </body>
    </asp:Content>


