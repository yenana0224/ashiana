<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import ="com.kh.semi.member.model.vo.Member"%>
<%
	String contextPath = request.getContextPath();
	Member loginUser = (Member)session.getAttribute("loginUser");
	String alertMsg = (String)session.getAttribute("alertMsg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
    
<style>
        #login_join{
            height: 50px;
            width: 1000px;
            margin: auto;
            padding-top: 10px;
            text-shadow: 2px 2px rgba(128, 128, 128, 0.226);
        }
        #login_join > a{
            text-decoration: none;
            color: rgb(85, 83, 83);
            position: relative;
            left: 90%;
            font-size: 13px;
        }
         #login_join > p{
              text-decoration: none;
            color: rgb(85, 83, 83);
            position: relative;
            left: 90%;
            font-size: 13px;
        }
        #logotop{
            height: 40px;
            width: 1000px;
            margin: auto;
            text-align: center;
            text-shadow: 2px 2px rgba(128, 128, 128, 0.226);
        }
        #logolow{
            height: 60px;
            width: 1000px;
            margin: auto;
            text-align: center;
            text-shadow: 3px 3px rgba(128, 128, 128, 0.226);
        }
        #menubar{
            height: 47px;
            width: 1000px;
            margin: auto;
            border-bottom: 1px solid rgba(75, 70, 70, 0.692);
        }
        #logotop > a{
            text-decoration: none;
            color: rgb(85, 83, 83);
            font-size: 17px;
            font-weight: 600;
            position: relative;
            top: 40%;
        }
        #logolow > a{
            text-decoration: none;
            color: rgb(85, 83, 83);
            font-size: 30px;
            font-weight: 800;
           
        }
        #logolow  b{
            color: red;
        }


        #navi{
            list-style: none;
            margin: 0;
            height: 100%;
            position: relative;
            bottom: 20%;
            left: 15%;
        }

        #navi > li{
            float: left;
            width: 13%;
            height: 100%;
            text-align: center;
        }

        #navi a{
            text-decoration: none;
            color: rgb(85, 83, 83);
            font-weight: 700;
            width: 100%;
            height: 100%; 
            display : block; 
            line-height: 50px;
            z-index: 2;
        }

        #navi > li > ul{
            list-style : none;
            padding : 0px;
            display: none;
        }

        #navi > li > a:hover + ul{
            display: block;
        }

        #navi > li > ul:hover {
           display: block;
        }

        #navi a:hover{
            font-size: 18px;
            color: red;
        }

        #navi > li > ul > li > a{
            position: relative; 
            font-weight: bold;
            font-size : 14px; 
            background-color: rgba(226, 86, 86, 0.452);
            height: 40px;
            padding-bottom: 7px; 
        }
        #navi > li > ul a:hover{font-size : 14px;}
    </style>
</head>
<body>
			<!-- 비로그인  -->
	<%if(loginUser == null) {%>
		<div id="login_join">
	        <a href="<%=contextPath%>/views/member/memberLoginForm.jsp">로그인</a>
	        <a href="<%=contextPath%>/views/member/memberEnrollForm.jsp">회원가입</a>
	    </div>
    <%}else{ %>
	    	<!-- 로그인시 -->
    	<div id="login_join">
    		<% if(!loginUser.getUserId().equals("admin")) {%>
	        <a href="<%=contextPath%>/views/member/myPage.jsp">마이페이지</a>
	        <% } else {%>
	        <a href="<%=contextPath%>/main.admin">관리자페이지</a>
	        <% } %>
	        <a href="<%=contextPath%>/logout">로그아웃</a>
	        <p><%=loginUser.getNickName()%>님 환영합니다!</p>
	    </div>
	 <%} %>
	 
	    <div id="logotop">
	        <a href="<%=contextPath%>">아시아를 한눈에 하나로</a>
	    </div>
	    <div id="logolow">
	        <a href="<%=contextPath%>">아시<b>하</b>나</a>
	    </div>
	    <div id="menubar">
	        <ul id="navi">
	            <li>
	                <a href="#">살펴보기</a>
	                <ul>
	                    <li><a href="<%=contextPath%>/story.info?currentPage=1">여행스토리</a></li>
	                    <li><a href="<%=contextPath%>/main.info">여행정보</a></li>
	                </ul>
	            </li>
	            <li>
	                <a href="<%=contextPath%>/travelReviewMain">여행기</a>
	            </li>
	            <li>
	                <a href="<%=contextPath%>/planMain.plan">여행플랜</a>
	            </li>
	            <li>
	                <a href="<%=contextPath%>/commu.List">커뮤니티</a> 
	            </li>
	            <li>
	                <a href="<%=contextPath%>/customer.customer">고객센터</a>
	                <ul>
	                    <li><a href="<%=contextPath%>/notice.customer?currentPage=1">공지사항</a></li>
	                    <li><a href="<%=contextPath%>/faq.customer">FAQ</a></li>
	                    <li><a href="<%=contextPath%>/qa.customer?currentPage=1">Q & A</a></li>
	                </ul>
	            </li>
	        </ul>
	    </div>
    <script>
    
		const msg = '<%= alertMsg %>';
		
		if(msg != 'null'){
			alert(msg);
			<% session.removeAttribute("alertMsg"); %>
		};
	</script>

</body>
</html>