<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>여행기 메인 화면</title>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <style>
    
    
        #content-wrap{
        width: 1200px;
        height : auto;
        margin : auto;
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
        background-color : red;
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
        width : 1000px;
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
                width : 25%;
                height : 100%;
                float : left;

                >img {
                    width : 230px;
                    margin-top : 10px;

                }
            }
    }

    #content-2-boardlist > :hover{
        cursor : pointer;
        opacity : 0.9;
    }
        


    #content-2-3{
        width: 100px;
    }


    #content-3wrap{
        width: 100%;
        height : 400px;
        > div {
            float : left;
            height : 97%;
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
        height : 83%;
        display : inline-block;
            
            > div{
                width : 25%;
                height : 100%;
                float : left;

                >img {
                    margin-top : 10px;
                    width : 230px;
                }
            }
        
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
        margin-right : 55px;
        width : 440px;
        height : 150px;
        z-index : 50;
        overflow : scroll;
        overflow-x : auto;
        float : center;
        display : none;
        
    }

    #content-3-boardlist > :hover{
        cursor : pointer;
        opacity : 0.9;
    }


    </style>

</head>
<body>

	<%@ include file="../common/headerbar.jsp" %>
    <div id="content-wrap"> <!-- content 전체를 감싸는 wrap영역 -->
        
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
                        <div id="nation-list-wrap">
                            <input id="search-botton" type="search" style="display : inline-block; width: 80%; height: 55px; " placeholder="국가, 도시, 키워드로 검색" name="search">
                            <input type="submit" style="display : inline-block; width: 50px; height: 55px;" value="검색">
                               
                            <ol align="left" id="nation-list">
                                     
                                     <!--1)DB에서 조회된 국가/도시 정보를 바탕으로 반복문을 통해서 li요소 추가, 
                                         2)해당 li요소를 클랙했을 때 해당 국가 여행기 게시판으로 이동-->
                                     <li class="mar">말레이시아</li>
                                     <li>도쿄(일본)</li>
                            </ol>
                        </div>
                        
                        

                        <script>

                         
                            $('#search-botton').keydown(function(){
                                $('ol').css('display', 'block');
                            })
                            
                            $('*').not('#content-1-2 *').not('html, body, #content-wrap, #content-1wrap, #content-1-2, #content-1-3').click(function(e){
                                console.log(e);
                                $('ol').css('display', 'none');
                                //$('ol').css('display', 'block');
                            })
                            
                            /*
                            
                            $('body').not('ol').click(function(){
                                $('ol').css('display', 'none');
                                //$('ol').css('display', 'block');
                            })

                            
                            */
                           


                            $('#nation-list-wrap').on('click', 'ol', function(){
                             
                                $('ol').append('<li>DB정보</li>'); 
                            })
                            $('ol').on('click', 'li', function(){
                            // input의 value 요소 값을 변경 시켜야함
                                    $('#search-botton').val($(this).text());
                            });

                            
                        </script>



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
                    <p style="padding-top: 20px;">최근 여행 게시물</p>
                </div>

                <!--추후 list에 띄워질 게시문은 반복문을 통해 출력-->
                <div id="content-2-boardlist" align="center"> 
                    
                    <!-- 화면 세팅 구도 보기 위한 것, 추후 없애질 영역-->
                    <div>
                        <input type="hidden" value="보드리스트"> <!-- 보여질 게시물리스트를 조회하기 위한 조건인 게시판번호가 필요함-->
                        <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDAyMDVfNTUg%2FMDAxNzA3MTE5NDY2NjAz.ApbkIELFXoR2Ke9Cp4i-ztgs0VQx36VbTWsdHo1DARQg.TCuxJb3UoONuyxvLTFWQ1iWXz0sBLQsQa_tHzouFy9og.PNG.kkeuliye%2Fimage.png&type=a340">
                        <p align="center">
                            <lable>닉네임 : </lable><span>닉네임</span> <br>
                            <span>해시태그</span> <span>해시태그2</span>
                        </p>  
                    </div>
                    <div>
                        <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDAyMDVfNTUg%2FMDAxNzA3MTE5NDY2NjAz.ApbkIELFXoR2Ke9Cp4i-ztgs0VQx36VbTWsdHo1DARQg.TCuxJb3UoONuyxvLTFWQ1iWXz0sBLQsQa_tHzouFy9og.PNG.kkeuliye%2Fimage.png&type=a340">
                        <p align="center">
                            <lable>닉네임 : </lable><span>닉네임</span> <br>
                            <span>해시태그</span> <span>해시태그2</span>
                        </p>  
                    </div>
                    <div>
                        <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDAyMDVfNTUg%2FMDAxNzA3MTE5NDY2NjAz.ApbkIELFXoR2Ke9Cp4i-ztgs0VQx36VbTWsdHo1DARQg.TCuxJb3UoONuyxvLTFWQ1iWXz0sBLQsQa_tHzouFy9og.PNG.kkeuliye%2Fimage.png&type=a340">
                        <p align="center">
                            <lable>닉네임 : </lable><span>닉네임</span> <br>
                            <span>해시태그</span> <span>해시태그2</span>
                        </p>  
                    </div>
                    <div>
                        <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDAyMDVfNTUg%2FMDAxNzA3MTE5NDY2NjAz.ApbkIELFXoR2Ke9Cp4i-ztgs0VQx36VbTWsdHo1DARQg.TCuxJb3UoONuyxvLTFWQ1iWXz0sBLQsQa_tHzouFy9og.PNG.kkeuliye%2Fimage.png&type=a340">
                        <p align="center">
                            <lable>닉네임 : </lable><span>닉네임</span> <br>
                            <span>해시태그</span> <span>해시태그2</span>
                        </p>  
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
                    <p style="padding-top: 20px;">여행기 추천수 Best4</p>
                </div>
                <div id="content-3-boardlist" align="center">
                    <div>
                        <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDAyMDVfNTUg%2FMDAxNzA3MTE5NDY2NjAz.ApbkIELFXoR2Ke9Cp4i-ztgs0VQx36VbTWsdHo1DARQg.TCuxJb3UoONuyxvLTFWQ1iWXz0sBLQsQa_tHzouFy9og.PNG.kkeuliye%2Fimage.png&type=a340">
                        <p align="center">
                            <lable>닉네임 : </lable><span>닉네임</span> <br>
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

</body>
</html>