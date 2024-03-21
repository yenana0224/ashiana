<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    #noticetext{
       margin: auto;
       width: 1000px;
       text-align: center;
       font-size: 30px;
       font-weight: bold;
       margin-top: 50px;
   }
   #login-form{
		background-color: rgb(247, 240, 233);
	}

	</style>

</head>
<body>

	<%@ include file="../common/headerbar.jsp" %>
	
			<div id="noticetext">
	     	   <p>로그인</p>
	   		</div>
	<form id = "login-form"  action="<%=contextPath%>/login" method="post">
			<table align="center">
				<tr>
					<th>아이디</th>
					<th><input type="text" name="userId" id="" required /></th>
				</tr>
				<tr>
					<th>비밀번호</th>
					<th><input type="password" name="userPwd" id="" required /></th>
				</tr>
				<tr>
					<th colspan="2">
						<button type="submit" class="btn btn-sm btn-primary">로그인</button>
						<button type="button" class="btn btn-sm btn-secondary" href="<%=contextPath%>/views/member/memberEnrollForm.jsp">회원가입</button>
					</th>
				</tr>
			</table>
		</form>   		
		


	<%@ include file="../common/footer.jsp" %>

</body>
</html>