<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	
	<%@ page import="java.util.ArrayList , com.kh.semi.customer.model.vo.Notice , com.kh.semi.pageInfo.model.vo.PageInfo
				 , java.util.List" %>    
	
	<%
	List<Notice> noticeList = (ArrayList<Notice>)request.getAttribute("noticeList");
	PageInfo pi = (PageInfo)request.getAttribute("pageInfo");
	//페이징바 만들 떄 필요한 변수 미리 세팅
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>친구</title>
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

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
	integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
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

#login-form {
	background-color: rgb(247, 240, 233);
}

.table {
	width: 1000px;
	margin: auto;
	text-align: center;
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
</style>

</head>
<body>

	<%@ include file="../common/headerbar.jsp"%>

	<%
		String userId = loginUser.getUserId();
	%>
	<div id="noticetext">
		<p>팔로우</p>
	<div id = "searchtext">
	<input class="form-control" id="myInput" type="text" placeholder="Search..">
	</div>
	</div>
	
	<br>
	<div>
	<!--  
		<table class="table">
			<thead class="thead-light">
				<tr>
					<th>닉네임</th>
					<th>여행기 바로가기</th>
					<th>여행플랜 바로가기</th>
					<th>팔로우 하기</th>
					<th>팔로우 취소</th>

				</tr>
			</thead>
			<tbody id="myTable">
				<tr>
					<td>John</td>
					<td><i class="fas fa-cloud"></i></td>
					<td><i class="fas fa-coffee"></i></td>
					<td><i class="fas fa-file"></i></td>
					<td><i class="fas fa-bars"></i></td>
				</tr>
				<tr>
					<td>Mary</td>
					<td><i class="fas fa-cloud"></i></td>
					<td><i class="fas fa-coffee"></i></td>
					<td><i class="fas fa-file"></i></td>
					<td><i class="fas fa-bars"></i></td>
				</tr>
				<tr>
					<td>July</td>
					<td><i class="fas fa-cloud"></i></td>
					<td><i class="fas fa-coffee"></i></td>
					<td><i class="fas fa-file"></i></td>
					<td><i class="fas fa-bars"></i></td>
				</tr>
				<tr>
					<td>Kelly</td>
					<td><i class="fas fa-cloud"></i></td>
					<td><i class="fas fa-coffee"></i></td>
					<td><i class="fas fa-file"></i></td>
					<td><i class="fas fa-bars"></i></td>
				</tr>
			</tbody>
		</table>
		 -->
		 <table class="table">
			<thead class="thead-light">
				<tr>
					<th>닉네임</th>
					<th>여행기 바로가기</th>
					<th>여행플랜 바로가기</th>
					<th>팔로우 하기</th>
					<th>팔로우 취소</th>
				</tr>
			</thead>
			<% if(list.isEmpty()){ %>
			 <tr>
          		<td colspan="6"  style="color: #ff52a0;" id="">조회된 게시글이없습니다.</td>
             </tr>
              <% }else{ %>
			<tbody id="myTable">
				<tr>
					<td>John</td>
					<td><i class="fas fa-cloud"></i></td>
					<td><i class="fas fa-coffee"></i></td>
					<td><i class="fas fa-file"></i></td>
					<td><i class="fas fa-bars"></i></td>
				</tr>
			 </tbody>
			</table>
		<br><br><br><br><br>
	</div>
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