<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

        .main{
            width : 1000px;
            margin : auto;
        }

        .story {
            width: 900px;
            height: auto;
            margin : auto;
            padding : 20px 10px 20px 10px;
            background-color: white;
            border : 1px solid blue;
        }

        .storyphoto{
            width: 900px;
            height: 300px;
            margin : auto;
            border : 1px solid red;
        }

        .storyphoto>img{
            width: 100%;
            height: 100%;
        }

        .content{
            width: 900px;
            height: 150px;
            margin : auto;
            border : 1px solid black;
        }

        .title{
            margin: 0px;
            padding : 0px;
            width: 100%;
            height: 120px;
            border : 1px solid yellowgreen;
        }

        .title>p{
            border : 1px solid black;
            margin-top : 20px;
            padding : 20px 0px 20px 0px;
            width: 100%;
            line-height: 100%;
            font-weight: bold;
            font-size : 25px;
            text-align: center;
        }

        .createDate{
            margin: 0px;
            padding : 0px;
            width: 100%;
            height: 30px;
            text-align: right;
            color : darkgray;
            border : 1px solid orchid;
        }

        .createDate>p{
            border : 1px solid black;
            margin : 0px;
            padding : 5px 20px 0px 0px;
            width: auto;
            line-height: 100%;
            font-size : 16px;
            text-align: right;
        }

        .btn{
            margin: 20px;
            padding : 5px 10px 5px 10px;
            width: auto;
            float : right;
            background-color: #ff595e;
            border-radius: 10px;
        }

        .btn>a{
            display : block;
            text-decoration: none;
            color : white;
        }

</style>
</head>
<body>

<%@ include file="../common/headerbar.jsp" %>
    <div class="outer">

        <div class="main">
            <div class="story">
                <div class="storyphoto">
                    <img src="" alt="">
                </div>
                <div class="content">
                    <div class="title"><p>이곳에서는 이런게 유명해요 꼭 가보기!</p></div>
                    <div class="createDate"><p>2024/03/15</p></div>
                    </div>
                </div>
            </div>

        </div>
    </div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>