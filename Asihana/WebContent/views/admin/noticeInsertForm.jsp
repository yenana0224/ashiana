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

        .form-area{
            width: 600px;
            height: auto;
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

        .check-area>input{
            border : 1px solid red;
            width: auto;
            text-align: left;
        }

        .check-area>label{
            display: inline-block;
            font-size: 13px;
            height: auto;
            margin: 3px 3px 3px 0px;
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
            <h2>공지사항</h2>
            <h3>공지사항등록</h3>
        </div>

        <div class="form-area">
            <form action="<%=contextPath %>/noticeInsert.customer" method="post" enctype="multipart/form-data">
            	<input type="hidden" name="userNo" value="<%= loginUser.getUserNo() %>">
                <div class="title-area">
                    <input class="input-area" type="text" placeholder="제목을 입력해주세요" name="title"> 
                </div>
                <div class="content-area" >
                    <textarea class="input-area" name="content" cols="30" rows="20" style="resize: none;"></textarea>
                </div>

                <div class="fileAt">
                    <input type="file" name="noticeFile">
                </div>

                <div class="check-area">
                    <input type="checkbox" name="hold" value="Y"> <label>상단고정</label>
                </div>

                <div class="btn">
                    <button type="submit"> 등록 </button>
                    <button>취소</button>
                </div>
                
               
            </form>
        </div>
    </div>
    
</body>
</body>
</html>