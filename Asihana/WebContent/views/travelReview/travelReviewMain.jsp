<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.kh.semi.travelReview.model.vo.TravelReview, com.kh.semi.info.model.vo.City, com.kh.semi.travelReview.model.vo.HashTag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>여행기 메인 화면</title>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <style>
        #content-wrap{
        width: 1200px;
        height : auto;
        margin : auto;
        background-color : rgb(250, 243, 221);
    }
    #content-1wrap{	
        width: 100%;
        height : 250px;
        background-color :rgb(46, 204, 113);
        > div{
            float : left;
        }
    }
    .content-1wrap{
        width : 300px;
        height : 100%;
    }
    #content-1-2{
        width: 594px;
    }
    #content-1-title{
        margin-top : 50px;
    }
    #content-2wrap{
        width: 100%;
        height : 400px;
        > div{
            float : left;
            height : 100%;
        }    
    }
    #content-2-1{
        width: 100px;

    }
    #content-2-2{
        width : 1000px;
        >div {
            width: 100%;
        }
    }
    #content-2-title{
        height : 15%;
        margin-top : 17px;
        font-weight: bolder;
    }
    #content-2-boardlist{
        height : 80%;
        display : inline-block;
            > div{
                width : 25%;
                height : 100%;
                float : left;
                >img {
                    width : 230px;
                    margin-top : 10px;
                }
            }
    }
    #content-2-boardlist > :hover{
        cursor : pointer;
        opacity : 0.9;
    }
    #content-2-3{
        width: 100px;
    }
    #content-3wrap{
        width: 100%;
        height : 400px;
        > div {
            float : left;
            height : 97%;
        }
    }
    #content-3-1{
        width: 100px;
    }
    #content-3-2{
        width : 1000px;
        >div {
            width: 100%;
        }
    }
    #content-3-title{
        height : 15%;
        font-weight: bolder;
        margin-top : 17px;
    }
    #content-3-boardlist{
        height : 83%;
        display : inline-block;
            > div{
                width : 25%;
                height : 100%;
                float : left;
                >img {
                    margin-top : 10px;
                    width : 230px;
                }
            }
    }
    #content-3-3{
        width: 100px;
    }
    ol{
        list-style: none;  
        background-color : white; 
        margin: 0; 
        padding-left : 0; 
        padding-right : 35px; 
        padding-top : 0; 
        margin-right : 55px;
        width : 440px;
        height : 150px;
        z-index : 50;
        overflow : scroll;
        overflow-x : auto;
        float : center;
        display : none;
    }
    p{
    	z-index : 40;
    }
    #content-3-boardlist > :hover{
        cursor : pointer;
        opacity : 0.9;
    }
    .review-thumnail{
    	width: 230px;
    	height : 230px;
    }
    </style>
