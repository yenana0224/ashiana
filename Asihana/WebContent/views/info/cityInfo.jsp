<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
    *{
        box-sizing: border-box;
        text-decoration: none;
        color : black;
        margin: 0px;
        padding : 0px;
    }

    .outer{
        width: 1000px;
        height: auto;
        margin: auto;
        margin-bottom: 70px;
    }

    .selectbar{
        width: 100%;
        height: 50px;
        float: right;
        display: block;
        text-align: right;
    }

    #selectwrap{
        margin-top: 20px;
        margin-right: 40px;
    }


    .selectbar h5{
        width: 15%;
        display: inline-block;
        text-align: center;
        line-height: 50px;
    }

    form{
        width : 300px;
        display: inline-block;
        line-height: 50px;
    }

    select{
        display : inline-flex;
        width: 115px;
        line-height: 50px;
    }

    .currentPage{
        padding-left: 20px;
        margin-bottom: 20px;
    }

    .currentPage > a, span {
        font-size: 30px;
        font-weight: 500;
    }

    .cityIntro{
        width: 100%;
        height: 400px;
        border : 1px solid blueviolet;
    }

    .introduce{
        float : left;
        width: 35%;
        height: 100%;
        border : 1px solid blue;
    }

    .cityphoto{
        float : left;
        width: 65%;
        height: 100%;
        border : 1px solid red;
    }

    .ment{
        width: 100%;
        height: 60%;
    }

    .time{

        width: 100%;
        height: 40%;
    }

    .outer p {
        border : 1px solid black;
        width: 100%;
        height: 100%;
        padding : 20px 20px 20px 20px;
        display: inline-block;
    }

    .cityphoto>img{
        width: 100%;
        height: 100%;
    }

    .checklist{
        width: 100%;
        height: 140px;
    }

    .weather{
        float : left;
        width: 50%;
        height: 100%;
    }
    
    .basicInfo{
        float : left;
        width: 50%;
        height: 100%;
    }

    .attract{
        width: 100%;
        height: 300px;
    }

    .atcontent{
        float : left;
        width: 22%;
        height: 100%;
        padding : 10px 20px 10px 20px;
        margin: 10px;
        border : 1px solid red;
    }

    .atphoto{
        width: 100%;
        height: 60%;
    }

    .atphoto>img{
        width: 100%;
        height: 100%;
    }

    .atname{
        width: 100%;
        text-align: center;
        font-size: 14px;
        font-weight: bold;
    }

    .atInfo{
        width: 100%;
        height: 30%;
    }
    
    .atInfo>p{
        padding : 0; 
        font-size: 11px;
    }
    
</style>

<body>

	<%@ include file="../common/headerbar.jsp"%>

    <div class="outer">
        <div class="selectbar">
            <div id="selectwrap">
                <h5>다른 여행지 보기</h5>
                <form action="#" method="GET">
                    <select name="nation" id="selectNation" onchange="nationChange(this)">
                        <option> 국가 선택 </option>
                        <option value="60">말레이시아</option>
                        <option value="62">인도네시아</option>
                        <option value="63">필리핀</option>
                        <option value="65">싱가포르</option>
                        <option value="66">태국</option>
                        <option value="81">일본</option>
                        <option value="82">대한민국</option>
                        <option value="84">베트남</option>
                        <option value="852">홍콩</option>
                        <option value="853">마카오</option>
                        <option value="855">캄보디아</option>
                        <option value="856">라오스</option>
                        <option value="86">중국</option>
                        <option value="880">방글라데시</option>
                        <option value="886">대만</option>
                    </select>
                    <select name="city" id="selectCity">
                        <option>도시선택</option>
                    </select> 
                    <button type="submit" class="btn btn-sm btn-basic" width="20px">　검색　</button>
                </form>
            </div>
        </div>
        <br><br><br><br>

        <div class="currentPage">
            <a href="<%=contextPath%>/main.info">홈</a> 
            <span> > </span>
            <a href="#">나라이름</a>
            <span> > </span>
            <a href="#">도시이름</a>
        </div>

        <div class="cityIntro">
            <div class="introduce">
                <div class="ment">
                    <p>이도시는 어쩌구저쩌구 이렇게 저렇게 예뻐요</p>
                </div>
                <div class="time">
                    <p>
                        도시까지 걸리는 시간(인천공항기준)
                    </p>
                </div>
            </div>
            <div class="cityphoto">
                <img src="https://www.midascad.com/hs-fs/hubfs/image-png-Nov-13-2023-12-40-12-5631-AM.png?width=1200&height=846&name=image-png-Nov-13-2023-12-40-12-5631-AM.png">
            </div>
        </div>
        <div class="checklist">
            <div class="weather">
                <p>
                    여기에 날씨가 들어가요
                </p>
            </div>
            <div class="basicInfo">
                <p>
                    전압 <br>
                    비자 <br>
                    사용언어 <br>
                    화폐 <br>
                </p>
            </div>
        </div>
        <br><br><br>
        <h4> 즐길거리 </h4>
        <br>
        <div class="attract">
            <div class="atcontent">
                <div class="atphoto">
                    <img src="" alt="">
                </div>
                <div class="atname">썬월드바나힐</div>
                <div class="atInfo">
                    <p>여기서 놀아요</p>
                </div>
            </div>
            <div class="atcontent">
                <div class="atphoto">
                    <img src="" alt="">
                </div>
                <div class="atname">썬월드바나힐</div>
                <div class="atInfo">
                    <p>여기서 놀아요</p>
                </div>
            </div>
            <div class="atcontent">
                <div class="atphoto">
                    <img src="" alt="">
                </div>
                <div class="atname">썬월드바나힐</div>
                <div class="atInfo">
                    <p>여기서 놀아요</p>
                </div>
            </div>
            <div class="atcontent">
                <div class="atphoto">
                    <img src="" alt="">
                </div>
                <div class="atname">썬월드바나힐</div>
                <div class="atInfo">
                    <p>여기서 놀아요</p>
                </div>
            </div>

        </div>
        
        <%@ include file="../common/footer.jsp" %>

</body>
</html>