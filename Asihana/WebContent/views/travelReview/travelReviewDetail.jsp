<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.kh.semi.travelReview.model.vo.HashTag, com.kh.semi.travelReview.model.vo.TravelReview" %>
<%
	TravelReview review = (TravelReview)request.getAttribute("review");
	List<HashTag> hashTagList = (List<HashTag>)session.getAttribute("hashTagList");
	
	List<HashTag> checkedHashTagList = (List<HashTag>)session.getAttribute("checkedHashTagList");
%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>여행기 상세 조회 화면</title>
    
    <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
    <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>


    <style>
    /* 이미지 영역 사이즈 조절 */
    .swiper {
        width: 440px;
        height: 280px;
    }

    /* 이미지 사이즈 조절 */
    .swiper-slide>img {
        width : 100%;
        height : 100%;
    }

    /* 화살표 버튼색 변경 (기본색은 파란색) */
    div[class^=swiper-button] {
        color : grey;
        /* display : none; */ /* 아니면 안보이게 숨기기도 가능 */
    }

    #content-wrap{
        width: 1200px;
        height : auto;
        margin : auto;
        font-family : 본고딕;
    }
    #content-1wrap{
        width: 100%;
        height : 250px;
        background-color :rgb(46, 204, 113);
        > div{
            float : left;
        }
    }

    .content-1wrap{
        width : 300px;
        height : 100%;
    }

    #content-1-2{
        width: 594px;
    }

    #content-1-title{
        margin-top : 50px;
    }

    #area2{
        margin-left : 100px;
        height : 742px;
        background-color : rgb(250, 243, 221);
    }

    #content-2wrap{
        width : 90%;
        height : 280px;
        display : inline-block;

        >div {
            height : 100%;
            float : left;
        }
    }
    #content-wrap-1-1{
        width : 100%;
        height : 75%;
        display : inline-block;

        >div {
            height: 100%;
            float : left;
        }
    }

    #content-warp-1-1-1{
        width: 70%;

        >div {
            width : 100%;
            height : 20%;
            line-height: center;
            padding-top : 10px;
        }
    }

    #content-warp-1-1-2{
        width : 30%;
        >p {
            text-align : left;
            line-height: 30px;
        }     
    }

    #content-wrap-1-2{
        width: 100%;
        height : 25%;
    }   

    #content-wrap-1-2-1{
        width: 100%;
        height : 30%;
    }

    #content-wrap-1-2-2{
        width: 100%;
        height: 70%;
    }


    #content-wrap-1{
        width : 55%;
        >div{
            width: 100%;
        }
    }

    #content-wrap-2{
        width : 44.7%;
    }


    #content-3wrap{
        width : 90%;
        height : 250px;
    }

    #content-wrap-3-1{
        margin-top : 10px;
        height : 80%;
    }

    #content-wrap-3-2{
        height : 20%;
        >div {
            float : left;
        }
    }

    #content-wrap-3-2-1{
        width: 35%;
        height : 100%;
    }

    #content-wrap-3-2-2{
        width: 65%;
        height : 100%;
    }

    #content-4wrap{
        width: 90%;
        height : 200px;
        float : left;

        >div{
            height : 100%;
            float : left;
        }
    }

    #content-wrap-4-1{
        width: 40%;
        > div{
            width : 100%;
        }
    }

    #plan{
        height : 30%;
        
        >h3{
            margin-top : 20px;
        }
    }

    #plan-check{
        height : 70%;
        >div{
            background-color : white; 
            display : inline-block;
        }
    }

    #content-wrap-4-2{
        width: 60%;
    }
    
    #content-wrap-4-2-1{
        height : 80%;

        >div{
            width: 100%;
        }
    }
    #like-area1{
        height : 60%;
    }
    #like-area2{
        height : 40%;
    }

    #content-wrap-4-2-2{
        height : 20%;
    }

    ol{
        list-style: none;  
        background-color : white; 
        margin: 0; 
        padding-left : 0; 
        padding-right : 35px; 
        padding-top : 0; 
        width : 495px;
    }

    </style>

