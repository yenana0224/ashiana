<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.semi.info.model.vo.*, com.kh.semi.common.*, java.util.List"%>
<%
	Nation nation = (Nation)request.getAttribute("nation");
	AttachmentFile title = (AttachmentFile)request.getAttribute("title");
	AttachmentFile file = (AttachmentFile)request.getAttribute("file");
	List<Visa> visaList = (List<Visa>)request.getAttribute("visaList");
	List<Language> langList = (List<Language>)request.getAttribute("langList");
	List<Voltage> volList = (List<Voltage>)request.getAttribute("volList");
	List<Currency> curList = (List<Currency>)request.getAttribute("curList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
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
        
        .titlePicture{
        	width : 1000px;
        	height : 500px;
        	border : 1px solid darkgray;
        	margin: auto;
            margin-bottom: 20px;
        }
        
        .titlePicture>img{
            width: 100%;
            height: 100%;
        }

        .photo{
            width: 400px;
            height: 400px;
            border : 1px solid darkgray;
            border-radius: 10px;
            margin: auto;
            margin-bottom: 30px;
        }

        .photo>#nationPhoto{
            width: 100%;
            height: 100%;
            border-radius: 10px;
        }

        .info-area{
            width: 80%;
            height: auto;
            padding : 5px 10px 5px 10px;
            margin: auto;
            margin-top : 10px;
            border : 1px solid darkgray;
            border-radius: 10px;
            margin: auto;
            margin-bottom: 8px;
        }

        input, textarea{
            border : none;
            width: 100%;
            background-color: rgba(0, 0, 0, 0);
        }
        
       input:focus, textarea:focus{
            border : none;
            outline: none;
            width: 100%;
            background-color: rgba(0, 0, 0, 0);
        }
 

        .btn{
            margin-top: 20px;
            text-align: center;
        }
        
       #newLang, #newCur{
        	text-decoration: none;
            color : white;
            background-color: #ff595e;
            border : none;
            border-radius: 10px;
            padding : 5px 10px 5px 10px;
            width : 100px;
        }
        
        #newLang, #newCur:hover{
        	cursor : pointer;
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
        
        #backBtn{
        	margin-bottom : 50px;
        }
        
        label{
            font-size: 14px;
            font-weight: bold;
            margin : 0px;
        }
        
        .info-area>label{
        	display : block;
        }
        
        .ck-area{
        	width : 120px;
        	display : inline-block;
        	font-size : 15px;
        }
        
        input[type="checkbox"]{
        	display : inline-block;
        	width : 10px;
        }
        

    </style>
</head>

