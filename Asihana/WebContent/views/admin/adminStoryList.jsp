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

        .search{
            margin : 0px 0px 10px 0px;
            display : block;
            width:100%;
            height: auto;
            text-align: center;
        }

        .search select{
            font-size: medium;
        }

        .search button {
            text-align: center;
            padding : 5px 10px 5px 10px;
            border-radius: 10px;
            background-color: #ff595e;
            color : white;
            border : none;
            font-size : 15px;
        }
        
        #countTitle{
        	width: 80%;
        	text-align : center;
            margin : auto;
            margin-bottom : 20px;
            font-size : 14px;
        }

        .storyList{
            border-top : 1px solid lightgray;
            border-collapse: collapse;
            width: 80%;
            margin : auto;
        }

        .btn{
            width: 80%;
            margin: auto;
            margin-top: 10px;
        }

        .storyList th{
            background-color: lightgray;
            border-bottom: 1px solid lightgray;
        }

        .storyList tbody tr:hover{
            .storyTitle {
                text-decoration: underline;
                cursor : pointer;
            }
        }
        
        .storyList tbody td{
        	text-align : center;
        	border-bottom: 1px solid lightgray;
        	padding : 5px 0px 5px 0px;
        }
        
        .btn>button{
        	border : none;
        	background-color: #ff595e;
        	color : white;
        	padding : 5px 10px 5px 10px;
        	border-radius: 10px;
        }

        .btn>a{
            text-decoration: none;
            color : white;
            background-color: #ff595e;
            border-radius: 10px;
            padding : 5px 10px 5px 10px;
            margin-right: 20px;
            float : right;
        }
        
       .paging-area{
      		margin-top : 20px;
      		margin-bottom : 20px;
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
        
        .paging-area>button:hover{
        	cursor : pointer;
        }


    </style>
</head>
<body>

	<jsp:include page="adminbar.jsp"/>
    <div class="outer">

        <div class="title">
            <h2>여행스토리</h2>
            <h3>여행스토리목록</h3>
        </div>

        <div class="search">
            <form action="story.admin" method="get">
                <select name="category">
                    <option value="title">제목</option>
                    <option value="content">내용</option>
                </select>
                <input type="text" name="keyword">
                <input type="hidden" name="currentPage" value="${ pageInfo.currentPage }">
                <button type="submit">검색</button>
            </form>
        </div>

        <form action="storyDel.admin" name="status">
        	<c:if test="${ not empty category }">
	        	<h6 id="countTitle"> 검색결과 : ${ count }개의 게시글이 조회되었습니다</h6>
        	</c:if>

            <table class="storyList">
                <thead>
                    <tr>
                        <th> <input type="checkbox" name="storyNo" id="checkAll"></th>
                        <th>글번호</th>
                        <th>제목</th>
                        <th>작성일</th>
                    </tr>
                </thead>
                <tbody>
                	<c:choose>
                		<c:when test="${ empty list }">
	                        <tr>
	                            <td colspan="4"> 게시글이 없습니다</td>
	                        </tr>
                		</c:when>
                		<c:otherwise>
                			<c:forEach var="story" items="${ list }">
                				<tr>
                					<td><input class="ckOne" type="checkbox" name="storyNo" value="${ story.storyNo }"></td>
                					<td>${ story.storyNo }</td>
                					<td class="storyTitle" id="${ story.storyNo }">${ story.storyTitle }</td>
                					<td>${ story.createDate }</td>
                				</tr>
                			</c:forEach>
                		</c:otherwise>
                	</c:choose>
                	
                	<script>
                    	$(function(){
                    		$('#checkAll').click(function(){
                    			if($('#checkAll').prop('checked')){
	                    			$('.ckOne').prop('checked', true);
                    			} else {
                    				$('.ckOne').prop('checked', false);
                    			}
                    		});
                    		
                    		$('#checkAll').on('change', function(){
	                    		if($(this).prop('checked') == false){
	                    			$('#checkAll').prop('checked', false);
	                    		}
                    		});
                    	})
                    </script>
                	
                </tbody>
            </table>
            <div class="btn">
                선택 게시물 
                <input type="hidden" name="boardType" value="7">
                <button type="submit">삭제</button>
            </div>
        </form>
        
       <div class="paging-area" align="center">
       
        <c:choose>	
       		<c:when test="${ not empty category }">
       			<c:if test="${ pageInfo.currentPage gt 1 }">
        			<button onclick="location.href='${ path }/story.admin?category=${ category }&keyword=${ keyword }&currentPage=${ pageInfo.currentPage - 1}'">이전</button>
       			</c:if>
       			<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" var="i" step="1">
       				<c:choose>
	       				<c:when test="${ pageInfo.currentPage ne i }">
							<button onclick="location.href='${ path }/story.admin?category=${ category }&keyword=${ keyword }&currentPage=${ i }'">${ i }</button>
	       				</c:when>
	       				<c:otherwise>
							<button style="background-color : darkgray" disabled>${ i }</button>
	       				</c:otherwise>
       				</c:choose>
       			</c:forEach>
       			<c:if test="${ pageInfo.currentPage ne pageInfo.maxPage }">
			 	 	<button onclick="location.href='${ path }/story.admin?category=${ category }&keyword=${ keyword }&currentPage=${ pageInfo.currentPage + 1 }'">다음</button>
       			</c:if>
       		</c:when>
       		<c:otherwise>
       			<c:if test="${ pageInfo.currentPage gt 1 }">
	        		<button onclick="location.href='${ path }/story.admin?currentPage=${ pageInfo.currentPage - 1 }'">이전</button>
       			</c:if>
       			<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" var="i" step = "1">
       				<c:choose>
	       				<c:when test="${ pageInfo.currentPage ne i }">
							<button onclick="location.href='${ path }/story.admin?currentPage=${ i }'">${ i }</button>
	       				</c:when>
	       				<c:otherwise>
							<button style="background-color : darkgray" disabled>${ i }</button>
	       				</c:otherwise>
       				</c:choose>
       			</c:forEach>
       			<c:if test="${ pageInfo.currentPage ne pageInfo.maxPage }">
				 	 <button onclick="location.href='${ path }/story.admin?currentPage=${ pageInfo.currentPage + 1 }'">다음</button>
       			</c:if>
       		</c:otherwise>
       	</c:choose>

        </div>

		<div class="btn">
        	<a href="${ path }/storyInsertForm.admin">글작성하기</a>
        </div>
        
        <script>
        $(function(){

        	$('.storyTitle').click(function(){
        		location.href="${ path }/storyDetail.admin?storyNo=" + $(this).attr('id');
        	});
        	
        })
        </script>

    </div>
</body>
</html>