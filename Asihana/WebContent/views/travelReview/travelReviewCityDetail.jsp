<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.kh.semi.info.model.vo.City" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../common/headerbar.jsp"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>여행기 국가, 도시별 조회 화면</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <style>
        #content-wrap{
        width: 1200px;
        height : auto;
        margin : auto;
        font-family : 본고딕;
        background-color : rgb(250, 243, 221);
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
    #content-2wrap{
        width: 100%;
        height : 400px;
        > div{
            float : left;
            height : 100%;
        }    
    }
    #content-2-1{
        width: 100px;
    }
    #content-2-2{
        width : 900px;
        >div {
            width: 100%;
        }
    }
    #content-2-title{
        height : 15%;
        margin-top : 17px;
        font-weight: bolder;
    }
    #content-2-boardlist{
        height : 80%;
        display : inline-block;
            > div{
                height : 97%;
                float : left;
                >img {
                    width : 90%;
                    height : 90%;
                    margin-top : 10px;
                    margin-left : 20px;
                }
            }
    }
    #nation-thumbnail{
        width : 60%;
    }
    #nation-content{
        width : 39%;
        > div{
            margin-left : 15px;
            line-height : 30px;
        }
    }
    #content-2-3{
        width: 100px;
    }
    #content-3wrap{
        width: 100%;
        height : 400px;
        > div {
            float : left;
            height : 100%;
        }
    }
    #content-3-1{
        width: 100px;
    }
    #content-3-2{
        width : 1000px;
        >div {
            width: 100%;
        }
    }
    #content-3-title{
        height : 15%;
        font-weight: bolder;
        margin-top : 17px;
    }
    #content-3-boardlist{
        height : 80%;
        display : inline-block;
            > div{
                width : 25%;
                height : 100%;
                float : left;
                >img {
                    width : 230px;
                    margin-top : 10px;
                }
            }
    }
    #nation-contentlist{
        margin-top : 10px;
        background-color :rgb(46, 204, 113);    
        border : 1px solid black;
    }
    #content-3-3{
        width: 100px;
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
            </div>
            <div id="content-1-3" class="content-1wrap" >
            </div>
        </div>
        <!--여기부터 content의 3분할 중 2영역-->
        <div id="content-2wrap"> 
            <div id="content-2-1">
            </div>
            <div id="content-2-2">
                <div id="content-2-title">
                    <p style="padding-top: 20px;">${requestScope.cityInformation.cityName}(${requestScope.cityInformation.nationName})</p> <!-- p태그에 들어갈 국가(도시)명은 DB에서 조회해올 예정-->
                </div>
                <div id="content-2-boardlist">
                    <c:set var="path" value="${pageContext.request.contextPath }"/>
                    <div id="nation-thumbnail">
                        <img src="${path}${ requestScope.cityInformation.filePath }/${ requestScope.cityInformation.changeName }" alt="국가도시">
                    </div>
                    <div id="nation-content">
                        <div id="nation-contentlist">
                            <p>
                                <!-- span요소에 출력될 값은 DB에서 국가/도시 테이블의 값을 넣을 예정-->
                                <lable>도시 : </lable><span>${ requestScope.cityInformation.cityName }</span> <br> 
                                <lable>언어 : </lable><span>${ requestScope.cityInformation.language }</span> <br>
                                <lable>화폐단위 : </lable> <span>${ requestScope.cityInformation.currency }</span> <br>
                                <lable>전압 : </lable> <span>${ requestScope.cityInformation.voltage }</span> <br>
                                <lable>비자 : </lable> <span>${ requestScope.cityInformation.visaName }</span> <br>                       
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <div id="content-2-3">
            </div >
        </div>
        <!--여기부터 content의 3분할 중 3영역-->
        <div id="content-3wrap"> 
            <div id="content-3-1">
            </div>
            <div id="content-3-2">
                <div id="content-3-title">
                    <p style="padding-top: 20px;">최근 여행 게시물</p>
                </div>
                <div id="content-3-boardlist" align="center">
                    <div>
                        <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2F20130401_290%2Fan_explorer_1364743851073cUc35_PNG%2Ftumblr_mihv5tJFVP1qes1wto1_500.png&type=sc960_832">
                        <p align="center">
                            <lable>닉네임 : </lable><span>이소룡</span> <br>
                            <!-- -->
                            <span>사랑하는 사람과 함께</span> <span>힐링여행</span>
                        </p>  
                    </div>
                    <div>
                        <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2F20130401_290%2Fan_explorer_1364743851073cUc35_PNG%2Ftumblr_mihv5tJFVP1qes1wto1_500.png&type=sc960_832">
                        <p align="center">
                            <lable>닉네임 : </lable> <span>관리자</span> <br>
                            <span>맛집탐방</span> <span></span>
                        </p>  
                    </div>
                    <div>
                        <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2F20130401_290%2Fan_explorer_1364743851073cUc35_PNG%2Ftumblr_mihv5tJFVP1qes1wto1_500.png&type=sc960_832">
                        <p align="center">
                            <lable>닉네임 : </lable> <span>관리자</span> <br>
                            <span>힐링여행</span> <span></span>
                        </p>  
                    </div>
                    <div>
                        <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2F20130401_290%2Fan_explorer_1364743851073cUc35_PNG%2Ftumblr_mihv5tJFVP1qes1wto1_500.png&type=sc960_832">
                        <p align="center">
                            <lable>닉네임 : </lable> <span>유저1</span> <br>
                            <span>랜드마크</span> <span></span>
                        </p>  
                    </div>
                </div>
            </div>
            <div id="content-3-3">
            </div >
        </div>
    </div>
<jsp:include page="../common/footer.jsp"/>
</body>
</html>