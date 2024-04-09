<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
        
        #backBtn{
        	margin-bottom : 50px;
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

	<jsp:include page="adminbar.jsp"/>
    
    <div class="outer">
        <div class="title">
            <h2>국가/도시정보</h2>
            <h3>도시정보변경 </h3>
        </div>
       
        <div class="photo">
        	<c:if test="${ not empty file }">
	            <img id="cityPhoto" src="${ path }${ file.filePath }/${ file.changeName }">
        	</c:if>
        </div>
        
        <form action="cityUpdate.admin" method="post" enctype="multipart/form-data">
            <input type="hidden" name="cityNo" value="${ city.cityNo }">
            <div class="info-area">
            	<select name="nationNo">
            		<c:forEach var="nation" items="${ list }">
            			<c:choose>
            				<c:when test="${ nation.nationNo ne nationNo }">
            					<option value="${ nation.nationNo }">${ nation.nationName }</option>
            				</c:when>
            				<c:otherwise>
            					<option value="${ nation.nationNo }" selected>${ nation.nationName }</option>
            				</c:otherwise>
            			</c:choose>
            		</c:forEach>
                </select>
            </div>
            <div class="info-area"><input type="text" name="cityName" value="${ city.cityName }"></div>
            <div class="info-area"><textarea name="cityContent" cols="30" rows="10" style="resize: none;">${ city.cityContent }</textarea></div>
            <div class="info-area"><input type="text" name="flyingTime" value="${ city.flyingTime }"></div>
            <div class="info-area">
                <label>도시사진변경</label>
			    <div class="btn"><input type="file" name="newFile" onchange="loadImg(this);"> </div>
            </div>
            
            <div class="btn">
                <button type="submit" id="updateBtn"> 확인 </button>
            </div>
        </form>

        <div class="btn">
            <button type="submit" id="backBtn"> 목록으로 </button>
        </div>
        <script>
            $('#backBtn').click(function(){
                location.href="${ path }/nationCityList.admin?currentPage=1";
            });
            
            function loadImg(inputFile){
        	
	        	if(inputFile.files.length){
	        		const reader = new FileReader();
	        		reader.readAsDataURL(inputFile.files[0]);
	        		reader.onload = function(e){
	        		
	        		$('#cityPhoto').attr('src', e.target.result);
	        		}
        		};
        	};

        </script>
    </div>
</body>
</html>