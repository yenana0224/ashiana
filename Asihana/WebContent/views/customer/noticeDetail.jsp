<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.semi.customer.model.vo.*" %>
<%
	Notice noticeDetail = (Notice)request.getAttribute("noticeDetail");
	NoticeFile noticeFile = (NoticeFile)request.getAttribute("noticeFile");
	String currentPage = (String)request.getAttribute("currentPage");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<style>
        #noticeMark{
            margin: auto;
            height: 150px;
            width: 1000px;
            text-align: center;
            line-height: 140px;
            font-size: 30px;
            font-weight: bold;
            text-shadow: 2px 2px rgba(128, 128, 128, 0.541);
            border-bottom: 1px solid  rgba(0,0,0,0.208);
        }
        #noticeBox{
            height: 850px;
            width: 1000px;
            margin: auto;
            border-radius: 5px;
        }
        #titleBox{
            height: 50px;
            width: 100%;
            border-bottom: 1px solid rgba(0,0,0,0.208);
            text-align: center;
            font-size: 20px;
            font-weight: 800;
        }
        #titleBox>P{
            margin-top: 20px;
        }
        #dateBox{
            height: 100px;
            text-align: right;
            padding-right: 30px;
        }
        #dateBox>p{
            margin-top: 2px;
            font-size: 15px;
            font-weight: bold;
            color: rgb(70, 68, 68);
        }
        #imageBox{
            height: 400px;
            width: 500px;
            margin: auto;
            text-align: center;
            border: 1px solid rgba(0, 0, 0, 0.493);
        }
        img{
            width: 100%;
            height: 100%;
        }
       #noticeText{
            width: 500px;
            height: 200px;
            margin: auto;
            padding-top: 50px;
       }
       #noticeText{
            word-wrap:break-word;
       }
       #buttonBox{
            margin: auto;
            text-align: center;
            width: 100%;
       }
</style>
</head>
<body>
	
	<%@ include file="../common/headerbar.jsp" %>
	
			<div id="noticeMark">
                <p>공지사항</p>
            </div>
            <div id="noticeBox">

                <div id="titleBox">
                    <p><%= noticeDetail.getNoticeTitle() %></p>
                </div>
                <div id="dateBox">
                    <label style="font-size: 12px;">작성일</label>
                    <p><%= noticeDetail.getCdate() %></p>
                </div>
                <% if(noticeFile != null) { %>
                <div id="imageBox">
                    <img src="<%=contextPath + "/" +noticeFile.getFilePath() + "/" + noticeFile.getChangeName()%>" alt="">
                </div>
                <div id="noticeText">
                    <p><%= noticeDetail.getNoticeContent() %></p>
                </div>
                <% } else{ %>
                <div id="noticeText">
                    <p><%= noticeDetail.getNoticeContent() %></p>
                </div>
                <div id="imageBox" style="border:none;">
                </div>
                <% } %>
                <div id="buttonBox">
                <% if(loginUser != null) {%>
                    <% if(loginUser.getUserId().equals("admin")){ %>
	                    <button class="btn btn-sm btn-danger" onclick="noticeUpdate();">수정</button>
	                    <button class="btn btn-sm btn-secondary" onclick="noticeBack();">목록</button>
                    <% } else { %>
                    	<button class="btn btn-sm btn-secondary" onclick="noticeBack();">목록</button>
                    <% } %>
                <% } else { %>
                	 <button class="btn btn-sm btn-secondary" onclick="noticeBack();">목록</button>
                <% } %>    
                </div>
            </div>
		
		<script>
			function noticeBack(){
				location.href='<%=contextPath%>/notice.customer?currentPage=<%=currentPage%>'
			}
			function noticeUpdate(){
				location.href='<%=contextPath%>/noticeUpdateForm.admin?noticeNo=<%=noticeDetail.getNoticeNo()%>'
			}
		
		</script>
		
		
	<%@ include file="../common/footer.jsp" %>


</body>
</html>