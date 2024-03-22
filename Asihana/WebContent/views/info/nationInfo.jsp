<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.semi.info.model.vo.*, java.util.ArrayList"%>
    
<%
	Nation nation = (Nation)request.getAttribute("nation");
	ArrayList<City> list = (ArrayList<City>)request.getAttribute("cityList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
    <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
    <script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
    
    <style>
        *{
            box-sizing: border-box;
            text-decoration: none;
            color : black;
            margin: 0;
            padding : 0;
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

        .nationIntro{
            width: 100%;
            height: auto;
        }

        .cityPhoto{
            width: 100%;
            height: 400px;
        }
        
        .cityPhoto>img{
        	width : 100;
        	height: 100%
        	
        }
        	

        .nationIntro>h4{
            margin-left: 20px;
            font-size: large;
        }
        
        #nationPhoto{
            width: 100%;
            height: 500px;
        }

        #nationPhoto>img{
            width: 100%;
            height: 100%;
        }

        .cityList{
            width: 100%;
            height: auto;
            display: block;
        }

        .cityView{
            width: 100%;
            background-color: #faf3dd;
            padding-left : 30px;
        }
        .city{
            background-color: white;
            margin : 20px 0px 20px 0px;
            width: 225px;
            height: 300px;
            display: inline-block;
            margin-right: 7px;
            box-shadow: 1px 1px 5px 2px gray ;
        }

        .cityPhoto{
            margin-top: 5px;
            margin-left: 5px;
            width: 100%;
            height: 70%;
        }

        .cityPhoto>img{
            width: 95%;
            height: 95%;
        }

        .cityName{
            width: 100%;
            height: 20%;
            background-color: white;
        }

        .cityName>h5{
            line-height: 30px;
            text-align: center;
            font-weight: 800;
            margin : 0px;
        }
        .cityName>h6{
            line-height: 40px;
            text-align: center;
            font-weight: 800;
        }
    </style>

</head>
<body>

	<%@ include file="../common/headerbar.jsp" %>

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
            <a href="#"><%= nation.getNationName() %></a>
        </div>

        <div class="nationIntro">
            <div id="nationPhoto">
                <img src="http://d3b39vpyptsv01.cloudfront.net/photo/1/2/9331fa26a6d4d1ba7e62333d8bd95a86.jpg" alt="">
            </div>
            
            <br><br>
            <h4> 여행객들이 많이 찾는 관광지</h4>
            <br>

                <div class="cityView">

		            <% for(City c : list) { %>
		                <div class="city">
		                    <div class="cityPhoto">
		                        <img src="https://tourimage.interpark.com//Spot/187/15599/202112/6377508663314465670.jpg" alt="">
		                    </div>
		                    <div class="cityName">
		                        <h5><%=c.getCityName() %></h5>
		                    </div>
		                </div>
		 			<% } %>
                </div>

        </div>

    </div>

    <script>

        function nationChange(e){

            var mal = ["말라카", "랑카위", "조호르바루", "코타키나발루", "쿠알라룸푸르", "페낭"];
            var ind = ["롬복", "발리", "빈탄", "욕야카르타", "자카르타"];
            var phi = ["마닐라", "보라카이", "보홀", "세부"];
            var tha = ["끄라비", "방콕", "코사무이", "푸켓", "후아힌"];
            var jap = ["고베", "교토", "도쿄", "오사카", "오키나와", "후쿠오카", "홋카이도"];
            var vie = ["나트랑", "푸꾸옥", "하노이", "호치민"];
            var chi = ["대련", "베이징", "상해", "서안", "장가계", "중경", "하얼빈", "하이난"];
            var cam = ["프놈펜", "씨엠립"];
            var lao = ["비엔티안", "루앙프라방", "방비엥", "팍세"];
            var tai = ["가오슝", "타이베이", "타이중"];

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
    
    	<%@ include file="../common/footer.jsp" %>

</body>
</html>