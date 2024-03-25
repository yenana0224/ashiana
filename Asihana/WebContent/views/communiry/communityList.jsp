<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 목록조회</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>


<style>
    div{
        box-sizing: border-box;
       border:1px solid red;

    }

    #wrap{

        width: 800px;
        height: 1200px;
        margin: auto;
        
    }

    #header{width: 100%; height: 25%;}
    #content{width: 80%; height: 50%;}
    #footer{width: 100%; height: 25%;}


    #header{
        background-color: green;
         
    }

    #h1{
        margin-right: 50px;
    }

    #key{
      
        margin-left:50px;
        width: 450px;
        height: 30px;


    }

    #content{
        background-color: beige;
        margin: auto;
    }
    
    #h2{
        margin: center;
    }

    #footer{
        background-color: white;
        text-align: center;
      

    }

    

    #g1{
        float:left;
        text-align: center;
        height: 30px;
        width: 100px;
        margin:20px;
        margin-left: 100px;
        text-align: left;
      
    }
    #g2{
        float:left;
        height: 30px;
        width: 100px;
        margin:20px;
        margin-left: 0px;
        text-align: left;
    }

    #g3{
        background-color: lightcoral;
        font-weight: 800;
        font-style: rgb(221, 201, 201);
        height: 30px;
        width: 80px;
        margin-top:20px;
        margin-left: 5px;
        margin-right: 80px;
    }

    

    
    
    
</style>
<title>커뮤니티</title>
</head>
<body>

 <%@ include file="../common/headerbar.jsp" %>
 	
    <!--#wrap>(#header+#content)+#footer  -->
    <div id="wrap">
        <div id="header">
            <h2 id="h1" >여행자들과 자유롭게 소통해보세요</h2> 

            <form action="city.do" > 
                <select name="city" id="key">
                    <option>국가,도시,키워드로 검색</option>
                    <option>일본</option>
                    <option>도쿄(일본)</option>
                    <option>오사카(일본)</option>
                    <option>나라(일본)</option>
                    <option>중국</option>
                    <option>상해(중국)</option>
                    <option>북경(중국)</option>

                </select>
            
            </form>

           
       

        </div>
        <div id="content">
            <h2>여행자 실시간 커뮤니티 <div class="spinner-border text-dark"></div> </h2> 
        <a href="<%=contextPath %>/insert.commu" >글 등록하기</a>
        <!-- 중간영역의 왼쪽에 위치하여 순서대로 도시에 대한 사진을 보이게 할 예정 -->
 <!-- swiper.js 라이브러리추가 -->
    <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
    <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>

    <style>
    /* 이미지 영역 사이즈 조절 */
    .swiper {
        width: 1200px;
        height: 500px;
    }

    /* 이미지 사이즈 조절 */
    .swiper-slide>img {
        width : 100%;
        height : 100%;
    }

    /* 화살표 버튼색 변경 (기본색은 파란색) */
    div[class^=swiper-button] {
        color : white;
        /* display : none; */ /* 아니면 안보이게 숨기기도 가능 */
    }
    </style>

