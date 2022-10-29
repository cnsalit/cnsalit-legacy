<%@ Page Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="WorkEdit.aspx.cs" Inherits="Cnsalitaward.WorkEdit" %>
 

<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contents" runat="server">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="/assets/css/apply.css" />
    <link rel="stylesheet" href="/assets/css/font.css" />
     <link rel="stylesheet" href="/assets/css/default.css" />
</head>
    <body style="user-select:none;">
                <div class="now" style="margin-left:51.45vw !important;"></div>

           <div style="width:100%; height:14VW; margin-top:3VW; background-image:url(/assets/img/banner.jpg); background-size:100VW 14VW;"></div>
        <div class ="apply">작품 응모</div>

<!--- 밑줄 --->
<div class = "bar"></div>


<!--- 응모 내용 --->
<div class = "write">
  <div class = "check"> 
    <div class = "checktype NotoM" style = "float:left;">응모 부문 | <span id="showingKind" runat="server"></span></div>
  </div>
  
  <!--- 중간 선 --->
  <div class = "line"></div>
  
  <!--- 작품 제목 --->
    <div class = "title NotoM" style = "float:left;">작품 제목</div>
    <div class = "subtitle NotoL" style = "float:left;">(운문의 경우, 다 적을 것)</div>
    <div class = "verticalline" style = "float:left; margin-top:1.718VW;"></div>
    <asp:TextBox ID="Titletxt" runat="server" style="width:69VW; height:5vw;" CSSclass = "texttitle"></asp:TextBox>
    <div class="Noto" style="font-size:1.25VW;color:#EF6666;width:69VW;height:5VW;border-style:none;margin-left: 0.781VW;"></div>
     
    
     <div class="Noto" style="font-weight:bold; margin-top:-3vw; margin-left: 0.781VW;"> ※ 운문을 여러 편 출품하는 경우</div> 
<div class="Noto" style="margin-left: 0.781VW;">1. 출품하는 모든 작품을<span  class="Noto" style="font-weight:bold; margin-left: 0.781VW;"> 이 게시물에 모두 작성</span> 바랍니다.</div>
<div class="Noto" style="margin-left: 0.781VW;">2. 제목의 경우 '제목1 / 제목2 / 제목3' 과 같이 한 줄에 <span  class="Noto" style="font-weight:bold">슬래시를 이용</span>하여 입력바랍니다.</div>
<div class="Noto" style="margin-left: 0.781VW;">3. 본문의 경우<span  class="Noto" style="font-weight:bold">'==================' 표시</span>를 이용해 <span  class="Noto" style="font-weight:bold">작품 간 구분</span>을 해주시기 바랍니다.<div>

