<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page
	import="com.kh.semi.customer.model.vo.*"
%>   
 
<%
	NoticeFile file = (NoticeFile) request.getAttribute("file");
	QNA qna = (QNA) request.getAttribute("qna");
	String currentPage = (String) request.getAttribute("currentPage");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<style>

	
    #insert-form{
        width:  700px;
        margin:  auto;
    }
    label{
        font-weight: bold;
    }
	#counter{
		color:#aaa;
        text-align: right;
        margin-bottom: 20px;
        line-height: 0%;
	}
</style>
</head>
<body>
	
	<%@ include file='../common/headerbar.jsp' %>

	<div style="height:80px ;"></div>

	<form action="<%=contextPath%>/updateQa.customer" method="post" id="insert-form" enctype="multipart/form-data">

		<input type="hidden" name="qnaNo"
			value="<%= qna.getQnaNo() %>">
		<input type="hidden" name="currentPage"
			value="<%= currentPage %>">

		<div class="form-group">
			<label for="usr"> 제목</label> <input type="text" class="form-control"
				id="usr" name="title" value="<%=qna.getQnaTitle()%>">
		</div>
		<div class="form-group">
			<label for="comment">내용</label>
			<textarea class="form-control" rows="19" id="comment" placeholder="1000자까지 입력가능합니다."
				style="resize: none;" name="content"><%=qna.getQnaContent() %></textarea>
		</div>
		<div id="counter">(0 / 1000)</div>
		<div class="form-group">
			<input type="file" name="qnaFile" value="<%=(file != null) ? file.getOriginName() : "존재하는 파일이 없습니다."%>">
		</div>
	
		<div align="center" style="margin-top: 40px;">
			<button type="button" class="btn btn-sm btn-secondary"
				onclick="history.back();">취소</button>
			<button type="submit" class="btn btn-sm btn-danger">등록</button>
		</div>

	</form>
	
	<script>
		$('#comment').keyup(function(){
	    let content = $('#comment').val();
	    $('#counter').html("("+ content.length +" / 1000)");
	
	    if (content.length > 1000){
	        alert("최대 1000자까지 입력 가능합니다.");
	        $(this).val(content.substring(0, 1000));
	    }
		});

	</script>
	

	<%@ include file='../common/footer.jsp' %>
</body>
</html>