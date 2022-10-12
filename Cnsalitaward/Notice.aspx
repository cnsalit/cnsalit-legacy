<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Notice.aspx.cs" Inherits="Cnsalitaward.Notice" %>

<!DOCTYPE html>
<link rel="stylesheet" href="/assets/css/font.css" />
<link rel="stylesheet" href="/assets/css/notice.css" />
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body style="background: url('/assets/img/background.png'); background-size:cover; display:flex; justify-content:center; align-content:center; overflow:hidden; user-select:none;">
    
<form id="form1" runat="server">
    <%  

        Random rand = new Random();
        int randNum = rand.Next(1,94);
        int randNum2 = rand.Next(1,39);
        Session["ID1"] = randNum;
        Session["ID2"] = randNum2;
        string TitleV = Cnsalitaward.Managers.CriticManager.randomTitleV((int)Session["ID1"]);
        string TitleP = Cnsalitaward.Managers.CriticManager.randomTitleP((int)Session["ID2"]);
        titlev.Text = "'" + TitleV + "'";
        titlep.Text = "'" + TitleP + "'";

        int id1 = (int)Session["ID1"];
        int id2 = (int)Session["ID2"];


                %>
       <div style=" height:49vw;">
            <div style="width:101vw; color:white; margin-top: 3vw; margin-left:1vw; text-align:center;color:white !important;margin-right:1vw;">
                <div style="font-size:6vw; margin-bottom:1vw;" class="Dokdo">당신을 위한 추천작</div>

                <div style="font-size:2vw; color:midnightblue; cursor:pointer" class="NotoB">운문      <span style="font-size:1vw; color:midnightblue; cursor:pointer" class="NotoB" onclick="location.href='/Work1?Id='+<%=id1%>+'&kind=verse'" >[지금 보러가기]</span>
				</div>
				<asp:Label ID="titlev" runat="server" Text="" CssClass="NotoB" style="margin-top: -1vw; margin-bottom:1vw; font-size:2.5vw;"></asp:Label>
				<div style="font-size:2vw; color:midnightblue; cursor:pointer" class="NotoB">산문      <span style="font-size:1vw; color:midnightblue; cursor:pointer" class="NotoB" onclick="location.href='/Work2?Id='+<%=id2%>+'&kind=prose'" >[지금 보러가기]</span></div>
                <asp:Label ID="titlep" runat="server" Text="" CssClass="NotoB" style="font-size:2.5vw; margin-top:3vw"></asp:Label>
                <%--1차 오픈 이후에 쓰이는 알림 공지--%>
                <div style="color:white; margin-left:10vw; margin-right:10vw; margin-top:2vw; font-size:1.5vw" class="Noto">친구들이 올린 작품을 읽고 비평문을 써주세요!</div>
                <div style="color:white; margin-left:10vw; margin-right:10vw; margin-top:0vw; font-size:1.5vw" class="Noto">비평문을 열심히 작성하고 활발하게 활동하여 <span class="NotoB" style="font-weight:bold; color:darkblue">최고의 독자</span>가 되어보세요!</div>
                <div style="margin-top: 2vw; font-size:1.5vw; color:white;" class="Noto">많은 참여 바랄게요!</div>
                <div style="font-size:1.5vw; color:white;" class="Noto">※ 최고의 독자는 2명, 최고의 작품은 3작품 선정합니다. 추천도서 1권 부상이 있습니다.</div>
                <asp:Button ID="check" runat="server" Text="확인했어요!" CssClass="btn btn-1" style="height:4vw; width:15vw; padding:0; " OnClick="Move_Click" />
            </div>  
            </div>
</>
    </form></body>
    
