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
        	margin-top: 50px;
        	margin-left: 110px;
            font-size: 50px;


        }

        .form-group{

          	 margin-top:40px;
            margin-left: 135px;
            width: 500px;
        }
        
        .form-control{
         	
         	
        
        }
        
        #s1{
        	
        	
        
        }
        #comment{
        
        margin-top: 130px;
        
        }

        .input-group-text{
            width: 60px;
            height: 40px;
            float: right;
            position:relative;
            background-color: white;
            top: -50px;
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

<%@ include file="../common/headerbar.jsp" %>




<div id="wrap">
    <div>

  
        <h2>커뮤니티 글 작성  </h2>     
                    
                    
               
       
       <form action="<%=contextPath%>/insert.commu" method="post" id="insert-form">
       <input type="hidden" name ="userNo"  >
       <%--무조건 로그인이된  상태로 댓글 등록을 할 수 있게하기!!!!! --%>
     
      

       
        <div class="form-group" id="s1">
            <label for="comment" name="cityname">
            <span> 
            	<select id="s2" >
            		<option>도시이름</option>
            		<option>싱가포르</option>
            		<option>치앙마이(태국)</option>
            		<option>방콬(태국)</option>
            		<option>후아힌(태국)</option>
            	
            	
            	</select>
            
         
			             
             
             </span>
           
            
            
            
            </label>
            <textarea class="form-control"  style="resize:none;" rows="10" id="comment" placeholder="내용을 입력해주세요" maxlength="100" name="context"></textarea>
            <button class="input-group-text"  id="b3" onclick="history.back();">취소</button>
              <button class="input-group-text"  id="b3" >등록</button>
            <span class="limit">0/100</span>
        </div>


       

    </form>
    
    
    </div>
    
   



</div>
 <%@ include file="../common/footer.jsp" %>

</body>
</html>