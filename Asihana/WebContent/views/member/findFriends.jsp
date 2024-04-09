<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import = "java.util.ArrayList, com.kh.semi.friendShip.model.vo.FriendShip,com.kh.semi.member.model.vo.Member"
	%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
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
	margin: 0 auto;
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
	width: 1000px;
    max-height: 300px; /* 최대 높이 지정 */
    overflow-y: auto; /* 세로 스크롤 생성 */
    margin: 0 auto;
}
</style>

</head>
<body>
	<jsp:include page="../common/headerbar.jsp"/>
	<c:set var="path" value="${ pageContext.request.contextPath }"/>
	
	<div>
	<div id="noticetext">
		<p>유저찾기</p>
	<div id = "searchtext">
	<input class="form-control" id="myInput" type="text" placeholder="닉네임 검색">
	</div>
	</div>
	
	<br>
	
	<div class="table-container" style="text-align: center;">
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
			<c:choose>
				<c:when test="${ empty memberlist}">
				<tr>
					<td colspan="5"> 친구가 없습니다.</td>
				</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="member" items="${ memberlist }">
					<tr>
						<td>${member.nickName}</td>
						<td class ="userNo" id = "${member.userNo }"><a href="#">📝</a></td>
						<td class ="userNo_plan" id = "${member.userNo }"><a href="#">📅</a></td>
						<td><button class="add-friend" data-user-no="${member.userNo }">🤝</button></td>
						<td><button class="delete-friend" data-user-no="${member.userNo }">✂</button></td>
					</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			</tbody>
		</table>
		
		<div align="center">
	         <button type="button" onclick="location.href='${ path }/friendList'">내 친구목록</button>
		</div>
	</div>	 
		<br><br><br><br><br>
	
	<script>
	$(function(){
		$('.userNo').click(function(){
			location.href='${ path }/othersTravel?userNo='+$(this).attr('id');
		});
	});
	
	$(function(){
		$('.userNo_plan').click(function(){
			location.href='${ path }/othersPlan?userNo='+$(this).attr('id');
		});
	});
	
		$(document).ready(function(){
		  $("#myInput").on("keyup", function() {
		    var value = $(this).val().toLowerCase();
		    $("#myTable tr").filter(function() {
		      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
		    });
		  });
		});
		

		$(document).ready(function() {
		    // 친구 추가 클릭 이벤트 처리
		    $('.add-friend').on('click', function(e) {
		        e.preventDefault();
		        var userNo = $(this).data('user-no');
		        if (userNo !== null) {
		            $.ajax({
		                url: '${ path }/insert.friend',
		                type: 'post',
		                data: {
		                    userId2: userNo
		                },
		                success: function(result) {
		                    if (result === 'success') {
		                        alert("친구가 추가되었습니다.");
		                        location.reload();
		                    }else{
		                    	alert("추가할 수 없습니다.");
		                    }
		                },
		                error: function(xhr, status, error) {
		                    console.error(error);
		                    
		                }
		            });
		        } else {
		            console.error("userId가 null입니다.");
		        }
		    });

		    // 친구 삭제 클릭 이벤트 처리
		    $('.delete-friend').on('click', function(e) {
		        e.preventDefault();
		        var userNo = $(this).data('user-no');
		        if (userNo !== null) {
		            $.ajax({
		                url: '${ path }/delete.friend',
		                type: 'post',
		                data: {
		                    userId2: userNo
		                },
		                success: function(result) {
		                    if (result === 'success') {
		                        alert("친구가 삭제되었습니다.");
		                        location.reload();
		                    }
		                },
		                error: function(xhr, status, error) {
		                    console.error(error);
		                }
		            });
		        } else {
		            console.error("userId가 null입니다.");
		        }
		    });
		});
		
	</script>

	<jsp:include page="../common/footer.jsp"/>

</body>
</html>