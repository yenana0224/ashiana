<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.semi.info.model.vo.City, java.util.List" %>
<%
	List<City> cityList = (List<City>)request.getAttribute("cityList");
	int planNo = (int)request.getAttribute("planNo");
%>
<%@ include file="../common/headerbar.jsp" %>
<%@ include file="planCss.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행 플랜 수정</title>
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
	    
		<input type="hidden" name="startDestNo" id="startDestNo" value="">
		<input type="hidden" name="planNo" id="planNo" value="<%=planNo%>">
	    <form method="post">
	        <div id="planning-interface">

				출국일시 : <input type="date" name="start-date" id="start-date">
				<input type="time" name="start-time" id="start-time" class="timepicker">
			    <button class="btn btn-sm btn-success btn-date-int" id="setStartDate" type="button">날짜 설정</button>
			    <button class="btn btn-sm btn-danger btn-date-int" id="updateStartDate" type="button">날짜 수정</button>
			    <button class="btn btn-sm btn-success btn-date-int" id="doUpdate" type="button">수정</button>
			    <button class="btn btn-sm btn-dark btn-date-int" id="cancelUpdate" type="button">취소</button>
	            <button class="btn btn-sm btn-dark btn-int cancel-plan" type="button">취소</button>
	            <button class="btn btn-sm btn-danger btn-int update-plan" type="button">여행 플랜 수정</button>
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
	            <button type="button" class="btn btn-danger submit-plan">여행 플랜 수정</button>
	            <button type="button" class="btn btn-dark cancel-plan">취소</button>
	        </div>
	    </form>
	</div> <!-- outer -->
	
	<%@ include file="../common/footer.jsp" %>
	
	<script>
		$(function(){
	        // 목적지 추가 토스트
	        $('#root-area').on('click', '.des-add-btn', function(){
	            if($('.planToast').css('display') == 'none') $('.planToast').show(100);
	            else $('.planToast').hide(100);
	        })
	        // 작성 취소 버튼 클릭 시 플랜 메인 화면으로 이동
	        $('.cancel-plan').click(function(){
	        	location.href = '<%=contextPath%>/planMain.plan';
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
                    	<input type="hidden" name="prevCity"> <!-- 수정 시 도시가 바뀌었는지 체크하는 용 -->
                        <select name="country" id="country">
                        	<option value="국가 선택" disabled selected>국가 선택</option>
                            <% for(int i = 0; i < cityList.size(); i++) { %>
                            	<% if(i == 0 && !cityList.get(i).getNationName().equals("대한민국")) { %>
	                            	<option value="<%= cityList.get(i).getNationName() %>"><%= cityList.get(i).getNationName() %></option>
                            	<% } %>
	                            <% if(i > 0 && !cityList.get(i - 1).getNationName().equals(cityList.get(i).getNationName()) && !cityList.get(i).getNationName().equals("대한민국")) { %>
	                            	<option value="<%= cityList.get(i).getNationName() %>"><%= cityList.get(i).getNationName() %></option>
	                            <% } %>
                            <% } %>
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
                            <label><%= loginUser.getNickName() %></label>님의 일정 요약 <br>
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
    			<% for(City city : cityList) { %>
    				if($('#country').val() == '<%=city.getNationName()%>'){
    					$('<option value="<%= city.getCityNo() %>"><%= city.getCityName() %></option>').insertAfter('#selectCity');
    				}
    			<% } %>
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
                $('#country-city').val($('#country').val() + '-' + $('#city option:checked').text());
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
				let display = '<label><%= loginUser.getNickName() %></label>님의 일정 요약 <br>'
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
	            			planNo : <%= planNo %>,
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
			})
            
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
            			planNo : <%= planNo %>,
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


</body>
</html>