<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        
        .storyPhoto{
        	width : 600px;
        	height : 200px;
        	border : 1px solid darkgray;
        	margin : auto;
        }
        
        #titlePhoto{
        	width : 100%;
        	height : 100%;
        }

        .form-area{
            width: 600px;
            height: auto;
            margin: auto;
        }

       .title-area, .content-area, .fileAt, .check-area {
            padding : 5px 10px 5px 10px;
            margin: auto;
            margin-top : 10px;
            width: 90%;
            height: auto;
            border : 1px solid darkgray;
            border-radius: 10px;
        }

        input, textarea {
            border : none;
            width: 100%;
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
            <h2>여행스토리</h2>
            <h3>여행스토리등록</h3>
        </div>
        
        <div class="storyPhoto">
        	<img id="titlePhoto" src="">
        </div>

        <div class="form-area">
            <form action="<%=contextPath %>/storyInsert.admin" method="post" enctype="multipart/form-data">
            	<input type="hidden" name="board" value="7">
            	
                <div class="title-area">
                    <input type="text" placeholder="제목을 입력해주세요" name="title" required> 
                </div>
                
                <div class="content-area" >
                    <textarea name="content" cols="30" rows="20" style="resize: none;" required></textarea>
                </div>
                
                <div class="content-area" >    
                    <input type="text" placeholder="출처" name="from"> 
                </div>

                <div class="fileAt">
                    <input type="file" name="storyFile" onchange="loadImg(this)" required>
                </div>
                
                <div class="btn">
                    <button type="submit"> 등록 </button>
                </div>
                
            </form>
            
            <div class="btn">
            	 <button id="back">취소</button>
            </div>
        </div>
        
       		<script>
             	$('#back').click(function(){
             		
             		location.href="<%=contextPath%>/story.admin?currentPage=1";
             	});
             
                function loadImg(inputFile){
                    if(inputFile.files.length){
                        const reader = new FileReader();
                        reader.readAsDataURL(inputFile.files[0]);
                        reader.onload = function(e){
                            $('#titlePhoto').attr('src', e.target.result);
	                        }
	                    }
	            }
            </script>
    </div>
    
</body>
</body>
</html>