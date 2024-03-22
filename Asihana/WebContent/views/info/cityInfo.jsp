<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.semi.info.model.vo.*"%>
<%
	City city = (City)request.getAttribute("City");
%>
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
                <form action="<%=contextPath%>/search.info" method="GET" name="selectNation">
                    <select name="nation" id="selectNation" onchange="nationChange(this)">
                        <option> 국가 선택 </option>
                        <option value="60">말레이시아</option>
                        <option value="62">인도네시아</option>
                        <option value="63">필리핀</option>
                        <option value="65">싱가포르</option>
                        <option value="66">태국</option>
                        <option value="81">일본</option>
                        <option value="84">베트남</option>
                        <option value="852">홍콩</option>
                        <option value="853">마카오</option>
                        <option value="855">캄보디아</option>
                        <option value="856">라오스</option>
                        <option value="86">중국</option>
                        <option value="886">대만</option>
                    </select>
                    <select name="city" id="selectCity">
                        <option>도시선택</option>
                    </select> 
                    <button type="submit" class="btn btn-sm btn-basic" width="20px">　검색　</button>
                </form>
            </div>
      </div>    
          
       <script>
            function nationChange(e){

                var mal = ["도시선택", "말라카", "랑카위", "조호르바루", "코타키나발루", "쿠알라룸푸르", "페낭"];
                var ind = ["도시선택", "롬복", "발리", "빈탄", "욕야카르타", "자카르타"];
                var phi = ["도시선택", "마닐라", "보라카이", "보홀", "세부"];
                var tha = ["도시선택", "끄라비", "방콕", "코사무이", "푸켓", "후아힌"];
                var jap = ["도시선택", "고베", "교토", "도쿄", "오사카", "오키나와", "후쿠오카", "홋카이도"];
                var vie = ["도시선택", "나트랑", "푸꾸옥", "하노이", "호치민"];
                var chi = ["도시선택", "대련", "베이징", "상해", "서안", "장가계", "중경", "하얼빈", "하이난"];
                var cam = ["도시선택", "프놈펜", "씨엠립"];
                var lao = ["도시선택", "비엔티안", "루앙프라방", "방비엥", "팍세"];
                var tai = ["도시선택", "가오슝", "타이베이", "타이중"];

                var target = document.getElementById("selectCity");

                if(e.value == "60") var d = mal;
                else if(e.value == "62") var d = ind;
                else if(e.value == "63") var d = phi;
                else if(e.value == "65") var d = ["싱가포르"];
                else if(e.value == "66") var d = tha;
                else if(e.value == "81") var d = jap;
                else if(e.value == "84") var d = vie;
                else if(e.value == "852") var d = ["홍콩"];
                else if(e.value == "853") var d = ["마카오"];
                else if(e.value == "855") var d = cam;
                else if(e.value == "856") var d = lao;
                else if(e.value == "86") var d = chi;
                else if(e.value == "886") var d = tai;

                $('#selectCity').empty();

                for(x in d){
                    var opt = document.createElement("option");
                    opt.value = d[x];
                    opt.innerHTML = d[x];
                    target.appendChild(opt);
                }
            }
        </script>
    

        <br><br><br><br>

        <div class="currentPage">
            <a href="<%=contextPath%>/main.info">홈</a> 
            <span> > </span>
            <a href="#"><%= city.getNationName() %></a>
            <% if(city.getNationNo() != 65 && city.getNationNo() != 852) { %>
            <span> > </span>
            <a href="#"><%= city.getCityName() %></a>
            <% } %>
        </div>

        <div class="cityIntro">
            <div class="introduce">
                <div class="ment">
                    <p>
                    	<%= city.getCityContent() %>
                    </p>
                </div>
                <div class="time">
                    <p>
                      	도시까지 걸리는 시간(인천공항기준)<br>
                        <%= city.getFlyingTime() %>
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
			                    전압 : <%= city.getVoltage() %><br>
			                    비자 : <%= city.getVisaName() %><br>
			                    사용언어 : <%= city.getLanguage() %> <br>
			                    화폐 : <%=city.getCurrency() %><br>
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
    </div>
        
    <%@ include file="../common/footer.jsp" %>


  
</body>
</html>