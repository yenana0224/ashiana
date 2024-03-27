<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

    <!--예약 및 일정 css-->
    <link rel="stylesheet" href="resources/css/plan/planInsertSched.css">
    
    <!--목적지 추가 모달 css -->
    <link rel="stylesheet" href="resources/css/plan/addDesModal.css">
    
    <!--목적지 추가/여행 종료 토스트 css-->
    <link rel="stylesheet" href="resources/css/plan/planInsertPlanToast.css">

    


    <!-- 아이콘 -->
    <!-- https://icons.getbootstrap.com/ -->

    <!-- 달력 -->
    
    <title>여행 플랜 작성</title>
    <style>
        div{
            width: 1200px;
            box-sizing: border-box;

        }
        
    </style>
</head>
<body>

    <div id="required-msg">
        <div>
            <label>출국 날짜를 설정해주세요.(시간 선택)</label>
        </div>
    </div>
    <form method="post">
        <div id="planning-interface">
             
            출국일시 : <input type="date" name="start-date" id="start-date" required>
            <input type="time" name="start-time" id="start-time"  class="timepicker">

            <button class="btn btn-sm btn-dark btn-int" type="button">취소</button>
            <button class="btn btn-sm btn-danger btn-int" type="submit">여행 플랜 완료</button>
            <button class="btn btn-sm btn-success btn-int" type="button" data-toggle="modal" data-target="#addDesModal">목적지 추가</button>
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
                        <span>대련-중국</span><input class="des-info-btn" type="color"><img class="des-info-btn" src="resources/icons/pencil-square.svg"><img class="des-info-btn" src="resources/icons/trash.svg"> <br>
                        <label>2월 27일</label> ~ <label>3월 1일</label>
                    </div>
                </div>
                
                <div class="root-line"></div>
                <div class="root-icon">
                    <img class="des-add-btn" src="resources/icons/plus-square-fill.svg">
                    <div class="toast" data-autohide="false" style="width: 240px;">
                        <div class="toast-body">
                            <button class="btn btn-sm btn-outline-danger btn-add-des" type="button" data-toggle="modal" data-target="#addDesModal">목적지 추가</button>
                            <button class="btn btn-sm btn-outline-success btn-end-plan" type="button">여행 종료</button>
                            <button class="btn btn-sm btn-outline-secondary btn-dismiss-toast" data-dismiss="toast">Ｘ</button>
                        </div>
                    </div>
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
                    <span class="sched-des-price">예약 및 일정 예산 <label>200,000원</label></span>
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
                                <th class="th5"></th>
                            </tr>
                        </thead>
                        <tbody class="sched-des-detail-body">
                            <tr class="sched-tr">
                                <td>숙소</td>
                                <td>파고다낭 호텔</td>
                                <td>오후 1시 체크인</td>
                                <td class="td-price">240,000원</td>
                                <td class="sched-detail-btn-area"><img class="sched-detail-btn" src="resources/icons/pencil-square.svg"><img class="sched-detail-btn" src="resources/icons/x-circle-fill.svg"></td>
                            </tr>
                            <!--
                            <tr class="sched-tr-add">
                                <td>
                                    <select name="sched-category" class="sched-category">
                                        <option value="선택">선택 안함</option>
                                        <option value="숙소">숙소</option>
                                        <option value="여행상품">여행상품</option>
                                        <option value="음식점">음식점</option>
                                        <option value="기타">기타</option>
                                    </select>
                                </td>
                                <td>
                                    <input type="text" name="sched-name" class="sched-name" placeholder="예약 및 일정 명">
                                </td>
                                <td>
                                    <input type="text" name="sched-content" class="sched-content" placeholder="예약 및 일정 내용">
                                </td>
                                <td>
                                    <input type="text" name="sched-price" class="sched-price" placeholder="0">원
                                </td>
                                <td class="sched-detail-btn-area"><img class="sched-detail-btn detail-btn-add" src="resources/icons/check-circle-fill-green.svg"><img class="sched-detail-btn detail-btn-cancel" src="resources/icons/x-circle-fill-red.svg"></td>
                            </tr>
                            -->
                        </tbody>
                      </table>
                </div>
    
                <div class="sched-des">
                    <span class="sched-des-city">대련-중국</span>
                    <span class="sched-des-date">3박 4일</span>
                    <div class="sched-btn-area">
                        <button class="btn btn-danger btn-add-sched">추가</button><img src="resources/icons/arrow-down-circle-fill.svg">
                    </div>
                    <span class="sched-des-price">예약 및 일정 예산 <label>200,000원</label></span>
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
                                <th class="th5"></th>
                            </tr>
                        </thead>
                        <tbody class="sched-des-detail-body">
                            <tr class="sched-tr-empty">
                                <td colspan="5">등록된 예약 및 일정이 없습니다.</td>
                            </tr>
                        </tbody>
                      </table>
                </div>
            </div>
        </div>
        <div id="submit-area">
            <div id="plan-sum">
                <span>이동 수단 가격 </span><label class="plan-sum-price">450,000원</label> +
                <span>예약 및 일정 예산 </span><label class="plan-sum-price"> 720,000원</label> +
                <span>귀국 항공 가격 </span><label class="plan-sum-price">200,000원</label> =
                <label class="plan-sum-total">총 예산 1,320,000원</label>
            </div>
            <button class="btn btn-danger">여행 플랜 완료</button>
            <button class="btn btn-dark">취소</button>
        </div>
    </form>

    <script> 
        // 출국 날짜 요구 메세지 슬라이드 업
        $('#start-date').change(function(){
            $('#required-msg').slideUp(500);
        })
        
        // 목적지 추가 토스트
        $(document).ready(function(){
            $('.des-add-btn').click(function(){
                $('.toast').toast('show');
            })
        });
    </script>
        

    <!-- 타임 피커 -->
    <script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js">
        $(document).ready(function(){
            $('input.timepicker').timepicker({ timeFormat: 'hh:mm' });
        });
    </script>

    <!-- The Modal -->
    <div class="modal" id="addDesModal">
        <div id="modal-dialog">
            <div id="modal-content">
                
                <!-- Modal Header -->
                <div id="modal-header">
                    <h4>목적지 추가</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                
                <!-- Modal body -->
                <form method="post" action="">
                <div id="modal-body">
                    <div id="modal-date-area">

                    </div>
                    <div id="modal-form-area">
                        <select name="country" id="country">
                            <option value="태국">태국</option>
                        </select>
                        <select name="city" id="city">
                            <option value="방콕">방콕</option>
                            <option value="크라비">크라비</option>
                        </select>
     
                        <input disabled type="text" name="country-city" id="country-city" value="국가-도시 선택">
                        
                        <select name="transport" id="transport">
                            <option value="선택 안함">이동수단</option>
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
                        <input type="text" name="transport-price" id="transport-price" value="0">원 <br>

                        출발일시 : <input type="date" name="dep-date" id="dep-date" value="2024-03-14" disabled> 
                        <input type="time" name="dep-time" id="dep-time" class="timepicker" value="14:00" disabled><br>
                        
                        <input type="date" name="arr-date" id="arr-date" value="" style="display:none;">
                        도착시간 : <input type="time" name="arr-time" id="arr-time" class="timepicker">
                        <input type="checkbox" name="add-day" id="add-day"><label for="add-day">+1 일</label> <br>
                        
                        출국일 : <input type="date" name="end-date" id="end-date"> <br>
                        출국시간 : <input type="time" name="end-time" id="end-time">
                        
                        <div id="des-sum">
                            <label>***</label>님의 일정 요약 <br>
                            <p>
                                <label id="dep-date-display">2024-03-14</label> <label id="dep-time-display">**:**</label>에 출발하여 <label id="arr-date-display">****-**-**</label> <label id="arr-time-display">**:**</label>에 <label id="country-city-display">**-**</label>로 도착합니다. <br>
                                해당 국가 출국은 <label id="end-date-display">****-**-**</label> <label id="end-time-display">**:**</label> 입니다.
                            </p>
                        </div>
                    </div>
                </div>
                
                <!-- Modal footer -->
                <div id="modal-footer">
                    <button type="submit" class="btn btn-danger">추가</button>
                    <button type="button" class="btn btn-dark" data-dismiss="modal">취소</button>
                </div>
                </form>
            </div>
        </div>
    </div>

    <!-- 모달 스크립트 -->
    <script>
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
        $(function(){
            $('#city').change(function(){ // 도시 선택시 인풋 벨류 변경
                $('#country-city').val($('#country').val() + '-' + $('#city').val());
            });
            $('#add-day').change(function(){ // +1일 체크박스
                console.log($('#arr-time').val())
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
            });

            $('#modal-form-area').ready(function(){ // 출발일시
                // 출발일 => 도착일 
                $('#arr-date').val($('#dep-date').val());

                // 출발일시 디스플레이
                $('#dep-date-display').text($('#dep-date').val());
                $('#dep-time-display').text($('#dep-time').val());
                // 도착일 디스플레이
                $('#arr-date-display').text($('#arr-date').val());
            });

            $('#modal-form-area').find('input, select').change(function(){
                
                $('#dep-time-display').text($('#dep-time').val());
                $('#arr-date-display').text($('#arr-date').val());
                $('#arr-time-display').text($('#arr-time').val());
                $('#country-city-display').text($('#country-city').val());
                $('#end-date-display').text($('#end-date').val());
                $('#end-time-display').text($('#end-time').val());
            })
        })
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
        $('.sched-des-detail-body').on('mouseover', '.sched-tr', function(){ // 추가 수정 삭제 버튼 호버
            $(this).find('.sched-detail-btn').css('visibility','visible');
        });
        $('.sched-des-detail-body').on('mouseout', '.sched-tr', function(){ // 추가 수정 삭제 버튼 호버
            $(this).find('.sched-detail-btn').css('visibility','hidden');
        });
        $('.btn-add-sched').on('click', function(){// 추가 버튼 클릭시
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
                        +       '<img class="sched-detail-btn detail-btn-add" src="resources/icons/check-circle-fill-green.svg">'
                        +       '<img class="sched-detail-btn detail-btn-cancel" src="resources/icons/x-circle-fill-red.svg">'
                        +   '</td>'
                    +  '</tr>';
            const $detail = $(this).parents('.sched-des').next().find('.sched-des-detail-body');
            
            if($detail.find('.sched-tr-add').length == 0){ // 예약/일정 추가 행이 존재하는지 여부
                $detail.find('.sched-tr-empty').remove(); // 등록 유도 행 제거
                $(trAdd).appendTo($detail); // 예약/일정 추가 행 추가
            }
            else {
                alert('추가 중인 예약 및 일정이 존재합니다.'); // 예약/일정 추가 행이 이미 있을 경우
            }
        });
        $('.sched-des-detail-body').on('click', '.detail-btn-cancel',function(){ // 예약/일정 추가 행 제거
            
            let trAdd = $(this).parent().parent('.sched-tr-add');
            if(trAdd.siblings('.sched-tr').length == 0){
                $(trEmpty).appendTo(trAdd.parents('.sched-des-detail-body'));
            }
            trAdd.remove();
        });
    </script>

    
</body>
</html>
