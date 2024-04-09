<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.semi.info.model.vo.*, java.util.List, com.kh.semi.common.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
    <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
    <script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
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
            width: 1000px;
            height: auto;
            margin: auto;
            margin-bottom: 70px;
        }

        .selectbar{
            width: 100%;
            height: 50px;
            float: right;
            display: block;
            text-align: right;
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
            margin-bottom: 20px;
        }

        .currentPage > a, span {
            font-size: 30px;
            font-weight: 500;
        }

        .nationIntro{
            width: 100%;
            height: auto;
        }

        .cityPhoto{
            width: 100%;
            height: 400px;
        }
        
        .cityPhoto>img{
        	width : 100;
        	height: 100%
        	
        }
        	

        .nationIntro>h4{
            margin-left: 20px;
            font-size: large;
        }
        
        #nationPhoto{
            width: 100%;
            height: 500px;
        }

        #nationPhoto>img{
            width: 100%;
            height: 100%;
        }
        
        .info-area{
            width: 100%;
            height: 150px;
            padding : 5px 10px 5px 10px;
            margin: auto;
            margin-top : 40px;
            border : 1px solid darkgray;
            border-bottom-left-radius: 10px;
            border-bottom-right-radius: 10px;
            margin: auto;
            margin-bottom: 8px;
        }
        
        textarea{
        	text-align : light;
        	font-size : 18px;
            border : none;
            width: 100%;
            background-color: rgba(0, 0, 0, 0);
            padding-top : 20px;
        }

        textarea:focus{
            border : none;
            outline: none;
            width: 100%;
            background-color: rgba(0, 0, 0, 0);
        }
        
        #popular{
        	font-size : 30px;
        	text-align : center;
        }

        .cityList{
            width: 100%;
            height: auto;
            display: block;
        }

        .cityView{
            width: 100%;
            margin-top : 20px;
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
            margin-top : 10px;
            font-size : 20px;
        }
        
        .cityName>h6{
            line-height: 40px;
            text-align: center;
            font-weight: 800;
            color : white;
            font-size : 8px;
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
        
        <br><br><br><br>
        <div class="currentPage">
            <a href="${ path }/main.info">홈</a> 
            <span> > </span>
            <a href="${ path }/search.info?nation=${ nation.nationNo }&city=도시선택">${ nation.nationName }</a>
        </div>

        <div class="nationIntro">
            <div id="nationPhoto">
            	<c:if test="${ not empty title }">
                	<img src="${ path }${ title.filePath }/${ title.changeName }">
            	</c:if>
            </div>
            
            <div class="info-area">
	            <textarea cols="30" rows="10" readonly>
${ nation.nationContent } 
	            </textarea>
            </div>
 
            <br><br>
            <div>
                <h4 id="popular">인기있는 여행지</h4>
            </div>
            <br>

             <div class="cityView">
                <!-- 조회 많은 순서대로 도시 노출 -->
             	<c:forEach var="c" items="${ cityList }">
	                <div class="city">
	                    <div class="cityPhoto"><img src="${ path }/${ c.filePath }/${ c.changeName }"></div>
	                    <div class="cityName">
		                    <h5 class="namecity" id="${ c.cityNo }">${ c.cityName }</h5>
		                    <h6 class="namenation" id="${ c.nationNo }">${ c.nationName }</h6>
	                	</div>
	               	</div>
             	</c:forEach>
            </div>   
        </div>
        
           <script>
	            $(function(){
	            	$('.city').click(function(){
	            		const cityNo = $(this).find('.namecity').attr('id');
	            		const nationNo = $(this).find('.namenation').attr('id')
	            		location.href="${ path }/search.info?nation=" + nationNo + "&city=" + cityNo;
	            	})
	            })
            </script>

    </div>
 
 	<jsp:include page="../common/footer.jsp"/>

</body>
</html>