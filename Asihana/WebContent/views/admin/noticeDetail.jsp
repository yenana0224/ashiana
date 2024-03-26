<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.semi.customer.model.vo.*"%>
<%
	NoticeFile atFile = (NoticeFile)request.getAttribute("atFile");
	Notice notice = (Notice)request.getAttribute("notice");
	String hold = notice.getNoticeHold();
	NoticeFile noticeFile = (NoticeFile)request.getAttribute("noticeFile");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <style> 
        .title{
            padding-left: 20px;
            width: 100%;
            height: 100px;
            font-weight: bold;
        }
        
        .title>h3{
        	margin-top : 10px;
        }

        .form-area{
            width: 600px;
            height: auto;
        }

       .title-area, .content-area, .fileAt, .check-area {
            padding : 5px 10px 5px 10px;
            margin: auto;
            margin-top : 10px;
            width: 90%;
            height: auto;
            border : 1px solid darkgray;
            border-radius: 10px;
        }

        input, textarea {
            border : none;
            width: 100%;
        }

        .check-area>input{
            border : 1px solid red;
            width: auto;
            text-align: left;
        }

        .check-area>label{
            display: inline-block;
            font-size: 13px;
            height: auto;
            margin: 3px 3px 3px 0px;
        }

        .btn{
            margin-top: 20px;
            text-align: center;
        }

        button {
            text-decoration: none;
            color : white;
            background-color: #ff595e;
            border : none;
            border-radius: 10px;
            padding : 5px 10px 5px 10px;
        }

        button:hover{
            cursor : pointer;
        }

    </style>
</head>
<body>
	<%@ include file="adminbar.jsp" %>
    <div class="outer">
        
        <div class="title">
            <h2>공지사항</h2>
            <h3>공지사항조회</h3>
        </div>

        <div class="form-area">
            <form action="<%=contextPath %>/noticeUpdateForm.admin" method="post">
            	<input type="hidden" name="userNo" value="<%= loginUser.getUserNo() %>">
            	<input type="hidden" name="noticeNo" value="<%= notice.getNoticeNo() %>">
            	
                <div class="title-area">
                    <input type="text" name="title" value="<%= notice.getNoticeTitle() %>" readonly> 
                </div>
                <div class="content-area">
                    <textarea name="content" cols="30" rows="20"  style="resize: none;" readonly><%= notice.getNoticeContent()%></textarea>
                </div>

                <div class="fileAt">
                    <input type="file" name="noticeFile">
                    <% if(noticeFile != null) { %>
                    	첨부파일 : <label> <%=noticeFile.getOriginName() %></label>
                    	<input type="hidden" name="fileNo" value="<%= noticeFile.getFileNo() %>">
                    <% } %>
                </div>

                <div class="check-area">
                	<% if(notice.getNoticeHold().equals("Y")) { %>
                    <input type="checkbox" name="hold" checked disabled> <label>상단고정</label>
                    <% } else {%>
                    <input type="checkbox" name="hold" disabled> <label>상단고정</label>
                    <% } %>
                </div>
           
                <div class="btn">
                    <button type="submit"> 수정하기 </button>
                </div>
            </form>
            	<div class="btn">
                    <button onclick="location.href='<%=contextPath %>/notice.admin?currentPage=1'"> 목록으로 </button>
            	</div>
        </div>
    </div>

</body>
</html>