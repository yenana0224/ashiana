<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.semi.info.model.vo.*, com.kh.semi.common.*"%>
<%
	// 국가정보 조회 : 국가번호, 국가이름, 국가소개, 비자
	Nation nation = (Nation)request.getAttribute("nation");
	//하나의 도시 정보조회 : 도시번호, 도시이름, 도시소개, 국가번호, 국가이름, 비행시간
	City city = (City)request.getAttribute("City");
	AttachmentFile file = (AttachmentFile)request.getAttribute("file");
	String language = (String)request.getAttribute("language");
	String voltage = (String)request.getAttribute("voltage");
	String currency = (String)request.getAttribute("currency");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>


    *{
        box-sizing: border-box;
        text-decoration: none;
        color : black;
        margin: 0px;
        padding : 0px;
    }

        .outer{
            border : 1px solid blue;
            width: 1000px;
            height: auto;
            margin : auto;
            margin-bottom : 70px;
        }

        .photo{
            border : 1px solid red;
            width: 600px;
            height: 600px;
            margin : auto;
        }

        .photo>img{
            width: 100%;
            height: 100%;
        }

        .info{
            border : 1px solid blue;
            width: 100%;
            height: auto;
        }

        .basic{
            width: auto;
            height: auto;
            margin : auto;
            margin-top: 20px;
            margin-bottom: 20px;
            text-align: center;
            border : 1px solid brown;
        }

        .basic>table{
            width: 1000px;
            margin: 10px 0px 10px 0px;
        }

        th{
            height: 50px;
            font-size: 20px;
            font-weight: bold;
        }

        .content{
            border : 1px solid red;
            width: 80%;
            height: auto;
            font-size: 18px;
            padding-left: 40px;
            margin: auto;
            margin-bottom: 50px;
        }

        .content>p{
            width: 100%;
        }
    
</style>

<body>

	<%@ include file="../common/headerbar.jsp"%>
	
    <div class="outer">
        <div class="photo" >
            <img src="<%=contextPath %>/<%=file.getFilePath() %>/<%=file.getChangeName() %>" >
        </div>

        <div class="info">
            <div class="basic">
                <table>
                    <tr>
                        <th>비자</th>
                        <th>화폐</th>
                        <th>전압</th>
                        <th>언어</th>
                    </tr>
                    <tr>
                        <td><%=nation.getVisaName() %></td>
                        <td><%=currency %></td>
                        <td><%=voltage %></td>
                        <td><%=language %></td>
                    </tr>
                </table>
            </div>

            <div class="content">
                <p>
                    <%= city.getCityContent()%>
                </p>
            </div>
        </div>

        <div class="attract">

        </div>
    </div>

        
    <%@ include file="../common/footer.jsp" %>


  
</body>
</html>