<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Check.aspx.cs" Inherits="Cnsalitaward.Check" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <link rel="stylesheet" href="/assets/css/font.css" />
        <link rel="stylesheet" href="/assets/css/check.css" />
    <title>재학생 확인</title>
</head>
<form id="form1" runat="server" style="user-select:none;">
        <%
            Random rand = new Random();
            string[] lst = { "중앙에 위치한 동은?", "본교 도서관의 이름은?", "본교 체육관의 이름은?" };
            int randNum = rand.Next(lst.Length);
            Question.Text = lst[randNum];
            Session["Q"] = lst[randNum];
            
            %>
        <div style="display:flex;">
            <div class="hello Dokdo">재학생 확인</div>
            <div class="quiz" style="height:6.1vw;" id="quiz">
            <div style="align-items:flex-start; flex-direction: row; margin-top:1vw;">
				<asp:Label ID="Question" runat="server" Text="" CssClass="quest"></asp:Label>
				<asp:TextBox ID="Answer" runat="server" CssClass="quiz-input" placeholder="정답" ></asp:TextBox>
            </div>
				<asp:Button ID="checkBtn" runat="server" Text="확인" CssClass="quiz-btn" OnClick="Check_cnsa" />
            </div>
        </div>

</form>
</html>
