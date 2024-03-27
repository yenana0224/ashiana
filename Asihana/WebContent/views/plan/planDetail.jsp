<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	int planNo = (int)request.getAttribute("planNo");
%>
<!DOCTYPE html>
<html>
<head>

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
	            <input type="hidden" name="planNo" id="planNo" value="<%= planNo %>">
	                            출국일시 : <input type="date" name="start-date" id="start-date" required disabled>
	            <input type="time" name="start-time" id="start-time"  class="timepicker" disabled>
	           	 &nbsp;
	           	 귀국일시 : <input type="date" name="end-date" id="end-date" required disabled>
	            <input type="time" name="end-time" id="end-time"  class="timepicker" disabled>
	 
	            <button class="btn btn-sm btn-success btn-int" type="submit">여행 플랜 수정</button>
	        </div>
	        <div id="planning-area">
	            <div id="date-area">
	
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
	
	<%@ include file="../common/footer.jsp" %>
    
    <script> // AJAX 
    	function selectPlan(){
    		$.ajax({
    			url : 'selectPlanDetail.ajaxplan',
    			type : 'post',
    			data : {
    				planNo : <%= planNo %>
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
    				planNo : <%= planNo %>
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
    						rootArea += '<div class="root-icon">' // 루트 아이콘
			                    	  +		'<img src="resources/icons/arrow-down-square-fill.svg">'
			                		  + '</div>';
							arrival = result[i].arrival;
							rootHour = Math.floor((new Date(arrival) - new Date(departure)) / 1000 / 60 / 60); // 시간
							rootMin = (new Date(arrival) - new Date(departure)) / 1000 / 60 % 60; // 분
							rootInfo = result[i].trans + '(' + rootHour + '시간';
							if(rootMin > 0) {rootInfo += '' + rootMin + '분';};
							rootInfo += ')';
							rootArea += '<div class="root-info"><label>' + rootInfo + '</label></div>'; // 루트 인포
							departure = result[i].returnDate;
							rootArea += '<div class="root-line"></div>'; // 루트 라인 
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
    						rootInfo = result[i].trans + '(' + rootHour + '시간';
    						if(rootMin > 0) {rootInfo += '' + rootMin + '분';};
    						rootInfo += ')';
    						rootArea += '<div class="root-info"><label>' + rootInfo + '</label></div>'; // 루트 인포
    						departure = result[i].returnDate;
    						rootArea += '<div class="root-line"></div>'; // 루트 라인 
    						
    						let startDate = new Date(arrival).getMonth() + 1 + '월' + new Date(arrival).getDate() + '일'; 
    						let endDate = new Date(departure).getMonth() + 1 + '월' + new Date(departure).getDate() + '일';
    						
    						rootArea += '<div class="root-card">' // 루트 카드
	    	                    	  +	'<div class="des-img">'
	    	                          +		'<img src="resources/대련.jpg">'
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
    				destNo : destNo
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
    
    
    
</body>
</html>