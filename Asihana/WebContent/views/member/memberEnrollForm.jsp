<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<style>
	#content{
            width: 1000px;
            margin: auto;   
            text-align: center;
            padding-top: 80px;
            font-size: 30px;
            
      	  }
    #enroll-form input{
		margin:8px;
	
	}
	#enroll-form{
		background-color: rgb(247, 240, 233);
	}
	 #noticetext{
            margin: auto;
            width: 1000px;
            text-align: center;
            font-size: 30px;
            font-weight: bold;
            margin-top: 50px;
        }
	
	</style>

</head>
<body>


<jsp:include page="../common/headerbar.jsp"/>
	<c:set var="path" value="${ pageContext.request.contextPath }"/>
	
			<div id="noticetext">
	     	   <p>회원가입</p>
	   		</div>
	   	<br>
		
	
		<form id = "enroll-form" method="post" action="${path}/insert.me">
			<table align="center">
				<tr>
					<td>* 아이디</td>
					<td><input type="text" maxlength="12" required name="userId"></td>
					<td><button class = "btn btn-sm btn-primary" type="button"  onclick="idCheck();">중복확인</button></td>
					<!-- 중복확인 나중에 AJAX배우고 다음주..? -->
				</tr>
				<script>					
					function idCheck(){
						const $userId = $('#enroll-form input[name=userId]');
						
						//AJAX요청
						$.ajax({
							url : '${path}/idCheck.do',
							data : {checkId : $userId.val()},
							success : function(result){
								//console.log(result);
								if(result=='NNNNN'){//중복된 아이디
									alert('이미 존재하거나 탈퇴한 회원의 아이디입니다.');
									$userId.val('').focus();
								}else{//중복x ==사용가능 
									
									if(confirm('사용가능한 아이디입니다 사용하시겠습니까?')){
										//아이디값은 변경 불가능하도록 ==>readonly
										$userId.attr('readonly',true);
										//중복확인 전 막아두었던 submit 버튼 활성화
										$('#enroll-form button[type=submit]').removeAttr('disabled');
										
									}else{
										$userId.focus();
									}
								}
								
							},
							error : function(){
								console.log('AJAX통신실패~~');
							}
						});
					}
				</script>
				<tr>
					<td>* 비밀번호</td>
					<td><input type="password" maxlength="15" required name="userPwd"></td>
					<td></td>
				</tr>
				<tr>
					<td>* 비밀번호확인</td>
					<td><input type="password" maxlength="15" required></td>
					<td></td>
				</tr>
				<tr>
					<td>* 닉네임</td>
					<td><input type="text" maxlength="5" required name="nickName"></td>
					<td></td>
				</tr>
			</table>

			<br><br>

			<div align="center">
				<button type="reset"class="btn btn-sm btn-secondary">취소</button>
				<button type="submit" class="btn btn-sm btn-primary" disabled >회원가입</button>
			</div>

			<br><br>
			
		</form>
	
	<br><br><br><br><br><br>


		
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>