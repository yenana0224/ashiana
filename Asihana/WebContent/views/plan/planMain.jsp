<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    
<title>아시하나 플랜</title>
</head>
<body>
	<style>
	div{
            box-sizing: border-box;
            width: 1200px;
        }
        #outer{
            margin : auto;
            margin-top: 50px;
        }
        #my-plans-area{  /* 나의 여행 플랜 영역 */
                overflow: auto;
                height: 430px;
                padding-left: 110px;
                padding-top: 20px;
                background-color: rgb(250, 243, 221);
            }
            #my-plans-area > h3{font-weight: 600;}
            #start-plan-area{
                height: 500px;
            }
            #plans-area{
                height: 500px;
            }
            .my-plan-card{
                background-color: white;
                border: 1px solid lightgrey;
                border-radius: 3px;
                /* box-shadow: 0px 0px 2px 2px lightgrey; */
                display: inline-block;
                width: 220px;
                height: 320px;
                margin: 16px 10px 20px 10px;
                position: relative;       
            }
            .my-plan-card > div{
                width: 200px;
                height: 300px;
                margin: 10px;
                position: absolute;
                > h5{
                    text-align: center;
                    font-weight: 600;
                    margin-top: 5px;
                }
            }
            .button{
                float: right;
                font-size: 12px;
                width: 32px;
                height: 24px;
                padding: 0;
                margin-top: 5px;
                position: absolute;
            }
            .card-content{
                width: 190px;
                font-size: 15px;
                line-height: 1.2;
                margin-left: 5px;
                margin-right: 5px;
    
            }
            .card-content-1{
                float: left;
                width: 60%;
                text-align: left;
    
            }
            .card-content-2{
                float: right;
                width: 40%;
                text-align: right;
            }
            .card-content-3{
                width: 100%;
                text-align: center;
                font-size: 10px;
                color: rgb(145, 145, 145);
            }
            .planning-card{
                padding-top: 40px;
                width: 200px;
                text-align: center;
                >h5{
                    font-size: 16px;
                }
                >p{
                    font-size: 14px;
                    width: 100%;
                    margin: 30px 0 30px 0;
                }
            }
            .btn-card{
                visibility: hidden;
            }
            .my-plan-card:hover{
                cursor: pointer;
                box-shadow: 0px 0px 2px 2px lightgrey;
                .btn-card{
                    visibility: visible;
                }
            }

        /*----------------------------------*/
        #start-plan-area{
            height: 500px;
            padding-left: 100px;
            padding-right: 50px;
            > div{
                float: left;
            }
        }
        #start-plan-pic{
            margin: 20px;
            height: 460px;
            width: 660px;
            border: 1px solid lightgray;
        }
        #start-plan-msg{
            margin-top: 20px;
            height: 460px;
            width: 330px;
        }
        .plan-msg{
            width: 100%;
            margin-top: 20px;
        }
        #city-area{
            width: 100%;
            margin-top: 20px;
        }
        #card-area{
            height: auto;
            width: 100%;
            display: inline-block;
        }
        .city-card{
            border: 1px solid lightgrey;
            padding: auto;
            margin-right: 10px;
            width: 100px;
            height: 150px;
            text-align: center;
            float: left;
            > img{
                border: 1px solid lightgrey;
                margin-top: 5px;
                width: 90%;
                height: 90px;
            }
            > h5{
                font-size: 16px;
                font-weight: 600;
                margin-top: 5px;
                margin-bottom: 0px;
            }
            > label{
                font-size: 12px;
                margin-top: 0px;
                color: darkgrey;
            }
        }
        .city-card:hover{
            cursor: pointer;
            box-shadow: 0px 0px 1px 1px lightgray;
            > img{
                opacity: 0.9;
            }
        }
    </style>
</head>
<body>

	<%@ include file="../common/headerbar.jsp" %>

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
                <button class="btn button btn-danger btn-card" style="right: 5px;">삭제</button>
                <button class="btn button btn-success btn-card"style="right: 37px;">수정</button>
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
                <img src="resources/여행플랜유도.png" width="100%" height="100%">
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
        <div id="plans-area"></div>
    </div>



    
</body>
</html>
	




</body>
</html>