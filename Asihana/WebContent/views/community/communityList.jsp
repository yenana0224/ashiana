<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.ArrayList, com.kh.semi.community.model.vo.Community" %>    
    
<%
	ArrayList<Community> list = (ArrayList<Community>)request.getAttribute("community");

 %>    
    
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
    }

    #wrap{

        width: 1000px;
        height: 1200px;
        margin-top:10px;
        margin-left:400px;
    }

    #header{width: 100%; height: 25%;}
    #content{width:100%; height: 50%;}

    #header{
        background-color: rgba(224, 224, 205, 0.63);
        
         
    }

    #h1{
      
        margin-left:  250px;
        margin-top: 30px;
    }

    #key{
      
        margin-left:250px;
        width: 450px;
        height: 30px;


    }
    

    #content{
        background-color: beige;
      
       
        width:1200px;
        flaot: right;
        

    }
    
    

    #content_2{
        background-color: white;
        margin: auto;
        
    }

	#roll{
		text-decoratin: none;
	
	}

    #h2_1{
        margin-right: 500px;
        font-size: 30px;
        
      
   
        
    }
    
     #h2_2{
        margin-left: 0px;
        font-size: 30px;
 		
    }

	#t{
			float:center;
			
			width: 100px;
			height: 150px;
			text-align: center;
	
	
	}

    

    #g1{
        float:left;
        text-align: center;
        height: 30px;
        width: 100px;
        margin:20px;
        margin-left: 240px;
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
        background-color: lightcral;
        font-weight: 8px;
        font-style: rgb(221, 201, 201);
        height: 30px;
        width: 200px;
        margin-top:20px;
        margin-left: 10px;
        margin-right: 10px;
    }
    
     #g4{
        background-color: coral;
        font-weight: 800px;
        font-style: rgb(221, 201, 201);
        height: 30px;
        width: 80px;
        margin-top:20px;
        margin-left: 1px;
        margin-right: 1px;
    }


	.#t1{
	
	
	margin-left: 50px;
	width:500px;
	height: 50px;
	
	
	}
	
	
	#t2{
	
	border-radius: 1px solid black;
	margin-left: 60px;
	width:1000px;
	height: 200px;
	
	
	
	
	
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
           <span id="h2_1">여행자 실시간 커뮤니티</span>
            <span id="h2_2"> <a href="<%=contextPath %>/insert.commu" id="roll" >글 등록하기</a></span>
      
    
        <!-- 중간영역의 왼쪽에 위치하여 순서대로 도시에 대한 사진을 보이게 할 예정 -->
        
 <!-- swiper.js 라이브러리추가 -->
    <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
    <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>

    <style>
    /* 이미지 영역 사이즈 조절 */
    .swiper {
        width: 300px;
        height: 300px;
        float:left;
        margin-top: 30px;
        margin-left: 10px;
        
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
    
  
  
  
    <div>
 
      <!-- 커뮤니티의 글이  있는 곳!!! 되도록 실시간으로 소통이 된다는 전제로!!!-->
      
      
      
      <table  id="t1" text-align="center">
      <thead> 
      
      	<tr>
      		<th>글 번호</th>
      		<th>도시 번호</th>
      		<th>멤버 번호</th>
      		<th>글 내용</th>
      		<th>조회수</th>
      		<th>작성일</th>
      		<th>회원상태</th>
      	
      	
      	
      	
      	
      	</tr>
      
      
      
      
     <!-- 실시간으로 소통하는 여행자들이 있다!!! -->
        <%--
			<% if(list.isEmpty()) {%>
					<tr>
						<th colspan="6"> 실시간으로 대화하는 여행자가 없다!!!</th>
					</tr> 
			
			<% } else { %>
					
					<% for(Community c : list) { %>
					<tr>
						<td<%= c.getComuNo() %>></td>
						<td><%= c.getCityNo() %></td>
						<td><%=c.getMemNo() %></td>
						<td><%=c.getComuContent() %></td>
						<td><%=c.getComuDate() %></td>
						<td><%=c.getStatus() %></td>
					</tr>
			
			
			<% } %>	
			
		<% } %>
		 --%>	
      </table>
     
 







	
    </div>
  
  










 




        </div>
        
        <div id="content_2">
        <!-- 전체기간,통합 분류로 기간, 국가별,도시별, 제목+내용, 내용으로 검색어를 입력하여 검색이 가능하다 -->
       
            <br>
            <span>
                <select id="g1">
                    <option>전체기간</option>
                    <option>1일</option>
                    <option>1주일</option>
                    <option>1개월</option>
                </select>
            </span>

          
            <span>
                <select id="g2">
                    <option>통합</option>
                    <option>도시별</option>
                    <option>제목+내용</option>
                    <option>내용</option>
                </select>
            </span>
            

            <span><input type="text" placeholder="검색어를 입력해주세요" id="g3"></span>

          <button id="g4"> 검색</button>
          
          
          <span>  
          
	          
	         <table id="t2">
	          	<thead >
		    	    <tr>
		          		<th>글 번호</th>
			    		<th>도시 번호</th>
			      		<th>멤버 번호</th>
			      		<th>글 내용</th>
			      		<th>조회수</th>
			      		<th>작성일</th>
			      		<th>회원상태</th>
			    
		        	</tr>
	          	  </thead>
	          	  <tbody>
	      <%-- 
	          	  <% if(list.isEmpty()) {%>
					<tr>
						<th colspan="6"> 실시간으로 대화하는 여행자가 없다!!!</th>
					</tr> 
			
				<% } else { %>
					
					<% for(Community c : list) { %>
					<tr>
						<td<%= c.getComuNo() %>></td>
						<td><%= c.getCityNo() %></td>
						<td><%=c.getMemNo() %></td>
						<td><%=c.getComuContent() %></td>
						<td><%=c.getComuDate() %></td>
						<td><%=c.getStatus() %></td>
					</tr>
			
			
			<% } %>	
			
		<% } %>
		 --%>	
	          	  	
	          	  
	          	  
	          	  
	          	  
	          	  </tbody>
	          	  
	      	  </table>
	          
          </span>
          
        
     
     
     
    </div>
</div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>