<body>
	<%@ include file="adminbar.jsp" %>
	
	    
    <div class="outer">

        <div class="title">
            <h2>국가/도시정보</h2>
            <h3>국가정보수정</h3>
        </div>
       
        <div class="titlePicture">
        	<% if(title != null) { %>
            <img id="titlePhoto" src="<%=contextPath %>/<%=title.getFilePath() %>/<%=title.getChangeName() %>">
            <% } %>
        </div>

        <div class="photo">
        	<% if(file != null) { %>
            <img id="nationPhoto" src="<%=contextPath %>/<%=file.getFilePath() %>/<%=file.getChangeName() %>">
            <% } %>
        </div>
    
        <form action="nationUpdate.admin" method="post" enctype="multipart/form-data">
        	<input type="hidden" name="nationNo" value="<%=nation.getNationNo() %>">
            <div class="info-area"><input type="text" name="newNationNo" pattern="[0-9]+" value="<%=nation.getNationNo() %>" required></div>
            <div class="info-area"><input type="text" name="nationName" value="<%=nation.getNationName() %>"></div>
            <div class="info-area"><textarea name="nationContent" cols="30" rows="10" style="resize: none;"><%=nation.getNationContent() %></textarea></div>
            <div class="info-area">
               <label>비자 선택 : </label> 
               <select name="visaNo">
                    <% for (Visa v : visaList) {%>
                        <% if (!v.getVisaName().equals(nation.getVisaName())) {%>
                            <option value="<%=v.getVisaNo()%>"><%=v.getVisaName() %></option>
                        <% } else { %>
                            <option value="<%=v.getVisaNo()%>" selected><%=v.getVisaName() %></option>
                        <%} %>
                    <% } %>
                </select>
            </div>
            <div class="info-area">
            <label>전압 선택 : 기존전압 (<%=nation.getVoltage() %>) </label> 
				<% for(Voltage v : volList) { %>
					<div class="ck-area">
						<input type="checkbox" name="volNo" value="<%=v.getVoltageNo() %>"> <%=v.getVolName() %>
					</div>
				<% } %>
            </div>
            <div class="info-area">
            <label>화폐 선택 : 기존 화폐 (<%=nation.getCurrency() %>)</label> 
            	<div id="cur-area">
            	<% for(Currency c : curList) { %>
            		<div class="ck-area">
            		<input type="checkbox" name="curNo" value="<%=c.getCurrencyNo()%>"> <%=c.getCurrencyName() %>
					</div>
				<% } %>
				</div>
				<div class="btn">
					<div id="newCur">새로등록</div>
				</div>

            </div>
            
            <div class="info-area">
            <label id="select-lang">언어 선택 : 기존언어 ( <%=nation.getLanguage() %>) </label> 
            	<div id="lang-area">
                <% for(Language l : langList) { %>
            		<div class="ck-area">
            		<input type="checkbox" name="langNo" value="<%=l.getLanguageNo()%>"> <%=l.getLanguageName() %>
					</div>
				<% } %>
				</div>
				<div class="btn">
					<div id="newLang">새로등록</div>
				</div>
			</div>
            
			<div class="info-area">
                <label>도시사진변경</label>
                <div class="btn"><input type="file" name="newTitleFile" onchange="loadImg(this, 1);"> </div>
			    <div class="btn"><input type="file" name="newFile" onchange="loadImg(this, 2);"> </div>
            </div>
            
            <div class="btn">
            	<button type="submit" id="updateBtn"> 확인 </button>
            </div>
        </form>
        
		<div class="btn">
        	<button id="backBtn"> 목록으로 </button>
        </div>
        
        <script>
        
        $('#newCur').click(function(){
        	const a = prompt('화폐를 입력해주세요');
        	
        	if(a != null) {
	        	$.ajax({
	        		url : 'addCur.do',
	        		data : {
	        			currencyName : a
	        		},
	        		type : 'get',
	        		success : function(result){
	        			let resultStr = '';
	        			for(let i in result){
	        				resultStr += '<div class="ck-area">'
	        						   + '<input type="checkbox" name="curNo" value="'
	        						   + result[i].currencyNo
	        						   + '">'
	        						   + result[i].currencyName
	        						   + '</div>'
	        			};
	        			
	        			$('#cur-area').empty();
	        			$('#cur-area').html(resultStr);
	        		}
	        	})
        	}
        });
       
        
        $('#newLang').click(function(){
			const a = prompt('언어 이름을 입력해주세요');
			if(a != null) {
				$.ajax({
	        		url : 'addLang.do',
	        		data : {
	        			languageName : a
	        		},
	        		type : 'get',
	        		success : function(result){
	        			let resultStr = '';
	        			for(let i in result){
	        				resultStr += '<div class="ck-area">'
	        						   + '<input type="checkbox" name="langNo" value="'
	        						   + result[i].languageNo
	        						   + '">'
	        						   + result[i].languageName
	        						   + '</div>'
	        			};
	        			
			        	$('#lang-area').empty();
	        			$('#lang-area').html(resultStr);
	        		}
	        	})
			}
        	
        });
        
        $('#backBtn').click(function(){
        	location.href="<%=contextPath %>/info.admin?currentPage=1";
        })
        
        function loadImg(inputFile, num){
        	
        	if(inputFile.files.length){
        		const reader = new FileReader();
        		reader.readAsDataURL(inputFile.files[0]);
        		reader.onload = function(e){
        			
        			switch(num){
        			case 1 : $('#titlePhoto').attr('src', e.target.result); break; 
        			case 2 : $('#nationPhoto').attr('src', e.target.result); break;
        			}
        			
        		}
        	};
        }
        </script>

    </div>

</body>
</html>