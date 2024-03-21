<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bootstrap Example</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>


<style>
    div{
        box-sizing: border-box;
       border:1px solid red;

    }

    #wrap{

        width: 800px;
        height: 1200px;
        margin: auto;
        
    }

    #header{width: 100%; height: 25%;}
    #content{width: 80%; height: 50%;}
    #footer{width: 100%; height: 25%;}


    #header{
        background-color: green;
         
    }

    #h1{
        margin-right: 50px;
    }

    #key{
      
        margin-left:50px;
        width: 450px;
        height: 30px;


    }

    #content{
        background-color: beige;
        margin: auto;
    }
    
    #h2{
        margin: center;
    }

    #footer{
        background-color: white;
        text-align: center;
      

    }

    

    #g1{
        float:left;
        text-align: center;
        height: 30px;
        width: 100px;
        margin:20px;
        margin-left: 100px;
        text-align: left;
      
    }
    #g2{
        float:left;
        height: 30px;
        width: 100px;
        margin:20px;
        margin-left: 0px;
        text-align: left;
    }

    #g3{
        background-color: lightcoral;
        font-weight: 800;
        font-style: rgb(221, 201, 201);
        height: 30px;
        width: 80px;
        margin-top:20px;
        margin-left: 5px;
        margin-right: 80px;
    }

    

    
    
    
</style>
<title>커뮤니티</title>
</head>
<body>

 <%@ include file="../common/headerbar.jsp" %>
 	
    <!--#wrap>(#header+#content)+#footer  -->
    <div id="wrap">
        <div id="header">
            <h2 id="h1" >여행자들과 자유롭게 소통해보세요</h2> 

            <form action="city.do" > 
                <select name="city" id="key">
                    <option>국가,도시,키워드로 검색</option>
                    <option>일본</option>
                    <option>도쿄(일본)</option>
                    <option>오사카(일본)</option>
                    <option>나라(일본)</option>
                    <option>중국</option>
                    <option>상해(중국)</option>
                    <option>북경(중국)</option>

                </select>
            
            </form>

           
       

        </div>
        <div id="content">
            <h2>여행자 실시간 커뮤니티 <div class="spinner-border text-dark"></div> </h2>  





        </div>
        <div id="footer" float;>
            <form action="term.do" float:right;></form><br>
            <span>
                <select  id="g1" >
                    <option>전체기간</option>
                    <option>1일</option>
                    <option>1주일</option>
                    <option>1개월</option>
                </select>

                
            </span>

            <form action="term.do"></form>
            <span>
                <select  id="g2">
                    <option>통합</option>
                    <option>도시별</option>
                    <option>제목+내용</option>
                    <option>내용</option>
                </select>
                
            </span>
            

            <span><input type="text" size="30px" placeholder="검색어를 입력해주세요"></span>

            <button  id="g3">검색</button>




 	<%@ include file="../common/footer.jsp" %>




        </div>
    </div>
</body>
</html>