<div  class="Noto" style="font-weight:bold;margin-top   :1.0416666666666665VW">※ 운문과 산문을 동시에 출품하는 경우</div>
<span class="Noto">- 별도의 게시물로</span> <span  class="Noto" style="font-weight:bold">운문과 산문을 따로 </span><span>출품해주시기 바랍니다. </span>
 </div>

 
  <!--- 요약 --->
  <div class = "summary NotoM"style = "float:left; margin-left:1vw;">요약  </div>
  <div class = "verticalline" style = "float:left;  margin-left:0.859VW; margin-top:1.69VW;"></div>
  <asp:TextBox ID="Brieftxt" runat="server" TextMode="MultiLine" style="margin-left:0vw;" Placeholder=" 자신의 작품 내용과 작품을 창작하며 느낀 점을 3~5줄로 요약하여 명사형 종결의 형태로 작성할 것. &#13;&#10;(생활기록부 세부능력특기사항에 기록되는 내용임.)&#13;&#10;(예시) 온라인 문학 전시관에서 ‘은채의 하루’라는 작품을 발표함. 아름답고 순수한 영혼을 지닌 주인공이 억압적인 입시 현실 속에서 자신 의 삶의 가치를 찾아가는 과정을 내밀하게 묘사함. 특히, 의식의 흐름 기법을 통해 현실과 이상의 괴리 속에서 상처 받는 과정에 대한 문학적 형상화가 인상적임." CSSclass = "textsummary"/>

  
  
  <!--- 본문 --->
  <div class = "maintext NotoM" style = "float:left;">본문</div>
  <div class = "verticalline" style = "float:left; margin-left:0.859VW; margin-top:1.69VW;"></div>
        <asp:TextBox ID="Contenttxt" runat="server" contenteditable="true" Textmode="MultiLine" Placeholder="운문 2편이상 3편 이하 / 산문 4장 이상 12장 이하 (글씨크기 11, 줄간격 160 기준)" CSSclass = "writemaintext"  style="margin-left:0vw;"></asp:TextBox>
  
  
  
  <!--- 첨부파일 --->
    <div>
  <div class = "attachments NotoM" style = "float:left;">첨부파일</div>
  <div class = "verticalline" style = "float:left; margin-left:0.859VW; margin-top:1.69VW;">
  </div>
        <div style="width:60vw; position:absolute; left:24.3vw; top:117.3vw; font-size:1vw; color:red;">※ 텍스트만으로 표현이 안되어 첨부파일로 제출이 필요한 경우, [likedis7@cnsa.hs.kr]로 제출해주세요</div>
        <%--<asp:Button ID="Download" OnClick="Download_Click" runat="server" style="margin-top:4.79VW; visibility : hidden; margin-left:-6.81VW;" Text="양식 다운로드" />--%> 
        <%--<asp:FileUpload ID="File" runat="server" style="margin-top:4.79VW;margin-left:-6.81VW;" />--%>
  
     <%--<asp:Button ID="Download" OnClick="Download_Click" runat="server" style="margin-top:4.79VW;margin-left:-6.81VW;" Text="양식 다운로드" />--%> 
        <asp:FileUpload ID="File" runat="server" style="margin-top:4.79VW;margin-left:-6.81VW; visibility : hidden;" />
            <div style="color:red;margin-left: 1.3vw;margin-top: 1vw;font-size: 1.5vw;" class="NotoB"> 주어진 양식, 분량, 조건에 맞지 않을 시 수상대상에서 제외될 수 있습니다.</div>

        </div>
  <!---- 등록 --->
   <asp:Button ID="Savebtn"  OnClick="Save_Click" onclientclick="return Save();" runat="server" CSsclass ="save Noto" Text="저장"></asp:Button>
  <asp:Button ID="Uploadbtn" OnClick="Upload_Click" style="border-radius:30vw;" runat="server" Cssclass = "submit Noto" Text="등록"></asp:Button>
    <script type="text/javascript">
                    function Save() {
            if (confirm("파일을 추가하지 않으면 기존 파일이 등록됩니다. 저장하시겠습니까?(부문을 변경한 경우 파일을 다시 등록해주세요.)")) {
                return true;
            }
            return false;
        }

        //
        //function uploadFinish(root,value,num) {
        //    window.open(root, value, num);
        //}

        document.execCommand('Italic')           // 기울이기
        document.execCommand('Underline')        // 밑줄
        document.execCommand('StrikeThrough')    // 중간줄
        document.execCommand('Cut')              // 자르기
        document.execCommand('Copy')             // 복사하기
        document.execCommand('Paste')            // 붙혀넣기
        document.execCommand('Undo')             // 실행취소
        document.execCommand('Redo')             // 다시실행
        document.execCommand('insertorderedList')    // 글번호 매기기
        document.execCommand('insertunorderdList')   // 글머리 매기기
        document.execCommand('outdent')          // 내어쓰기
        document.execCommand('indent')           // 들여쓰기
        document.execCommand('justifyleft')      // 왼쪽정렬
        document.execCommand('justifycenter')    // 가운데정렬
        document.execCommand('justifyright')     // 오른쪽정렬
        $(document).ready(function () {
            $('.writemaintext').hide();
        });
 </script> 
  </div>
      </body>
    </asp:Content>


