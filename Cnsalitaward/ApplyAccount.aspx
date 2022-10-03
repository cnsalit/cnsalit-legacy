<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ApplyAccount.aspx.cs" Inherits="Cnsalitaward.ApplyAccount" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server" style="display:none;">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="/assets/css/make.css" />
    <link rel="stylesheet" href="/assets/css/font.css" />
    <title>큰별문학상</title>
</head>
<script>

</script>
<form id="form1" runat="server" >
    <div style="display: flex; flex-direction: column; align-items: center;">
        <div class="hello Dokdo">회원가입</div>
        <div class="tytle" style="font-size:1.4vw; margin-left:-23.0vw;">이름</div>
		<asp:TextBox ID="realName" placeholder="이름을 입력해주세요" runat="server" CssClass="input"></asp:TextBox>
 
            
            <div style="width:10vw; display:inline-block; margin-left:30.2vw;">
            <div class="tytle" style="width:4vw; margin-right:0; display:inline-block; font-size :1.4vw; margin-top:1vw;">학번</div>
            <asp:Button ID="checkNumber" runat="server" Text="중복확인"  class="btn" style="margin-left:16vw; display:inline-block; background-color:#EFEFEF; color:black; line-height:2vw; font-size: 1vw; width:5vw; height:2vw; margin-bottom:0; margin-top:1vw;" OnClick="CheckNumber_Click"/>
            </div>
            <asp:TextBox ID="realNum" placeholder="고유학번(6자리)를 입력해주세요" runat="server" style="margin-top:0.5vw;" CssClass="input" MaxLength="6"></asp:TextBox>
            <div style="margin-top: 0.2vw; margin-left:-4vw; font-size:0.8vw; float:left; color:red;"> ※ 본인의 학번을 기입하지 않은 경우 수상에서 제외됩니다.</div>
            <asp:Label ID="onlyNumber" runat="server" Text="" style="font-size:0.8vw; margin-bottom:1vw; margin-top:0.1vw; margin-left:-15.48vw;"></asp:Label>
        
            <div style="width:10vw; display:inline-block; margin-left:30.2vw;">
            <div class="tytle" style="width:4vw; margin-right:0; display:inline-block; font-size :1.4vw; margin-top:0.5vw;">필명</div>
            <asp:Button ID="checkPenname" runat="server" Text="중복확인"  class="btn" style="margin-left:16vw; display:inline-block; background-color:#EFEFEF; color:black; line-height:2vw; font-size: 1vw; width:5vw; height:2vw; margin-bottom:0; margin-top:1vw;" OnClick="CheckPenname_Click"/>
            </div>
            <asp:TextBox ID="penName" placeholder="필명을 입력해주세요" style="margin-top:0.5vw;" runat="server" CssClass="input"></asp:TextBox>
            <div style="margin-top: 0.2vw; margin-left:-2.5vw; font-size:0.8vw; float:left; color:red;"> ※ 온라인 전시관에서는 실명이 아닌 필명으로 활동하게 됩니다.</div>
            <div style="margin-top: 0.2vw; margin-left:-4.4vw; font-size:0.8vw; float:left; color:red;">  ※ 혐오감을 불러일으키거나, 타인을 비방하는 필명의 경우</div>
            <div style="margin-top: 0.2vw; margin-left:-3.5vw; font-size:0.8vw; float:left; color:red;">  선도위원회, 학교폭력대책위원회에 회부될 수 있습니다.</div>
            <asp:Label ID="onlyPN" runat="server" Text="" style="font-size:0.8vw; margin-bottom:1vw; margin-top:0.1vw; margin-left:-15.48vw;"></asp:Label>
        
                
            <div style="width:10vw; display:inline-block; margin-left:30.2vw;">
            <div class="tytle" style="width:6vw; margin-right:0; display:inline-block; font-size :1.3vw; margin-top:1vw;">아이디</div>
            <asp:Button ID="checkID" runat="server" Text="중복확인"  class="btn" style="margin-left:14vw; display:inline-block; background-color:#EFEFEF; color:black; line-height:2vw; font-size: 1vw; width:5vw; height:2vw; margin-bottom:0; margin-top:1vw;" OnClick="CheckID_Click"/>
		    </div>
            <asp:TextBox ID="userId" placeholder="아이디를 입력해주세요" runat="server" style="margin-top:0.5vw;" CssClass="input"></asp:TextBox>
            <asp:Label ID="onlyID" runat="server" Text="" style="align-self:flex-start; margin-left:36.3vw; font-size:0.9vw; margin-top:0.1vw; "></asp:Label>
       
            <div class="tytle" style="margin-left:-21vw; margin-top:0.5vw;">비밀번호</div>
            <asp:TextBox ID="userPw" placeholder="비밀번호를 입력해주세요" runat="server" CssClass="input" TextMode="Password"></asp:TextBox>
            <div class="tytle" style="margin-left:-17vw; margin-top:0.5vw;">비밀번호 재확인</div>
            <asp:TextBox ID="userPw2" placeholder="비밀번호를 입력해주세요" runat="server" CssClass="input" TextMode="Password"></asp:TextBox>
            <asp:Label ID="pwcheck" runat="server" Text="" style="margin-top:0.1vw; margin-left:-16vw;"></asp:Label>
      
        
		<asp:Button ID="applybtn" runat="server" Text="확  인"  CssClass="btn" style="font-size:1vw; margin-top:3vw; display:flex; justify-content:center; align-content:center" OnClick="Apply_Click"/>
        </div>
</form>
</html>


<%--<div style="height:7vw; display:inline-block">
        <div class="tytle" style="display:inline-block; width:5vw; font-size:1.4vw; margin:0vw; margin-top:1vw;">이름</div>
        <asp:Button ID="Button1" runat="server" Text="중복확인"  class="btn" style="line-height:2vw; font-size: 1vw; display:inline-block; width:5vw; height:2vw; margin-left: 15vw; margin-bottom:0; margin-top:1vw;"/>
		<asp:TextBox ID="TextBox2" placeholder="이름을 입력해주세요" runat="server" style="margin-top:1vw;" CssClass="input"></asp:TextBox>
        </div>--%>
