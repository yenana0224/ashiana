<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.semi.info.model.vo.*"%>
<%
	City city = (City)request.getAttribute("city");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <style>

        .title{
            padding-left: 20px;
            width: 100%;
            height: 100px;
            font-weight: bold;
        }
        
        .title>h3{
        	margin-top : 10px;
        }

        .photo{
            width: 600px;
            height: 600px;
            border : 1px solid darkgray;
            border-radius: 10px;
            margin: auto;
            margin-bottom: 30px;
        }

        .photo>img{
            width: 100%;
            height: 100%;
            border-radius: 10px;
        }

        .info-area{
            width: 80%;
            height: auto;
            padding : 5px 10px 5px 10px;
            margin: auto;
            margin-top : 10px;
            border : 1px solid darkgray;
            border-radius: 10px;
            background-color: lightgray;
            margin: auto;
            margin-bottom: 8px;
        }

        input, textarea{
            border : none;
            width: 100%;
            background-color: rgba(0, 0, 0, 0);
        }
        
        input:focus, textarea:focus{
            border : none;
            outline: none;
            width: 100%;
            background-color: rgba(0, 0, 0, 0);
        }
        
       .btn{
            width: 80%;
            margin: auto;
            margin-top: 10px;
        }
        
       .btn>button{
        	border : none;
        	background-color: #ff595e;
        	color : white;
        	padding : 5px 10px 5px 10px;
        	border-radius: 10px;
        }

        .btn>a{
        	display : block;
            text-decoration: none;
            color : white;
            background-color: #ff595e;
            border-radius: 10px;
            padding : 5px 10px 5px 10px;
            margin: 0px 5px 10px 0px;
            float : left;
        }
        
        #attractionList{
            width: 80%;
            margin: auto;
            text-align: left;
            margin-bottom: 20px;

        }

    </style>
</head>
<body>
    <%@ include file="adminbar.jsp" %>
    
    <div class="outer">
        <div class="title">
            <h2>국가/도시정보</h2>
            <h3>도시정보 </h3>
        </div>
       
        <div class="photo">
            <img src="https://pbs.twimg.com/profile_images/1615738154333667331/NTng-9ke_400x400.jpg" alt="">
        </div>
        
        <div class="btn" id="attractionList">
            <button> 즐길거리 목록 </button>
        </div>
        
        <form action="#" method="post">
            <input type="hidden" name="CityNo" value="<%= city.getCityNo() %> ">
            <div class="info-area"><input type="text" name="nationName" value = "<%=city.getNationName() %>" readonly></div>
            <div class="info-area"><input type="text" name="CityName" value = "<%=city.getCityName() %>" readonly></div>
            <div class="info-area"><textarea name="CityContent" cols="30" rows="10" style="resize: none;" readonly><%=city.getCityContent() %></textarea></div>
            <div class="info-area"><input type="text" name="flyingTime" value = "<%= city.getFlyingTime() %>" readonly></div>
            <div class="btn">
                <button type="submit" id="updateBtn"> 수정하기 </button>
            </div>
        </form>

        <div class="btn">
            <button type="submit" id="backBtn"> 목록으로 </button>
        </div>
        <script>
            $('#backBtn').click(function(){
                location.href="<%=contextPath %>/nationCityList.admin?currentPage=1";
            });
            
        </script>
    </div>
</body>
</html>