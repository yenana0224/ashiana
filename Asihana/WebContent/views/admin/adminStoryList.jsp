<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

    <style>


        .pageTitle{
            font-weight: bold;
            font-size : large;
        }

        .searchbar{
            margin-top: 40px;
            width: 100%;
            height: 30px;
            text-align: center;
        }
        
        .container {
            margin-top: 50px;
            text-align: center;
        }

        #add{
            margin-top: 20px;
            width: auto;
            float : right;
            text-align: center;
            text-decoration: none;
            background-color: #ff595e;
            border-radius: 10px;
            padding : 5px 10px 5px 10px;
            color : white;
        }

    </style>
</head>
<body>
	<%@ include file="adminbar.jsp" %>
    <div class="outer">

      <div class="pageTitle">
            <h3>여행스토리</h3>
            <h5>여행스토리 목록</h5>
      </div>

      <form action="#" method="get">
        <div class="searchbar">
          <select name="range" id="searchCate">
            <option value="title">제목</option>
            <option value="content">내용</option>
          </select>
          <input type="text" id="searchtext">
          <button type="submit">검색</button>
        </div>
      </form>

      <div class="container">
        <table class="table table-hover">
          <thead>
            <tr>
              <th width="80px">글번호</th>
              <th width="300px">제목</th>
              <th width="30px">작성일</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>10</td>
              <td>여기로떠나보자</td>
              <td>2024/03/19</td>
            </tr>
          </tbody>
        </table>
      </div>

      <a href="#" id="add">글쓰기</a>

    </div>
</body>
</html>