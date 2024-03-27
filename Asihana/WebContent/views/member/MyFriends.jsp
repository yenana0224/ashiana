<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import = "java.util.ArrayList, com.kh.semi.friendShip.model.vo.FriendShip"
	%>
	
	<%
	ArrayList<FriendShip> list = (ArrayList<FriendShip>)request.getAttribute("friendlist");
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
.table-container {
    max-height: 300px; /* 최대 높이 지정 */
    overflow-y: auto; /* 세로 스크롤 생성 */
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
	<input class="form-control" id="myInput" type="text" placeholder="닉네임 검색">
	</div>
	</div>
	
	<br>
	
	<div class="table-container">
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
				<%if(list.isEmpty()) {%>
				<tr>
					<td colspan="5"> 친구가 없습니다.</td>
				<tr>
				<%}else{ %>
				<%for(FriendShip friendShip :list){ %>
				<tr>
					<td><%=friendShip.getNickNameF()%></td>
					<td><a href="#"><i class="fas fa-cloud"></i></a></td>
					<td><a href="#"><i class="fas fa-coffee"></i></a></td>
					<td><a href="<%=contextPath%>/insert.friend" onclick="insertFriend('<%= friendShip.getUserId2() %>')"><i class="fas fa-file"></i><%= friendShip.getUserId2() %></a></td>
					<td><a href="<%=contextPath%>/delete.friend" onclick="deleteFriend('<%= friendShip.getUserId2() %>')"><i class="fas fa-bars"></i><%= friendShip.getUserId2() %></a></td>
				</tr>
				<%} %>
				<%} %>
			</tbody>
		</table>
	</div>	 
		<br><br><br><br><br>
	
	<script>
		$(document).ready(function(){
		  $("#myInput").on("keyup", function() {
		    var value = $(this).val().toLowerCase();
		    $("#myTable tr").filter(function() {
		      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
		    });
		  });
		});
		
		
	function insertFriend(userId){
		   if (userId !== null) {
		        $.ajax({
		            url: 'insert.friend',
		            type: 'post',
		            data: {
		                userId2: userId
		            },
		            success: function(result) {
		                if (result == 'success') {
		                    alert("친구가 추가되었습니다.");
		                };
		            },
		            error: function(xhr, status, error) {
		                console.error(error);
		            }
		        });
		    } else {
		        // userId가 null일 때 예외 처리
		        console.error("userId가 null입니다.");
		    }
			
		}
	function deleteFriend(userId){
		   if (userId !== null) {
			$.ajax({
				url:'delete.friend',
				type : 'post',
				data : {
					userId2: userId
				},
				 success: function(result) {
					 if(result == 'success'){
			            alert("친구가 삭제되었습니다.");
					 };
			    },
			    error: function(xhr, status, error) {
		            // 요청이 실패했을 때 수행할 작업을 여기에 작성합니다.
		            console.error(error);
		        }
			});
		   } else {
			// userId가 null일 때 예외 처리
		        console.error("userId가 null입니다.");
		    }
		}
		
	</script>

	<%@ include file="../common/footer.jsp"%>

</body>
</html>