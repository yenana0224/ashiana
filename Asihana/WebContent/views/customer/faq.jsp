<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/Asihana/resources/css/customer/faq.css">
</head>
<body>

	<jsp:include page="../common/headerbar.jsp"/>
	
	<div id="content">
        <div id="title"><b>자주 찾는 질문</b></div>
        
        <div class="q">Q. [여행플랜] 비공개 설정 가능한가요??</div>
        <p class="a">A. 네 가능합니다.</p>
        <div class="line"></div>
        <div class="q">Q. [여행기] 여행기를 작성하려면 어떻게 해야 하나요?</div>
        <p class="a">A: 로그인을 하면 여행기 페이지 우측 상단 부근에 작성하기 버튼이 활성화 됩니다.<br>  버튼을 누른 후 여행기 작성 페이지에서 본인의 여행기를 적어주세요.</p>
        <div class="line"></div>
        <div class="q"></div>
        <p class="a"></p>
        <div class="line"></div>
        <div class="q"></div>
        <p class="a"></p>
        <div class="line"></div>
        <div class="q"></div>
        <p class="a"></p>
        <div class="line"></div>
        <div class="q"></div>
        <p class="a"></p>
        <div class="line"></div>
        <div class="q"></div>
        <p class="a"></p>
        <div class="line"></div>
        <div class="q"></div>
        <p class="a"></p>
        <div class="line"></div>
        <div class="q"></div>
        <p class="a"></p>
        <div class="line"></div>
        <div class="q"></div>
        <p class="a"></p>
        <div class="line"></div>
    </div>

    <script>
        $(function(){

            $('.q').click(function(){

                const $p = $(this).next();

                if($p.css('display') == 'none'){

                    $p.siblings('.a').slideUp(500);

                    $p.slideDown(500);
                }
                else{
                    $p.slideUp(500);
                }
            });

        });
    </script>


	<jsp:include page="../common/footer.jsp"/>
</body>
</html>