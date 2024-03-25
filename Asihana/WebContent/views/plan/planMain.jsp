<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

    <link rel="stylesheet" href="resources/css/plan/planMain.css">

    <title>여행 플랜 메인</title>

</head>
<body>

    <div id="outer">
        <div id="my-plans-area">
            <h3>나의 여행 플랜</h3>
            <div class="my-plan-card">
    
                <div>
                    <img src="https://i.pinimg.com/564x/cc/3a/d0/cc3ad03320fb0b7ac2407f535e605bc3.jpg" width="200" height="200">
                    <h5>도시</h5>
                    <div class="card-content">
                        <div class="card-content-1">
                            <label>12월 27일 출발</label> <br>
                            <label>D-11</label>
                        </div>
                        <div class="card-content-2">
                            <label>6박 7일</label> <br>
                            <label>132만</label>
                        </div>
                        <div class="card-content-3">
                            <label>2023년 12월 3일 작성/수정</label>
                        </div>
                    </div>
                </div>
                <button id="card-delete" class="btn button btn-danger btn-card" style="right: 5px;">삭제</button>
                <button id="card-edit" class="btn button btn-success btn-card" style="right: 37px;">수정</button>
            </div>
            
    
            <div class="my-plan-card">
                <div class="planning-card">   
                    <h5>계획된 여행이 없습니다.</h5>
                    <p>
                        목적지 설정부터 숙소 및 각종<br>여행 상품 예약 내용까지!<br><br><label>***</label>님의 여행 계획을 자세히<br>기록해보세요!
                    </p>
                    <button class="btn btn-sm btn-success">여행 플랜 추가</button>
                </div>
            </div>
            
        </div>

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
                    <button class="btn btn-outline-danger">나의 여행 플랜하기</button>
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
                        <div class="city-card">
                            <img src="https://i.namu.wiki/i/K7KMU0ZBa3wUxSmr8X-lA4DVqII6QMKJ5vBWiD3FTtYEZUIiUBn8vmZk1pCT44Q9-YXnWNigKDZCBLeMb_1RjEXAsz-U1kbVr2lafvxVh7WF9FIcg2B9vwHsUQhDm9CXrvbbk8VREzYUTV2g1gKaog.webp">
                            <h5>다낭</h5>
                            <label>베트남</label>
                        </div>
                        <div class="city-card">
                            <img src="https://i.namu.wiki/i/LBKzQOIRatNfnoBY1FoPnfTJJwfHEdDvYVsyJhFWXkaq0J1kc3ozcMDKzF_6XtVB4OmPmPW10WRDpSeRVwITf6bfy70-OSWmWDCM2CjUCGcdm8uJtkMGGhVQmGzfX2pOrM24M4lmFSxm7lAR0lHDGQ.webp">
                            <h5>삿포로</h5>
                            <label>일본</label>
                        </div>
                        <div class="city-card">
                            <img src="https://i.namu.wiki/i/KNlOyYgTdOVD9_0MW7v0wYo6Ygmrbma0tnSbR3NRUMJgprhaiELU-AbJYKjzu-apVfBGCwK34XtCBae44uE0rdgf812AGqXfTwKQkUOthbaA_Cy54De6oJ7PIVt1gcQp0BqynZWN9EEA2YT5tWa29w.webp">
                            <h5>로마</h5>
                            <label>이탈리아</label>
                        </div>
                        
    
                    </div>
    
                </div>
            </div>

        </div>
    </div>



    
</body>
</html>