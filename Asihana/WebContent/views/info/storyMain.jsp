<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.semi.info.model.vo.*, java.util.List, com.kh.semi.pageInfo.model.vo.PageInfo" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
        
        .mainTitle{
        	width : 100%;
        	height : 40px;
        	margin : 20px 0px 20px 0px;
        	text-align : center;
        	font-size : 30px;
        	font-weight : bold;
        }

        .story .storyEmpty {
            width: 900px;
            height: auto;
            margin : auto;
            padding : 20px 10px 20px 10px;
        }
        
        .story:hover{
			cursor : pointer;        
        }

        .storyphoto{
            width: 900px;
            height: 300px;
            margin : auto;
            background-color : white;
        }

        .storyphoto>img{
            width: 100%;
            height: 100%;
        }

        .content{
            width: 900px;
            height: 150px;
            margin : auto;
            background-color : white;
        }

        .title{
            margin: 0px;
            padding : 0px;
            width: 100%;
            height: 120px;
        }

        .title>p{
            margin-top : 0px;
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
        }

        .createDate>p{
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
        
        .paging-area>button{
            text-align: center;
            padding : 5px 10px 5px 10px;
            border-radius: 10px;
            background-color: #ff595e;
            color : white;
            border : none;
            font-size : 15px;
        }

</style>
</head>
<body>

<jsp:include page="../common/headerbar.jsp"/>

	<c:set var="path" value="${ pageContext.request.contextPath }" />

    <div class="outer">

        <div class="main">
        
            <div class="mainTitle"> S T O R Y </div>
            
            <c:choose>
            	<c:when test="${ empty requestScope.list }">
		            <div class="storyEmpty">
		            	<div class="content">
		            		<div class="title"><p>등록된 게시글이 없습니다</p></div>
		            	</div>
		           	</div>
	           	</c:when>
				<c:otherwise>           	
            		<c:forEach var="s" items="${ requestScope.list }">
            		<div class="story" id="${ s.storyNo }">
		                <div class="storyphoto">
		                    <img src="${ path }${ s.filePath }/${ s.changeName }">
		                </div>
		                <div class="content">
		                	<div class="createDate"><p> ${ path }${ s.createDate } </p></div>
		                    <div class="title"><p>${ s.storyTitle }</p></div>
		                </div>
            		</div>
            		</c:forEach>
				</c:otherwise>
	      	</c:choose>
	     </div>
	      
	     <script>
        	$(function(){
        		
        		$('.story').click(function(){
        			location.href='${ path }/detailStory.info?pageNo=${ pageInfo.currentPage }&storyNo='+$(this).attr('id');
 
        		});
        	})
        </script> 
        
	       <div class="paging-area" align="center">
				<c:if test="${ pageInfo.currentPage gt 1 }">
	        		<button onclick="location.href='${ path }/story.info?currentPage=${ pageInfo.currentPage - 1 }'">이전</button>
				</c:if>
				
				<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" var="i" step = "1">
					<c:choose>
						<c:when test="${ pageInfo.currentPage ne i }">
							<button onclick="location.href='${ path }/story.info?currentPage=${i}'">${i}</button>
						</c:when>
						<c:otherwise>
							<button style="background-color : darkgray" disabled>${ i }</button>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				
				<c:if test="${ pageInfo.currentPage ne pageInfo.maxPage }">
				  <button onclick="location.href='${ path }/story.info?currentPage=${ pageInfo.currentPage + 1 }'">다음</button>
				</c:if>
				
	        </div>   
       </div>
   </div>
   
   <jsp:include page ="../common/footer.jsp"/>
   
</body>
</html>