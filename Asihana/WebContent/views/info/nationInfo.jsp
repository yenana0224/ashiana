<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.semi.info.model.vo.Nation"%>
    
<%
	Nation nation = (Nation)request.getAttribute("nation");
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

            /* 이미지 영역 사이즈 조절 */
        .swiper {
            width: 100%;
            height: 400px;
        }

        /* 이미지 사이즈 조절 */
        .swiper-slide>img {
            width : 100%;
            height : 100%;
        }

        /* 화살표 버튼색 변경 (기본색은 파란색) */
        div[class^=swiper-button] {
            color : white;
            /* display : none; */ /* 아니면 안보이게 숨기기도 가능 */
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
            <a href="<%=contextPath%>/index.jsp">홈</a> 
            <span> > </span>
            <a href="#"><%= nation.getNationName() %></a>
        </div>

        <div class="nationIntro">
            <div id="content_1">
                <!-- Slider main container -->
                <div class="swiper">
                    <!-- Additional required wrapper -->
                    <div class="swiper-wrapper">
                        <!-- Slides -->
                        <div class="swiper-slide"><img src="https://cdn.pixabay.com/photo/2017/04/11/15/55/animals-2222007__480.jpg"></div>
                        <div class="swiper-slide"><img src="https://cdn.pixabay.com/photo/2015/12/06/09/15/maple-1079235__480.jpg"></div>
                        <div class="swiper-slide"><img src="https://cdn.pixabay.com/photo/2016/09/01/19/53/pocket-watch-1637396__480.jpg"></div>
                        <div class="swiper-slide"><img src="https://cdn.pixabay.com/photo/2016/05/27/08/51/mobile-phone-1419275__480.jpg"></div>
                        <div class="swiper-slide"><img src="https://cdn.pixabay.com/photo/2015/09/01/09/32/alphabet-916673__480.jpg"></div>
                    </div>
                
                    <!-- If we need pagination -->
                    <div class="swiper-pagination"></div>
                
                    <!-- If we need navigation buttons -->
                    <div class="swiper-button-prev"></div>
                    <div class="swiper-button-next"></div>
                
                    <!-- If we need scrollbar -->
                    <div class="swiper-scrollbar"></div>
                </div>
            </div>
            <br><br>
            <h4> 여행객들이 많이 찾는 관광지</h4>
            <br>

                <div class="cityView">
                    <div class="city">
                        <div class="cityPhoto">
                            <img src="https://tourimage.interpark.com//Spot/187/15599/202112/6377508663314465670.jpg" alt="">
                        </div>
                        <div class="cityName">
                            <h5>피렌체</h5>
                            <h6>이탈리아</h6>
                        </div>
                    </div>
                    <div class="city">
                        <div class="cityPhoto">
                            <img src=https://ak-d.tripcdn.com/images/1i6192224syebo5lcFD0D_W_400_0_R5_Q90.jpg?proc=source/trip" alt="">
                        </div>
                        <div class="cityName">
                            <h5>도쿄</h5>
                            <h6>일본</h6>
                        </div>
                    </div>
                    <div class="city">
                        <div class="cityPhoto">
                            <img src="https://mblogthumb-phinf.pstatic.net/MjAxNjEyMDZfMjc2/MDAxNDgwOTUzMzQ2NDMy.XZTVP0zjye6zsCzTNFiRM72yprWmzNRuF_yrZvYRD8cg.r-VzTAWxS9qAxdpTcXcNdWIUPoc0MlwQdMFswLi1O5Qg.JPEG.minzsnap/IMG_3725.JPG?type=w420" alt="">
                        </div>
                        <div class="cityName">
                            <h5>어디지</h5>
                            <h6>스위스</h6>
                        </div>
                    </div>
                    <div class="city">
                        <div class="cityPhoto">
                            <img src="https://st3.depositphotos.com/22201120/37041/i/1600/depositphotos_370410358-stock-photo-jinbi-square-golden-horse-jade.jpg" alt="">
                        </div>
                        <div class="cityName">
                            <h5>아마</h5>
                            <h6>중국</h6>
                        </div>
                    </div>   
                </div>
                <div class="cityView">
                    <div class="city">
                        <div class="cityPhoto">
                            <img src="https://tourimage.interpark.com//Spot/187/15599/202112/6377508663314465670.jpg" alt="">
                        </div>
                        <div class="cityName">
                            <h5>피렌체</h5>
                            <h6>이탈리아</h6>
                        </div>
                    </div>
                    <div class="city">
                        <div class="cityPhoto">
                            <img src=https://ak-d.tripcdn.com/images/1i6192224syebo5lcFD0D_W_400_0_R5_Q90.jpg?proc=source/trip" alt="">
                        </div>
                        <div class="cityName">
                            <h5>도쿄</h5>
                            <h6>일본</h6>
                        </div>
                    </div>
                    <div class="city">
                        <div class="cityPhoto">
                            <img src="https://mblogthumb-phinf.pstatic.net/MjAxNjEyMDZfMjc2/MDAxNDgwOTUzMzQ2NDMy.XZTVP0zjye6zsCzTNFiRM72yprWmzNRuF_yrZvYRD8cg.r-VzTAWxS9qAxdpTcXcNdWIUPoc0MlwQdMFswLi1O5Qg.JPEG.minzsnap/IMG_3725.JPG?type=w420" alt="">
                        </div>
                        <div class="cityName">
                            <h5>어디지</h5>
                            <h6>스위스</h6>
                        </div>
                    </div>
                    <div class="city">
                        <div class="cityPhoto">
                            <img src="https://st3.depositphotos.com/22201120/37041/i/1600/depositphotos_370410358-stock-photo-jinbi-square-golden-horse-jade.jpg" alt="">
                        </div>
                        <div class="cityName">
                            <h5>아마</h5>
                            <h6>중국</h6>
                        </div>
                    </div>   
                </div>

        </div>

    </div>

    <script>
        // 슬라이더 동작 정의
        const swiper = new Swiper('.swiper', {
            autoplay : {
                delay : 3000 // 3초마다 이미지 변경
            },
            loop : true, //반복 재생 여부
            slidesPerView : 1, // 이전, 이후 사진 미리보기 갯수
            pagination: { // 페이징 버튼 클릭 시 이미지 이동 가능
                el: '.swiper-pagination',
                clickable: true
            },
            navigation: { // 화살표 버튼 클릭 시 이미지 이동 가능
                prevEl: '.swiper-button-prev',
                nextEl: '.swiper-button-next'
            }
        });
         
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