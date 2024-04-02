<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    import ="java.util.ArrayList, com.kh.semi.community.model.vo.Community" %>
    
    <%	Community c = (Community)request.getAttribute("community");
   %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 상세조회</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<style>





</style>

</head>
<body>

<%@ include file="../common/headerbar.jsp" %>

<div class="outergogi">
	
	<br>
	<h2 align="center"> 커뮤니티 상세보기</h2>

	<table  class="table table-hover" id="detail-area">
		
			
			<tr>
				<th width ="80">글번호</th>
				<td width ="80" colspan="1"><%=c.getComuNo() %></td>
				<th>도시이름</th>
				<td colspan="1"><%=c.getCityName() %></td>
				<th>회원닉네임</th>
				<td colspan="1"><%=c.getMemberNickname() %></td>
				<th>글 내용</th>
				<td colspan="5">
					<p style ="height:100px";><%=c.getComuContent() %></p>
					
				</td>
				<td>조회수</td>
				<td colspan="1"><%=c.getCount() %></td>
				<td>작성일</td>
				<td colspan="3"><%=c.getComuDate() %></td>
				<td>회원상태</td>
				<td colspan="1"><%=c.getStatus() %></td>
				<td>회원넘버</td>
				<td colspan="1"><%=c.getMemberNo() %></td>
				
			</tr>

	</table>
	
	    <br><br>
	
	<div align="center">
            <a href="<%=contextPath%>/commu.List" class="btn btn-sm btn-info">목록으로</a>
             <!-- 작성자만 보이게하기 : 로그인유저 == 작성자 -->
            <!-- 
                로그인여부판단 (하지 않으면 로그인유저가 없을 시 nullpoint) 
                > loginUser.getUserNo() == 뭐랑 비교하지..? 했을때 새롭게 조회해온 UserNo 컬럼의 값이 있음
            -->
            

            <a href="<%=contextPath%>/updateForm.commu?communityNo=<%=c.getComuNo() %>"
                class="btn btn-sm btn-warning">수정하기</a>
            <a href="<%=contextPath %>/delete.commu?communityNo=<%=c.getComuNo()%>"
            	class="btn btn-sm btn-secondary">삭제하기</a>
            
        </div>
	
	


	










</div>





<%@ include file="../common/footer.jsp" %>
</body>
</html>