</head>
<body>
	<jsp:include page="../common/headerbar.jsp"/>
    <div id="content-wrap"> <!-- content 전체를 감싸는 wrap영역 -->
        <!--여기부터 content의 3분할 중 1영역-->
        <div id="content-1wrap">
            <div id="content-1-1" class="content-1wrap">
            </div>
            <div id="content-1-2" class="content-1wrap" align="center">
                <div id="content-1-title">
                    <h3>여행자들의 생생한 여행기를 확인해보세요</h3>
                </div>
                <div id="content-1-2form">
                	<c:set var="path" value="${pageContext.request.contextPath }"/>
                    <form action="${ path }/cityDetail.review" method="get" name="search-form">
                        <div id="nation-list-wrap">
                            <input id="search-botton" type="search" style="display : inline-block; width: 80%; height: 55px; " placeholder="국가, 도시, 키워드로 검색" name="search">
                            <input type="submit" style="display : inline-block; width: 50px; height: 55px;" value="검색">
                               
                            <ol align="left" id="nation-list">
                                     <!--1)DB에서 조회된 국가/도시 정보를 바탕으로 반복문을 통해서 li요소 추가, 
                                         2)해당 li요소를 클랙했을 때 해당 국가 여행기 게시판으로 이동-->
                            	<c:forEach var="city" items="${ sessionScope.cityList }">
                            		<li>${ city.cityName }(${city.nationName })</li>
                            	</c:forEach>
                            </ol>
                        </div>
                        
                        <script>
                           $('#search-botton').keydown(function(){
	                           	// 국가 ,도시 리스트 중에서 input 요소에 적히는 글씨와 일치하는 리스트만 보고싶다.
	                           	$('ol').css('display', 'block');
                           });		
                            $('*').not('#content-1-2 *').not('html, body, #content-wrap, #content-1wrap, #content-1-2, #content-1-3').click(function(e){
                                $('ol').css('display', 'none');
                            });
                            $('ol').on('click', 'li', function(){
                            // input의 value 요소 값을 변경 시켜야함
                                $('#search-botton').val($(this).text());
                            	// 이거 안됨$('#city-num').attr('value', $(this).text());
                            })
                         // .filter('선택자') : 기준 중에서 해당 조건에 만족하는 요소만 선택 *
                        </script>
                    </form>
                </div>
            </div>
            <div id="content-1-3" class="content-1wrap" >
                <c:if test="${ not empty sessionScope.loginUser }">
                	<input type="hidden" name="userNo" value="${sessionScope.loginUser.userNo}<%-- <%=loginUser.getUserNo()%>--%>">
                	<p><a href="${ path }/EnrollForm.review">여행기 쓰기</a></p>
                </c:if>
            </div>
        </div>

        <!--여기부터 content의 3분할 중 2영역-->
        <div id="content-2wrap" style="overflow: auto; border-bottom:1px solid lightgrey;"> 
            <div id="content-2-1">
            </div>

            <div id="content-2-2">
                <div id="content-2-title">
                    <p style="padding-top: 20px;">최근 여행 게시물</p>
                </div>
                <div id="content-2-boardlist" align="center"> 
                    <c:forEach var="review" items="${requestScope.reviewList }">
	                    <div id="${review.reviewNo}" class="review-list">
	                        <input type="hidden" value="">  
	                        <img class="review-thumnail" src="${requestScope.review.titleImg}">
	                        <p align="center">
	                            <lable>작성자 : </lable><span>${review.reviewWriter}</span> <br>
	                            <span>힐링여행</span> <span></span>
	                        </p>  
	                    </div>   
                    </c:forEach> 
                  
                <script>
                	$(function(){
                		$('.review-list').click(function(){
                			location.href = '${path}/detail.review?reviewNo=' + $(this).attr('id');
                		})
                	});
                </script>
                
                </div>
            </div>
            <div id="content-2-3">
            </div >
        </div>

        <!--여기부터 content의 3분할 중 3영역-->
        <div id="content-3wrap" style="overflow: auto;"> 
            <div id="content-3-1">
            </div>
            <div id="content-3-2">
                <div id="content-3-title">
                    <p style="padding-top: 20px;">여행기 추천수 Best4</p>
                </div>
                
                <div id="content-3-boardlist" align="center">
                    
                    <c:forEach var="t" items="${requestScope.likeList}">
	                    <div id="${ t.reviewNo }"  class="likeList">
	                        <img class="review-thumnail" src="${ t.titleImg }">
	                        <p align="center">
	                            <lable>닉네임 : </lable><span>${ t.reviewWriter }</span> <br>
	                            <span>추천수 :</span> <span>${t.likes }</span>
	                        </p>  
	                    </div>
                    </c:forEach>
                    <script>
                    	$(function(){
							$('.likeList').click(function(){
								location.href = '${ path }/detail.review?reviewNo=' + $(this).attr('id');
							})
                    	})
                    </script>
                </div>
            </div>
            <div id="content-3-3">
            </div >
        </div>
    </div>
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>