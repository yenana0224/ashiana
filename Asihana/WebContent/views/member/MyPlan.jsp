<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import = "java.util.List, com.kh.semi.plan.model.vo.PlanMain"	%>
	 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내플랜</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
#content {
	width: 1000px;
	margin: auto;
	text-align: center;
	padding-top: 80px;
	font-size: 30px;
}

#noticetext {
	margin: auto;
	width: 1000px;
	text-align: left;
	font-size: 30px;
	font-weight: bold;
	margin-top: 50px;
}
#searchtext {
	margin: auto;
	width: 200px;
	text-align: left;
	font-size: 30px;
	font-weight: bold;
	margin-top: 50px;
	margin-right: 10px;
}

#login-form {
	background-color: rgb(247, 240, 233);
}

.table {
	width: 1000px;
	margin: auto;
	text-align: center;
}
.table-container {
    max-height: 300px; /* 최대 높이 지정 */
    overflow-y: auto; /* 세로 스크롤 생성 */
     margin: 0 auto;
     width: 1000px;
}
</style>

</head>
<body>

<jsp:include page="../common/headerbar.jsp"/>
	<c:set var="path" value="${ pageContext.request.contextPath }"/>
	
	<div id="noticetext">
		<p>My여행플랜</p>
	<div id = "searchtext">
	<input class="form-control" id="myInput" type="text" placeholder="Search..">
	</div>
	</div>
	
	
	<br>
	<div class="table-container">
		<table class="table">
			<thead class="thead-light">
				<tr>
					<th>No</th>
					<th>도시들</th>
					<th>가격</th>
					<th>여행 일정</th>
					<th>여행시작일</th>
					<th>마지막수정일</th>
				</tr>
			</thead>
			<tbody id="myTable">
			<c:choose>
				<c:when test="${ empty myPlanList}">
			        <tr>
			            <td colspan="6">내 여행계획이 없습니다.</td>
			        </tr>
				</c:when>
				<c:otherwise>
			            <c:forEach var="planMain" items="${ myPlanList }"  varStatus="loop">
			            <tr>
			   				<td><c:out value="${loop.index + 1}" /></td>
			                <td><a href="#">${planMain.planCitys  }</a></td>
			                <td><a href="#">${planMain.totalPrice }</a></td>
			                <td><a href="#">${planMain.travelDate}</a></td>
			                <td><a href="#">${planMain.startDate }</a></td>
			                <td><a href="#">${planMain.uploadDate}</a></td>
			            </tr>
			            </c:forEach>
			        </c:otherwise>
			        </c:choose>
			</tbody>

		</table>
		<div align="center">
         <button type="button" onclick="location.href='${path}/myTravel'">내 여행기로 가기</button>
	</div>
	</div>
	
	<br><br><br><br><br><br><br><br><br><br><br><br>
	<script>
		$(document).ready(function(){
		  $("#myInput").on("keyup", function() {
		    var value = $(this).val().toLowerCase();
		    $("#myTable tr").filter(function() {
		      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
		    });
		  });
		});
	</script>

	<jsp:include page="../common/footer.jsp"/>

</body>
</html>