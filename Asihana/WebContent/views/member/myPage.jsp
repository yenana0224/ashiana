<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내정보조회</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<style>
    #update-form input{
        margin : 8px;
    }
  	 #noticetext{
          margin: auto;
          width: 1000px;
          text-align: center;
          font-size: 30px;
          font-weight: bold;
          margin-top: 50px;
      }
      	#enroll-form{
		background-color: rgb(247, 240, 233);
	}
	  #enroll-form input{
		margin:8px;
	
	}
	
</style>
</head>
<body>
	
	<%@ include file="../common/headerbar.jsp" %>
	
	<%
		String userId = loginUser.getUserId();
		String nickName = loginUser.getNickName();
	%>
		<div id="noticetext">
	     	   <p>마이페이지</p>
	   		</div>
		<form id="enroll-form" method="post" action="<%=contextPath%>/update.me">
		
			<table align="center">
				<tr>
					<td>* 아이디</td>
					<td><input type="text" readonly maxlength="12" required name="userId" value="<%=userId%>"></td>
					<td></td>
				</tr>
				<tr>
					<td>* 닉네임</td>
					<td><input type="text" maxlength="5" required name="nickName" value="<%=nickName%>"></td>
					<td></td>
				</tr>
			</table>
			<br><br>

			<div align="center">
				<button type="submit" >정보수정</button>
				<button type="button" data-toggle="modal" data-target="#updatePwd">비밀번호수정</button>
                <button type="button" data-toggle="modal" data-target="#deleteForm">회원탈퇴</button>
			</div>

			<br><br>
		
		</form>
	
	<!-- 회원 탈퇴 모달 -->
	<div class="modal" id="deleteForm">
	  <div class="modal-dialog">
	    <div class="modal-content">
	
	      <div class="modal-header">
	        <h4 class="modal-title" style="color:red;">회원 탈퇴</h4>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	
	      <div class="modal-body">
	        <form action="<%=contextPath%>/delete.me" method="post">
	        
			  <div class="form-group">
			    <label for="userPwd" style="font-size:12px; color:red">탈퇴를 원하신다면 비밀번호를 입력해주세요.</label>
			    <input type="password" name="userPwd" class="form-control" placeholder="비밀번호를 입력해주세요." id="deletePwd" required>
			  </div>
			  <input type="hidden" value="<%= loginUser.getUserNo() %>" name="userNo">
			  
			  <button type="submit" class="btn btn-danger" onclick="return deleteMember();">회원탈퇴</button>
			  
			  <script>
			  	function deleteMember(){
			  		
			  		const value = prompt('탈퇴를 원하신다면 "회원탈퇴"를 정확히 입력해주세요.');
			  		
			  		if(value === '회원탈퇴'){
						return true;	  			
			  		}
			  		else{
			  			return false;
			  		}
			  		
			  	}
			  </script>
			</form>
	      </div>

	
	    </div>
	  </div>
	</div>
	
	
	<!-- 비밀번호 변경 모달 -->
	<div class="modal" id="updatePwd">
	  <div class="modal-dialog">
	    <div class="modal-content">
	
	      <div class="modal-header">
	        <h4 class="modal-title">비밀번호 변경</h4>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	
	
		  <!-- 현재 비밀번호, 변경할 비밀번호, 변경할 비밀번호 재입력 -->
	      <div class="modal-body">
	        <form action="<%=contextPath%>/updatePwd.me" method="post">
	        
			  <div class="form-group">
			    <label for="userPwd">현재 비밀번호 :</label>
			    <input type="password" name="userPwd" class="form-control" placeholder="비밀번호를 입력해주세요." id="userPwd" required>
			  </div>
			  
			  <div class="form-group">
			    <label for="changePwd">변경할 비밀번호 :</label>
			    <input type="password" name="changePwd" class="form-control" placeholder="변경할 비밀번호를 입력해주세요." id="changePwd" required>
			  </div>
			  
			  <div class="form-group">
			    <label for="checkPwd">변경할 비밀번호 확인 :</label>
			    <input type="password" class="form-control" placeholder="다시 한 번 입력해주세요." id="checkPwd" required>
			  </div>
			  
			  <button type="submit" class="btn btn-primary" onclick="return validatePwd();">비밀번호 변경</button>
			  
			  <input type="hidden" value="<%= loginUser.getUserNo() %>" name="userNo">
			  
			  <script>
			  	function validatePwd(){
			  		
			  		if($('#changePwd').val() != $('#checkPwd').val()){
			  			alert('비밀번호를 동일하게 입력해주세요!');
			  			$('#checkPwd').focus().val('');
			  			return false;
			  		}
			  		
			  		return true;
			  	}
			  </script>
			</form>
	      </div>

	
	    </div>
	  </div>
	</div>
	
		<%@ include file="../common/footer.jsp" %>
	
	
	


</body>
</html>