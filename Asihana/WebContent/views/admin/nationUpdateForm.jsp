<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.semi.info.model.vo.*, com.kh.semi.common.*"%>
<%
	Nation nation = (Nation)request.getAttribute("nation");
	AttachmentFile title = (AttachmentFile)request.getAttribute("title");
	AttachmentFile file = (AttachmentFile)request.getAttribute("file");
%>
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
        
        label{
            font-size: 14px;
            font-weight: bold;
            margin : 0px;
        }
        

    </style>
</head>

<body>
	<%@ include file="adminbar.jsp" %>
	
	    
    <div class="outer">

        <div class="title">
            <h2>국가/도시정보</h2>
            <h3>국가정보수정</h3>
        </div>
       
        <div class="titlePhoto">
        	<% if(title != null) { %>
            <img id="titlePhoto" src="<%=contextPath %>/<%=title.getFilePath() %>/<%=title.getChangeName() %>">
            <% } %>
        </div>

        <div class="photo">
        	<% if(file != null) { %>
            <img id="nationPhoto" src="<%=contextPath %>/<%=file.getFilePath() %>/<%=file.getChangeName() %>">
            <% } %>
        </div>
    
        <form action="nationUpdate.admin" method="post" enctype="multipart/form-data">
        	<input type="hidden" name="nationNo" value="<%=nation.getNationNo() %>">
            <div class="info-area"><input type="text" name="nationName" value="<%=nation.getNationName() %>"></div>
            <div class="info-area"><textarea name="nationContent" cols="30" rows="10" style="resize: none;"><%=nation.getNationContent() %></textarea></div>
            <div class="info-area"><input type="text" name="voltage" value="<%=nation.getVoltage() %>"></div>
            <div class="info-area"><input type="text" name="visa" value="<%=nation.getVisaName() %>"></div>
            <div class="info-area"><input type="text" name="language" value="<%=nation.getLanguage() %>"></div>
            <div class="info-area"><input type="text" name="currency" value="<%=nation.getCurrency() %>"></div>
			
			<div class="info-area">
                <label>도시사진변경</label>
                <div class="btn"><input type="file" name="newTitleFile" onchange="loadImg(this, 1);"> </div>
			    <div class="btn"><input type="file" name="newFile" onchange="loadImg(this, 2);"> </div>
            </div>
            
            <div class="btn">
            	<button type="submit" id="updateBtn"> 확인 </button>
            </div>
        </form>
        
		<div class="btn">
        	<button id="backBtn"> 목록으로 </button>
        </div>
        
        <script>
        $('#backBtn').click(function(){
        	location.href="<%=contextPath %>/info.admin?currentPage=1";
        })
        
        function loadImg(inputFile, num){
        	
        	if(inputFile.files.length){
        		const reader = new FileReader();
        		reader.readAsDataURL(inputFile.files[0]);
        		reader.onload = function(e){
        			
        			switch(num){
        			case 1 : $('#titlePhoto').attr('src', e.target.result); break; 
        			case 2 : $('#nationPhoto').attr('src', e.target.result); break;
        			}
        			
        		}
        	};
        }
        </script>

    </div>

</body>
</html>