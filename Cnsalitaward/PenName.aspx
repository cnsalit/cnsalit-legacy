<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PenName.aspx.cs" Inherits="Cnsalitaward.PenName" %>


<title>삼성문학상</title>

<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
   <link rel="stylesheet" href="/assets/css/login.css" />
    <link rel="stylesheet" href="/assets/css/font.css" />
</head>
<body>
    <form id="form1" runat="server">
       
                <table border="solid 0.05VW" style="width:35.41VW; height: 16.66VW; margin:19.79VW;margin-left:32.29VW;border-radius:0.83VW; border-spacing: 0px 0px; ">

        <td style="width:14.47VW; border:none; background-image:url('/assets/img/login.jpg'); background-size:14.58VW 16.66VW;">
            </td>
            <td style="border:none; ">
                <div class="logintxt" style="margin-left: 2.08VW; " >필명 만들기</div>
                <hr style="  border:solid 0.1VW #002897;width:6.8VW; margin-top:0.05VW;;margin-bottom: 3.125VW; margin-left:2.187VW">
                <div style="margin-left:2.08VW;margin-top: -2.083333333333333VW;margin-bottom: 2.604166666666667VW;font-size:0.8vw">필명을 등록하면 삼성문학상에 응모할 수 있습니다!&#13;&#10;-5자 이내-&#13;&#10;(바꿀수 없으니 신중하게 생각해주세요.)</div>
              <div style="margin-left:2.08VW">
          
                <div style="margin-bottom:0.78VW;">
                     <asp:TextBox ID="Name" runat="server" BorderStyle="None" placeholder="PEN NAME"></asp:TextBox>
                    <hr style="border:solid 0.05VW grey; width:17.18VW; margin-left:0px; " />
                </div>
                <div>
                    <asp:Button  Text="등록" OnClick="Register_Click" runat="server" Class="loginbtn" style="width:3.64VW; border-radius:0.312VW; background-color:white" />

                </div>
                  </div>
            </td>
        
        </table>
        <div  class="blinking Noto" style="color:#385bbb;width:39.270833333333336VW;height:2.8125VW;border-style:none;margin:0px 31.25VW;margin-top: -19.53125VW; ">
           <div>타인을 비방하거나, 불쾌감을 줄 수 있는 필명의 경우 사안에 따라 학교폭력위원회 처벌이 가능합니다.</div>
            <div>필명 시스템은 익명성 보장을 통해 평가의 공정성을 높이려는 취지이므로, 실명 공개는 하지 말아주세요.</div>
        </div>
        <asp:TextBox runat="server" ID="stdnumber" placeholder="학번" style="margin-left:50%; margin-top:-11.5%"></asp:TextBox>

    </form>
</body>

