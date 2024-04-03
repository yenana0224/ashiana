<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.kh.semi.travelReview.model.vo.HashTag, com.kh.semi.info.model.vo.City
				,com.kh.semi.travelReview.model.vo.TravelReview, com.kh.semi.common.AttachmentFile"
				
%>   
<%@ include file="../common/headerbar.jsp" %>   
<%
	List<City> cityList = (List<City>)session.getAttribute("cityList");
	List<HashTag> hashTagList = (List<HashTag>)session.getAttribute("hashTagList");
	TravelReview review = (TravelReview)request.getAttribute("review");
	List<AttachmentFile> fileList = (List<AttachmentFile>)request.getAttribute("fileList");
%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>여행기 작성 화면</title>


    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    <style>

        #content-wrap{
            width: 1200px;
            height : auto;
            margin : auto;
            background-color : rgb(250, 243, 221);
        }

        #content-1wrap{
            height : 250px;
            background-color: rgb(46, 204, 113);
            
            > div{
                height : 100%;
               float :left;
            }
        }

        #content-1-1{
            width: 30%;
        }

        #content-1-2{
            width: 40%;

            >h3 {
                margin-top : 50px;
            }
        }

        #content-1-3{
            width: 30%;
        }

        #wrap-insert-form{
            width: 1200px;
            height : auto;
        }

        #insert-form{
            width : 80%;
            height : auto;
            margin-left : 150px;

            >div{
                width: 100%;
            }
        }

        #insert-1{
            height : 500px;
            >div {
                width : 100%;
            }
        }

        #area-star{
            height : 20%;
            display : inline-block;
            margin-top : 50px;
            >div {
                width: 100%;
            }
        }

        #star-title{
            height : 45%;
        }

        #star-content{
            height : 55%;
            padding-top :0;
        }

        #area-calendar{
            height : 20%;
            display : iline-block;
            >div{
                width: 100%;
            }
        }
        #calendar-title{
            height : 30%;
        }   

        #calendar-content{
            height : 70%;
        }

        #area-place{
            height : 20%;            
            >div{
                width: 100%;
            }
        }

        #place-title{
            height: 30%;
        }

        #place-content{
            height: 80%;
        }

        #insert-2{
            height : 50%;

        }
        #area-file{
            >div{
                display : inline-block;
            }
        }

        .sub{
            display : inline-block;
            height : 100%;
            width: 78%;

            >div{
                display : inline-block;
                width: 22%;
            }
        }

        #add-file{
            width: 100%;
            padding-top : 30px;


            >div {
                height : 100%;
                display : inline-block;
            }
        }

        #file-main{
            width : 20%;
        }
        
        #file-sub{
            width: 79%
        }

        /*
        #star-content > input {
            display : none;
        }
        */
        #test1 :hover{
            width : 200px;
        }
        .file {
            display : none;
        }
        

       
    </style>

