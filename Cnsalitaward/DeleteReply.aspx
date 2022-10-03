<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeleteReply.aspx.cs" Inherits="Cnsalitaward.DeleteReply" %>


<head runat="server">
    <link rel="stylesheet" href="/assets/css/font.css" />
    <link rel="stylesheet" href="/assets/css/work.css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>삼성문학상</title>
</head>
    <form id="form1" runat="server"  style="user-select:none;">
        <div style="text-align:center">
        <div class="Dokdo" style="font-size:9vw">
            댓글을 삭제하시겠습니까?
        </div>
        <span>
            <asp:Button ID="yesbtn" runat="server" style="font-size:5vw;line-height:inherit;" Cssclass="reply"  Text="예" OnClick="Yes_Click" />      
            <asp:Button ID="nobtn" runat="server"  style="font-size:5vw;line-height:inherit;" Cssclass="reply" Text="아니오" OnClick="No_Click" />      

        </span>
            </div>
    </form>
