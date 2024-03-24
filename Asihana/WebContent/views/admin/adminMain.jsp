<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

    <style>

        .main{
            width : 1000px;
            margin : auto;
            margin-bottom : 80px;
        }

        .searchbar{
            width: 100%;
            height: 50px;
        }

        #searchform{
            margin-top: 20px;
            width: 100%;
            text-align: center;
        }

        #searchtext{
            border : none;
            border-radius: 50px;
            background: none;
            outline : none;
            width: 500px;
            height: 50px;
            background-color: rgba(239, 239, 238, 0.575);
            text-align: center;
        }

        #searchbtn{
            display: none;
        }
        
        .tag{
            margin-top: 20px;
            width: 100%;
            height: 30px;
            text-align: center;
        }

        .tagbtn{
            font-size: small;
            margin-right: 3px;
            padding : 2px 7px 2px 7px;
            width: auto;
            display : inline-block;
            background-color: #ff595e;
            border-radius: 10px;
            color : white;
        }

        .storyBoardView{
            position : relative;
            z-index : 0;
            margin-top: 40px;
            width: 100%;
            height: 500px;
            border : 1px solid red;
        }

        .storyBoardView>img{
            position : absolute;
            z-index : 1;
            width: 100%;
            height: 100%;
        }

        #title{
            position : absolute;
            z-index : 2;
            font-size : large;
            font-weight: 700;
            color : white;
            display: inline-block;
            width: auto;
            margin-left: 20px;
        }

        #boardTitle{
            position : absolute;
            z-index: 5;
            width: 1000px;
            color : wheat;
            text-align: center;
            font-weight: 800;
            font-size: x-larger;
            top : 25%;
        }

        #detail{
            width: 100%;
            position: absolute;
            z-index: 4;
            left : 90%;
            bottom : 10%;
        }

        #storypage{
            width: auto;
            background-color: rgba(50, 50, 50, 0.308);
            text-decoration: none;
            color : white;
            padding : 2px 10px 2px 10px;
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
<body>

<%@ include file="adminbar.jsp" %>

    
   
    
</body>
</html>