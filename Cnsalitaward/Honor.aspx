<%@ Page Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Honor.aspx.cs" Inherits="Cnsalitaward.Honor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contents" runat="server">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="/assets/css/honor.css" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script>
        $(document).ready(function () {

            $("[id^=w],[id^=t],[id^=e],[id^=k]").hide();

            $("#btn1").click(function () {
                $("[id^=p]").toggle();
                $("[id^=w],[id^=t],[id^=e],[id^=k]").hide();
                $("#btn1").removeClass();
                $("#btn1").addClass("choice1");
                $("#btn2,#btn3,#btn4,#btn5").removeClass();
                $("#btn2,#btn3,#btn4,#btn5").addClass("nochoice");
            });

            $("#btn2").click(function () {
                $("[id^=w]").toggle();
                $("[id^=p],[id^=t],[id^=e],[id^=k]").hide();
                $("#btn2").removeClass();
                $("#btn2").addClass("choice1");
                $("#btn1,#btn3,#btn4,#btn5").removeClass();
                $("#btn1,#btn3,#btn4,#btn5").addClass("nochoice");

            });

            $("#btn3").click(function () {
                $("[id^=t]").toggle();
                $("[id^=p],[id^=w],[id^=e],[id^=k]").hide();
                $("#btn3").removeClass();
                $("#btn3").addClass("choice1");
                $("#btn1,#btn2,#btn4,#btn5").removeClass();
                $("#btn1,#btn2,#btn4,#btn5").addClass("nochoice");

            });

            $("#btn4").click(function () {
                $("[id^=e]").toggle();
                $("[id^=p],[id^=w],[id^=t],[id^=k]").hide();
                $("#btn4").removeClass();
                $("#btn4").addClass("choice1");
                $("#btn1,#btn2,#btn3,#btn5").removeClass();
                $("#btn1,#btn2,#btn3,#btn5").addClass("nochoice");
            });
            $("#btn5").click(function () {
                $("[id^=k]").toggle();
                $("[id^=p],[id^=w],[id^=t],[id^=e]").hide();
                $("#btn5").removeClass();
                $("#btn5").addClass("choice1");
                $("#btn1,#btn2,#btn3,#btn4").removeClass();
                $("#btn1,#btn2,#btn3,#btn4").addClass("nochoice");
            });

        });
    </script>
</head>
    <body style="user-select:none;">
        <div style="margin-left:44.5vw;" class="now"></div>
      <div style="width:100%; height:14VW; margin-top:3VW; background-image:url(/assets/img/banner.jpg); background-size:100VW 14VW;"></div>
<!--- 1,2회 선택 --->
<div id="btn1" class = "choice" style ="float:left; margin-left:14.6875VW; cursor:pointer">제 1회 큰별문학상 수상작</div>
<div id="btn2" class = "nochoice" style ="float:left; margin-left:-0.05VW;  cursor:pointer">제 2회 큰별문학상 수상작</div>
<div id="btn3" class = "nochoice" style ="float:left; margin-top:-0vw; border-top-color:none; width: 35.24VW;  cursor:pointer">제 3회 큰별문학상 수상작</div>
<div id="btn4" class = "nochoice" style ="float:left; margin-top: -0.01vw; margin-left: 0.001vw; cursor:pointer">제 4회 큰별문학상 수상작</div>
<div id="btn5" class = "nochoice" style ="float:left; margin-top:+0.01vw; border-top-color:none; width: 35.24VW;  cursor:pointer">제 5회 큰별문학상 수상작</div>

      
<!--- 제목 --->
<div id="p1" class = "title" style="cursor:pointer; margin-top:15vw;">제 1회 큰별문학상 수상작</div>
<div id="w1" class = "title" style="cursor:pointer; margin-top:15vw;">제 2회 큰별문학상 수상작</div>
<div id="t1" class = "title" style="cursor:pointer; margin-top:15vw;">제 3회 큰별문학상 수상작</div>
<div id="e1" class = "title" style="cursor:pointer; margin-top:15vw;">제 4회 큰별문학상 수상작</div>
<div id="k1" class = "title" style="cursor:pointer; margin-top:15vw;">제 5회 큰별문학상 수상작</div>
<div class = "underline"></div>


