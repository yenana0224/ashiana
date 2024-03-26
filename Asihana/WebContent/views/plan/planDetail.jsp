<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	int planNo = Integer.parseInt((String)request.getAttribute("planNo"));
%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    
    <!--데이트 타임 피커 https://www.delftstack.com/ko/howto/jquery/jquery-datetimepicker/-->
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
    
    <link rel="stylesheet" href="resources/css/plan/planInsertPlan.css">
    <link rel="stylesheet" href="resources/css/plan/planDetailPlan.css">

    <!--예약 및 일정 css-->
    <link rel="stylesheet" href="resources/css/plan/planInsertSched.css">
    <link rel="stylesheet" href="resources/css/plan/planDetailSched.css">
    
    <!--목적지 추가 모달 css -->
    <link rel="stylesheet" href="resources/css/plan/addDesModal.css">
    
    <!--목적지 추가/여행 종료 토스트 css-->
    <link rel="stylesheet" href="resources/css/plan/planInsertPlanToast.css">

    <!-- 아이콘 -->
    <!-- https://icons.getbootstrap.com/ -->
    <title>여행 플랜 상세 조회</title>
    <style>
        #outer{
            width: 1200px;
            box-sizing: border-box;
            margin: auto;
        }
    </style>
</head>
<body>

	<%@ include file="../common/headerbar.jsp" %>
    <div id="outer">
	    <form method="post">
	        <div id="planning-interface">
	             
	                            출국일시 : <input type="date" name="start-date" id="start-date" required disabled value="2024-04-06">
	            <input type="time" name="start-time" id="start-time"  class="timepicker" disabled value="12:00">
	           	 &nbsp;
	           	 귀국일시 : <input type="date" name="end-date" id="end-date" required disabled value="2024-04-06">
	            <input type="time" name="end-time" id="end-time"  class="timepicker" disabled value="12:00">
	 
	            <button class="btn btn-sm btn-success btn-int" type="submit">여행 플랜 수정</button>
	        </div>
	        <div id="planning-area">
	            <div id="date-area">
	
	            </div> 
	            <div id="root-area">
	                <div class="root-icon">
	                    <img src="resources/icons/arrow-down-square-fill.svg">
	                </div>
	                <div class="root-info"><label>항공(1시간)</label></div>
	                <div class="root-line"></div>
	                <div class="root-card">
	                    <div class="des-img">
	                        <img src="resources/대련.jpg">
	                    </div>
	                    <div class="des-info">
	                        <span>대련-중국</span> <br>
	                        <label>2월 27일</label> ~ <label>3월 1일</label>
	                    </div>
	                </div>
	                
	                <div class="root-line"></div>
	                <div class="root-icon">
	                    <img src="resources/icons/arrow-down-square-fill.svg">
	                </div>
	                <div class="root-info"><label>항공(1시간)</label></div>
	                <div class="root-line"></div>
	                <div class="root-icon-home">
	                    <img  src="resources/icons/house-door-fill.svg">
	                </div>
	                
	            </div>
	            
	            
	        </div>
	        <div id="sched-area">
	            <div id="sched-box">
	                <h2>예약 및 일정</h2> <label id="sched-date-sum">6박 7일</label>
	                <div class="sched-des">
	                    <span class="sched-des-city">대련-중국</span>
	                    <span class="sched-des-date">3박 4일</span>
	                    <div class="sched-btn-area">
	                        <button class="btn btn-danger btn-add-sched">추가</button><img src="resources/icons/arrow-down-circle-fill.svg">
	                    </div>
	                    <span class="sched-des-price">예약 및 일정 예산 <label>260,000원</label></span>
	                    <span class="sched-des-price">항공 가격 <label>350,000원</label> +</span>
	                </div>
	                <div class="sched-des sched-des-detail">
	                    <table class="table table-hover table-bordered">
	                        <thead>
	                            <tr>
	                                <th class="th1">카테고리</th>
	                                <th class="th2">예약/일정 명</th>
	                                <th class="th3">상세 내용</th>
	                                <th class="th4">예상 금액</th>
	                            </tr>
	                        </thead>
	                        <tbody class="sched-des-detail-body">
	                            <tr class="sched-tr">
	                                <td>숙소</td>
	                                <td>파고다낭 호텔</td>
	                                <td>오후 1시 체크인</td>
	                                <td class="td-price">240,000원</td>
	                            </tr>
	                            <tr class="sched-tr">
	                                <td>음식점</td>
	                                <td>파고다 비빔밥</td>
	                                <td>첫날 저녁밥</td>
	                                <td class="td-price">20,000원</td>
	                            </tr>
	                            
	                        </tbody>
	                      </table>
	                </div>
	    
	                <div class="sched-des">
	                    <span class="sched-des-city">대련-중국</span>
	                    <span class="sched-des-date">3박 4일</span>
	                    <div class="sched-btn-area">
	                        <button class="btn btn-danger btn-add-sched">추가</button><img src="resources/icons/arrow-down-circle-fill.svg">
	                    </div>
	                    <span class="sched-des-price"> 예약 및 일정 예산 <label>0</label>원</span>
	                    <span class="sched-des-price">항공 가격 <label>250,000</label>원 + </span>
	                </div>
	                <div class="sched-des sched-des-detail">
	                    <table class="table table-hover table-bordered">
	                        <thead>
	                            <tr>
	                                <th class="th1">카테고리</th>
	                                <th class="th2">예약/일정 명</th>
	                                <th class="th3">상세 내용</th>
	                                <th class="th4">예상 금액</th>
	                            </tr>
	                        </thead>
	                        <tbody class="sched-des-detail-body">
	                            <tr class="sched-tr-empty">
	                                <td colspan="4">등록된 예약 및 일정이 없습니다.</td>
	                            </tr>
	                        </tbody>
	                      </table>
	                </div>
	            </div>
	        </div>
	        <div id="plan-sum">
	            <span>이동 수단 가격 </span><label class="plan-sum-price">450,000원</label> +
	            <span>예약 및 일정 예산 </span><label class="plan-sum-price"> 720,000원</label> =
	            <label class="plan-sum-total">총 예산 1,320,000원</label>
	        </div>
	    </form>
    </div>

    <!-- 타임 피커 -->
    <script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js">
        $(document).ready(function(){
            $('input.timepicker').timepicker({ timeFormat: 'hh:mm' });
        });
    </script>
    
    <!-- 예약 및 일정 시작 -->
    <!--예약 및 일정 아코디언-->
    <script>
        // 등록 유도 행
        var trEmpty = '<tr class="sched-tr-empty"><td colspan="5">등록된 예약 및 일정이 없습니다.</td></tr>';
        
        $('.sched-des').on('click', '.sched-btn-area>img', function(){
            let $div = $(this).parent().parent().next();
            if($div.css('display') == 'none'){
                $div.slideDown(500);
                $(this).attr('src','resources/icons/arrow-up-circle-fill.svg');
                //$(this).siblings('button').css('visibility','visible');
            }
            else{
                $div.slideUp(500);
                $(this).attr('src','resources/icons/arrow-down-circle-fill.svg');
                //$(this).siblings('button').css('visibility','hidden');
                $div.find('.sched-tr-add').remove(); // 슬라이드 업 할 시 예약 추가 행 삭제됨
                if($div.find('.sched-tr').length == 0 && $div.find('.sched-tr-empty').length == 0){
                    $(trEmpty).appendTo($div.find('.sched-des-detail-body'));
                }
            }
        });
    </script>
	
	<%@ include file="../common/footer.jsp" %>
    
    <script>
    	function selectPlan(){
    		$.ajax({
    			url : 'selectDetail.ajaxplan',
    			type : 'post',
    			data : {
    				planNo : <%= planNo %>
    			},
    			success : function(result){
    				
    				console.log(result);
    				
    			}
    			
    		})
    		
    		
    	}
    
    	$(function(){
    		selectPlan();
    	})
    	
    	
    
    
    
    </script>
    
    
    
</body>
</html>