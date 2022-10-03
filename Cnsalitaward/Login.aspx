<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Cnsalitaward.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="/assets/css/Login.css" type="text/css"/>

    <title>큰별문학상</title>
</head>

<form id ="form1" runat="server" style="user-select:none;">
    
        <table border="1" class="tablebox">
            <tr>
          <td style="width:14.47VW; border:none; background-image:url('/assets/img/login.png'); background-size:14.58VW 16.66VW;">
            </td>
            <td style="border:none; ">
                <div class="logintxt" style="margin-left: 2.08VW; " >로그인</div>
                <hr style="border:solid 0.1VW #002897;background-color: #002897;width:3.69VW;margin-top:0.05VW;margin-bottom: 0.5vw ;margin-left:2.18VW;">
              <div style="margin-left:2.08VW">
                <div style="margin-bottom:1.04VW;">
                    <asp:TextBox ID="UserID" runat="server" BorderStyle="None" placeholder="ID" ></asp:TextBox>
                    <hr style="border:solid 0.05VW grey; width:17.18VW; margin-left:0px; " />
              </div>
                <div style="margin-bottom:0.78VW;">
                     <asp:TextBox ID="UserPW" runat="server" BorderStyle="None" TextMode="Password" placeholder="Password"></asp:TextBox>
                    <hr style="border:solid 0.05VW grey; width:17.18VW; margin-left:0px; " />
                </div>
                <div>
                    <asp:Button  Text="로그인" OnClick="Login_Click" runat="server" Class="loginbtn" style=" border-radius:0.52VW; background-color:white" />
                    <asp:Button  Text="회원가입" OnClick="Apply_Move" runat="server" Class="loginbtn" style=" border-radius:0.52VW; background-color:white; margin-left:30px" />

                </div>
                  </div>
                
            </td>
                
        </tr>
        </table>
    <div style="font-size:0.8vw; margin-top:-14.5vw; margin-left:50vw;">※ 본 사이트는 Chrome에 최적화되어 있습니다.</div>
    
</form>
</html>
