<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

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
	<jsp:include page="adminbar.jsp"/>
    <div class="outer">

        <div class="title">
            <h2>국가/도시정보</h2>
            <h3>국가정보수정</h3>
        </div>
       
        <div class="titlePicture">
       		<c:if test="${ not empty title }">
	            <img id="titlePhoto" src="${ path }${ title.filePath }/${ title.changeName }">
       		</c:if>
        </div>

        <div class="photo">
        	<c:if test="${ not empty file }">
	            <img id="nationPhoto" src="${ path }${ file.filePath }/${ file.changeName }">
        	</c:if>
        </div>
    
        <form action="nationUpdate.admin" method="post" enctype="multipart/form-data">
        	<input type="hidden" name="nationNo" value="${ nation.nationNo }">
            <div class="info-area"><input type="text" id="numCk" name="newNationNo" pattern="[0-9]+" value="${ nation.nationNo }" required></div>
	            <script>
	            $('#nationNum').change(function() {
	            	const nation = $('#nationNum').val();
	            	
	            	$.ajax({
	            		url : 'nationCk.do',
	            		data : {
	            			nationNo : nation
	            		},
	            		type : 'get',
	            		success : function(result){
	            			if(result == 'NNNN'){
	            				alert('이미 존재하는 국가입니다');
	            				$('#nationNum').val('');
	            			} else{
	            				alert('사용가능합니다');
	            				$('#updateBtn').removeAttr('disabled');
	            			}
	            		}
	            	})
	            });
	            </script>
    
            <div class="info-area"><input type="text" name="nationName" value="${ nation.nationName }"></div>
            <div class="info-area"><textarea name="nationContent" cols="30" rows="10" style="resize: none;">${ nation.nationContent }</textarea></div>
            <div class="info-area">
               <label>비자 선택 : </label> 
               <select name="visaNo">
               		<c:forEach var="visa" items="${ visaList }">
               			<c:choose>
               				<c:when test="${ visa.visaName ne nation.visaName }">
	                            <option value="${ visa.visaNo }">${ visa.visaName }</option>
               				</c:when>
               				<c:otherwise>
	                            <option value="${ visa.visaNo }" selected>${ visa.visaName}</option>
               				</c:otherwise>
               			</c:choose>
               		</c:forEach>
                </select>
            </div>
            <div class="info-area">
            <label>전압 선택 : 기존전압 (${ nation.voltage }) </label>
             	<c:forEach var="voltage" items="${ volList }">
					<div class="ck-area">
						<input type="checkbox" name="volNo" value="${ voltage.voltageNo }"> ${ voltage.volName }
					</div>
             	</c:forEach>
            </div>
            <div class="info-area">
            <label>화폐 선택 : 기존 화폐 (${ nation.currency })</label> 
            	<div id="cur-area">
           		<c:forEach var="currency" items="${ curList }">
            		<div class="ck-area">
            		<input type="checkbox" name="curNo" value="${ currency.currencyNo }">${ currency.currencyName }
					</div>
           		</c:forEach>
				</div>
				<div class="btn">
					<div id="newCur">새로등록</div>
				</div>

            </div>
            
            <div class="info-area">
            <label id="select-lang">언어 선택 : 기존언어 ( ${ antion.language }) </label> 
            	<div id="lang-area">
            	<c:forEach var="language" items="${ langList }">
            		<div class="ck-area">
            		<input type="checkbox" name="langNo" value="${ language.languageNo }"> ${ language.languageName }
					</div>
            	</c:forEach>
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
        	const currency = prompt('화폐를 입력해주세요');
        	
        	if(currency != null) {
	        	$.ajax({
	        		url : 'addCur.do',
	        		data : {
	        			currencyName : currency
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
			const language = prompt('언어 이름을 입력해주세요');
			if(language != null) {
				$.ajax({
	        		url : 'addLang.do',
	        		data : {
	        			languageName : language
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
        	location.href="${ path }/info.admin?currentPage=1";
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