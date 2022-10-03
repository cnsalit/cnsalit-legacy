<%@ Page Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Introduce.aspx.cs" Inherits="Cnsalitaward.Introduce" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server" ></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contents" runat="server">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="stylesheet" href="/assets/css/Introduce.css" />
    <link rel="stylesheet" href="/assets/css/detail.css" />
<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.0.min.js" ></script>
</head>
    <body style="user-select:none;">
        <style type="text/css">
.ex_show{cursor:pointer}
.ex_hide{cursor:pointer}
            </style>
 <script type="text/javascript">
            $(function () {

  var ex_show = $('.ex_show');
  var ex_hide = $('.ex_hide');
    var ex_box = $('.ex_box');
    var date = $('.date');
    var submit = $('.submit');
    var winner = $('.winner');
    var notice = $('.notice');
                var blank = $('.blank');
    date.hide();
    submit.hide();
    winner.hide();
     notice.hide();
      ex_hide.hide();
  ex_show.click(function(){
      date.slideDown();
      submit.slideDown();
      winner.slideDown();
      notice.slideDown();
      ex_box.slideDown();
      ex_show.hide();
      ex_hide.show();
      blank.show();
      
   

     
   

  });
    ex_hide.click(function () {
        date.slideUp();
      submit.slideUp();
      winner.slideUp();
        notice.slideUp();
        ex_box.slideUp();
        ex_hide.hide();
        ex_show.show();
        blank.hide();
  });
});
</script>
                <div style="margin-left:35.6vw;" class="now"></div>

         <div style="width:100%; height:14VW; margin-top:3VW; background-image:url(/assets/img/banner.jpg); background-size:100VW 14VW;"></div>
               

<!--- 삼성 문학상 --->
<div class = "title">큰별 문학상</div>
<div class = "underline"></div>

<!--- 클립 --->
<div class = "top"></div>
<div class = "hole"></div>
<div class = "bottom"></div>


<!--- 본문 --->

<div class = "body">
  
<div class = "maintext1">큰별문학상은 2017년부터 개최된 충남삼성고등학교 국어과에서 주최하는 문예 창작 대회입니다. CNSAIAN들의 문학에 대한 사랑과 관심을 증대시키는 한편, 창작활동을 통해 자신이 하고 싶은 이 야기를 문학적으로 풀어낼 수 있는 장으로 만들려는 목적을 가지고 있습니다.</div>
  
<div class = "maintext2">큰별문학상은 운문부와 산문부로 나누어 작품을 받아 심사하고 있으며, 각 작품은 오랜 기간의 심 사를 통해 공정하게 평가받습니다. 또한 대상 수상작의 경우에는 해당 년도에 모시는 특별 심사위 원의 심사점수를 포함하여 심사하고 있는 만큼, 매우 권위있고 특별한 상이며 대회입니다.</div>
  
<div class = "maintext3" style="font-weight:800">큰별문학상에서는 해마다 놀라운 작품들과 원석같은 학생 작가들을 발굴하고 있습니다. 문학을 통해 자신의 이야기를 들려줄 학생들의 도전을 기다립니다.</div>
  
  <div class = "maintext4">충남삼성고등학교 국어과</div>
</div>
<div class="ex_show">
<!--- 추가 정보 --->
<div class = "moreinfo Dokdo" style="font-size: 2VW;width:17VW">대회 정보가 궁금하다면 클릭!</div>
<div class = "blueline"></div>
<div class = "arrow"></div>
<div class = "arrowwhite"></div>
<div class = "arrowhide"></div>
    </div>
        <div id="blank" class="blank"></div>
    <!--- 추가 정보 --->

