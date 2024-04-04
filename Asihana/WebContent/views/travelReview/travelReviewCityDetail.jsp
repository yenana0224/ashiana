<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.kh.semi.info.model.vo.City" %>    
<%
	List<City> cityInfo = (List<City>)request.getAttribute("cityInformation");
%>
<%
	System.out.println(cityInfo);
%>

<%
	String language = cityInfo.get(0).getLanguage();
	String currency = cityInfo.get(0).getCurrency();
	String voltage = cityInfo.get(0).getVoltage();

	String newLanguage = cityInfo.get(0).getLanguage();
	String newCurrency = cityInfo.get(0).getCurrency();
	String newVoltage = cityInfo.get(0).getVoltage();
	
	for(int i = 1; i < cityInfo.size(); i++){
		if(!language.equals(cityInfo.get(i).getLanguage())){
			newLanguage += ", " + cityInfo.get(i).getLanguage();
		}
	}
	
	for(int j = 1; j < cityInfo.size(); j++){
		if(!currency.equals(cityInfo.get(j).getCurrency())){
			newCurrency += ", " + cityInfo.get(j).getCurrency(); 
		}
	}
	
	for(int k = 0; k < cityInfo.size(); k++){
		if(!voltage.equals(cityInfo.get(k).getVoltage())){
			newVoltage += ", " + cityInfo.get(k).getVoltage();
		}
	}
%>


<%@ include file="../common/headerbar.jsp" %>    
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
                <div id="content-1-2form">
                    <!-- 수업 때 더 배워서 보완해야 하는 영역 폼태그-->
                    <form action="#" method="get" name="search-form">
                        <input type="search" style="display : inline-block; width: 80%; height: 55px; " placeholder="국가, 도시, 키워드로 검색" name="search">
                        <input type="submit" style="display : inline-block; width: 50px; height: 55px;" value="검색">
                        <ol align="left" >
                            
                            <!--1)DB에서 조회된 국가/도시 정보를 바탕으로 반복문을 통해서 li요소 추가, 
                                2)해당 li요소를 클랙했을 때 해당 국가 여행기 게시판으로 이동-->
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

        <!--여기부터 content의 3분할 중 2영역-->
        <div id="content-2wrap"> 
            
            <div id="content-2-1">

            </div>

            <div id="content-2-2">
                <div id="content-2-title">
                    <p style="padding-top: 20px;"><%= cityInfo.get(0).getCityName() %>(<%=cityInfo.get(0).getNationName()%>)</p> <!-- p태그에 들어갈 국가(도시)명은 DB에서 조회해올 예정-->
                </div>
                <div id="content-2-boardlist"> <!--추후 list에 띄워질 게시물은 DB에서 조회해온 뒤 반복문을 통해 출력-->
                    
                    <!-- 화면 세팅 구도 보기 위한 것, 추후 없애질 영역-->
                    <div id="nation-thumbnail">
                        <img src="<%=contextPath %><%=cityInfo.get(0).getFilePath()%>/<%=cityInfo.get(0).getChangeName() %>" alt="국가도시">
                    </div>
                    
                    <div id="nation-content">
                        
                        
                        <div id="nation-contentlist">
                            <p>
                                <!-- span요소에 출력될 값은 DB에서 국가/도시 테이블의 값을 넣을 예정-->
                                <lable>도시 : </lable><span><%= cityInfo.get(0).getCityName() %></span> <br> 
                                <lable>언어 : </lable> <span><%= newLanguage %></span> <br>
                                <lable>화폐단위 : </lable> <span><%= newCurrency %></span> <br>
                                <lable>전압 : </lable> <span><%= newVoltage %></span> <br>
                                <lable>비자 : </lable> <span><%= cityInfo.get(0).getVisaName() %></span> <br>                       
                            </p>
                        </div>
                        <div>
                        </div>
                    </div>
                    <!-- 여기까지 없어질 영역-->
                    
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
                        <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDAyMDVfNTUg%2FMDAxNzA3MTE5NDY2NjAz.ApbkIELFXoR2Ke9Cp4i-ztgs0VQx36VbTWsdHo1DARQg.TCuxJb3UoONuyxvLTFWQ1iWXz0sBLQsQa_tHzouFy9og.PNG.kkeuliye%2Fimage.png&type=a340">
                        <p align="center">
                            <lable>닉네임 : </lable><span>닉네임</span> <br>
                            <!-- -->
                            <span>해시태그</span> <span>해시태그2</span>
                        </p>  
                    </div>
                    <div>
                        <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDAyMDVfNTUg%2FMDAxNzA3MTE5NDY2NjAz.ApbkIELFXoR2Ke9Cp4i-ztgs0VQx36VbTWsdHo1DARQg.TCuxJb3UoONuyxvLTFWQ1iWXz0sBLQsQa_tHzouFy9og.PNG.kkeuliye%2Fimage.png&type=a340">
                        <p align="center">
                            <lable>닉네임 : </lable> <span>닉네임</span> <br>
                            <span>해시태그</span> <span>해시태그2</span>
                        </p>  
                    </div>
                    <div>
                        <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDAyMDVfNTUg%2FMDAxNzA3MTE5NDY2NjAz.ApbkIELFXoR2Ke9Cp4i-ztgs0VQx36VbTWsdHo1DARQg.TCuxJb3UoONuyxvLTFWQ1iWXz0sBLQsQa_tHzouFy9og.PNG.kkeuliye%2Fimage.png&type=a340">
                        <p align="center">
                            <lable>닉네임 : </lable> <span>닉네임</span> <br>
                            <span>해시태그</span> <span>해시태그2</span>
                        </p>  
                    </div>
                    <div>
                        <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDAyMDVfNTUg%2FMDAxNzA3MTE5NDY2NjAz.ApbkIELFXoR2Ke9Cp4i-ztgs0VQx36VbTWsdHo1DARQg.TCuxJb3UoONuyxvLTFWQ1iWXz0sBLQsQa_tHzouFy9og.PNG.kkeuliye%2Fimage.png&type=a340">
                        <p align="center">
                            <lable>닉네임 : </lable> <span>닉네임</span> <br>
                            <span>해시태그</span> <span>해시태그2</span>
                        </p>  
                    </div>
                </div>
            </div>

            <div id="content-3-3">

            </div >
        </div>
    </div>
<%@ include file="../common/footer.jsp" %>


</body>
</html>