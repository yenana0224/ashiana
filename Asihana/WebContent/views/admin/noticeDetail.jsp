<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
	<jsp:include page="adminbar.jsp"/>
	
    <div class="outer">
        
        <div class="title">
            <h2>공지사항</h2>
            <h3>공지사항조회</h3>
        </div>

        <div class="form-area">
            <form action="${ path }/noticeUpdateForm.admin" method="post">
            	<input type="hidden" name="userNo" value="${ loginUser.userNo }">
            	<input type="hidden" name="noticeNo" value="${ notice.noticeNo }">
            	
                <div class="title-area">
                    <input type="text" name="title" value="${ notice.noticeTitle }" readonly> 
                </div>
                <div class="content-area">
                    <textarea name="content" cols="30" rows="20"  style="resize: none;" readonly>${ notice.noticeContent }</textarea>
                </div>

                <div class="fileAt">
                    <input type="file" name="noticeFile">
                    <c:if test="${ not empty noticeFile }">
                    	첨부파일 : <label>${ noticeFile.orginName }</label>
                    	<input type="hidden" name="fileNo" value="${ noticeFile.fileNo }">
                    </c:if>
                </div>

                <div class="check-area">
                	<c:choose>
                		<c:when test="${ notice.noticeHold eq 'Y' }">
		                    <input type="checkbox" name="hold" checked disabled> <label>상단고정</label>
                		</c:when>
                		<c:otherwise>
		                    <input type="checkbox" name="hold" disabled> <label>상단고정</label>
                		</c:otherwise>
                	</c:choose>
                </div>
           
                <div class="btn">
                    <button type="submit"> 수정하기 </button>
                </div>
            </form>
            	<div class="btn">
                    <button onclick="location.href='${ path }/notice.admin?currentPage=1'"> 목록으로 </button>
            	</div>
        </div>
    </div>

</body>
</html>