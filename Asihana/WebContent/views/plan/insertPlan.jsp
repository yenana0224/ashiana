<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.semi.info.model.vo.City, java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common/headerbar.jsp"/>
<jsp:include page="planCss.jsp"/>
<!DOCTYPE html>
<html>
<head>      
    <title>여행 플랜 작성</title>
	<style>
	    div{
		    width: 1200px;
		    box-sizing: border-box;
		    margin: auto;
		}
		.planToast{ 
		    display: inline-block;
		    background-color: white;
		    box-shadow: 0 0 1px 1px lightgray;
		    width: 112px;
		    border-radius: 10px;
		    height: 43px;
		    padding: 6px 3px 3px 5px;
		    z-index: 10;
		    display: none;
		    
		}    
		.btn-add-des{
		    margin-left: 5px;
		    margin-right: 6px;
		}
		
		#updateStartDate, #cancelUpdate, #doUpdate{
			display : none;
		}
		#endDesModal{
			width: 340px;
		}
		#openEndDetail{
			margin-left: 95px;
		}
		#endDesDetailModalBody > select, input{
			margin-top:10px;
		}
		#insertEndDest{
			margin-left:270px;
		}
    </style>
</head>
<body>
	<div id="outer-plan">
	    <div id="required-msg">
	        <div>
	            <label>출국 날짜를 설정해주세요.(시간 선택)</label>
	        </div>
	    </div>
		<input type="hidden" name="startDestNo" id="startDestNo" value="">
		<input type="hidden" name="planNo" id="planNo" value="${ planNo }">
	    <form method="post">
	        <div id="planning-interface">
				
				출국일시 : <input type="date" name="start-date" id="start-date">
				<input type="time" name="start-time" id="start-time" class="timepicker">
			    <button class="btn btn-sm btn-success btn-date-int" id="setStartDate" type="button">날짜 설정</button>
			    <button class="btn btn-sm btn-danger btn-date-int" id="updateStartDate" type="button">날짜 수정</button>
			    <button class="btn btn-sm btn-success btn-date-int" id="doUpdate" type="button">수정</button>
			    <button class="btn btn-sm btn-dark btn-date-int" id="cancelUpdate" type="button">취소</button>
	            <button class="btn btn-sm btn-dark btn-int cancel-plan" type="button">취소</button>
	            <button class="btn btn-sm btn-danger btn-int submit-plan" type="button">여행 플랜 완료</button>
	            <button class="btn btn-sm btn-success btn-int btn-des-disabled" type="button" data-toggle="modal" data-target="#addDesModal" disabled>목적지 추가</button>
	        </div>
	        <div id="planning-area">
	            <div id="date-area">
	
	            </div> 
	            <div id="root-area">
	            	
		           <div class="root-icon">
		               	<img class="des-add-btn" src="resources/icons/plus-square-fill.svg" >
		               	<div class="planToast">
		                    <button class="btn btn-sm btn-outline-danger btn-add-des btn-des-disabled" type="button" data-toggle="modal" data-target="#addDesModal" disabled>목적지 추가</button>
		            	</div>
		           	</div>
		           	
	            </div>
	            
	        </div>
	        <div id="sched-area">
	            <div id="sched-box">
	                <h2>예약 및 일정</h2> <label id="sched-date-sum"></label>
	               
	            </div> <!-- #sched-box -->
	        </div> <!-- #sched-area -->
	        <div id="submit-area">
	            <div id="plan-sum">
		            <span>이동 수단 가격 <label class="plan-sum-price" id="trans-sum"></label> + </span>
		            <span>예약 및 일정 예산 <label class="plan-sum-price" id="sched-sum"></label> = </span>
		            <label class="plan-sum-total">총 예산 <label></label>원</label>
	        	</div>
	            <button type="button" class="btn btn-danger submit-plan">여행 플랜 완료</button>
	            <button type="button" class="btn btn-dark cancel-plan">취소</button>
	        </div>
	    </form>
	</div> <!-- outer -->
	
	<jsp:include page="../common/footer.jsp" />
	
	<script>
		$(function(){
	        // 목적지 추가 토스트
	        $('#root-area').on('click', '.des-add-btn', function(){
	            if($('.planToast').css('display') == 'none') $('.planToast').show(100);
	            else $('.planToast').hide(100);
	        })
	        // 작성 취소 버튼 클릭 시 플랜 메인 화면으로 이동
	        $('.cancel-plan').click(function(){
	        	location.href = '${ contextPath }/planMain.plan';
	        })
		})
	</script>
        

    <!-- 타임 피커 -->
    <script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js">
        $(document).ready(function(){
            $('input.timepicker').timepicker({ timeFormat: 'hh:mm' });
        });
    </script>

    <!-- 목적지 추가 Modal -->
    <div class="modal" id="addDesModal">
        <div id="modal-dialog">
            <div id="modal-content">
                
                <!-- Modal Header -->
                <div id="modal-header">
                    <h4>목적지 추가</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                
                <!-- Modal body -->
                <form method="post">
                <div id="modal-body">
                    <div id="modal-date-area">

                    </div>
                    <div id="modal-form-area">
                    	<input type="hidden" name="updateDestNo">
                    	<input type="hidden" name="prevCityNo">
                    	<input type="hidden" name="prevCity"> <!-- 수정 시 도시가 바뀌었는지 체크하는 용 -->
                        <select name="country" id="country">
                        	<option value="국가 선택" disabled selected>국가 선택</option>
                        	<c:forEach var="nation" items="${ nationList }">
                           		<c:if test="${ nation.nationName ne '대한민국' }">
	                           		<option value="${ nation.nationNo }">${ nation.nationName }</option>
                           		</c:if>      
                            </c:forEach>
                        </select>
                        <select name="city" id="city">
                        	<option id="selectCity" value="도시 선택" disabled selected>도시 선택</option>
                        	
                        </select>
     	
                        <input disabled type="text" name="country-city" id="country-city" value="국가-도시 선택">
                        
                        <select name="transport" id="transport">
                            <option value="" disabled selected>이동수단</option>
                            <option value="항공">항공</option>
                            <option value="기차">기차</option>
                            <option value="버스">버스</option>
                            <option value="여객선">여객선</option>
                            <option value="렌트카">렌트카</option>
                            <option value="기타">기타</option>
                        </select>
                        <select name="transport-op" id="transport-op">
                            <option value="편도">편도</option>
                            <option value="왕복">왕복</option>
                        </select>
                        <input type="text" name="trans-price" id="trans-price" value="0">원 <br>

                       	 출발일시 : <input type="date" name="dep-date" id="dep-date" disabled> 
                        <input type="time" name="dep-time" id="dep-time" class="timepicker" disabled><br>
                        
                        <input type="date" name="arr-date" id="arr-date" style="display:none;">
                                                      도착시간 : <input type="time" name="arr-time" id="arr-time" class="timepicker">
                        <input type="checkbox" name="add-day" id="add-day"><label for="add-day">+1 일</label> <br>
                        
                                                       출국일 : <input type="date" name="end-date" id="end-date"> <br>
                       	 출국시간 : <input type="time" name="end-time" id="end-time">
                        
                        <div id="des-sum">
                            <label>${ loginUser.nickName }</label>님의 일정 요약 <br>
                            <p>
                                <label id="dep-date-display">****-**-**</label> <label id="dep-time-display">**:**</label>에 출발하여 <label id="arr-date-display">****-**-**</label> <label id="arr-time-display">**:**</label>에 <label id="country-city-display">**-**</label>로 도착합니다. <br>
                                                                        해당 국가 출국은 <label id="end-date-display">****-**-**</label> <label id="end-time-display">**:**</label> 입니다.
                            </p>
                        </div>
                    </div>
                </div>
                
                <!-- Modal footer -->
                <div id="modal-footer">
                    <button type="button" id="insertDes" class="btn btn-danger" data-dismiss="modal">추가</button>
                    <button type="button" id="updateDes" class="btn btn-danger" data-dismiss="modal" style="display: none;">수정</button>
                    <button type="button" class="btn btn-dark" data-dismiss="modal">취소</button>
                </div>
                </form>
            </div>
        </div>
    </div>

    <!-- 목적지 추가 모달 스크립트 -->
    <script>
    	$(function(){ // 모달 도시 셀렉트박스 
    		$('#country').change(function(){
    			$('#city').empty();
    			$('<option id="selectCity" value="도시 선택" disabled selected>도시 선택</option>').prependTo('#city');
				$.ajax({
					url : 'cityList.ajaxplan',
					type : 'post',
					data : {
						nationNo : $('#country').val()
					},
					success : function(cityList){
						for(let i = 0; i < cityList.length; i++){
							$('<option value="' + cityList[i].cityNo + '">' + cityList[i].cityName + '</option>').insertAfter('#selectCity');
						}
					}
				})
    		})
    	});
    	
        // 날짜 포멧 바꾸는 함수
        function formatDate(date) {
            var d = new Date(date),
            
            month = '' + (d.getMonth() + 1) , 
            day = '' + d.getDate(), 
            year = d.getFullYear();
            
            if (month.length < 2) month = '0' + month; 
            if (day.length < 2) day = '0' + day; 
            
            return [year, month, day].join('-');
        }
        $(function(){ // 모달 일정 요약 부분
            $('#city').change(function(){ // 도시 선택시 인풋 벨류 변경
                $('#country-city').val($('#country option:checked').text() + '-' + $('#city option:checked').text());
            });
            $('#add-day').change(function(){ // +1일 체크박스
                if($('#add-day').is(':checked')) {
                    let $arr = new Date($('#arr-date').val());
                    $arr.setDate($arr.getDate() + 1);
                    $('#arr-date').val(formatDate($arr));
                }
                else{
                    let $arr = new Date($('#arr-date').val());
                    $arr.setDate($arr.getDate() - 1);
                    $('#arr-date').val(formatDate($arr));
                }
            })
            $('#add-day-end').change(function(){ // +1일 체크박스
		        if($('#add-day-end').is(':checked')) {
		            let $arr = new Date($('#arr-date-end').val());
		            $arr.setDate($arr.getDate() + 1);
		            $('#arr-date-end').val(formatDate($arr));
		        }
		        else{
		            let $arr = new Date($('#arr-date-end').val());
		            $arr.setDate($arr.getDate() - 1);
		            $('#arr-date-end').val(formatDate($arr));
		        }
		    })
			$('#outer-plan').on('click', '.btn-des-disabled, .btn-add-des', function(){ // 목적지 추가 버튼 클릭 시  
				$('#modal-header').find('h4').text('목적지 추가');
				$('#updateDes').css('display', 'none');
            	$('#insertDes').css('display', '');
				let display = '<label>${ loginUser.nickName }</label>님의 일정 요약 <br>'
				            + '<p>'
				            + '<label id="dep-date-display">****-**-**</label> <label id="dep-time-display">**:**</label>에 출발하여 <label id="arr-date-display">****-**-**</label> <label id="arr-time-display">**:**</label>에 <label id="country-city-display">**-**</label>로 도착합니다. <br>'
				            + '해당 국가 출국은 <label id="end-date-display">****-**-**</label> <label id="end-time-display">**:**</label> 입니다.'
				            + '</p>'
				$('#country option:first').prop('selected', true);
				$('#city option:first').prop('selected', true);
				$('#transport option:first').prop('selected', true);
				$('#transport-op option:first').prop('selected', true);
				$('#trans-price').val('0');
				$('#country-city').val('국가-도시 선택');
				$('#des-sum').html(display);
				if($('.root-card').length == 0){ // 목적지가 없을 시 여행 출발일시로 디스플레이됨 
				    $('#add-day').prop('checked', false); // 체크 박스 해제
				    $('#dep-date').val($('#start-date').val());
				    $('#dep-time').val($('#start-time').val());
				    // 출발일 => 도착일 
				    $('#arr-date').val($('#dep-date').val());
				    // 출발일시 디스플레이
				    $('#dep-date-display').text($('#dep-date').val());
				    $('#dep-time-display').text($('#dep-time').val());
				    // 도착일 디스플레이
				    $('#arr-date-display').text($('#arr-date').val());
				    $('#arr-time').val('');
				    $('#end-date').val('');
				    $('#end-time').val('');
				}
				else{
					$.ajax({
	            		url : 'selectDesDetail.ajaxplan',
	            		type : 'post',
	            		data : {
	            			planNo : ${ planNo },
	            			status : 'N'
	            		},
	            		success : function(result){
	            			$('#add-day').prop('checked', false);

			            	$('#dep-date').val(result[result.length - 1].returnDate.substring(0, 10));
	            			$('#dep-time').val(result[result.length - 1].returnDate.substring(11));
	            			$('#arr-date').val(result[result.length - 1].returnDate.substring(0, 10));
							
	            		} // result function
	            	})		
	            	$('#dep-date-display').text($('#dep-date').val());
					$('#dep-time-display').text($('#dep-time').val());
					// 도착일 디스플레이
					$('#arr-date-display').text($('#arr-date').val());
	            			
					$('#arr-time').val('');
					$('#end-date').val('');
					$('#end-time').val('');
				}
			});
            
            
            $('#modal-form-area').find('input, select').change(function(){ // 모달 디스플레이
                $('#dep-time-display').text($('#dep-time').val());
                $('#arr-date-display').text($('#arr-date').val());
                $('#arr-time-display').text($('#arr-time').val());
                $('#country-city-display').text($('#country-city').val());
                $('#end-date-display').text($('#end-date').val());
                $('#end-time-display').text($('#end-time').val());
            });
            
            $('#root-area').on('click', '.des-update', function(){ // 목적지 수정 버튼 클릭 시 
            	$('#modal-header').find('h4').text('목적지 수정');
            	$('#insertDes').css('display', 'none');
            	$('#updateDes').css('display', '');
            	const destNo = $(this).siblings('input[name=destNo]').val();
            	
            	$.ajax({
            		url : 'selectDesDetail.ajaxplan',
            		type : 'post',
            		data : {
            			planNo : ${ planNo },
            			status : 'N'
            		},
            		success : function(result){
            			for(let i in result){
            				if(result[i].destNo == destNo){
            					$('#add-day').prop('checked', false);
		            			$('input[name=updateDestNo]').val(result[i].destNo);
		            			$('#country option:first').prop('selected', true);
		        				$('#city option:first').prop('selected', true);
		            			$('#country-city').val(result[i].cityName);
		            			$('input[name=prevCityNo]').val(result[i].cityNo);
		            			$('input[name=prevCity]').val(result[i].cityName);
		            			$('#transport').val(result[i].trans).prop('selected', true);
		            			$('#trans-price').val(result[i].transPrice);
		            			$('#dep-date').val(result[i-1].returnDate.substring(0, 10));
            					$('#dep-time').val(result[i-1].returnDate.substring(11));
            					$('#arr-date').val(result[i].arrival.substring(0, 10));
		            			$('#arr-time').val(result[i].arrival.substring(11));
		            			$('#end-date').val(result[i].returnDate.substring(0, 10));
		            			$('#end-time').val(result[i].returnDate.substring(11));
            					if($('#dep-date').val() != $('#arr-date').val()) {
            						$('#add-day').prop('checked', true);
            					}
            				}
            			} // for 문
            			$('#dep-time-display').text($('#dep-time').val());
            	        $('#arr-date-display').text($('#arr-date').val());
            	        $('#arr-time-display').text($('#arr-time').val());
            	        $('#country-city-display').text($('#country-city').val());
            	        $('#end-date-display').text($('#end-date').val());
            	        $('#end-time-display').text($('#end-time').val());
            		}
            	})
            })
        })
    </script>
    
    <script> <!-- AJAX -->
    	$(function(){ // 목적지 추가
    		$('#insertDes').click(function(){
    			$.ajax({
    				url : 'insertDestination.ajaxplan',
    				type : 'post',
    				data : {
    					planNo : ${ planNo },
    					cityNo : $('#city').val(),
    					trans : $('#transport').val(),
    					transPrice : $('#trans-price').val().split(',').join(''),
    					trip : $('#transport-op').val(),
    					arrival : $('#arr-date').val() + ' ' + $('#arr-time').val(),
    					returnDate : $('#end-date').val() + ' ' + $('#end-time').val()
    				},
    				success : function(result){
    					if(result > 0){
    						$('#dep-date-end').val($('#end-date').val());
    					    $('#dep-time-end').val($('#end-time').val());
    					    $('#arr-date-end').val($('#end-date').val());
    						selectDestination();
    					}
    				}
    			});
    		});
    		$('#updateDes').click(function(){ // 목적지 수정
    			let $city = $('#city').val();
	    		const countryCity = $('#country-city').val().split('-');
    			if($city == null){
    				$city = $('input[name=prevCityNo]').val();
    			}
				// 목적지 수정시 도시가 변경되었을 경우
				if($('input[name=prevCity]').val() != countryCity[1]){
					if(confirm('목적지 변경으로 인해 등록하신 예약 및 일정이 초기화 됩니다. 정말로 변경 하시겠습니까?')){
						$.ajax({
							url : 'deleteSchedCache.ajaxplan',
							type : 'post',
							data : {
								destNo : $('input[name=updateDestNo]').val()
							}
						})
					}
					else{
						return false;
					}
				}
    			$.ajax({
    				url : 'updateDestination.ajaxplan',
    				type : 'post',
    				data : {
    					destNo : $('input[name=updateDestNo]').val(),
    					cityNo : $city,
    					trans : $('#transport').val(),
    					transPrice : $('#trans-price').val().split(',').join(''),
    					trip : $('#transport-op').val(),
    					arrival : $('#arr-date').val() + ' ' + $('#arr-time').val(),
    					returnDate : $('#end-date').val() + ' ' + $('#end-time').val(),
    				},
    				success : function(result){
    					if(result > 0){
    						selectDestination();
    					}
    					else{
    						alert('수정 실패..');
    					}
    				}
    			}) // ajax
    		}) // 목적지 수정 function
    		// 목적지 삭제 버튼 클릭 시
    		$('#root-area').on('click', '.des-delete', function(){
    			const $destNo = $(this).siblings('input[name=destNo]').val();
    			if(confirm('해당 목적지를 삭제하시겠습니까?')){
    				$.ajax({
    					url : 'deleteDestCache.ajaxplan',
    					type : 'post',
    					data : {
    						destNo : $destNo
    					},
    					success : function(result){
    						if(result > 0){
    							selectDestination();
    						}
    					}
    				})
    			}
    		}) // 목적지 삭제
    	})
    </script>

    <!-- 예약 및 일정 시작 -->
    <!--예약 및 일정 아코디언-->
    <script>
        // 등록 유도 행
        var trEmpty = '<tr class="sched-tr-empty"><td colspan="5">등록된 예약 및 일정이 없습니다.</td></tr>';
        
        $('#sched-box').on('click', '.sched-btn-area>img', function(){
            let $div = $(this).parent().parent().next();
            if($div.css('display') == 'none'){
                $div.slideDown(500);
                $(this).attr('src','resources/icons/arrow-up-circle-fill.svg');
                $(this).siblings('button').css('visibility','visible');
            }
            else{
                $div.slideUp(500);
                $(this).attr('src','resources/icons/arrow-down-circle-fill.svg');
                $(this).siblings('button').css('visibility','hidden');
                $div.find('.sched-tr-add').remove(); // 슬라이드 업 할 시 예약 추가 행 삭제됨
                if($div.find('.sched-tr').length == 0 && $div.find('.sched-tr-empty').length == 0){
                    $(trEmpty).appendTo($div.find('.sched-des-detail-body'));
                }
            }
        });
        
    </script>
    
    <!--디테일 테이블 스크립트-->
    <script>
        $('#sched-box').on('mouseover', '.sched-tr', function(){ // 추가 수정 삭제 버튼 호버
            $(this).find('.sched-detail-btn').css('visibility','visible');
        });
        $('#sched-box').on('mouseout', '.sched-tr', function(){ // 추가 수정 삭제 버튼 호버
            $(this).find('.sched-detail-btn').css('visibility','hidden');
        });
        $('#sched-box').on('click', '.btn-add-sched', function(){// 추가 버튼 클릭시
            const trAdd = '<tr class="sched-tr-add">' // 예약 및 일정 추가 행 
                        +   '<td>'
                        +       '<select name="sched-category" class="sched-category">'
                        +           '<option value="선택">선택 안함</option>'
                        +           '<option value="숙소">숙소</option>'
                        +           '<option value="여행상품">여행상품</option>'
                        +           '<option value="음식점">음식점</option>'
                        +           '<option value="기타">기타</option>'
                        +        '</select>'
                        +   '</td>'
                        +   '<td><input type="text" name="sched-name" class="sched-name" placeholder="예약 및 일정 명"></td>'
                        +   '<td><input type="text" name="sched-content" class="sched-content" placeholder="예약 및 일정 내용"></td>'
                        +   '<td><input type="text" name="sched-price" class="sched-price" placeholder="0">원</td>'
                        +   '<td class="sched-detail-btn-area">'
                        +       '<img class="sched-detail-btn detail-btn-add btn-insert-sched" src="resources/icons/check-circle-fill-green.svg">'
                        +       '<img class="sched-detail-btn detail-btn-cancel btn-insert-cancel" src="resources/icons/x-circle-fill-red.svg">'
                        +   '</td>'
                    	+ '</tr>';
            const $detail = $(this).parents('.sched-des').next().find('.sched-des-detail-body');
            
            if($detail.find('.sched-tr-add, .sched-tr-update').length == 0){ // 예약/일정 추가 행이 존재하는지 여부
               $detail.find('.sched-tr-empty').remove(); // 등록 유도 행 제거
               $(trAdd).appendTo($detail); // 예약/일정 추가 행 추가
            }
            else {
                alert('추가 중인 예약 및 일정이 존재합니다.'); // 예약/일정 추가 행이 이미 있을 경우
            }
        });
        $('#sched-box').on('click', '.btn-insert-cancel', function(){ // 예약/일정 추가 행 제거
            
            let trAdd = $(this).parent().parent('.sched-tr-add');
            if(trAdd.siblings('.sched-tr').length == 0){
                $(trEmpty).appendTo(trAdd.parents('.sched-des-detail-body'));
            }
            trAdd.remove();
        });
        // 예약 및 일정 추가 
        $('#sched-box').on('click', '.btn-insert-sched', function(){
        	const $sched = $(this).parent().parent();   
        	const $schedDestNo = $sched.siblings('.schedDestNo').val();
        	$.ajax({
        		url : 'insertSched.ajaxplan',
        		type : 'post',
        		data : {
        			destNo : $sched.siblings('.schedDestNo').val(),
        			category : $sched.find('.sched-category').val(),
        			schedName : $sched.find('.sched-name').val(),
        			schedContent : $sched.find('.sched-content').val(),
        			schedCost : $sched.find('.sched-price').val().split(',').join('')
        		},
        		success : function(result){
        			if(result > 0){
        				selectSchedule($schedDestNo);
        				selectPlan();
        			}
        			else{
        				alert("예약 및 일정 추가를 다시 시도해주세요..")
        				selectSchedule($schedDestNo);
        			}
        		}
        	})
        	$sched.remove();
        });
        $('#sched-box').on('click', '.update-sched', function(){ // 예약 및 일정 수정 버튼 클릭 시 
        	let $schedTr = $(this).parent().parent();
        	const trUpdate = '<tr class="sched-tr-update">' // 예약 및 일정 수정 행 
        				   +   '<input type="hidden" name="schedNo" value="' + $schedTr.find('input[name=schedNo]').val() + '">'
		                   +   '<td>'
		                   +       '<select name="sched-category" class="sched-category">'
		                   +           '<option value="선택">선택 안함</option>'
		                   +           '<option value="숙소">숙소</option>'
		                   +           '<option value="여행상품">여행상품</option>'
		                   +           '<option value="음식점">음식점</option>'
		                   +           '<option value="기타">기타</option>'
		                   +        '</select>'
		                   +   '</td>'
		                   +   '<td><input type="text" name="sched-name" class="sched-name" placeholder="예약 및 일정 명" value="' + $schedTr.find('td').eq(1).text() + '"></td>'
		                   +   '<td><input type="text" name="sched-content" class="sched-content" placeholder="예약 및 일정 내용" value="' + $schedTr.find('td').eq(2).text() + '"></td>'
		                   +   '<td><input type="text" name="sched-price" class="sched-price" placeholder="0" value="' + $schedTr.find('td').eq(3).text().substring(0, $schedTr.find('td').eq(3).text().length - 1) + '">원</td>'
		                   +   '<td class="sched-detail-btn-area">'
		                   +       '<img class="sched-detail-btn detail-btn-add btn-update-sched" src="resources/icons/check-circle-fill-green.svg">'
		                   +       '<img class="sched-detail-btn detail-btn-cancel btn-update-cancel" src="resources/icons/x-circle-fill-red.svg">'
		                   +   '</td>'
		             	   + '</tr>';
        	

			if($schedTr.parent().find('.sched-tr-update, .sched-tr-add').length == 0){
				$(trUpdate).insertAfter($schedTr);
				$('.sched-category').val($schedTr.find('td').eq(0).text());
				$schedTr.remove();
			}
			else{
				alert('작성/수정 중인 예약 및 일정이 존재합니다.');
			}
        })
        $('#sched-box').on('click', '.btn-update-cancel', function(){ // 수정 취소 시 
        	const $tBody = $(this).parent().parent().parent();
        	$tBody.find('.sched-tr-update').remove();
        	selectSchedule($tBody.find('.schedDestNo').val());
        })
        $('#sched-box').on('click', '.btn-update-sched', function(){ // 수정버튼 클릭시 
        	const $sched = $(this).parent().parent();
        	const $schedDestNo = $sched.siblings('.schedDestNo').val();
        	$.ajax({
        		url : 'updateSched.ajaxplan',
        		type : 'post',
        		data : {
        			schedNo : $sched.find('input[name=schedNo]').val(),
        			category : $sched.find('.sched-category').val(),
        			schedName : $sched.find('.sched-name').val(),
        			schedContent : $sched.find('.sched-content').val(),
        			schedCost : $sched.find('.sched-price').val().split(',').join('')
        		},
        		success : function(result){
        			selectSchedule($schedDestNo);
        			selectPlan();
        		}
        	})
        	$sched.remove();
        })
        $('#sched-box').on('click', '.delete-sched', function(){ // 예약 및 일정 삭제 버튼 클릭 시
        	
        })
    </script>
	
	<script> // AJAX 
		$(function(){
            // 출발일시 추가
            let sDate = '';
            let sTime = '';
            $('#outer-plan').on('click', '#setStartDate', function(){ // 날짜 설정 버튼 클릭 시 
            	if($('#start-date').val() == ''){ // 날짜 설정 안함
            		$('#start-date').focus(); return;
            	}
            	else{
					$.ajax({ // 날짜 설정시 출발지 DB로 INSERT
						url : 'insertStartDestination.ajaxplan',
						type : 'post',
						data : {
							planNo : ${ planNo },
							returnDate : $('#start-date').val() + ' ' + $('#start-time').val()
						},
						success : function(result){
							if(result > 0){
								sDate = $('#start-date').val();
								sTime = $('#start-time').val();
								selectDestination();
							}
							else{
								$('#start-date').val('');
								$('#start-time').val('');
							}
						}
					}) // ajax 출발 목적지 행 추가 
            		$('#required-msg').slideUp(500); // 알림 메세지 슬라이드 업
	            	$('#start-date, #start-time').attr('disabled', true);
	            	$('#setStartDate').css('display', 'none');
	            	$('#doUpdate').css('display', 'inline-block'); // 수정 버튼
					$('.btn-des-disabled').attr('disabled', false); // 출발일 설정시 목적지 추가 가능해짐 
            	}
            })
            $('#planning-interface').on('click', '#doUpdate', function(){ // 수정 버튼 클릭 시 
            	$('#start-date, #start-time').attr('disabled', false);
            	$('#updateStartDate, #cancelUpdate').css('display', 'inline-block'); // 날짜 수정 / 취소 버튼
            	$('#doUpdate').css('display', 'none'); // 수정 버튼
            })
            $('#planning-interface').on('click', '#updateStartDate', function(){
            	if($('#start-date').val() != sDate || $('#start-time').val() != sTime){
            		$.ajax({ // 출발일시 업데이트
            			url : 'updateStartDestination.ajaxplan',
						type : 'post',
						data : {
							destNo : $('#startDestNo').val(),
							returnDate : $('#start-date').val() + ' ' + $('#start-time').val()
						},
						success : function(result){
							if(result > 0){
								sDate = $('#start-date').val();
								sTime = $('#start-time').val();
								selectDestination();
							}
							else{
								$('#start-date').val(sDate);
								$('#start-time').val(sTime);
							}
						}
            		})
            	}
            	$('#start-date, #start-time').attr('disabled', true);
            	$('#updateStartDate, #cancelUpdate').css('display', 'none');
            	$('#doUpdate').css('display', 'inline-block');
            })
            $('#planning-interface').on('click', '#cancelUpdate', function(){ // 취소 버튼 클릭 시
            	$('#start-date').val(sDate);
            	$('#start-time').val(sTime);
            	$('#start-date, #start-time').attr('disabled', true);
            	$('#updateStartDate, #cancelUpdate').css('display', 'none');
            	$('#doUpdate').css('display', 'inline-block');
            })	
		});
		
    	function selectPlan(){
    		$.ajax({
    			url : 'selectPlanDetail.ajaxplan',
    			type : 'post',
    			data : {
    				planNo : ${ planNo },
    				status : 'N'
    			},
    			success : function(result){
    				// 몇박몇일
    				if(result.travelDate != '박일'){
	    				$('#sched-date-sum').text(result.travelDate);
    				}
    				else{
    					$('#sched-date-sum').text('');
    				}
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
    				status : 'N'
    			},
    			success : function(result){    				
    				let departure = '';
    				let arrival = '';
    				let rootInfo = '';
    				
    				let rootArea = '';
    				let schedArea = '';
					
    				let rootAddIcon = '<div class="root-icon">' // 루트 추가 아이콘
					                + 	'<img class="des-add-btn" src="resources/icons/plus-square-fill.svg">'
					                + 	'<div class="planToast">'
					                +     '<button class="btn btn-sm btn-outline-danger btn-add-des" type="button" data-toggle="modal" data-target="#addDesModal">목적지 추가</button>'
					                +	'</div>'
					           	    + '</div>'; 
					$('#sched-date-sum').nextAll().remove();
    				for(let i = 0; i < result.length; i++){
    					if(i == 0){ // 출발
    						departure = result[i].returnDate;
    						$('#startDestNo').val(result[i].destNo);
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
	    	                          +     	'<input type="hidden" name="destNo" value="' + result[i].destNo + '">'
	    	                          + 		'<span>' + result[i].cityName + '</span><input class="des-info-btn" type="color"><img class="des-info-btn des-update" data-toggle="modal" data-target="#addDesModal" src="resources/icons/pencil-square.svg"><img class="des-info-btn des-delete" src="resources/icons/trash.svg"> <br>'
	    	                          +  		'<label>' + startDate + '</label> ~ <label>' + endDate + '</label>'
	    	                    	  + 	'</div>'
	    	                          + '</div>';
	    	                rootArea += '<div class="root-line"></div>'; // 루트 라인 
	    	                
	    	                // 예약 및 일정 구역
		    	            schedArea  = '<div class="sched-des">' // 아코디언 div
					    	           +     '<span class="sched-des-city">' + result[i].cityName + '</span>'
					    	           +     '<span class="sched-des-date">' + result[i].destDate + '</span>'
					    	           +     '<div class="sched-btn-area">'
					    	           +         '<button type="button" class="btn btn-danger btn-add-sched">추가</button><img src="resources/icons/arrow-down-circle-fill.svg">'
					    	           +     '</div>'
					    	           +     '<span class="sched-des-price">예약 및 일정 예산 <label class="schedCostSum">' + result[i].schedCostSum + '원</label></span>'
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
					    	           + 				 '<th class="th5"></th>'
					    	           +             '</tr>'
					    	           +         '</thead>'
					    	           +         '<tbody class="sched-des-detail-body">'
		    	                	   +     		 '<input type="hidden" class="schedDestNo" name="destNo" value="' + result[i].destNo + '">'
					    	           +         '</tbody>'
					    	           +       '</table>'
					    	           + '</div>';
		    				$('#sched-box').append(schedArea);
						    selectSchedule(result[i].destNo);
    					}
    				} // for문
		  	            rootArea += rootAddIcon;
    					$('#root-area').html(rootArea);
    					selectPlan();
    			}
    		})
    	};
    	
    	function selectSchedule(destNo){
    		$.ajax({
    			url : 'selectSchedule.ajaxplan',
    			type : 'post',
    			data : {
    				destNo : destNo,
    				status : 'N'
    			},
    			success : function(result){
    				let schedTable = '';
    				let schedCostSum = 0;

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
			                            +	 '<td class="sched-detail-btn-area"><img class="sched-detail-btn update-sched" src="resources/icons/pencil-square.svg"><img class="sched-detail-btn delete-sched" src="resources/icons/x-circle-fill.svg"></td>'
			                            + '</tr>';

			                schedCostSum += parseInt(result[i].schedCost.split(',').join(''));

    					}
    				}
    				$('.schedDestNo[value=' + destNo + ']').nextAll().remove();
                    $(schedTable).insertAfter('.schedDestNo[value=' + destNo + ']');

                    $('.schedDestNo[value=' + destNo + ']').parent().parent().parent().prev('.sched-des').find('.schedCostSum').text(schedCostSum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '원');
					console.log($('.schedDestNo[value=' + destNo + ']').parent().parent().parent().prev('.sched-des').find('.schedCostSum'));
                    
    			}
    		})
    	};
    	
    </script>

	
	<!-- 여행 종료 Modal -->
	<div class="modal" id="endDesModal">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-body" id="endModalBody">
					<p>돌아가는 이동 수단을 등록 하시겠습니까?</p>
					<button class="btn btn-sm btn-primary" id="openEndDetail">등록 진행</button>
					<button class="btn btn-sm btn-success" id="insertEndDestNull">등록 안함</button>
					<button class="btn btn-sm btn-dark" id="cancelEndDest">취소</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 등록 진행 시  -->
	<script>
	$(function(){
		// 귀국일 insert 
		$('.submit-plan').on('click', function(){ // 여행 종료 버튼 클릭시
			if($('.root-card').length == 0){
				alert('목적지가 최소 한개 이상 등록이 되어야합니다.');				
			}
			else{
				$('#endDesModal').show();
			}
		});
		$('#cancelEndDest').click(function(){ // 취소버튼 
			$('#endDesModal').hide();
		});
		$('#cancelEndDesDetail').click(function(){ // 귀국 이동수단 취소버튼
			$('#endDesDetailModal').hide();
		});
		$('#openEndDetail').click(function(){
			$('#endDesModal').hide();
			
			// input 값 초기화
			$('#transport-end option:first').prop('selected', true);
			$('#trans-price-end').val('0');
			$('#add-day-end').prop('checked', false);
			$('#arr-time-end').val('');
			
			$('#endDesDetailModal').show();
		});
		// 귀국 INSERT 등록 안했을 시
		$('#insertEndDestNull').click(function(){
			const endDest = {
					planNo : ${ planNo },
					trans : '등록 안함',
					transPrice : 0,
					trip : '귀국',
					arrival : $('#dep-date-end').val() + ' ' + $('#dep-time-end').val(),
			}
			insertEndDestination(endDest);
			$('#endDesModal').hide();
		});
		// 귀국 INSERT 이동수단 등록 시 
		$('#insertEndDest').click(function(){
			const endDest = {
					planNo : ${ planNo },
					trans : $('#transport-end').val(),
					transPrice : $('#trans-price-end').val(),
					trip : '편도',
					arrival : $('#arr-date-end').val() + ' ' + $('#arr-time-end').val(),
			}
			insertEndDestination(endDest);
			$('#endDesDetailModal').hide();
		})
	})
	// 귀국 INSERT AJAX
	function insertEndDestination(endDest){
		window.removeEventListener('beforeunload', beforeEvent);
		const $scheds = $('.sched-tr').length;
		$.ajax({
			url : 'insertEndDestination.ajaxplan',
			type : 'post',
			data : endDest,
			success : function(result){
				if(result > 0){
					location.href = '${ contextPath }/publishPlan.plan?planNo=${ planNo }&scheds=' + $scheds;
				}
				else{
					alert('오류 발생.. 다시 시도해주세요.');
					window.addEventListener('beforeunload', beforeEvent);
				}
			}
		})
	}
	
	
	
	</script>
	
	<!-- 여행 종료 Modal -->
	<div class="modal" id="endDesDetailModal">
		<div class="modal-dialog-centered modal-lg" id="modal-dialog-endDes">
			<div class="modal-content" id="modal-content-endDes" style="width:380px">
				<div class="modal-body" id="endDesDetailModalBody">
					<select name="transport" id="transport-end">
	                    <option value="" disabled selected>이동수단</option>
	                    <option value="항공">항공</option>
	                    <option value="기차">기차</option>
	                    <option value="버스">버스</option>
	                    <option value="여객선">여객선</option>
	                    <option value="렌트카">렌트카</option>
	                    <option value="기타">기타</option>
                    </select>
                    <input type="text" name="trans-price" id="trans-price-end" value="0">원 <br>
					출발일시 : <input type="date" name="dep-date" id="dep-date-end" disabled> 
                    <input type="time" name="dep-time" id="dep-time-end" class="timepicker" disabled><br>
                    <input type="date" name="arr-date" id="arr-date-end" style="display:none;">
                                             도착시간 : <input type="time" name="arr-time" id="arr-time-end" class="timepicker">
                    <input type="checkbox" name="add-day" id="add-day-end"><label for="add-day">+1 일</label> <br>
				</div>
				<div style="margin-bottom:12px;">
					<button class="btn btn-sm btn-danger btn-endDest" id="insertEndDest">등록</button>
					<button class="btn btn-sm btn-dark btn-endDest" id="cancelEndDesDetail">취소</button>
				</div>
			</div>
		</div>
	</div>
   	

    <script>
    	const beforeEvent = function unloadEvent(event){
    		event.preventDefault();
    	}
    	window.addEventListener('beforeunload', beforeEvent);
    </script>

    
    
    
    

</body>
</html>
