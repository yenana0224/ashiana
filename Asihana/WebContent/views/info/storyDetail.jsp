<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.semi.info.model.vo.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     

<%
	StoryFile s = (StoryFile)request.getAttribute("story");
	int pageNo = (int)request.getAttribute("pageNo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
        .outer{
            width: 1200px;
            margin : auto;
            margin-bottom : 100px;
        }

        .main{
            width : 1000px;
            margin : auto;
        }
        
        .title{
        	width : 1000px;
        	height : auto;
        	margin-top : 60px;
        }

        .title>p{
            font-size : 25px;
            font-weight: bold;
            text-align: center;
        }

        .createDate>p{
            color : darkgray;
            font-size : 15px;
            text-align: right;
            padding-right: 20px;
        }

        .photo{
            width: 100%;
            height : 400px;
        }

        .photo>img{
            width: 100%;
            height: 100%;
        }

        .content-area{
            width: 100%;
            height: auto;
        }

        .content-area>pre{
            padding : 0px;
            font-size : 18px;
            font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
            white-space: pre-wrap;
        }

        .from-area{
            width: 100%;
            height: 20px;
            text-align: right;
        }

        .btn{
            width: 100%;
            height: auto;
            text-align: center;
            margin : 50px 0px 20px 0px;
        }

        .btn>a{
            text-decoration: none;
            color : white;
            background-color: #ff595e;
            border-radius: 10px;
            padding : 5px 10px 5px 10px;
            margin-right: 20px;
        }

    </style>
</head>
<body>
	<jsp:include page="../common/headerbar.jsp"/>
	<c:set var="path" value="${ pageContext.request.contextPath }" />
	
    <div class="outer">
        <div class="main">

            <div class="title">
                <p>${ story.storyTitle }</p>
            </div>
            <div class="createDate">
                <p>${ story.createDate }</p>
            </div>

            <div class="photo">
                <img src="${ path }${ story.filePath }/${ story.changeName }">
            </div>

            <div class="content-area">
                <pre>
  ${ story.storyContent }
                </pre>
            </div>

            <div class="from-area">
            	<c:if test="${ not empty story.storyFrom }">
	                <p>출처 : ${ story.storyFrom } </p>
            	</c:if>
            </div>

            <div class="btn">
            
            <c:choose>
            	<c:when test="${ empty loginUser || loginUser.userId eq 'admin'}">
	    		    <a href="${ path }/story.info?currentPage=${ pageNo }">목록으로</a>
            	</c:when>
            	<c:otherwise>
    			<a href="${ path }/story.info?currentPage=${ pageNo }">목록으로</a>
    			<a href="${ path }.storyUpdateForm.admin?storyNo=${ story.storyNo }">수정하기</a>
            	</c:otherwise>
            </c:choose>
            </div>
        </div>
    </div>
    
	<jsp:include page="../common/footer.jsp" />
</body>
</html>