<div  class = "date" style="height:10.479166666666666VW;">	
  <div  class = "lined">
    <div  class = "bluelined" style = "float:left"></div>
    <div  class = "grayline" style = "float:left"></div></div>
  <div  class = "text" style = "float:left;">대회 일정</div>
  <div  class = "details1" style = "float:left;">
    <div class = "detail1">
      <div  class = "detail" style = "float:left;">응모기간</div>
      <div  class = "realdetail" style = "float:left;">10.18 (월) ~ 10.25 (월)</div></div>
    <div class = "detail1" style = "margin-top:0.20833333333333334VW;">
      <div class = "detail" style = "float:left;">심사기간</div>
      <div  class = "realdetail" style = "float:left;">10.26 (화) ~ 11.5 (금)</div></div>
    <div id= class = "detail1" style = "margin-top:0.20833333333333334VW;">
      <div  class = "detail" style = "float:left;">문학제</div>
      <div  class = "realdetail" style = "float:left;">11.10(수)</div></div>
    <div class = "detail1" style = "margin-top:0.20833333333333334VW; width:40vw; display:inline-block">
      <div class = "detail" style = "float:left; margin-left:0vw;">결과발표</div>
      <div  class = "realdetail" style = "float:left;">11.10 (수)</div></div>
    <div  class = "detail1" style = "margin-top:0.20833333333333334VW;">
      <div class = "detail" style = "float:left;">작품집 배부</div>
      <div class = "realdetail" style = "float:left;">12.6 (월) ~ 12.17 (금)</div></div>
</div>
</div>
  
  
  
<!--- 응모 안내 --->
<div class = "submit">
  <div class = "lined">
    <div class = "bluelined" style = "float:left"></div>
    <div class = "grayline" style = "float:left"></div></div>
  <div class = "text" style = "float:left;">응모 안내</div>
    <div class = "detail2" style = "height:5.9375VW;">
      <div class = "detail" style = "float:left;">첫째, 응모 부문</div>
      <div class = "realdetail" style = "float:left;">
        운문(현대시, 고전시가 등) <br> 
        산문(소설, 수필, 희곡, 독후감, 평론 등)<br> 
        ※ 소설과 시뿐만 아니라 다른 갈래도 많은 응모 바랍니다.
      </div></div>
  
  <div class = "detail2" style = "margin-top:0.4166666666666667VW; height:3.958333333333333VW;">
      <div class = "detail" style = "float:left;">둘째, 분량</div>
      <div class = "realdetail" style = "float:left;">
        운문 : 2편 이상 3편 이하 <br> 
        산문 : 4장 이상 12장 이하</div></div>
  
  <div class = "detail2" style = "height:5.9375VW; margin-top:0.4166666666666667VW;">
      <div class = "detail" style = "float:left;">셋째, 응모 방법</div>
      <div class = "realdetail" style = "float:left;">
        - 온라인 전시관 회원 가입 이후 [작품 응모]하기 <br>
        ※ 상세 내용 추후 안내</div></div>
</div>