</head>
<body>
    
    <!-- 
        * 참고 링크
        https://iridescent-zeal.tistory.com/150
    -->
    <div id="content_1">
        <!-- Slider main container -->
        <div class="swiper">
            <!-- Additional required wrapper -->
            <div class="swiper-wrapper">
                <!-- Slides -->
                <div class="swiper-slide"><img src="https://cdn.pixabay.com/photo/2017/04/11/15/55/animals-2222007__480.jpg"></div>
                <div class="swiper-slide"><img src="https://cdn.pixabay.com/photo/2015/12/06/09/15/maple-1079235__480.jpg"></div>
                <div class="swiper-slide"><img src="https://cdn.pixabay.com/photo/2016/09/01/19/53/pocket-watch-1637396__480.jpg"></div>
                <div class="swiper-slide"><img src="https://cdn.pixabay.com/photo/2016/05/27/08/51/mobile-phone-1419275__480.jpg"></div>
                <div class="swiper-slide"><img src="https://cdn.pixabay.com/photo/2015/09/01/09/32/alphabet-916673__480.jpg"></div>
            </div>
        
            <!-- If we need pagination -->
            <div class="swiper-pagination"></div>
        
            <!-- If we need navigation buttons -->
            <div class="swiper-button-prev"></div>
            <div class="swiper-button-next"></div>
        
            <!-- If we need scrollbar -->
            <div class="swiper-scrollbar"></div>
        </div>
    </div>

    <script>
        // 슬라이더 동작 정의
        const swiper = new Swiper('.swiper', {
            autoplay : {
                delay : 3000 // 3초마다 이미지 변경
            },
            loop : true, //반복 재생 여부
            slidesPerView : 1, // 이전, 이후 사진 미리보기 갯수
            pagination: { // 페이징 버튼 클릭 시 이미지 이동 가능
                el: '.swiper-pagination',
                clickable: true
            },
            navigation: { // 화살표 버튼 클릭 시 이미지 이동 가능
                prevEl: '.swiper-button-prev',
                nextEl: '.swiper-button-next'
            }
        }); 
    </script>
    
    <!-- 중간영역의 오른쪽에 배치를 할 예정  사진에 따른 도시에 따른 커뮤니티에    싫시간으로 작성한글을 보이게 할 예정(AJAX 사용할 예정 -->

	<button onclick="push();" id="click1">실시간</button>
	
	<script>
		
		function push(){
			
			$.ajax({
				url : 'jqAjax1.do',
				data : {comuNo:$('#click').val()},
				type : 'get'
			}
			
			success :function(result){
				
			}
			});
		}
	
	
	
	</script>
	










 <!-- 페이징 바 영역 -->
        
        
        <div class="paging-area" align="center">
        
        	<% if(currentPage > 1) { %>
        		<button 
				class="btn btn-danger" style="color:##ff52a0;"
				onclick="location.href='<%=contextPath%>/page?currentPage=<%=currentPage -1 %>'">이전</button>
          	<% } %>   
        	
			<% for(int i = startPage; i <= endPage; i++){ %>
			
				<% if(currentPage != i){ %>
				<button 
				class="btn btn-outline-danger" style="color:##ff52a0;"
				onclick="location.href='<%=contextPath%>/page?currentPage=<%=i%>'"><%= i %></button>
				<%} else {%>
					<button disabled class="btn btn-outline-secondary"><%=i %></button>
				<%} %>
			<%} %>
			
			<% if(currentPage != maxPage) { %>
			  <button 
				class="btn btn-danger" style="color:##ff52a0;"
				onclick="location.href='<%=contextPath%>/page?currentPage=<%=currentPage + 1%>'">다음</button>
			<% } %>
        </div>
     </div>
     





        </div>
        <div id="footer" float;>
        <!-- 전체기간,통합 분류로 기간, 국가별,도시별, 제목+내용, 내용으로 검색어를 입력하여 검색이 가능하다 -->
        <a href="<%=contextPath%>/read.commu>
            <form action="term.do" float:right;></form><br>
            <span>
                <select  id="g1" >
                    <option>전체기간</option>
                    <option>1일</option>
                    <option>1주일</option>
                    <option>1개월</option>
                </select>

                
            </span>

            <form action="term.do"></form>
            <span>
                <select  id="g2">
                    <option>통합</option>
                    <option>도시별</option>
                    <option>제목+내용</option>
                    <option>내용</option>
                </select>
                
            </span>
            

            <span><input type="text" size="30px" placeholder="검색어를 입력해주세요"></span>

            <button  id="g3">검색</button>
            
             <!-- 페이징 바 영역 -->
        
        
        <div class="paging-area" align="center">
        
        	<% if(currentPage > 1) { %>
        		<button 
				class="btn btn-danger" style="color:##ff52a0;"
				onclick="location.href='<%=contextPath%>/boardList?currentPage=<%=currentPage -1 %>'">이전</button>
          	<% } %>   
        	
			<% for(int i = startPage; i <= endPage; i++){ %>
			
				<% if(currentPage != i){ %>
				<button 
				class="btn btn-outline-danger" style="color:##ff52a0;"
				onclick="location.href='<%=contextPath%>/boardList?currentPage=<%=i%>'"><%= i %></button>
				<%} else {%>
					<button disabled class="btn btn-outline-secondary"><%=i %></button>
				<%} %>
			<%} %>
			
			<% if(currentPage != maxPage) { %>
			  <button 
				class="btn btn-danger" style="color:##ff52a0;"
				onclick="location.href='<%=contextPath%>/boardList?currentPage=<%=currentPage + 1%>'">다음</button>
			<% } %>
        </div>
     </div>
     
            




 	<%@ include file="../common/footer.jsp" %>




        </div>
    </div>
</body>
</html>