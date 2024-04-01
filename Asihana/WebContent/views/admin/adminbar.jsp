<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.semi.member.model.vo.*"%>
<% 	
	String contextPath = request.getContextPath();
	Member loginUser = (Member) session.getAttribute("loginUser");
	//String alertMsg = (String) session.getAttribute("alertMsg");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>

       *{
            list-style: none;
            box-sizing: border-box;
            text-decoration: none;
            margin: 0px;
            padding: 0px;
            color : black;
        }

        .sidebar{
            position : absolute;
            z-index: 10;
            float : top;
            width : 22%;
            height: 1000px;
            background-color: white;
            border : 1px solid #ff595e;
        }

        .sidebar>ul{
            width : 100%;
            margin: 100px 0px 80px 10px;
            text-align: center;
        }

        .menu {
            font-size: 25px;
            font-weight: 900;
            margin: 20px 0px 20px 0px;

        }

        .menu>li{
            font-size : 20px;
            font-weight: 500;
            margin: 7px;
        }

        .menu>li:hover{
            font-size : 20px;
            font-weight: 500;
            margin: 7px;
            background-color : #ff595e;
        }

        a {
          text-decoration: none;
          color : black;
        }

        a:hover{
          text-decoration : none;
          color : white;
        }

        .sidebar>h2{
            font-size: 30px;
            text-align: center;
            margin: 20px 0px 20px 0px;
            color : #ff595e;
            
        }

        .mainbtn{
            width: 100%;
            text-align: center;
        }

        .mainbtn>a{
            text-align: center;
            font-size: 15px;
            font-weight: 800;
            padding : 5px 15px 5px 15px;
            color : white;
            background-color: #ff595e;
            border-radius: 10px;
            margin : 40px 12px 20px 10px;
        }

        .outer{
            position: relative;
            z-index: 1;
            float : left;
            width: 78%;
            height: 1000px;
            margin : auto;
            padding-top : 30px;
            padding-left: 25%;
            padding-right: 30px;
        }

    </style>
</head>
<body>
    <div class="sidebar">
        <h2>관리자페이지</h2>
        <ul class="adminMenu">
            <ul class="menu"> <span>메뉴 관리</span>
                <li><a href="<%=contextPath %>/notice.admin?currentPage=1">공지사항</a></li>
                <li><a href="<%=contextPath %>/story.admin?currentPage=1">여행스토리</a></li>

            </ul>
            <ul class="menu"> <span>여행정보 관리</span>
                <li><a href="<%=contextPath %>/info.admin?currentPage=1">국가정보</a></li>
                <li><a href="<%=contextPath%>/nationCityList.admin?currentPage=1">도시정보</a></li>
            </ul>  
            <ul class="menu"> <span>회원 관리</span>
                <li><a href="<%=contextPath %>/member.admin?currentPage=1">전체 회원 조회</a></li>
                <li><a href="<%=contextPath %>/notmember.admin?currentPage=1">탈퇴 회원 조회</a></li>
            </ul>
        </ul>
        <div class="mainbtn">
            <a href="<%=contextPath %>">메인화면</a>
            <a href="">로그아웃</a>
        </div>
    </div>

</body>
</html>