<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	
import = "java.util.ArrayList, com.kh.semi.travelReview.model.vo.TravelReview"	%>
	<%ArrayList<TravelReview> list = (ArrayList<TravelReview>)request.getAttribute("othersTravelList"); 
	Member m = (Member)request.getAttribute("member");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 여행기</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
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

	<%@ include file="../common/headerbar.jsp"%>


	<div id="noticetext">
		<p><%=m.getNickName() %>여행기</p>
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
					<th>제목</th>
					<th>상태</th>
					<th>도시</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody id="myTable">
			    <% if (list.isEmpty()) { %>
			        <tr>
			            <td colspan="5">내 여행기가 없습니다.</td>
			        </tr>
			    <% } else { %>
			        <% int rowNumber = 1; %>
			        <% for (TravelReview travelReview : list) { %>
			            <%
			            int reviewNo = travelReview.getReviewNo(); 
			            String reviewTitle = travelReview.getReviewTitle(); 
			            String cityName = travelReview.getCityName(); 
			            String departureDate = travelReview.getDepartureDate(); 
			            int count = travelReview.getCount(); 
			            String nickName = travelReview.getNickName();
			            %>
			            <tr>
			                <td><%= rowNumber %></td>
			                <td><a href="#"><%= reviewTitle %></a></td>
			                <td><a href="#"><%= cityName %></a></td>
			                <td><a href="#"><%= departureDate %></a></td>
			                <td><a href="#"><%= count %></a></td>
			            </tr>
			            <% rowNumber++; %>
			        <% } %>
			    <% } %>
			</tbody>

		</table>
			
			<!--
			<tbody id="myTable">
				<tr>
					<td>1</td>
					<td>핀란드여행기</td>
					<td>2023.11.15</td>
					<td>30</td>
				</tr>
				<tr>
					<td>2</td>
					<td>중국여행기</td>
					<td>2024.1.15</td>
					<td>32</td>
				</tr>
				<tr>
					<td>3</td>
					<td>태국여행기</td>
					<td>2023.11.05</td>
					<td>23</td>
				</tr>
				<tr>
					<td>4</td>
					<td>미국여행기</td>
					<td>2023.11.25</td>
					<td>10</td>
				</tr>
			</tbody>
		</table>
		-->
	<div align="center">
         <button type="button" onclick="location.href='<%=contextPath%>/views/member/MyPlan.jsp'">플랜으로 가기</button>
	</div>
	</div>

	<br><br><br>
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

	<%@ include file="../common/footer.jsp"%>



</body>
</html>