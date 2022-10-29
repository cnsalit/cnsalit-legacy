<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminApply.aspx.cs" Inherits="Cnsalitaward.AdminApply" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server" style="display:none;">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="/assets/css/make.css" />
    <link rel="stylesheet" href="/assets/css/font.css" />
    <title>큰별문학상</title>
</head>
<form id="form1" runat="server">
        <div style="display:flex; align-items:center;">
        <div class="hello Dokdo">회원가입</div>

        <div style="width:10vw; display:inline-block; margin-left:30.2vw;">
        <div class="tytle" style="margin-right:0; display:inline-block; font-size :1.4vw; margin-top:1vw;">관리자 인증 코드</div>
        </div>
        <asp:TextBox ID="verifyCode" placeholder="인증 코드를 입력해 주세요." style="margin-top:0.5vw;" runat="server" CssClass="input" TextMode="Password"></asp:TextBox>

        <div style="width:10vw; display:inline-block; margin-left:30.2vw; margin-top:2vw;">
        <div class="tytle" style="width:4vw; margin-right:0; display:inline-block; font-size :1.4vw; margin-top:0.5vw;">필명</div>
        <asp:Button ID="checkPenname" runat="server" Text="중복확인"  class="btn" style="margin-left:16vw; display:inline-block; background-color:#EFEFEF; color:black; line-height:2vw; font-size: 1vw; width:5vw; height:2vw; margin-bottom:0; margin-top:1vw;" OnClick="CheckPenname_Click"/>
        </div>
        <asp:TextBox ID="penName" placeholder="필명을 입력해주세요" style="margin-top:0.5vw;" runat="server" CssClass="input"></asp:TextBox>
        <asp:Label ID="onlyPN" runat="server" Text="" style="font-size:0.9vw; margin-bottom:1vw; margin-top:0.1vw; margin-left:-15.48vw;"></asp:Label>
        
        <div style="display:inline-block; margin-left:0.2vw;">
        <div class="tytle" style="display:inline-block; width:5vw; font-size:1.4vw; margin:0vw; margin-top:1vw;">ID</div>
        <asp:Button ID="checkID" runat="server" Text="중복확인" class="btn" style="background-color:#EFEFEF; color:black; line-height:2vw; font-size: 1vw; display:inline-block; width:5vw; height:2vw; margin-left: 15vw; margin-bottom:0; margin-top:1vw;" OnClick="CheckID_Click" />
        </div>
        <asp:TextBox ID="userId" placeholder="아이디를 입력해주세요" runat="server" style="margin-top:0.5vw;" CssClass="input"></asp:TextBox>
        <asp:Label ID="onlyID" runat="server" Text="" style="margin-bottom:0.9vw; margin-top:0.1vw; margin-left:-12vw;"></asp:Label>

        
        <div class="tytle" style="margin-left:-20.5vw; margin-top:0vw;">비밀번호</div>
        <asp:TextBox ID="userPw" placeholder="비밀번호를 입력해주세요" runat="server" CssClass="input" TextMode="Password"></asp:TextBox>

        
        <div class="tytle" style="margin-left:-16.7vw; margin-top:1vw;">비밀번호 재확인</div>
        <asp:TextBox ID="userPw2" placeholder="비밀번호를 입력해주세요" runat="server" CssClass="input" TextMode="Password"></asp:TextBox>
        <asp:Label ID="pwcheck" runat="server" Text="" style="margin-top:0.1vw; margin-left:-16vw;"></asp:Label>

		<asp:Button ID="applybtn" runat="server" Text="확  인"  CssClass="btn" style="display:flex; justify-content:center; margin-top:2vw;" OnClick="Apply_Click"/>
         
        </div>
</form>
</html>


<%--<div style="height:7vw; display:inline-block">
        <div class="tytle" style="display:inline-block; width:5vw; font-size:1.4vw; margin:0vw; margin-top:1vw;">이름</div>
        <asp:Button ID="Button1" runat="server" Text="중복확인"  class="btn" style="line-height:2vw; font-size: 1vw; display:inline-block; width:5vw; height:2vw; margin-left: 15vw; margin-bottom:0; margin-top:1vw;"/>
		<asp:TextBox ID="TextBox2" placeholder="이름을 입력해주세요" runat="server" style="margin-top:1vw;" CssClass="input"></asp:TextBox>
        </div>--%>
