<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

        .titlePhoto{
        	width : 1000px;
        	height : 500px;
        	border : 1px solid darkgray;
        	margin: auto;
            margin-bottom: 20px;
        }
        
        .titlePhoto>img{
            width: 100%;
            height: 100%;
        }

        .photo{
            width: 400px;
            height: 400px;
            border : 1px solid darkgray;
            border-radius: 10px;
            margin: auto;
            margin-bottom: 30px;
        }

        .photo>#nationPhoto{
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
            focus : 
        }
        
       input:focus, textarea:focus{
            border : none;
            outline: none;
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
        
        #backBtn, #delBtn{
        	margin-bottom : 50px;
        }
        

    </style>
</head>

<body>

	<jsp:include page="adminbar.jsp"/>

    <div class="outer">
        <div class="title">
            <h2>국가/도시정보</h2>
            <h3>국가정보 </h3>
        </div>
        <div class="titlePhoto">
        	<c:if test="${ not empty title }">
	            <img id="titlePhoto" src="${ path }${ title.filePath }/${ title.changeName }">
        	</c:if>
        </div>

        <div class="photo">
        	<c:if test="${ not empty file }">
	            <img id="nationPhoto" src="${ path }${ file.filePath }/${ file.changeName }">
        	</c:if>
        </div>
    
        <form action="nationUpdateForm.admin" method="post">
        	<input type="hidden" name="nationNo" value="${ nation.nationNo }">
            <div class="info-area"><input type="text" name="nationName" value="${ nation.nationName }" readonly></div>
            <div class="info-area"><textarea name="nationContent" cols="30" rows="10" style="resize: none;" readonly>${ nation.nationContent }</textarea></div>
            <div class="info-area"><input type="text" name="visa" value="${ nation.visaName }" readonly></div>
            <div class="info-area"><input type="text" name="voltage" value="${ nation.voltage }" readonly></div>
            <div class="info-area"><input type="text" name="currency" value="${ nation.currency }" readonly></div>
            <div class="info-area"><input type="text" name="language" value="${ nation.language }" readonly></div>

            <div class="btn">
            	<button type="submit" id="updateBtn"> 수정하기 </button>
            </div>
        </form>
        
		<div class="btn">
        	<button id="backBtn"> 목록으로 </button>
        </div>
        
       
        <div class="btn">
        	<button id="delBtn"> 삭제하기 </button>
        </div>
        
        <script>
        $('#backBtn').click(function(){
        	location.href="${ path }/info.admin?currentPage=1";
        })
        
        $('#delBtn').click(function(){
        	location.href="${ path }/deleteNation.admin?nationNo=${ nation.nationNo }";
        })
        </script>

    </div>

</body>
</html>