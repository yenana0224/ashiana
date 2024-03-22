<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.kh.semi.info.model.vo.City"%>
<%
	ArrayList<City> list = (ArrayList<City>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <title>Document</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
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
            margin : auto;
            margin-bottom : 100px;
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
        <div class="main">
            <br><br><br>
            <h2 id="mainComent">어디로 떠나고 싶으세요?</h2>
            <div class="selectbar">
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
                        <option>도시</option>
                    </select> 
                    <button type="submit" class="btn btn-sm btn-basic" width="20px"> Go </button>
                </form>
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

            <br><br><br>
            <div>
                <h4>인기있는 여행지</h4>
            </div>
            <br>
            <div class="cityView">
                <!-- 조회 많은 순서대로 도시 8개 노출 -->
            <% for(City c : list) { %>
                <div class="city">
                    <div class="cityPhoto">
                        <img src="https://tourimage.interpark.com//Spot/187/15599/202112/6377508663314465670.jpg" alt="">
                    </div>
                    <div class="cityName">
                        <h5><%=c.getCityName() %></h5>
                        <h6><%=c.getNationName() %></h6>
                    </div>
                </div>
 			<% } %>
            </div>

            <script>
                $(document).on('click', '.city', function(event){
                    location.href="<%=contextPath%>/search.info?nation=66&city=끄라비"
                })

            </script>

        </div>
    </div>
    
    	<%@ include file="../common/footer.jsp" %>

    
</body>
</html>