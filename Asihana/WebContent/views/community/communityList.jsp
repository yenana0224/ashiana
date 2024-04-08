<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ page import="com.kh.semi.community.model.vo.Community" %>  
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
        margin:auto;
    }

    #header{width: 100%; height: 10%;}
    #content_1{width:100%; height: 45%;}
    #content_2{width:100%; height: 45%;}

    #header{
        background-color: rgba(224, 224, 205, 0.63);
        
         
    }

    #h1{
      
        margin-left:  250px;
        margin-top: 30px;
    }

    #key{
      
        margin-left:250px;
        width: 500px;
        height: 30px;
        overflow:auto;


    }
    
    #key::-web-scrollbar{
    	height:10px;
    	
    	
    }
    

    #content{
        background-color: beige;
        width:100px;
        flaot: right;
     
        

    }
    
    #content_1{
    
    	
    	margin:0px;
    	background-color:beige;
    	position:relative;
    	
    	
    
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
    
     #g5{
        background-color: lightgreen;
        font-weight: 800px;
        font-style: rgb(221, 201, 201);
        height: 30px;
        width: 90px;
        margin-top:20px;
        margin-left: 5px;
        margin-right: 1px;
    }
    
    


	.#t1{
	
	
	margin-left: 50px;
	width:80px;
	height: 50px;
	
	
	}
	
	
	#t2{
	
	border-radius: 1px solid black;
	margin-left: 10px;
	width:1000px;
	height: 200px;
	
	
	
	
	
	}
    
	    
	    * {
	    padding: 0;
	    margin: 0;
	    box-sizing: border-box;
	}
	
	a {
	    text-decoration: none;
	}
	
	.wrap {
		width:500px;
		height: 440px;
	    padding: 15px 0;
	    margin-top: 70px;
	    background-color: lightcoral;
	    position:absolute;
	    top:10px;
	    left:400px;
	    float:right;
	    z-index:2;
	    
	}
	
	.wrap .chat {
	    display: flex;
	    align-items: flex-start;
	    padding: 20px;
	}
	
	.wrap .chat .icon {
	    position: relative;
	    overflow: hidden;
	    width: 50px;
	    height: 50px;
	    border-radius: 50%;
	    background-color: #eee;
	}
	
	.wrap .chat .icon i {
	    position: absolute;
	    top: 10px;
	    left: 50%;
	    font-size: 2.5rem;
	    color: #aaa;
	    transform: translateX(-50%);
	}
	
	.wrap .chat .textbox {
	    position: relative;
	    display: inline-block;
	    max-width: calc(100% - 70px);
	    padding: 10px;
	    margin-top: 7px;
	    font-size: 13px;
	    border-radius: 10px;
	}
	
	.wrap .chat .textbox::before {
	    position: absolute;
	    display: block;
	    top: 0;
	    font-size: 1.5rem;
	}
	
	.wrap .ch1 .textbox {
	    margin-left: 20px;
	    background-color: #ddd;
	}
	
	.wrap .ch1 .textbox::before {
	    left: -15px;
	    content: "◀";
	    color: #ddd;
	}
	
	.wrap .ch2 {
	    flex-direction: row-reverse;
	}
	
	.wrap .ch2 .textbox {
	    margin-right: 20px;
	    background-color: #F9EB54;
	}
	
	.wrap .ch2 .textbox::before {
	    right: -15px;
	    content: "▶";
	    color: #F9EB54;
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

            <form action="city.do"  id="key" width= "500px" height= "30px" > 
                <select name="city" >
                    <option >국가,도시,키워드로 검색</option>
                    <option >일본</option>
                    <option >도쿄(일본)</option>
                    <option>오사카(일본)</option>
                    <option>나라(일본)</option>
                    <option>중국</option>
                    <option>상해(중국)</option>
                    <option>북경(중국)</option>
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
        <div id="content_1">
           <span id="h2_1">여행자 실시간 커뮤니티</span>
          
      
    
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
        margin-top: 70px;
        margin-left: 20px;
        
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
      
    
      
      <div class="wrap">
        <div class="chat ch1">
            <div class="icon"><i class="fa-solid fa-user"></i></div>
            <div class="textbox">안녕하세요. 반갑습니다.</div>
        </div>
        <div class="chat ch2">
            <div class="icon"><i class="fa-solid fa-user"></i></div>
            <div class="textbox">안녕하세요. 친절한효자손입니다. 그동안 잘 지내셨어요?</div>
        </div>
        <div class="chat ch1">
            <div class="icon"><i class="fa-solid fa-user"></i></div>
            <div class="textbox">아유~ 너무요너무요! 요즘 어떻게 지내세요?</div>
        </div>
        <div class="chat ch2">
            <div class="icon"><i class="fa-solid fa-user"></i></div>
            <div class="textbox">뭐~ 늘 똑같은 하루 하루를 보내는 중이에요. 코로나가 다시 극성이어서 모이지도 못하구 있군요 ㅠㅠ 얼른 좀 잠잠해졌으면 좋겠습니다요!</div>
        </div>
    </div>
      
      
     
		
		 
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
          
      
          
           		<a href="${ list }/insert.commu"> <button id="g5" > 글 작성하기</button></a>
          <!--글 작성하기를  누르면 글 작성폼으로 연결 -->
          
          		

          
          
          </script>
          
          
          
                    
          <span>  
          
          
	       
	         <table class="table table-hover"  id="t2">
	          	<thead >
		    	    <tr>
		          		<th>글 번호 :${ comuNo }</th>
			    		<th>도시 :${ cityName }</th>
			      		<th>회원 닉네임: ${ memberNickName }</th>
			      		<th>글 내용 :${ comuContent }</th>
			      		<th>조회수: ${ count }</th>
			      		<th>작성일 :${ comuDate }</th>
			      		
		        	</tr>
	          	  </thead>
	          	  <tbody>
	          	  <c:choose>
	     				<c:when test="${ empty list}">
		          	  		<tr>
		          	  			<td colspan="6">결과가 존재하지 않습니다.</td>
		          	  		</tr>
	          	  		</c:when>
	          	  		<c:otherwise>
	          	  			<c:forEach var="c" items="${ requestScope.list }" varStatus="s">
	          	  				<tr>
		          	  				<td>${ c.comuNo }</td>
		          	  				<td>${ c.cityName }</td>
		          	  				<td>${ c.memberNickname }</td>
		          	  				<td>${ c.comuContent }</td>
		          	  				<td>${ c.count }</td>
		          	  				<td>${ c.comuDate }</td>
	          	  				</tr>
	          	  			</c:forEach>
	          	  		</c:otherwise>
	          	 	 </c:choose>		
	          	  
	       <%--
	          	  	<% if(list.isEmpty()) {%>
					<tr>
						<th colspan="6"></th>
					</tr> 
			
			<% } else { %>
					
					<% for(Community c : list) { %>
					<tr class="list">
						<td><%= c.getComuNo() %></td>
						<td><%= c.getCityName() %></td>
						<td><%=c.getMemberNickname() %></td>
						<td><%=c.getComuContent() %></td>
						<td><%=c.getCount() %></td>	
						<td><%=c.getComuDate() %></td>
					</tr>
			<% } %>	
		<% } %>
		--%>
	          	  </tbody>
	          </table>
	       </span>
	       
	       <script>
                // 1절 선택한 뒤 이벤트 부여
                $('tbody>tr.list').click(function(){
                    
                    // 2절 상세페이지 요청!!!

                    // location.href='${comunitylist}/detail.commu';
                    // 클릭했을 때 클릭한 공지사항의 번호를 넘겨줘야함!!!   
                    // console.log(this);
                    // 이벤트가 발생한 tr요소의 자식 중에서도 첫 번째 td요소의  Content영역의 값이 필요함!!
                    // console.log(this.children()) => 찍어봤더니 말도안되는 소리 하지마라고 함!!!
                    // console.log($(this).children().eq(0).text());

                    const communityNo = $(this).children().eq(0).text();

                    // 공지사항 번호를 이용한 요청
                    // url을 보냈다 => GET방식 : 요청할 url?키=밸류&키=밸류&키=밸류
                    // queryString		
					// url을 직접 만들어 보낼 것!!!
					// jsp/detail.commu?communityNo=글번호
					location.href = '<%=contextPath%>/detail.commu?communityNo='+communityNo;

                });
	       
	       
	       
	       
	       
	       
	       
	       </script>
          
        
     
     
     
    </div>
</div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>