<!--- 본문 ---->
<div class = "body">
  <div class = "firstprize">대상</div>
  <div class = "line"></div>
    <div id="p2" class = "firstprizetitle" style="float:left;">파도는 항상 빈 배를 싣고 온다</div>
    <div id="w2" class = "firstprizetitle" style="float:left;">그럼에도 불구하고</div>
    <div id="t2" class = "firstprizetitle" style="float:left;">룸메이트</div>
    <div id="e2" class = "firstprizetitle" style="float:left;">도마의 투쟁</div>
    <div id="k2" class = "firstprizetitle" style="float:left;">호박잎쌈</div>

  <div class = "verticalline" style="float:left;"></div>
   <div id="p3" class = "firstprizewriter" style = "float:left">3기 곽구연</div>
  <div id="w3" class = "firstprizewriter" style = "float:left">5기 배진영</div>
    <div id="t3" class = "firstprizewriter" style = "float:left">4기 강시현</div>
    <div id="e3" class = "firstprizewriter" style = "float:left">7기 임재우</div>
    <div id="k3" class = "firstprizewriter" style = "float:left">7기 윤서연</div>
  
  
  <div class = "secondprize">최우수상</div>
  <div class = "line"></div>
    <div id="p4" class = "secondprizetitle" style="float:left;">악어</div>
  <div id="w4" class = "secondprizetitle" style="float:left;">이지러지다</div>
     <div id="t4" class = "secondprizetitle" style="float:left;">어느 자살한 로봇의 고해</div>
    <div id="e4" class = "secondprizetitle" style="float:left;">바다를 밝힐 수 있었던 것은</div>
    <div id="k4" class = "secondprizetitle" style="float:left;">시향의 비 외 2편</div>
    

  <div class = "verticalline" style="float:left;"></div>
    <div id="p5" class = "secondprizewriter" style = "float:left">3기 박한비</div>
  <div id="w5" class = "secondprizewriter" style = "float:left">4기 하지윤</div>
    <div id="t5" class = "secondprizewriter" style = "float:left">6기 정현욱</div>
    <div id="e5" class = "secondprizewriter" style = "float:left">5기 김가을</div>
    <div id="k5" class = "secondprizewriter" style = "float:left">8기 신정우</div>
   

        <div id="p6" class = "secondprizetitle" style="float:left; margin-left:20.104166666666668VW;">노란이불</div>
  <div id="w6" class = "secondprizetitle" style="float:left; margin-left:20.104166666666668VW;">순댓국밥집에서 쓰는 편지</div>
     <div id="t6" class = "secondprizetitle" style="float:left; margin-left:11.804166666666668VW;">소설</div>
    <div id="e6" class = "secondprizetitle" style="float:left; margin-left:11.804166666666668VW;">기계, 사람, 그리고 폐허에 대하여</div>
    <div id="k6" class = "secondprizetitle" style="float:left; margin-left:11.804166666666668VW;">눈을 감으면 여전히 바다의 소리가 들린다</div>
  <div class = "verticalline" style="float:left;"></div>
    <div id="p7" class = "secondprizewriter" style = "float:left">4기 이가은</div>
  <div id="w7" class = "secondprizewriter" style = "float:left">4기 이가은</div>
     <div id="t7" class = "secondprizewriter" style = "float:left">4기 최서린 </div>
    <div id="e7" class = "secondprizewriter" style = "float:left">7기 박지환 </div>
    <div id="k7" class = "secondprizewriter" style = "float:left">8기 강은영 </div>


  
  
  
  <div class = "thirdprize">우수상</div>
  <div class = "line"></div>
  
  <div class = "first">
      <div id="p8"class = "thirdprizetitle" style="float:left;">아무도 모르게</div>
    <div id="w8"class = "thirdprizetitle" style="float:left;">벨이 울렸다</div>
       <div id="t8"class = "thirdprizetitle" style="float:left;">아버지는 복숭아가 싫다고 하셨어</div>
      <div id="e8"class = "thirdprizetitle" style="float:left;">시를 쓰는 방법을 잊어버렸습니다</div>
      <div id="k8"class = "thirdprizetitle" style="float:left;">점</div>
  <div class = "verticalline" style="float:left; margin-top:0.3385416666666667VW;"></div>
      <div id="p9"class = "thirdprizewriter" style = "float:left">3기 손찬빈</div>
  <div id="w9"class = "thirdprizewriter" style = "float:left">4기 이희수</div>
       <div id="t9"class = "thirdprizewriter" style = "float:left">5기 강민채</div>
       <div id="e9"class = "thirdprizewriter" style = "float:left">5기 김진희</div>
      <div id="k9"class = "thirdprizewriter" style = "float:left">6기 박서진</div>
      <div id="p10"class = "thirdprizetitle" style="float:left; margin-left:19.6875VW;">빛</div>
  <div id="w10"class = "thirdprizetitle" style="float:left; margin-left:19.6875VW;">윤회</div>
       <div id="t10"class = "thirdprizetitle" style="float:left; margin-left:5.8875VW;">당신이 겪지 못한 시간에 대하여</div>
      <div id="e10"class = "thirdprizetitle" style="float:left; margin-left:5.8875VW;">온 세상이 당신의 길이 그르다 할지라도</div>
      <div id="k10"class = "thirdprizetitle" style="float:left; margin-left:16.610416666666668VW;">제비울 섬</div>
  <div class = "verticalline" style="float:left;margin-top:0.3385416666666667VW;"></div>
      <div id="p11" class = "thirdprizewriter" style = "float:left">3기 김나연</div>
    <div id="w11" class = "thirdprizewriter" style = "float:left">4기 임혜리</div>
      <div id="t11" class = "thirdprizewriter" style = "float:left">5기 기라연</div>
      <div id="e11" class = "thirdprizewriter" style = "float:left">6기 정현욱</div>
      <div id="k11" class = "thirdprizewriter" style = "float:left">6기 오나경</div>
  </div>
  
  <div class = "second">
      <div id="p12"class = "thirdprizetitle" style="float:left;">유리창은 슬펐다</div>
    <div id="w12"class = "thirdprizetitle" style="float:left;">영정사진</div>
      <div id="t12"class = "thirdprizetitle" style="float:left;">반생(半生) 외 1편</div>
      <div id="e12"class = "thirdprizetitle" style="float:left;">우연이 인연이 되는 힘이란, 평범함의 기적을 일구는 것</div>
       <div id="k12"class = "thirdprizetitle" style="float:left;">暳 외 2편</div>
  <div class = "verticalline" style="float:left; margin-top:0.3385416666666667VW;"></div>
      <div id="p13"class = "thirdprizewriter" style = "float:left">3기 장수아</div>
  <div id="w13"class = "thirdprizewriter" style = "float:left">4기 박현영</div>
        <div id="t13"class = "thirdprizewriter" style = "float:left">5기 김가을</div>
      <div id="e13"class = "thirdprizewriter" style = "float:left">5기 남예원</div>
      <div id="k13"class = "thirdprizewriter" style = "float:left">7기 김도연</div>
      <div id="p14"class = "thirdprizetitle" style="float:left;  margin-left:18.229166666666664VW;">별, 달 그리고 나</div>
  <div id="w14"class = "thirdprizetitle" style="float:left; margin-left:21.510416666666668VW;">내가 할 수 있는 것</div>
       <div id="t14"class = "thirdprizetitle" style="float:left; margin-left:15.610416666666668VW;">여섯 시의 달 외 2편</div>
      <div id="e14"class = "thirdprizetitle" style="float:left; margin-left:14.610416666666668VW;">회귀</div>
      <div id="k14"class = "thirdprizetitle" style="float:left; margin-left:14.610416666666668VW;">황혼 외 1편</div>
  <div class = "verticalline" style="float:left;margin-top:0.3385416666666667VW;"></div>
      <div id="p15"class = "thirdprizewriter" style = "float:left">4기 최서린</div>
    <div id="w15"class = "thirdprizewriter" style = "float:left">4기 최소정</div>
      <div id="t15"class = "thirdprizewriter" style = "float:left">5기 김소은</div>
      <div id="e15"class = "thirdprizewriter" style = "float:left">6기 박서진</div>
      <div id="k15"class = "thirdprizewriter" style = "float:left">7기 박유진</div>
   </div>
  
  <div class = "third">
      <div id="p16"class = "thirdprizetitle" style="float:left;">별의 위로</div>
    <div id="w16"class = "thirdprizetitle" style="float:left;">목련</div>
      <div id="t16"class = "thirdprizetitle" style="float:left;">가면</div>
      <div id="e16"class = "thirdprizetitle" style="float:left;">목련에게는 오직 한 번의 봄</div>
      <div id="k16"class = "thirdprizetitle" style="float:left;">엄마야 누나야 강변 살자</div>
  <div class = "verticalline" style="float:left; margin-top:0.3385416666666667VW;"></div>
      <div id="p17"class = "thirdprizewriter" style = "float:left">4기 최소정</div>
  <div id="w17"class = "thirdprizewriter" style = "float:left">5기 김소은</div>
      <div id="t17"class = "thirdprizewriter" style = "float:left">5기 백인하</div>
      <div id="e17"class = "thirdprizewriter" style = "float:left">6기 이성채</div>
      <div id="k17"class = "thirdprizewriter" style = "float:left">7기 박선기</div>
      <div id="p18"class = "thirdprizetitle" style="float:left; margin-left:22.552083333333332VW;">당신 안의 공감 본능을 깨워라</div>
  <div id="w18"class = "thirdprizetitle" style="float:left; margin-left:24.375VW;">늦여름</div>
      <div id="t18"class = "thirdprizetitle" style="float:left; margin-left:24.075VW;">그토록 흰 웃음을 나는 본 적이 없었네</div>
      <div id="e18"class = "thirdprizetitle" style="float:left; margin-left:30.075VW;">인생을 살아가며 우리가 지향해야할 삶의 자세</div>
      <div id="k18"class = "thirdprizetitle" style="float:left; margin-left:5.075VW;">관찰자 그리고 현재</div>
  <div class = "verticalline" style="float:left;margin-top:0.3385416666666667VW;"></div>
      <div id="p19"class = "thirdprizewriter" style = "float:left">4기 백여진</div>
    <div id="w19"class = "thirdprizewriter" style = "float:left">5기 김진희</div>
       <div id="t19"class = "thirdprizewriter" style = "float:left">4기 최윤서</div>
      <div id="e19"class = "thirdprizewriter" style = "float:left">7기 하현서</div>
      <div id="k19"class = "thirdprizewriter" style = "float:left">7기 박지우</div>
  </div>
  
  <div class = "fourth">
      <div id="p20"class = "thirdprizetitle" style="float:left;">벨이 울렸다</div>
    <div id="w20"class = "thirdprizetitle" style="float:left;">우리는 어디쯤</div>
       <div id="k20"class = "thirdprizetitle" style="float:left;">나의 눈물이 모여 너를 죽였다</div>
  <div id= "pline wline" class = "verticalline" style="float:left; margin-top:0.3385416666666667VW;"></div>
      <div id="p21"class = "thirdprizewriter" style = "float:left">3기 김수진</div>
  <div id="w21"class = "thirdprizewriter" style = "float:left">5기 조연수</div>
      
      <div id="k21"class = "thirdprizewriter" style = "float:left">7기 유예린</div>

      <div id="k22"class = "thirdprizetitle" style="float: left; margin-left:14.610416666666668VW;">여행을 떠난 이에게 외 1편</div>
        
      <div id="k23"class = "thirdprizewriter" style = "float:left">7기 손채원</div>

  </div>

    <div class = "fifth">
        <div id="k24"class = "thirdprizetitle" style="float:left;">꿈의 천사</div>
        

         <div id="k25"class = "thirdprizewriter" style = "float:left">8기 이상운</div>
        <div id="k26"class = "thirdprizetitle" style="float:left; margin-left:14.610416666666668VW;">박동성 이명 외 1편</div>
        <div id="k27"class = "thirdprizewriter" style = "float:left">8기 우서연</div>

    </div>

        
        
  
  
  
  
  <div class = "encouragementprize">장려상</div>
  <div class = "line"></div>
  
  <div class = "box" style ="margin-top:1.2760416666666667VW;">
    <div  id="p37" class = "thirdprizetitle" style="float:left;">꿈에게 묻다</div>
    <div id="w37" class = "thirdprizetitle" style="float:left;">안녕, 선화동</div>
      <div id="t37" class = "thirdprizetitle" style="float:left;">스물 아홉</div>
    <div id="e37" class = "thirdprizetitle" style="float:left;">120</div>
      <div id="k37" class = "thirdprizetitle" style="float:left;">승리자의 말예(末裔)</div>
  <div class = "verticalline" style="float:left; margin-top:0.3385416666666667VW;"></div>
       <div id="p23" class = "thirdprizewriter" style = "float:left">3기 강지윤</div>
  <div id="w23" class = "thirdprizewriter" style = "float:left">4기 박아현</div>
      <div id="t23" class = "thirdprizewriter" style = "float:left">5기 김인영</div>
      <div id="e23" class = "thirdprizewriter" style = "float:left">7기 노유민</div>
       <div id="k38" class = "thirdprizewriter" style = "float:left">6기 정현욱</div>
  <div id="p38" class = "thirdprizetitle" style="float:left; margin-left:21vw;">수국</div>
  <div id="w38" class = "thirdprizetitle" style="float:left; margin-left:10vw;">열흘간 나와 함께한 별</div>
      <div id="t38" class = "thirdprizetitle" style="float:left; margin-left:20.6vw;">존재와</div>
      <div id="e38" class = "thirdprizetitle" style="float:left; margin-left:20.6vw;">落花流水(낙화유수)</div>
      <div id="k39" class = "thirdprizetitle" style="float:left; margin-left:20.6vw;">생(生) 외 2편</div>
  <div class = "verticalline" style="float:left;margin-top:0.3385416666666667VW;"></div>
      <div id="p24" class = "thirdprizewriter" style = "float:left">3기 김서윤</div>
    <div id="w24" class = "thirdprizewriter" style = "float:left">4기 김한별</div>
      <div id="t24" class = "thirdprizewriter" style = "float:left">5기 김민성</div>
      <div id="e24" class = "thirdprizewriter" style = "float:left">7기 윤서연</div>
       <div id="k40" class = "thirdprizewriter" style = "float:left">8기 김연건</div>
  </div>
  
  <div class = "box">
    <div id="p39"  class = "thirdprizetitle" style="float:left;">너에게 충고</div>
    <div id="w39" class = "thirdprizetitle" style="float:left;">선생과 의사의 시계</div>
      <div id="t39" class = "thirdprizetitle" style="float:left;">어느 날 아침, 변신해버린 당신을 위해</div>
      <div id="e39" class = "thirdprizetitle" style="float:left;">사계절이 가듯 세월을 보내고 나면</div>
      <div id="k41" class = "thirdprizetitle" style="float:left;">영화 같은 삶</div>
  <div class = "verticalline" style="float:left; margin-top:0.3385416666666667VW;"></div>
      <div id="p26" class = "thirdprizewriter" style = "float:left">3기 서예원</div>
  <div id="w26" class = "thirdprizewriter" style = "float:left">5기 우경흔</div>
      <div id="t26" class = "thirdprizewriter" style = "float:left">5기 김민진</div>
      <div id="e26" class = "thirdprizewriter" style = "float:left">6기 박서진</div>
      <div id="k42" class = "thirdprizewriter" style = "float:left">6기 이태경</div>
  <div id="p40" class = "thirdprizetitle" style="float:left; margin-left:18vw;">벚꽃나무</div>
  <div id="w40" class = "thirdprizetitle" style="float:left; margin-left:12.5vw;">외로움이란</div>
      <div id="t40" class = "thirdprizetitle" style="float:left; margin-left:3vw;">C339</div>
      <div id="e40" class = "thirdprizetitle" style="float:left; margin-left:3vw;">위대한 감시학교 리뷰</div>
      <div id="k43" class = "thirdprizetitle" style="float:left; margin-left:18.5vw;">노을 외 1편</div>
  <div class = "verticalline" style="float:left;margin-top:0.3385416666666667VW;"></div>
      <div id="p27"class = "thirdprizewriter" style = "float:left">3기 박지훈</div>
    <div id="w27" class = "thirdprizewriter" style = "float:left">5기 유혜주</div>
      <div id="t27" class = "thirdprizewriter" style = "float:left">6기 박서진</div>
      <div id="e27" class = "thirdprizewriter" style = "float:left">7기 윤승우</div>
      <div id="k44" class = "thirdprizewriter" style = "float:left">7기 오승연</div>
  </div>
  
  <div class = "box">
    <div id="p41" class = "thirdprizetitle" style="float:left;">2번의 물수제비</div>
    <div id="w41" class = "thirdprizetitle" style="float:left;">달 없는 밤</div>
      <div id="t41" class = "thirdprizetitle" style="float:left;">갈마바람 외 2편</div>
      <div id="e41" class = "thirdprizetitle" style="float:left;">뛰어가기 전 한 번 더</div>
      <div id="k45" class = "thirdprizetitle" style="float:left;">주홍 얼룩 고양이</div>
  <div class = "verticalline" style="float:left; margin-top:0.3385416666666667VW;"></div>
      <div id="p29" class = "thirdprizewriter" style = "float:left">3기 이지연</div>
  <div id="w29" class = "thirdprizewriter" style = "float:left">5기 강민채</div>
      <div id="t29" class = "thirdprizewriter" style = "float:left">6기 박지성</div>
      <div id="e29" class = "thirdprizewriter" style = "float:left">6기 오서윤</div>
      <div id="k46" class = "thirdprizewriter" style = "float:left">7기 박지환</div>
    <div id="p42"  class = "thirdprizetitle" style="float:left; margin-left:15.3vw;">작은 행운</div>
          <div  id="w42" class = "thirdprizetitle" style="float:left;margin-left:19.6vw;">세라피나</div>
      <div  id="t42" class = "thirdprizetitle" style="float:left;margin-left:16.6vw;">맨마루의 오죽(烏竹) 외 1편</div>
      <div  id="e42" class = "thirdprizetitle" style="float:left;margin-left:16.6vw;">피어</div>
      <div  id="k47" class = "thirdprizetitle" style="float:left;margin-left:15.6vw;">어느 노신사의 독백 외 2편</div>
  <div class = "verticalline" style="float:left;margin-top:0.3385416666666667VW;"></div>
      <div id="p30" class = "thirdprizewriter" style = "float:left">3기 송선우</div>
    <div id="w30" class = "thirdprizewriter" style = "float:left">5기 조유진</div>
      <div id="t30" class = "thirdprizewriter" style = "float:left">5기 이환희</div>
      <div id="e30" class = "thirdprizewriter" style = "float:left">6기 이미애</div>
      <div id="k48" class = "thirdprizewriter" style = "float:left">7기 박서진</div>
  </div>
  
  <div class = "box">
    <div id="p43" class = "thirdprizetitle" style="float:left;">18년</div>
    <div  id="w43" class = "thirdprizetitle" style="float:left;">저 강이 되어라</div>
      <div  id="t43" class = "thirdprizetitle" style="float:left;">느린 우체통</div>
      <div  id="e43" class = "thirdprizetitle" style="float:left;">나의 시골은</div>
      <div id="k49" class = "thirdprizetitle" style="float:left;">창공의 기사</div>
  <div class = "verticalline" style="float:left; margin-top:0.3385416666666667VW;"></div>
      <div id="p32" class = "thirdprizewriter" style = "float:left">4기 문사랑</div>
  <div id="w32" class = "thirdprizewriter" style = "float:left">5기 이환희</div>
      <div id="t32" class = "thirdprizewriter" style = "float:left">5기 조유진</div>
      <div id="e32" class = "thirdprizewriter" style = "float:left">6기 심진우</div>
      <div id="k50" class = "thirdprizewriter" style = "float:left">8기 홍석현</div>
    <div id="p44" class = "thirdprizetitle" style="float:left;margin-left:25.2vw;">새벽</div>
    <div  id="w44" class = "thirdprizetitle" style="float:left;margin-left:8.6vw;">그 섬에는 인어가 산다</div>
       <div  id="t44" class = "thirdprizetitle" style="float:left;margin-left:19.2vw;">해와 달 </div>
      <div  id="e44" class = "thirdprizetitle" style="float:left;margin-left:19.2vw;">비의 의미 </div>
      <div  id="k51" class = "thirdprizetitle" style="float:left;margin-left:19.2vw;">진눈깨비 외 1편 </div>
  <div class = "verticalline" style="float:left;margin-top:0.3385416666666667VW;"></div>
      <div id="p33" class = "thirdprizewriter" style = "float:left">4기 박현영</div>
    <div id="w33" class = "thirdprizewriter" style = "float:left">5기 김조현</div>
       <div id="t33" class = "thirdprizewriter" style = "float:left">4기 최소정</div>
      <div id="e33" class = "thirdprizewriter" style = "float:left">7기 이재영</div>
      <div id="k52" class = "thirdprizewriter" style = "float:left">7기 정다예</div>
  </div>
  
  <div class = "box">
    <div id="p45"  class = "thirdprizetitle" style="float:left;">신의 계획</div>
    <div id="w45" class = "thirdprizetitle" style="float:left;">이인</div>
      <div id="t45" class = "thirdprizetitle" style="float:left;">반달의 상실 외 1편</div>
       <div id="k53" class = "thirdprizetitle" style="float:left;">이육사의 광야는 외 1편</div>
  <div class = "verticalline" style="float:left; margin-top:0.3385416666666667VW;"></div>
      <div id="p35" class = "thirdprizewriter" style = "float:left">4기 이희수</div>
  <div id="w35" class = "thirdprizewriter" style = "float:left">5기 기라연</div>
      <div id="t35" class = "thirdprizewriter" style = "float:left">4기 하지윤</div>
      <div id="k54" class = "thirdprizewriter" style = "float:left">6기 이성채</div>
    <div id="p46" class = "thirdprizetitle" style="float:left;margin-left:14.3vw;">내가 바라는 생명</div>
    <div id="w46" class = "thirdprizetitle" style="float:left;margin-left:23.3vw;">스케치북</div>
      <div id="k55" class = "thirdprizetitle" style="float:left;margin-left:20.3vw;">떠나보내다 외 1편</div>
  <div id="pline1 wline1" class = "verticalline" style="float:left;margin-top:0.3385416666666667VW;"></div>
      <div id="p36" class = "thirdprizewriter" style = "float:left">3기 김수진</div>
    <div id="w36" class = "thirdprizewriter" style = "float:left">5기 박지원</div>
      <div id="k56" class = "thirdprizewriter" style = "float:left">7기 신현진</div>
  </div>
    <div class = "box">
        <div id="k57" class = "thirdprizetitle" style="float:left;">별의 장례식 외 1편</div>
        <div id="k58" class = "thirdprizewriter" style = "float:left">6기 송하영</div>
        <div id="k59" class = "thirdprizetitle" style="float:left;margin-left:23.3vw;">마음의 증명 외 2편</div>
        <div id="k60" class = "thirdprizewriter" style = "float:left">7기 손민서</div>
    </div>

    <div class = "box">
        <div id="k61" class = "thirdprizetitle" style="float:left;">늘 그랬듯이 외 1편</div>
        <div id="k62" class = "thirdprizewriter" style = "float:left">8기 권하진</div>
        
    </div>
    </body>
    </asp:Content>