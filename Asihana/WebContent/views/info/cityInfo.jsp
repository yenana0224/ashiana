<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.semi.info.model.vo.*, com.kh.semi.common.*, java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style>

	    *{
	        box-sizing: border-box;
	        text-decoration: none;
	        color : black;
	        margin: 0px;
	        padding : 0px;
	    }

        .outer{
            width: 1000px;
            height: auto;
            margin : auto;
            margin-bottom : 70px;
        }

        .photo{
            width: 600px;
            height: 600px;
            margin : auto;
        }

        .photo>img{
            width: 100%;
            height: 100%;
        }

        .info{
            width: 100%;
            height: auto;
        }

        .basic{
            width: 100%;
            height: auto;
            margin : auto;
            margin-top: 20px;
            margin-bottom: 20px;
            text-align: center;
        }

        .basic>table{
            width: 80%;
            margin: auto;
        }

        th{
        	width : 25%;
        	background-color : lightgray;
            height: 50px;
            font-size: 20px;
            font-weight: bold;
        }

        .content{
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
    

        .selectbar{
            width: 100%;
            height: 50px;
            float: right;
            display: block;
            text-align: right;
            margin-bottom : 30px;
        }

        #selectwrap{
            margin-top: 20px;
            margin-right: 40px;
        }


        .selectbar h5{
            width: 15%;
            display: inline-block;
            text-align: center;
            line-height: 50px;
        }

        form{
            width : 300px;
            display: inline-block;
            line-height: 50px;
        }

        select{
            display : inline-flex;
            width: 115px;
            line-height: 50px;
        }
        
        .currentPage{
            padding-left: 20px;
            margin-bottom:50px;
        }

        .currentPage > a, span {
            font-size: 30px;
            font-weight: 500;
        }

</style>

</head>


<body>

<jsp:include page="../common/headerbar.jsp"/>
	<c:set var="path" value="${ pageContext.request.contextPath }" />

    <div class="outer">
           <div class="selectbar">
            <div id="selectwrap">
                <h5>다른 여행지 보기</h5>
                <form action="${ path }/search.info" method="GET" name="selectNation">
                    <select name="nation" id="selectNation" onchange="nationChange()">
                        <c:forEach var="n" items="${ nationList }">
	                        <option class="nationList" value="${ n.nationNo }">${ n.nationName }</option>
                        </c:forEach>
                    </select>
                    <select name="city" id="selectCity">
                        <option>도시선택</option>
                    </select> 
                    <button type="submit" class="btn btn-sm btn-basic" width="20px"> Go </button>
                </form>
            </div>
            
     <script>
            function nationChange(){
            	
            	$('#selectCity').empty();
            	
            	const nationNo = $('#selectNation').val();
            	
            	if(nationNo != 65 && nationNo != 852 && nationNo != 853){
	            	$('#selectCity').append("<option>도시선택</option>");
            	}
            	
            	$.ajax({
            		url : 'cityList.infoaj',
            		data : {
            			nationNo : $('option:selected').val()
            			},
            		type : 'get',
            		success : function(result){
            			let resultStr = '';
            			
            			for(let i = 0; i<result.length; i++){
            				$('#selectCity').append(
            				"<option value='"+result[i].cityNo+"'>"+result[i].cityName+"</option>" 		
            				)
            			};
     					
            		}
            	})
            }
 			</script>

        </div>
        
       <div class="currentPage">
            <a href="${ path }/main.info">홈</a> 
            <span> > </span>
            <a href="${ path }/search.info?nation=${ nation.nationNo }&city=도시선택">${ nation.nationName }</a>
            	<c:if test="${ nation.nationNo ne 853 && nation.nationNo ne 852 && nation.nationNo ne 65}">
            		<span> > </span>
	           			 <a href="#">${ City.cityName }</a>
    	     	</c:if>	 
        </div>

        <div class="photo">
            <img src="${ path }${ file.filePath }/${ file.changeName }" >
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
                        <td>${ nation.visaName }</td>
                        <td>${ currency }</td>
                        <td>${ voltage }</td>
                        <td>${ language }</td>
                    </tr>
                </table>
            </div>

            <div class="content">
                <p>
                	${ City.cityContent }
                </p>
            </div>
        </div>

        <div class="attract">

        </div>
    </div>

	<jsp:include page="../common/footer.jsp" />        
  
</body>
</html>