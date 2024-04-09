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

        .nationList{
            border-top : 1px solid lightgray;
            border-collapse: collapse;
            width: 80%;
            margin : auto;
            margin-top : 20px;
            
        }

        .btn{
            width: 80%;
            margin: auto;
            margin-top: 10px;
        }

        .nationList th{
            background-color: lightgray;
            border-bottom: 1px solid lightgray;
        }

        .nationList tbody tr:hover{
            .nationName {
                text-decoration: underline;
                cursor : pointer;
            }
        }
        
        .nationList tbody td{
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
        	display : block;
            text-decoration: none;
            color : white;
            background-color: #ff595e;
            border-radius: 10px;
            padding : 5px 10px 5px 10px;
            margin: 0px 5px 10px 0px;
            float : left;
        }
        
       .paging-area{
      		margin-top : 20px;
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
            <h2>국가/도시정보</h2>
            <h3>국가목록</h3>
        </div>

        <div class="search">
            <form action="info.admin" method="get">
                <select name="category">
                    <option value="nation">국가</option>
                </select>
                <input type="text" name="keyword">
                <input type="hidden" name="currentPage" value="${ pageInfo.currentPage }">
                <button type="submit">검색</button>
            </form>
        </div>

            <table class="nationList">
                <thead>
                    <tr>
                        <th>국가번호</th>
                        <th>국가이름</th>
                    </tr>
                </thead>
                <tbody>
                	<c:choose>
                		<c:when test="${ empty list }">
	                        <tr>
	                            <td colspan="2"> 게시글이 없습니다</td>
	                        </tr>
                		</c:when>
                		<c:otherwise>
                			<c:forEach var="nation" items="${ list }">
	                            <tr>
	                                <td>${ nation.nationNo }</td>
	                                <td class="nationName" id="${ nation.nationNo }">${ nation.nationName }</td>
	                            </tr>
                			</c:forEach>
                		</c:otherwise>
                	</c:choose>
                	
		        <script>
			        $(function(){
			        	$('.nationName').click(function(){
			        		location.href="${ path }/nationInfo.admin?nationNo=" + $(this).attr('id');
			        	});
			        })
		        </script>
	        
                </tbody>
            </table>


      	<div class="paging-area" align="center">
      	
        <c:choose>
       		<c:when test="${ not empty category }">
       			<c:if test="${ pageInfo.currentPage gt 1 }">
        			<button onclick="location.href='${ path }/info.admin?category=${ category }&keyword=${ keyword }&currentPage=${ pageInfo.currentPage - 1}'">이전</button>
       			</c:if>
       			<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" var="i" step="1">
       				<c:choose>
	       				<c:when test="${ pageInfo.currentPage ne i }">
							<button onclick="location.href='${ path }/info.admin?category=${ category }&keyword=${ keyword }&currentPage=${ i }'">${ i }</button>
	       				</c:when>
	       				<c:otherwise>
							<button style="background-color : darkgray" disabled>${ i }</button>
	       				</c:otherwise>
					</c:choose>
       			</c:forEach>
       			<c:if test="${ pageInfo.currentPage ne pageInfo.maxPage }">
			 	 	<button onclick="location.href='${ path }/info.admin?category=${ category }&keyword=${ keyword }&currentPage=${ pageInfo.currentPage + 1 }'">다음</button>
       			</c:if>
       		</c:when>
       		<c:otherwise>
       			<c:if test="${ pageInfo.currentPage gt 1 }">
	        		<button onclick="location.href='${ path }/info.admin?currentPage=${ pageInfo.currentPage - 1 }'">이전</button>
       			</c:if>
       			<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" var="i" step = "1">
       				<c:choose>
       				<c:when test="${ pageInfo.currentPage ne i }">
						<button onclick="location.href='${ path }/info.admin?currentPage=${ i }'">${ i }</button>
       				</c:when>
       				<c:otherwise>
						<button style="background-color : darkgray" disabled>${ i }</button>
       				</c:otherwise>
       				</c:choose>
       			</c:forEach>
       			<c:if test="${ pageInfo.currentPage ne pageInfo.maxPage }">
				 	 <button onclick="location.href='${ path }/info.admin?currentPage=${ pageInfo.currentPage + 1 }'">다음</button>
       			</c:if>
       		</c:otherwise>
       	</c:choose>
        
       <div class="btn">
        	<a href="${ path }/nationInsertForm.admin">국가 추가하기</a>
       </div>

    </div>
</body>
</html>