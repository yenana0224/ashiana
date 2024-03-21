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

	</style>

</head>
<body>

	<%@ include file="../common/headerbar.jsp" %>
	
			<div id="noticetext">
	     	   <p>로그인</p>
	   		</div>


	<%@ include file="../common/footer.jsp" %>

</body>
</html>