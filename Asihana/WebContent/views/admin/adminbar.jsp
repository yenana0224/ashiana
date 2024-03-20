<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            float : top;
            width: 78%;
            height: 1000px;
            margin : auto;
            padding : 30px 30px 0px 15%;
            border : 1px solid blue;
        }


    </style>
</head>
<body>
    <div class="sidebar">
        <h2>관리자페이지</h2>
        <ul class="adminMenu">
            <ul class="menu"> 메뉴 관리
                <li><a href="#">공지사항</a></li>
                <li><a href="#">여행스토리</a></li>
                <li><a href="#">여행정보</a></li>
            </ul>
            <ul class="menu"> 회원 관리
                <li><a href="#">전체 회원 조회</a></li>
                <li><a href="#">탈퇴 회원 조회</a></li>
            </ul>
            <ul class="menu"> 문의 관리
                <li><a href="#">QNA</a></li>
            </ul>
        </ul>
        <div class="mainbtn">
            <a href="#">메인화면</a>
            <a href="#">로그아웃</a>
        </div>
    </div>

    <div class="outer">
        <h1>어깨가아프다</h1>
    </div>

</body>
</html>