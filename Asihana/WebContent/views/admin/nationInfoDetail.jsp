<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
            width: 400px;
            height: 400px;
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
 

        .btn{
            margin-top: 20px;
            text-align: center;
        }

        button {
            text-decoration: none;
            color : white;
            background-color: #ff595e;
            border : none;
            border-radius: 10px;
            padding : 5px 10px 5px 10px;
        }

        button:hover{
            cursor : pointer;
        }

    </style>
</head>

<body>
	<%@ include file="adminbar.jsp" %>
	
	    
    <div class="outer">

        <div class="title">
            <h2>국가/도시정보</h2>
            <h3>국가정보 </h3>
        </div>
       
        <div class="photo">
            <img src="https://pbs.twimg.com/profile_images/1615738154333667331/NTng-9ke_400x400.jpg" alt="">
        </div>
    
        <form action="#" method="post">
            <div class="info-area"><input type="text" name="nationName" readonly></div>
            <div class="info-area"><textarea name="nationContent" cols="30" rows="10" style="resize: none;" readonly></textarea></div>
            <div class="info-area"><input type="text" name="voltage" readonly></div>
            <div class="info-area"><input type="text" name="visa" readonly></div>
            <div class="info-area"><input type="text" name="language" readonly></div>
            <div class="info-area"><input type="text" name="currency" readonly></div>

            <div class="btn">
            <button type="submit" id="updateBtn"> 수정하기 </button>
            </div>
        </form>

        <button type="submit" id="backBtn"> 수정하기 </button>

    </div>

</body>
</html>