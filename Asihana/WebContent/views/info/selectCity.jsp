<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List, com.kh.semi.info.model.vo.*, com.kh.semi.common.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <title>Document</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <style>
        *{
            box-sizing: border-box;
            text-decoration: none;
            color : black;
            margin: 0;
            padding : 0;
        }

        .outer{
            width: 1200px;
            margin : auto;
            margin-bottom : 100px;
        }

        .main{
            width : 1000px;
            margin : auto;
        }

        #mainComent{
            font-weight: bold;
            text-align: center;
            margin-bottom: 50px;
        }

        .selectbar{
            width: 35%;
            height: 50px;
            margin:auto;
        }

        select{
            width: 150px;
            height: 30px;
            display: inline-flex;
        }
        
        #popular{
        	font-weight : bold;
        	font-size : 25px;
        	text-align : center;
        }


        .cityView{
            width: 100%;
            margin-top : 40px;
            padding-left : 30px;
            background-color: #faf3dd;

        }
        
        .city{
            background-color: white;
            margin : 20px 0px 20px 0px;
            width: 225px;
            height: 300px;
            display: inline-block;
            margin-right: 7px;
            box-shadow: 1px 1px 5px 2px gray ;
        }

        .cityPhoto{
            width: 100%;
            height: 70%;
            float : left;
        }

        .cityPhoto>img{
            width: 100%;
            height: 100%;
            padding : 5px;
        }

        .cityName{
        	float : left;
            width: 225px;
            height: 85px;
            background-color: white;
        }

        .cityName>h5{
            line-height: 30px;
            text-align: center;
            font-weight: 800;
            margin-top : 5px;
        }
        .cityName>h6{
            line-height: 40px;
            text-align: center;
            font-weight: 800;
        }
    </style>
</head>
<body>

	<jsp:include page="../common/headerbar.jsp"/>
	<c:set var="path" value="${ pageContext.request.contextPath }" />
	
    <div class="outer">
        <div class="main">
            <br><br><br>
            <h2 id="mainComent">어디로 떠나고 싶으세요?</h2>
            <div class="selectbar">
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

            <br><br><br>
            <div>
                <h4 id="popular">인기있는 여행지</h4>
            </div>
            <div class="cityView">
            	<c:forEach var = "c" items ="${ files }">         
	                <div class="city">
	                    <div class="cityPhoto"><img src="${ path }${ c.filePath }/${c.changeName }"></div>
	                    <div class="cityName">
		                    <h5 class="namecity" id="${ c.cityNo }">${ c.cityName }</h5>
		                    <h6 class="namenation" id="${ c.nationNo }">${ c.nationName }</h6>
	                	</div>
	               	</div>
               	</c:forEach>
            </div>   

            <script>
	            $(function(){
	            	$('.city').click(function(){
	            		const cityNo = $(this).find('.namecity').attr('id');
	            		const nationNo = $(this).find('.namenation').attr('id');
	            		location.href="${ path }/search.info?nation=" + nationNo + "&city=" + cityNo;
	            	})
	            })
            </script>
        </div>
    </div>
    
    <jsp:include page="../common/footer.jsp"/>
    
</body>
</html>