<!--- 시상 계획 --->
<div class = "winner">
  <div class = "lined">
    <div class = "bluelined" style = "float:left"></div>
    <div class = "grayline" style = "float:left"></div></div>
  <p class = "text" style = "float:left;">시상 계획</p> 
  <div class = "detail3"></div>
  <div class = "detail3_1" style = "margin-top:2.5VW;"></div>
  <div class = "detail3_1" style = "margin-top:4.583333333333333VW;"></div>
  <div class = "detail3_1" style = "margin-top:6.666666666666667VW;"></div>
  <div class = "detail3_1" style = "margin-top:8.75VW;"></div>
  <div class = "outline" style = "margin-top:0.4427083333333333VW; margin-left:8.59375VW;"></div>
  <div class = "outline" style = "margin-top:2.473958333333333VW; margin-left:8.59375VW;"></div>
  <div class = "outline" style = "margin-top:4.557291666666666VW; margin-left:8.59375VW;"></div>
  <div class = "outline" style = "margin-top:6.640625VW; margin-left:8.59375VW;"></div>
  <div class = "outline" style = "margin-top:8.723958333333332VW; margin-left:8.59375VW;"></div>
  <div class = "outline" style = "margin-top:10.807291666666668VW; margin-left:8.59375VW;"></div>
  <div class = "middleline" style = "margin-top:0.4427083333333333VW; margin-left:16.901041666666668VW;"></div>
  <p class = "detailtext" style = "margin-left:11.614583333333334VW; margin-top:0.5208333333333333VW;">종별</p>
  <p class = "detailtext" style = "margin-left:19.375VW; margin-top:0.5208333333333333VW;">인원수</p>
  <p class = "detailtext" style = "margin-left:11.614583333333334VW; margin-top:2.604166666666667VW;">대상</p>
  <p class = "detailtext" style = "margin-left:20.15625VW; margin-top:2.604166666666667VW;">1명</p>
  <p class = "detailtext" style = "margin-left:10.46875VW; margin-top:4.6875VW;">최우수상</p>
  <p class = "detailtext" style = "margin-left:20.15625VW; margin-top:4.6875VW;">2명</p>
  <p class = "detailtext" style = "margin-left:11.041666666666666VW; margin-top:6.770833333333333VW;">우수상</p>
  <p class = "detailtext" style = "margin-left:18.55625VW; margin-top:6.770833333333333VW;">추후 공지</p>
  <p class = "detailtext" style = "margin-left:11.041666666666666VW; margin-top:8.854166666666668VW;">장려상</p>
  <p class = "detailtext" style = "margin-left:18.5vw; margin-top:8.854166666666668VW;">추후 공지</p>
    <div class="realdetail" style="margin-left:28vw">
        <br>
        ※ 우수상과 장려상은 수상자 비율(20%) 및 작품 수준 고려 후 인원 수 결정<br>
        ※ 수상 인원은 참가 인원 수에 비례하여 조정될 수 있습니다.
    </div>
</div>

<!--- 유의사항 --->
<div class = "notice">
  <div class = "lined">
    <div class = "bluelined" style = "float:left"></div>
    <div class = "grayline" style = "float:left"></div></div>
  <p class = "text" style = "float:left;">유의사항</p>
  <div class = "detail4">
      <p class = "detail" style = "float:left;">첫째,</p>
      <p class = "realdetail" style = "float:left;">
        다른 대회에 응모한 작품 원본 그대로를 제출하는 것은 불가능합니다. <br>
        (제출 기준에 맞게 변형, 확장한 경우에는 응모할 수 있습니다.)</p>
    
    <p class = "detail" style = "float:left; margin-top:0.4166666666666667VW;">둘째,</p>
      <p class = "realdetail" style = "float:left; margin-top:0.4166666666666667VW;">
        국어 교과를 포함한 수행평가 및 과제 완성물의 경우, 제출 기준을 충족<br>
        시켜 응모할 수 있습니다.</p>
    
    <p class = "detail" style = "float:left; margin-top:0.4166666666666667VW;">셋째,</p>
      <p class = "realdetail" style = "float:left; margin-top:0.4166666666666667VW;">
        운문과 산문 부문에 중복 응모는 가능하지만, 수상은 한 개 부문만 가능 <br>
        합니다.</p>
    
    <p class = "detail" style = "float:left; margin-top:0.4166666666666667VW;">넷째,</p>
      <p class = "realdetail" style = "float:left; margin-top:0.4166666666666667VW;">
        타인의 작품을 표절하거나 도용한 경우, 그 사안의 경중에 따라 관찰 쪽<br>
        지 발급 및 학생선도위원회에 회부하고, 각종 교내대회 수상과 관련하<br>
        여 참고 자료로 활용합니다.</p>
  </div>
</div>

<div class="ex_hide" style="margin-top:1vw">
<!--- 접기 --->
<div class = "bottombluelined"></div>
<div class = "arrowd"></div>
<div class = "arrowwhited"></div>
<div class = "arrowhided"></div>
    </div>
    </body>

</asp:Content>              
