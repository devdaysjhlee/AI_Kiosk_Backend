<%--
  Created by IntelliJ IDEA.
  User: junhee
  Date: 4/1/25
  Time: 8:59 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>에러!</title>
    <style>
        * {
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f8f8;
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
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }

        h1 {
            color: #c0392b;
            margin-bottom: 16px;
            font-size: 4em;
        }

        h2 {
            font-size: 2em;
        }

        p {
            color: #555;
            font-size: 1em;
            margin: 10px 0;
        }

        a {
            display: inline-block;
            margin-top: 20px;
            padding: 12px 24px;
            background-color: #2980b9;
            color: #fff;
            text-decoration: none;
            border-radius: 4px;
            font-size: 1em;
        }

        a:hover {
            background-color: #1c5d8c;
        }
    </style>
</head>
<body>
<div class="error-box">
  <p><strong>에러 코드:</strong> <%= request.getAttribute("javax.servlet.error.status_code") %></p>
  <p><strong>메시지:</strong> <%= request.getAttribute("javax.servlet.error.message") %></p>
  <br/>
</div>
<h1>오류!</h1>
<h2><a href="upload">되돌아가기</a></h2>
</body>
</html>
