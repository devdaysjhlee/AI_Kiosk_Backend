<%--
  Created by IntelliJ IDEA.
  User: junhee
  Date: 4/1/25
  Time: 8:54 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String ageGroup = (String) session.getAttribute("ageGroup");
  String base64Image = (String) session.getAttribute("imageBase64");
%>
<html>
<head>
    <title>Title</title>
    <style>
        * {
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f2f2f2;
            align-content: center;
            text-align: center;
        }

        .container {
            max-width: 500px;
            width: 90%;
            margin: 80px auto;
            background: #fff;
            padding: 24px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }

        img {
            width: 70%;
            height: auto;
            border-radius: 4px;
            margin-bottom: 20px;
        }

        h1 {
            margin-bottom: 16px;
            font-size: 4em;
        }

        h2 {
            color: blue;
            font-size: 2em;
        }

        a {
            display: inline-block;
            margin-top: 24px;
            color: #2980b9;
            text-decoration: none;
            font-size: 1em;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h1>예측 결과</h1>
    <img src="data:image/jpeg;base64,<%= base64Image %>">
    <h1><%= ageGroup != null ? ageGroup : "결과를 불러오지 못했습니다." %></h1>
    <h2><a href="/upload">돌아가기</a></h2>
</body>
</html>
