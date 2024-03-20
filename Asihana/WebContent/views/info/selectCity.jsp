<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <title>Document</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

    <style>
        *{
            box-sizing: border-box;
            text-decoration: none;
            color : black;
            margin: 0;
            padding : 0;
        }

        .outer{
            width: 1200px;
        }

        .main{
            width : 1000px;
            margin : auto;
        }

        #mainComent{
            font-weight: bold;
            text-align: center;
            margin-bottom: 50px;
        }

        .selectbar{
            width: 35%;
            height: 50px;
            margin:auto;
        }

        select{
            width: 150px;
            height: 30px;
            display: inline-flex;
        }


        .cityView{
            margin-top: 20px;
            width: 100%;
            background-color: faf3dd;
            padding-left : 40px;
        }
        .city{
            width: 225px;
            height: 300px;
            display: inline-block;
            border : 1px solid lightslategray;
        }

        .cityPhoto{
            width: 100%;
            height: 70%;
            border : 1px solid black;
        }

        .cityName{
            text-align: center;
            font-weight: bold;
            margin-top : 20px;
        }
    </style>
</head>
<body>

    <div class="outer">
        <div class="main">
            <br><br><br>
            <h2 id="mainComent">어디로 떠나고 싶으세요?</h2>
            <div class="selectbar">
                <form action="#" method="GET">
                    <select name="nation" id="selectNation">
                        <option value="">국가</option>
                        <option value="">국가</option>
                        <option value="">국가</option>
                        <option value="">국가</option>
                        <option value="">국가</option>
                        <option value="">국가</option>
                        <option value="">국가</option>
                    </select>
                    <select name="city" id="selectCity">
                        <option value="">도시</option>
                        <option value="">도시</option>
                        <option value="">도시</option>
                        <option value="">도시</option>
                        <option value="">도시</option>
                        <option value="">도시</option>
                    </select> 
                    <button type="submit" class="btn btn-sm btn-basic" width="20px">Go</button>
                </form>
            </div>
            <br><br><br>
            <div>
                <h4>인기있는 여행지</h4>
            </div>
            <br>
            <div class="cityView">
                <div class="city">
                    <div class="cityPhoto">
                        <img src="" alt="">
                    </div>
                    <h5 class="cityName">도쿄 <span>,</span> 일본 </h5>
                </div>
                <div class="city">
                    <div class="cityPhoto">
                        <img src="" alt="">
                    </div>
                    <h5 class="cityName">도쿄 <span>,</span> 일본 </h5>
                </div>
                <div class="city">
                    <div class="cityPhoto">
                        <img src="" alt="">
                    </div>
                    <h5 class="cityName">도쿄 <span>,</span> 일본 </h5>
                </div>
                <div class="city">
                    <div class="cityPhoto">
                        <img src="" alt="">
                    </div>
                    <h5 class="cityName">도쿄 <span>,</span> 일본 </h5>
                </div>
            </div>

            <div class="cityView">
                <div class="city">
                    <div class="cityPhoto">
                        <img src="" alt="">
                    </div>
                    <h5 class="cityName">도쿄 <span>,</span> 일본 </h5>
                </div>
                <div class="city">
                    <div class="cityPhoto">
                        <img src="" alt="">
                    </div>
                    <h5 class="cityName">도쿄 <span>,</span> 일본 </h5>
                </div>
                <div class="city">
                    <div class="cityPhoto">
                        <img src="" alt="">
                    </div>
                    <h5 class="cityName">도쿄 <span>,</span> 일본 </h5>
                </div>
                <div class="city">
                    <div class="cityPhoto">
                        <img src="" alt="">
                    </div>
                    <h5 class="cityName">도쿄 <span>,</span> 일본 </h5>
                </div>
            </div>
        </div>
    </div>
    
    
</body>
</html>