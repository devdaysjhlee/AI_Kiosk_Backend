<%--
  Created by IntelliJ IDEA.
  User: junhee
  Date: 4/1/25
  Time: 8:49 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>분석 중...</title>
    <script>
      let count = 3;
      function countdown() {
        if (count > 0) {
          document.getElementById("timer").innerText = count + "...";
          count--;
          setTimeout(countdown, 1000); // 1초 간격
        } else {
          window.location.href = "result";
        }
      }
      window.onload = countdown;
    </script>
    <style>
      body {
        font-family: Arial; text-align: center; padding-top: 100px;
      }
    </style>

</head>
<body style="text-align:center; padding-top:50px;">
    <h2>분석 중입니다</h2>
    <h1 id="timer">...3</h1>
</body>
</html>
