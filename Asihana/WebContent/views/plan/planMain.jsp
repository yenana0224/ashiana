<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.kh.semi.plan.model.vo.PlanMain" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../common/headerbar.jsp" %>
<%@ include file="planCss.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>여행 플랜 메인</title>
    <style>
	    div{
		    width: 1200px;
		    box-sizing: border-box;
		    margin: auto;
		}
    </style>
</head>
<body>
	<c:set var="path" value="${ pageContext.request.contextPath }"/>
    <div id="outer-main">
        <div id="my-plans-area">
            <h3>나의 여행 플랜</h3>

			<!-- 로그인 상태면서 여행 플랜이 존재할때 -->
            <c:if test="${ !empty sessionScope.loginUser and !empty list }">
            	<c:forEach var="p" items="${ list }"> 

		            <div class="my-plan-card my-plan-card-hover">
		                <div class="to-card-detail">
		                
		                    <img src="${ p.filePath.substring(1) }" width="200" height="200">
		                    <h5>${ p.planCitys }</h5>
		                    <div class="card-content">
		                    	<label class='plan-no' style='display:none;'>${ p.planNo }</label>
		                        <div class="card-content-1">
		                            <label>${ p.startDate }</label> <br>
		                            <label>${ p.dDay }</label>
		                        </div>
		                        <div class="card-content-2">
		                            <label>${ p.travelDate }</label> <br>
		                            <label>${ p.totalPrice }</label>
		                        </div>
		                        <div class="card-content-3">
		                            <label>${ p.uploadDate }</label>
		                        </div>
		                    </div>
		                </div>
		                <button class="btn button btn-danger btn-card card-delete" style="right: 5px;">삭제</button>
		                <button class="btn button btn-success btn-card card-edit" style="right: 37px;">수정</button>
		            </div>
            	</c:forEach>      	
            </c:if>
            <div class="my-plan-card">
                <div class="planning-card">   
                    <h5>나의 여행 플랜</h5>
                    <p>
                                                       목적지 설정부터 숙소 및 각종<br>여행 상품 예약 내용까지!<br><br><label>***</label>님의 여행 계획을 자세히<br>기록해보세요!
                    </p>
                    <button class="btn btn-sm btn-success btn-insert">여행 플랜 추가</button>
                </div>
            </div>
        </div> <!-- #my-plans-area -->

        <div id="start-plan-area">
            <div id="start-plan-pic">
                <img src="resources/plan/travel.png" width="100%" height="100%">
            </div>
            <div id="start-plan-msg">
                <div class="plan-msg">
                    <p>
			                        상상 속의 여행을 현실로!<br>
			                        아시하나의 여행 플래너를 이용해보세요!
                    </p>
                    <button class="btn btn-outline-danger btn-insert">나의 여행 플랜하기</button>
                </div>
                <div class="plan-msg">
                    <p>
			                        어디로 떠나야할지 고민되신다면<br>
			                        다른 여행자들의 여행기를 둘러보세요!
                    </p>
                    <button class="btn btn-outline-success">여행기 탐방하기</button>
                </div>
                <div id="city-area">
                    <p>
                       	아시하나의 추천 여행지로 떠나보세요!
                    </p>
                    <div id="card-area">
                    	<c:forEach var="c" items="${ requestScope.cityList }" end="2">
	                        <div class="city-card">
	                            <img src="${ path }${ c.filePath }/${ c.changeName }">
	                            <h5>${ c.cityName }</h5>
	                            <label>${ c.nationName }</label>
	                            <input type="hidden" class="nation-no" value="${ c.nationNo }">
	                            <input type="hidden" class="city-no" value="${ c.cityNo }">
	                        </div>
                        </c:forEach>
                    </div>
                </div> <!-- #city-area -->
            </div> <!-- #start-plan-msg -->

        </div>
    </div> <!-- outer -->

    <jsp:include page="../common/footer.jsp" />
    
    <script>
    	$(function(){
	    	$('#my-plans-area').on('click', '.to-card-detail', function(){ // 카드 클릭 시 상세 조회 =>
	    		location.href = '${ path }/planDetail.plan?planNo=' + $(this).find('.plan-no').text();
	    	});
	    	$('#outer-main').on('click', '.btn-insert', function(){ // 플랜 카드 안에 여행 플랜 추가 버튼 클릭 시 작성 화면 이동 =>

	    		if(${ !empty loginUser }){
		    		location.href = '${ path }/insert.plan?userNo=' + '${ loginUser.userNo }';
	    		}
	    		else{
	    			alert("로그인 후 이용해주세요..");
	    			location.href = '${ path }/views/member/memberLoginForm.jsp';
	    		}

	    	})
    	})	
    </script>
    
    <script>
    	$(function(){
			$('#my-plans-area').on('click', '.card-delete', function(){ 
				if(confirm('여행플랜을 삭제 하시겠습니까?')){
					const $planNo = $(this).parent().find('.plan-no').text()
					location.href = '${ path }/delete.plan?planNo=' + $planNo;
				}
			});

			$('.btn-travelReview').click(function(){
				location.href = '${ path }/travelReviewMain';
			});
			$('#city-area').on('click', '.city-card', function(){
				location.href="${ path }/search.info?nation=" + $(this).find('.nation-no').val() + "&city=" + $(this).find('.city-no').val();
			});

    	})
    </script>
    
    
</body>
</html>