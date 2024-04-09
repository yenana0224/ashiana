<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common/headerbar.jsp"/>
<jsp:include page="planCss.jsp"/>
<!DOCTYPE html>
<html>
<head>

    <!-- 아이콘 -->
    <!-- https://icons.getbootstrap.com/ -->
    <title>여행 플랜 상세 조회</title>
    <style>
	    div{
		    width: 1200px;
		    box-sizing: border-box;
		    margin: auto;
		}
		.sec_cal {
		    width: 360px;
		    margin: 0 auto;
		    font-family: "NotoSansR";
		}
    </style>
    <!-- calendar -->
	<link rel="stylesheet" href="resources/css/plan/calendar.css">
</head>
<body>
    <div id="outer-plan">
	    <form method="post">
	        <div id="planning-interface">
	            <input type="hidden" name="planNo" id="planNo" value="${ planNo }">
	                            출국일시 : <input type="date" name="start-date" id="start-date" required disabled>
	            <input type="time" name="start-time" id="start-time"  class="timepicker" disabled>
	           	 &nbsp;
	           	 귀국일시 : <input type="date" name="end-date" id="end-date" required disabled>
	            <input type="time" name="end-time" id="end-time"  class="timepicker" disabled>
	            
	 
	            <button class="btn btn-sm btn-success btn-int" type="submit">여행 플랜 수정</button>
	        </div>
	        <div id="planning-area">
	            <div id="date-area">
					<div class="sec_cal">
			            <div class="cal_nav">
			                <a href="javascript:;" class="nav-btn go-prev">prev</a>
			                <div class="year-month"></div>
			                <a href="javascript:;" class="nav-btn go-next">next</a>
			            </div>
			            <div class="cal_wrap">
			                <div class="days">
			                    <div class="day">MON</div>
			                    <div class="day">TUE</div>
			                    <div class="day">WED</div>
			                    <div class="day">THU</div>
			                    <div class="day">FRI</div>
			                    <div class="day">SAT</div>
			                    <div class="day">SUN</div>
			                </div>
			                <div class="dates"></div>
			            </div>
			        </div>
	            </div> 
	            <div id="root-area">
	                
	            </div>
	        </div>
	        <div id="sched-area">
	            <div id="sched-box">
	                <h2>예약 및 일정</h2> <label id="sched-date-sum"></label>
	                
	            </div>
	        </div>
	        <div id="plan-sum">
	            <span>이동 수단 가격 <label class="plan-sum-price" id="trans-sum"></label> + </span>
	            <span>예약 및 일정 예산 <label class="plan-sum-price" id="sched-sum"></label> = </span>
	            <label class="plan-sum-total">총 예산 <label></label>원</label>
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
        // 예약 및 일정이 없을 때
        var trEmpty = '<tr class="sched-tr-empty"><td colspan="5">등록된 예약 및 일정이 없습니다.</td></tr>';
        
        $('#sched-box').on('click', '.sched-btn-area>img', function(){
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
	
	<jsp:include page="../common/footer.jsp" />
    
    <script> // AJAX 
    	function selectPlan(){
    		$.ajax({
    			url : 'selectPlanDetail.ajaxplan',
    			type : 'post',
    			data : {
    				planNo : ${ planNo },
    				status : 'Y'
    			},
    			success : function(result){
    				// 상단 출국일시 귀국일시
    				$('#start-date').val(result.startDate);
    				$('#start-time').val(result.startTime);
    				$('#end-date').val(result.endDate);
    				$('#end-time').val(result.endTime);
    				// 몇박몇일
    				$('#sched-date-sum').text(result.travelDate);
    				// 하단 총 예산
    				$('#trans-sum').text(result.transSum + '원');
    				$('#sched-sum').text(result.schedSum + '원');
    				$('.plan-sum-total').find('label').text(result.totalSum);
    			}
    		})
    	};
    	function selectDestination(){
    		$.ajax({
    			url : 'selectDesDetail.ajaxplan',
    			type : 'post',
    			data : {
    				planNo : ${ planNo },
    				status : 'Y'
    			},
    			success : function(result){    				
    				let departure = '';
    				let arrival = '';
    				let rootInfo = '';
    				
    				let rootArea = '';
    				let schedArea = '';
    				for(let i = 0; i < result.length; i++){
    					if(i == 0){ // 출발
    						departure = result[i].returnDate;
    					}
    					else if(i == result.length - 1) { // 귀국
    						// 귀국 이동수단 등록 안했을 시 처리 
    						if(result[i].trans != '등록 안함'){
	    						rootArea += '<div class="root-icon">' // 루트 아이콘
				                    	  +		'<img src="resources/icons/arrow-down-square-fill.svg">'
				                		  + '</div>';
								arrival = result[i].arrival;
								rootHour = Math.floor((new Date(arrival) - new Date(departure)) / 1000 / 60 / 60); // 시간
								rootMin = (new Date(arrival) - new Date(departure)) / 1000 / 60 % 60; // 분
								if(result[i].trans == undefined || result[i].trans == '등록 안함'){
	    							rootInfo = '(' + rootHour + '시간';
	    						}
	    						else{
		    						rootInfo = result[i].trans + '(' + rootHour + '시간';
	    						}
								if(rootMin > 0) {rootInfo += '' + rootMin + '분';};
								rootInfo += ')';
								rootArea += '<div class="root-info"><label>' + rootInfo + '</label></div>'; // 루트 인포
								departure = result[i].returnDate;
								rootArea += '<div class="root-line"></div>'; // 루트 라인 
    						}
							rootArea += '<div class="root-icon">' // 루트 아이콘
			                    	  +		'<img src="resources/icons/house-door-fill.svg">'
			                		  + '</div>';
			                		  
			                // 귀국 항공편이 있을 시
			                if(result[i].transPrice != 0){
			                	$('<span>(+ 귀국 항공 가격 <label class="plan-sum-price">' + result[i].transPrice + '원</label>)</span>').insertAfter('#trans-sum');  
			                }
    					}
    					else{ // 도시			
    						// 목적지 구역
    						rootArea += '<div class="root-icon">' // 루트 아이콘
			                    	  +		'<img src="resources/icons/arrow-down-square-fill.svg">'
			                		  + '</div>';
    						arrival = result[i].arrival;
    						rootHour = Math.floor((new Date(arrival) - new Date(departure)) / 1000 / 60 / 60); // 시간
    						rootMin = (new Date(arrival) - new Date(departure)) / 1000 / 60 % 60; // 분
    						if(result[i].trans == undefined || result[i].trans == '등록 안함'){
    							rootInfo = '(' + rootHour + '시간';
    						}
    						else{
	    						rootInfo = result[i].trans + '(' + rootHour + '시간';
    						}
    						if(rootMin > 0) {rootInfo += '' + rootMin + '분';};
    						rootInfo += ')';
    						rootArea += '<div class="root-info"><label>' + rootInfo + '</label></div>'; // 루트 인포
    						departure = result[i].returnDate;
    						rootArea += '<div class="root-line"></div>'; // 루트 라인 
    						
    						let startDate = new Date(arrival).getMonth() + 1 + '월' + new Date(arrival).getDate() + '일'; 
    						let endDate = new Date(departure).getMonth() + 1 + '월' + new Date(departure).getDate() + '일';
    						
    						rootArea += '<div class="root-card">' // 루트 카드
	    	                    	  +	'<div class="des-img">'
	    	                          +		'<img src="'+ result[i].filePath.substring(1) +'">'
	    	                    	  + 	'</div>'
	    	                          + 	'<div class="des-info">'
	    	                          + 		'<span>' + result[i].cityName + '</span> <br>'
	    	                          +  		'<label>' + startDate + '</label> ~ <label>' + endDate + '</label>'
	    	                    	  + 	'</div>'
	    	                          + '</div>';
	    	                rootArea += '<div class="root-line"></div>'; // 루트 라인 
	    	                
	    	                // 예약 및 일정 구역
	    	                schedArea += '<div class="sched-des">' // 아코디언 div
				    	               +     '<span class="sched-des-city">' + result[i].cityName + '</span>'
				    	               +     '<span class="sched-des-date">' + result[i].destDate + '</span>'
				    	               +     '<div class="sched-btn-area">'
				    	               +         '<button class="btn btn-danger btn-add-sched">추가</button><img src="resources/icons/arrow-down-circle-fill.svg">'
				    	               +     '</div>'
				    	               +     '<span class="sched-des-price">예약 및 일정 예산 <label>' + result[i].schedCostSum + '원</label></span>'
				    	               +     '<span class="sched-des-price">항공 가격 <label>' + result[i].transPrice + '원</label> +&nbsp;</span>'
				    	               + '</div>'
				    	               + '<div class="sched-des sched-des-detail">' // 아코디언 내부
				    	               +     '<table class="table table-hover table-bordered">'
				    	               +         '<thead>'
				    	               +             '<tr>'
				    	               +                 '<th class="th1">카테고리</th>'
				    	               +                 '<th class="th2">예약/일정 명</th>'
				    	               +                 '<th class="th3">상세 내용</th>'
				    	               +                 '<th class="th4">예상 금액</th>'
				    	               +             '</tr>'
				    	               +         '</thead>'
				    	               +         '<tbody class="sched-des-detail-body">'
	    	                		   +     		 '<input type="hidden" name="destNo" value="' + result[i].destNo + '">'
				    	               +         '</tbody>'
				    	               +       '</table>'
				    	               + '</div>';
				    	               
				    		selectSchedule(result[i].destNo);
				    		
    					}
    				} // for문
    					$('#root-area').html(rootArea);
    					$('#sched-box').append(schedArea);
    			}
    		})
    	};
    	
    	function selectSchedule(destNo){
    		$.ajax({
    			url : 'selectSchedule.ajaxplan',
    			type : 'post',
    			data : {
    				destNo : destNo,
    				status : 'Y'
    			},
    			success : function(result){
    				let schedTable = '';
    				if(result.length == 0){
    					schedTable += '<tr class="sched-tr-empty">'
                        			+	 '<td colspan="4">등록된 예약 및 일정이 없습니다.</td>'
                        			+ '</tr>';
    				}
    				else{
    					for(let i in result){
    						schedTable += '<tr class="sched-tr">'
    									+	 '<input type="hidden" name="schedNo" value="' + result[i].schedNo + '">'
			                            +    '<td>' + result[i].category + '</td>'
			                            +    '<td>' + result[i].schedName + '</td>'
			                            +    '<td>' + result[i].schedContent + '</td>'
			                            +    '<td class="td-price">' + result[i].schedCost + '원</td>'
			                            + '</tr>';
    					}
    				}
                    $(schedTable).insertAfter('input[value=' + destNo + ']');
    			}
    		})
    	};
    	$(function(){
    		selectPlan();
    		selectDestination();
    	})
    </script>
    
    <!-- 달력 스크립트 -->
    
    <script>
        $(document).ready(function() {
            calendarInit();

        });
        /*
            달력 렌더링 할 때 필요한 정보 목록 

            현재 월(초기값 : 현재 시간)
            금월 마지막일 날짜와 요일
            전월 마지막일 날짜와 요일
        */

        function calendarInit() {

            // 날짜 정보 가져오기
            var date = new Date(); // 현재 날짜(로컬 기준) 가져오기
            var utc = date.getTime() + (date.getTimezoneOffset() * 60 * 1000); // uct 표준시 도출
            var kstGap = 9 * 60 * 60 * 1000; // 한국 kst 기준시간 더하기
            var today = new Date(utc + kstGap); // 한국 시간으로 date 객체 만들기(오늘)
        
            var thisMonth = new Date(today.getFullYear(), today.getMonth(), today.getDate());
            // 달력에서 표기하는 날짜 객체
            
            
            var currentYear = thisMonth.getFullYear(); // 달력에서 표기하는 연
            var currentMonth = thisMonth.getMonth(); // 달력에서 표기하는 월
            var currentDate = thisMonth.getDate(); // 달력에서 표기하는 일
            
            // kst 기준 현재시간
            // console.log(thisMonth);

            // 캘린더 렌더링
            renderCalender(thisMonth);

            function renderCalender(thisMonth) {

                // 렌더링을 위한 데이터 정리
                currentYear = thisMonth.getFullYear();
                currentMonth = thisMonth.getMonth();
                currentDate = thisMonth.getDate();

                // 이전 달의 마지막 날 날짜와 요일 구하기
                var startDay = new Date(currentYear, currentMonth, 0);
                var prevDate = startDay.getDate();
                var prevDay = startDay.getDay();

                // 이번 달의 마지막날 날짜와 요일 구하기
                var endDay = new Date(currentYear, currentMonth + 1, 0);
                var nextDate = endDay.getDate();
                var nextDay = endDay.getDay();

                // console.log(prevDate, prevDay, nextDate, nextDay);

                // 현재 월 표기
                $('.year-month').text(currentYear + '.' + (currentMonth + 1));

                // 렌더링 html 요소 생성
                calendar = document.querySelector('.dates')
                calendar.innerHTML = '';
                
                // 지난달
                for (var i = prevDate - prevDay + 1; i <= prevDate; i++) {
                    calendar.innerHTML = calendar.innerHTML + '<div class="day prev disable" name="p' + i + '">' + i + '<div class="highlight"></div><div class="highlight2"></div></div>'
                }
                // 이번달
                for (var i = 1; i <= nextDate; i++) {
                    calendar.innerHTML = calendar.innerHTML + '<div class="day current" name="c' + i + '">' + i + '<div class="highlight"></div><div class="highlight2"></div></div>'
                }
                // 다음달
                for (var i = 1; i <= (7 - nextDay == 7 ? 0 : 7 - nextDay); i++) {
                    calendar.innerHTML = calendar.innerHTML + '<div class="day next disable" name="n' + i + '">' + i + '<div class="highlight"></div><div class="highlight2"></div></div>'
                }

                // 오늘 날짜 표기
                if (today.getMonth() == currentMonth) {
                    todayDate = today.getDate();
                    var currentMonthDate = document.querySelectorAll('.dates .current');
                    currentMonthDate[todayDate -1].classList.add('today');
                }
            }

            // 이전달로 이동
            $('.go-prev').on('click', function() {
                thisMonth = new Date(currentYear, currentMonth - 1, 1);
                renderCalender(thisMonth);
            });

            // 다음달로 이동
            $('.go-next').on('click', function() {
                thisMonth = new Date(currentYear, currentMonth + 1, 1);
                renderCalender(thisMonth); 
            });
        }
    </script>
    
    
</body>
</html>