</head>
<body>
	<%@ include file="../common/headerbar.jsp" %>
    <div id="content-wrap" > <!-- content 전체를 감싸는 wrap영역 -->
        
        <!--여기부터 content의 3분할 중 1영역-->
        <div id="content-1wrap">
            <div id="content-1-1" class="content-1wrap">
                <p></p>
            </div>
            <div id="content-1-2" class="content-1wrap" align="center">
                <div id="content-1-title">
                    <h3>여행자들의 생생한 여행기를 확인해보세요</h3>
                </div>
                <div id="content-1-2form">
                    <form action="#" method="get" name="search-form">
                        
                        <!-- 여기부터는 수업에서 배우는 내용 참고하여  수정 필요한 부분-->
                        <input type="search" style="display : inline-block; width: 80%; height: 55px; " placeholder="국가, 도시, 키워드로 검색" name="search">
                        <input type="submit" style="display : inline-block; width: 50px; height: 55px;" value="검색">
                        <ol align="left" >
                            
                            <!--1)DB에서 조회된 국가/도시 정보를 바탕으로 반복문을 통해서 li요소 추가, 
                                2)해당 li요소를 클랙했을 때 해당 국가 여행기 게시판으로 이동
                                -->
                            <li>일본</li>
                            <li>중국</li>
                            <li>태국</li>
                            <li>말레이시아</li>
                            <li>도쿄(일본)</li>
                        </ol>

                    </form>
                </div>
            </div>
            <div id="content-1-3" class="content-1wrap" >
                <p></p>
            </div>


        </div>


        <div id="area2">
            <div id="content-2wrap">
                
                <div id="content-wrap-1">
                    <div id="content-wrap-1-1">
                        <div id="content-warp-1-1-1" align="left">

                            <!--DB에서 조회된 결과가 내용에 들어감 -->
                            <div class="content-wrap-1-1-1" >
                                <h3 style="margin : 0;"><%=review.getReviewTitle() %></h3>
                            </div>
                            <div class="content-wrap-1-1-1">
                                <!--별점 구현 해야함 + 마진으로 위치 조정 해야 함-->
                                <label>별점</label><input type="radio"><input type="radio"><input type="radio"><input type="radio"><input type="radio">  <br>
                            </div>
                            <div class="content-wrap-1-1-1">
                                <input type="date" value="<%=review.getDepartureDate()%>" readonly> ~ <input type="date" value="<%=review.getArrivalDate()%>" readonly> <br>
                            </div>
                            <div class="content-wrap-1-1-1">
                                <label>여행지 : </label><span><%=review.getCityName() %></span>
                            </div>
                        </div>
                        <div id="content-warp-1-1-2">
                            <p>
                                <!--DB에서 조회된 결과가 내용에 들어감-->
                                <label>작성자 : </label><span><%= review.getReviewWriter() %></span> <br>
                                <label>작성일 : </label><span><%= review.getCreateDate() %></span> <br>
                                <label>조회수 : </label><span><%= review.getCount() %></span> <br>
                                <label>좋아요 : </label><span><%= review.getLikes() %></span> <br>
                            </p>
                        </div>
                    </div>

                    <div id="content-wrap-1-2">
                        <div id="content-wrap-1-2-1">
                            <h3 style="margin : 0;">동행</h3>
                        </div>
                        <div id="content-wrap-1-2-2">
                            <!--DB에서 조회된 결과과 일치하는 input요소의 checked 속성 부여를 해야함, 일치하지 않는 input에는 disabled 속성 부여
                                -->
                            <input type="radio" name="partner" value="A" style="margin-top : 20px;" checked><label>나홀로</label>
                            <input type="radio" name="partner" value="FM" disabled><label>가족</label>
                            <input type="radio" name="partner" value="F" disabled><label>친구</label>
                            <input type="radio" name="partner" value="L" disabled><label>사랑하는 사람과 함께</label>
                            
                            <script>
                            	$(function(){
                            		
                            	})
                            
                            </script>
                            
                        </div>
                    </div>
                </div>

                <div id="content-wrap-2">
                    <div id="content_1">
                        <!-- Slider main container -->
                        <div class="swiper">
                            <!-- Additional required wrapper -->
                            <div class="swiper-wrapper">
                                <!-- Slides -->

                                <!-- 이미지의 src 속성값은 DB에서 조회해온 결과를 바탕으로 띄워줘야 함-->
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
                    </script>




                </div>

            </div>
    
    
    
            <div id="content-3wrap">
                <div id="content-wrap-3-1">
                    <div id="board-content" >

                        <!--내용 영역을 DB에 조회해올때 replaceAll()를 통해 개행문자 => <br> 태그로 변환시켜야 함-->
                        <p style="margin : 0; margin-top : 5px;">안녕하세요 db에서 조회해온 값을 여기에 출력 중입니다.</p>
                    </div>
                </div>

                <div id="content-wrap-3-2">

                    <div id="content-wrap-3-2-1">
                    </div>

                    <div id="content-wrap-3-2-2" align="right">
                        <div id="hash-tag">
                            <!--1)DB에서 조회된 결과를 바탕으로 반복문을 통해 보여질 해시태그 수를 정하고 
                                2) 보여지는checkbox의 checked 속성을 조작해야함-->
                             <%for(int i = 0; i < checkedHashTagList.size(); i++){ %>
                             <input type="checkbox" name="hash-tag" value="tag<%=i%>" disabled><label for="tag<%=i%>"><%= hashTagList.get(i) %></label>
                             <%} %>   
                                
                            <!--      
                            <input type="checkbox" name="hashtag" value="tag1" checked disabled><label for="tag1" style="background-color: white;">#맛집탐방</label>
                            <input type="checkbox" name="hashtag" value="tag2" checked disabled><label for="tag2" style="background-color: white;">#힐링여행</label>
                            <input type="checkbox" name="hashtag" value="tag3" checked disabled><label for="tag3" style="background-color: white;">#자연경관</label>
                            <input type="checkbox" name="hashtag" value="tag4" checked disabled><label for="tag4" style="background-color: white;">#랜드마크</label>
                            <input type="checkbox" name="hashtag" value="tag5" checked disabled><label for="tag5" style="background-color: white;">#쇼핑</label>
                            -->
                        </div>
                    </div>
                </div>


            </div>
    
    
            <div id="content-4wrap">
                <div id="content-wrap-4-1">
                    <div id="plan">
                        <h3>여행 플랜 </h3>
                    </div>

                    <div id="plan-check">
                    	<%if(review.getPlanCheck().equals("Y")){%>
                        <div>
                            <!-- 게시물 작성자의 여행플랜이 있다면, a태그를 누를 때 해당 플랜으로 이동-->
                            <a href="#" style="text-decoration: none; color : black;">
                            	등록된 플랜이 있습니다.
                            </a>
                         <%} else {%>
                         	등록된 여행플랜이 없습니다.
                         <%} %>   
                        </div>
                    </div>
                </div>
                <div id="content-wrap-4-2">
                    <div id="content-wrap-4-2-1" align="right">
                        <div id="like-area1">

                        </div>
                        <div id="like-area2">
                            <img src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fpng.pngtree.com%2Fpng-vector%2F20210703%2Fourlarge%2Fpngtree-3d-like-and-thumbs-up-button-png-image_3558644.jpg&type=sc960_832" style="width: 50px; height: 50px;" alt="좋아요"><span style="margin-right : 40px;">여행기 추천하기</span>
                        </div>
                    </div>

                    <div id="content-wrap-4-2-2" align="right">
                        <button type="button" style="background-color : rgb(255, 89, 94); color : white; border : 0; border-radius : 5px; width: 50px; height : 30px; margin-top : 5px; margin-right : 40px;">목록</button>
                    </div>
                </div>

                

            </div>
        </div>
    </div>
    <%@ include file="../common/footer.jsp" %>


</body>
</html>