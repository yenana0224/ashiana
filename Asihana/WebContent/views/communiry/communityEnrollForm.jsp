<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 글 작성하기</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

  <style>

        div{
            box-sizing: border-box;
            border: 1px solid red;
        }

        #wrap{

            
            width: 800px;
            height: 1200px;
            margin: auto;
            background-color: beige;
        }

        h2{
            font-size: 50px;


        }

        .form-group{

           
            margin-left: 10px;
            width: 500px;
        }

        .input-group-text{
            width: 60px;
            height: 40px;
            float:right;
            position:relative;
            background-color: white;
            top:-50px;
            right:10px;
        }

        .limit{
            position:relative;
            float:left;
            top:5px;
            right:10px;
        }



       


    </style>

</head>
<body>





<div id="wrap">
    <div>

  
        <h2>여행자 실시간 커뮤니티 <div class="spinner-border text-dark"></div> </h2>     
                    
       
       
     
      

        <div class="form-group">
            <class for="comment"></class>
            <textarea class="form-control" style="resize:none;" rows="5" id="comment" placeholder="게시글 작성은 로그인 후 이용 가능합니다."></textarea>
            <button class="input-group-text" id="b1">등록</button>
            <div id="limit">0/100</div>
           
        </div>


        <div class="form-group">
            <label for="comment"></label>
            <textarea class="form-control" style="resize:none;" rows="5" id="comment"placeholder="댓글작성은 로그인 후 이용가능합니다. " maxlength="30"></textarea>
            <button class="input-group-text" id="b2"  >등록</button>
            <span class="limit">0/100</span>
        </div>                         


        <div class="form-group">
            <label for="comment"></label>
            <textarea class="form-control"  style="resize:none;" rows="5" id="comment" placeholder="내용을 입력해주세요" maxlength="100"></textarea>
            <button class="input-group-text"  id="b3" >등록</button>
            <span class="limit">0/100</span>
        </div>


        <div class="form-group">
            <label for="comment"></label>
            <textarea class="form-control"  style="resize:none;" rows="5" id="comment" placeholder="내용을 입력해주세요"  maxlength="30"></textarea>
            <button class="input-group-text" id="b4" >등록</button>
            <span class="limit">0/100</span>
        </div>


        <div class="form-group">
            <label for="comment"></label>
            <textarea class="form-control"  style="resize:none;" rows="5" id="comment" placeholder="내용을 입력해주세요"  maxlength=""></textarea>
            <button class="input-group-text" id="b5" >등록</button>
            <span class="limit">0/100</span>
        </div>

    
    
    
    </div>
    
   



</div>
 <%@ include file="../common/footer.jsp" %>

</body>
</html>