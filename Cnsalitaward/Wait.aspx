﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Wait.aspx.cs" Inherits="Cnsalitaward.Wait" %>

<!DOCTYPE html>
<link rel="stylesheet" href="/assets/css/font.css" />
<link rel="stylesheet" href="/assets/css/notice.css" />
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body style="background: url('/assets/img/background5.png'); background-size:cover; display:flex; justify-content:center; align-content:center; overflow:hidden; user-select:none; background-repeat:no-repeat ">
<form id="form1" runat="server">
        <div style=" height:49vw;">
            <div style="width:101vw; color:white; margin-top: 18vw; margin-left:1vw; text-align:center;color:white !important;margin-right:1vw;">
              
                <div style="font-size:4vw; margin-top:0vw;" class="NotoB">시험운영중입니다. 정식운영(10/25~)</div>
                <!--<div style="font-size:2vw;" class="NotoB">불편을 드려 죄송합니다.</div>-->
                <%--<div style="font-size:2vw;" class="NotoB">조금만 기다려주세요!</div>--%>
                <asp:Button ID="check" runat="server" Text="확인했어요!" CssClass="btn btn-1" style="height:4vw; width:15vw; padding:0; " OnClick="Move_Click" />
                
            </div>  
            </div>
</>
    </form></body>
    