</head>
<body>   
    <div id="content-wrap">
        <div id="content-1wrap" align="center">
            <div id="content-1-1">
            </div>
            <div id="content-1-2">
                <h3>여행기를 작성하고 다른 여행자들에게 도움을 주세요</h3>
                <div>
                    <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDAyMDVfNTUg%2FMDAxNzA3MTE5NDY2NjAz.ApbkIELFXoR2Ke9Cp4i-ztgs0VQx36VbTWsdHo1DARQg.TCuxJb3UoONuyxvLTFWQ1iWXz0sBLQsQa_tHzouFy9og.PNG.kkeuliye%2Fimage.png&type=a340" style="width : 500px; height: 150px;" alt="여행이미지">
                </div>
            </div>

            <div id="content-1-3">
            </div>


        </div>


        <div id="wrap-insert-form" align="left"> <!-- 전체를 감싸는 div-->
            <form action="<%=contextPath%>/update.review" method="post" id="form"
            	enctype="multipart/form-data">
            
                <div id="insert-form"> <!--content 영역을 감싸는 div-->
                    <div id="insert-1"><!--content영역1 (별점, 여행시기, 장소, 동행)-->
                        <div id="area-star"><!--별점 영역-->
                            <div id="star-title">  <!--별점의 title영역-->
                                <h3 style="margin : 0;">여행은 어떠셨나요?</h3>
                            </div>
                            <div id="star-content"> <!--별점의 content영역-->
                                <!--radio 버튼으로 구현, radio button은 display : none으로 안보이게 해두고 연결된 label로 별점 조정 가능하게 구현-->
                                
                                <input type="radio" name="star" id="star1" value="1" checked> <label for="star1" style="font-size : 30px;">1</label>
                                <input type="radio" name="star" id="star2" value="1.5"> <label for="star2">2</label>
                                <input type="radio" name="star" id="star3" value="2"> <label for="star3">3</label>
                                <input type="radio" name="star" id="star4" value="2.5"> <label for="star4">4</label>
                                <input type="radio" name="star" id="star5" value="3"> <label for="star5">5</label>
                                <input type="radio" name="star" id="star6" value="3.5"> <label for="star6">6</label>
                                <input type="radio" name="star" id="star7" value="4"> <label for="star7">7</label>
                                <input type="radio" name="star" id="star8" value="4.5"> <label for="star8">8</label>
                                <input type="radio" name="star" id="star9" value="5"> <label for="star9">9</label>
                            </div>

                            <script>
                                $(function(){
                                    $('#star1').click(function(){
                                    
                                    });

                                })


                            </script>

                        </div>

                        <div id="area-calendar"><!--여행시기 영역-->
                            <div id="calendar-title"><!--제목의 title영역-->
                                <h3 style="margin : 0;">언제 다녀오셨나요?</h3>
                            </div>

                            <div id="calendar-content"> <!--제목의 content영역-->
                            	출발일<input type="date" name="departure" required value="<%=review.getDepartureDate()%>"> <br>
                            	도착일<input type="date" name="arrival" required value="<%=review.getArrivalDate()%>">
                                <!--  <a href="#"><img src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fw7.pngwing.com%2Fpngs%2F711%2F598%2Fpng-transparent-computer-icons-month-calendrier-angle-text-rectangle.png&type=sc960_832" style="width: 100px; height : 70px;" alt="달력사진"></a>-->
                            </div>
                        </div>

                        <div id="area-place"><!--장소 영역-->
                            <div id="place-title"> <!--장소의 title영역-->
                                <h3>어디로 다녀오셨나요</h3>
                            </div>
                            <div id="place-content"> <!-- 장소의 content영역-->
                                <select name="city">
                           			
                                	<%for(int i = 0; i < cityList.size(); i++) {%>
                                	<option id="<%=cityList.get(i).getCityNo() %>" value="<%=cityList.get(i).getCityNo()%>"><%=cityList.get(i).getCityName() %></option>
                                	<%} %>
                                	
                                	
                                </select>
                                
                                <script>
                                	$(function(){
                        				$('#<%=review.getCityNo()%>').attr('selected', true);
                                	})
                                
                                </script>
                            </div>
                        </div>
                        
                        <div id="area-partner" ><!--동행 영역--> 
                            <h3>누구와 다녀 오셨나요?</h3>
                            
                            <input class="partner" type="radio" name="partner" value="A"><label for="A">나홀로</label>
                            <input class="partner" type="radio" name="partner" value="FM"><label for="FM">가족</label>
                            <input class="partner" type="radio" name="partner" value="F"><label for="F">친구</label>
                            <input class="partner" type="radio" name="partner" value="L"><label for="L">사랑하는 사람과 함께</label>
                            
                            <script>
                            </script>
                        </div>
                        
                        
                    </div>
                    <div id="insert-2" ><!--content영역2 (제목, 파일첨부, 내용)-->
                        <div id="title"> <!--제목의 title영역-->
                            <h3 style="margin-bottom : 5px;">제목</h3>
                        </div>
                        <div id="title"> <!--제목의 content영역-->
                            <input type="text" name="title" style="width:950px; height: 30px" placeholder="제목"  value="<%=review.getReviewTitle() %>" required><label for="title"></label>
                        </div>
                        

                        <div id="area-file" style="margin-top : 50px;"><!-- 파일 첨부영역-->

                            <!--사용자가 추가한 사진이 뜨는 영역-->
                            
                            <div id="thumbnail-file"> <!--대표이미지 뜨는 곳-->
                                <img id="img0" src="<%=fileList.get(0).getFilePath() %>" style="width : 200px; height: 200px;" alt="대표이미지"> <br>                           
                                <label style="padding-left : 60px; display : inline-block;" align="center">대표이미지</label>
                            </div>

                            <div class="sub" align="center"> <!-- 사용자가 추가한 서브이미지 뜨는 곳, 최대 4개까지 가능-->
                                <div style="padding-left : 50px" id="sub1">
                                    <img id="img1" src="
                                    <%if(fileList.size() > 1 && fileList.get(1).getFilePath() != null) {%>
                                    <%=fileList.get(1).getFilePath() %>
                                    <%} else {%>
                                    	https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDAyMDVfNTUg%2FMDAxNzA3MTE5NDY2NjAz.ApbkIELFXoR2Ke9Cp4i-ztgs0VQx36VbTWsdHo1DARQg.TCuxJb3UoONuyxvLTFWQ1iWXz0sBLQsQa_tHzouFy9og.PNG.kkeuliye%2Fimage.png&type=a340
                                    <%} %> 
                                    "
                                    style="width : 150px; height: 200px;" alt="서브이미지"> <br>
                                    <label >이미지1</label>
                                </div>
                                
                                <div id="sub2">
                                    <img id="img2" src="
                                    <%if(fileList.size() > 2 && fileList.get(2).getFilePath() != null) {%>
                                    <%=fileList.get(2).getFilePath() %>
                                    <%} else {%>
                                    	https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDAyMDVfNTUg%2FMDAxNzA3MTE5NDY2NjAz.ApbkIELFXoR2Ke9Cp4i-ztgs0VQx36VbTWsdHo1DARQg.TCuxJb3UoONuyxvLTFWQ1iWXz0sBLQsQa_tHzouFy9og.PNG.kkeuliye%2Fimage.png&type=a340
                                    <%} %> 
                                    " style="width : 150px; height: 200px;" alt="서브이미지"> <br>
                                    <label>이미지2</label>
                                </div>
                                
                                <div id="sub3">
                                    <img id="img4" src="
                                    <%if(fileList.size() > 3 && fileList.get(3).getFilePath() != null) {%>
                                    <%=fileList.get(3).getFilePath() %>
                                    <%} else {%>
                                    	https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDAyMDVfNTUg%2FMDAxNzA3MTE5NDY2NjAz.ApbkIELFXoR2Ke9Cp4i-ztgs0VQx36VbTWsdHo1DARQg.TCuxJb3UoONuyxvLTFWQ1iWXz0sBLQsQa_tHzouFy9og.PNG.kkeuliye%2Fimage.png&type=a340
                                    <%} %> 
                                    " style="width : 150px; height: 200px;" alt="서브이미지"> <br>
                                    <label>이미지3</label>
                                </div>
  
                                <div id="sub4">
                                    <img id="img5" src="
                                    <%if(fileList.size() > 4 && fileList.get(4).getFilePath() != null) {%>
                                    <%=fileList.get(4).getFilePath() %>
                                    <%} else {%>
                                    	https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDAyMDVfNTUg%2FMDAxNzA3MTE5NDY2NjAz.ApbkIELFXoR2Ke9Cp4i-ztgs0VQx36VbTWsdHo1DARQg.TCuxJb3UoONuyxvLTFWQ1iWXz0sBLQsQa_tHzouFy9og.PNG.kkeuliye%2Fimage.png&type=a340
                                    <%} %> 
                                    " style="width : 150px; height: 200px;" alt="서브이미지"> <br>
                                    <label>이미지4</label>
                                </div>
                            </div>
                            <script>
                            </script>

                            <!-- 파일추가 버튼영역-->
                            <div id="add-file" align="center">
                                <div id="file-main">
                                    <input type="file" name="file0" id="file0" class="file" onchange="loadImg(this, 0);" required><label for="file0"></label>
                                    <a href=""></a>
                                </div>
                                <div id="file-sub" align="center">
                                    <input type="file" name="file1" id="file1" class="file" onchange="loadImg(this, 1);"><label for="file1"></label>
                                    <input type="file" name="file2" id="file2" class="file" onchange="loadImg(this, 2);"><label for="file2"></label>
                                    <input type="file" name="file3" id="file3" class="file" onchange="loadImg(this, 3);"><label for="file3"></label>
                                    <input type="file" name="file4" id="file4" class="file" onchange="loadImg(this, 4);"><label for="file4"></label>
                                </div>
                                <!--<a href=""><img src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fi.pinimg.com%2F736x%2Fd1%2Faa%2F6d%2Fd1aa6d39a3eea6a06e18d182e3f397d1.jpg&type=a340" style="width: 50px; height: 50px;" alt=""></a>
                                -->

                                <script>
                                    function loadImg(inputFile, num){
                                        console.log(inputFile.files);

                                        if(inputFile.files.length){

                                            const reader = new FileReader();

                                            console.log(inputFile.files[0]);

                                            reader.readAsDataURL(inputFile.files[0]);

                                            reader.onload = function(e){ // FileReader의 속성 result : 파일내용, onload : 파일을 성공적으로 읽어냈을 때마다 발생
                                                switch(num){
                                                
                                                case 0 : $('#title-img').attr('src', e.target.result); break;
                                                case 1 : $('#sub-img1').attr('src', e.target.result); break;
                                                case 2 : $('#sub-img2').attr('src', e.target.result); break;
                                                case 3 : $('#sub-img3').attr('src', e.target.result); break;
                                                case 4 : $('#sub-img4').attr('src', e.target.result); break;
                                                }
                                                
                                            }


                                        }
                                        else{
                                        	const str = 'https://search.pstatic.net/sunny/?src=https%3A%2F%2Fi.pinimg.com%2F736x%2Fad%2Fa8%2F23%2Fada823d3ba33a88035e9754ac6b53ac9--london-snow-london-winter.jpg&type=a340';
                                        	
                                        	switch(num){
                                        	case 0 : $('#title-img').attr('src', str); break;
                                        	case 1 : $('#sub-img1').attr('src', str); break;
                                        	}
                                        }
                                    }
                                </script>

                                <script>
                                    $(function(){
                                        // $('#file-sub').hide(); // 하이드 속성을 부여하면 보이지 않는 것 + 차지하던 공간의 영역에서 아예 사라짐
                                        
                                        $('#thumbnail-file').click(function(){
                                            $('#file0').click();
                                        })
                            
                                        $('#sub1').click(function(){
                                            $('#file1').click();
                                        })

                                        $('#sub2').click(function(){
                                            $('#file2').click();
                                        })

                                        $('#sub3').click(function(){
                                            $('#file3').click();
                                        })

                                        $('#sub4').click(function(){
                                            $('#file4').click();
                                        })
                                    })

                                </script>


                            </div>
                        </div>

                        <div id="board-content">
                            <div>
                                <h3>여행기 쓰기</h3>
                            </div>
                            <div>
                                <textarea id="content" style="width: 950px;" name="content" cols="30" rows="10" placeholder="내용을 입력해주세요  (최대 600글자)" maxlength="600" oninput="lengthCheck();" required><%=review.getReviewContent() %></textarea>
                            </div>
                            <script>
                           		function lengthCheck(e){
                               		if(e.value.length > e.maxlength){
                               			e.value = e.value.slice(0, e.maxlength);
                               		}
                               	}
                            </script>
                            
                        </div>

                    </div>
                    
                    
                    

                    <div align="left"><!--해시태그, 여행플랜 / 공개여부, 작성버튼-->
                        <!--해시태그 영역-->
                        <div id="hash-tag">
                                <!--1)DB에서 조회된 결과를 바탕으로 반복문을 통해 보여질 해시태그 수를 정하고 
                                    2) 보여지는checkbox의 checked 속성을 조작해야함-->
                                
                                <%for(int i = 0; i < hashTagList.size(); i++) {%>
                                <input type="checkbox" name="hashTag" id="tag<%=i%>" value="<%=hashTagList.get(i).getTagNo()%>"><label class="hashtag" for="tag1" style="background-color: white;"><%=hashTagList.get(i).getTagName() %></label>
                                <%} %>
                                <!--  
                                <script>
                                	$(fucntion(){
                                		$('.hashtag').click(function(){
                                			$(':checkbox').attr('checked', true);
                                		})
                                	})
                                </script>
                                -->
                                
                        </div>
                        

                        <div> <!--여행 플랜 영역-->
                            <div id="plan">
                                <h3>여행 플랜 여부</h3>
                            </div>
        
                            <div id="plan-add">
                                <div>
                                    <!-- 여행기 첨부하기, 버튼을 누르면 DB에서 작성자와 정보가 동일한 여행플랜이 있을 경우 결과 조회, 조회된 결과 첨부 가능-->
                                    <select name="planCheck">
                                    	<option value="Y">있음</option>
                                    	<option value="N">없음</option>
                                    </select>
                                    
                                    <!--<a href="#" style="background-color : rgb(46, 204, 113); text-decoration: none; text-decoration : none; color : black;">여행기 첨부하기</a>-->
                                </div>
                            </div>
                        </div>

                        <div> <!--공개 여부 선택 영역-->

                        </div>

                        <div align="right"> <!--여행기 작성/ 취소 버튼 영역--> <!--제목, 내용을 입력하기 전에는 버튼이 disabled 상태여야 함-->
                            <select name="display-select" id="">
                                <option value="public">공개</option>
                                <option value="private">비공개</option>
                            </select>
                            <button type="sumbit" style="background-color : rgb(255, 89, 94); color : white; border: 0; width:50px; height: 30px;">작성</button>
                            <button type="button" id="23" style="background-color : rgb(224, 224, 224); color : black; border: 0; width:50px; height: 30px;" onclick="history.back();">취소</button>
                     
                        </div>
                        
                        
                        
                    </div>

                </div>
            </form>
        </div>
    </div>        
    
    <%@ include file="../common/footer.jsp" %>
	
	
</body>
</html>