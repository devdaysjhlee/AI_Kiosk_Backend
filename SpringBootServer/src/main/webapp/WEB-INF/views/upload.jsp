<%--
  Created by IntelliJ IDEA.
  User: junhee
  Date: 4/1/25
  Time: 8:40 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>이미지 업로드 테스트 사이트</title>
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

        h1 {
            margin: 6px;
            font-size: 4em;
        }

        h2 {
            color: #c0392b;
            font-size: 2em;
            margin-bottom: 20px;
        }

        input[type="file"] {
            display: none;
        }

        /* 커스텀 라벨 스타일 */
        .custom-file-upload {
            display: flex;
            align-items: center;         /* 수직 중앙 정렬 */
            justify-content: center;     /* 수평 중앙 정렬 */
            width: 100%;
            height: 40%;               /* 박스 높이 고정 */
            background-color: #dcdcdc;
            color: #333;
            text-align: center;
            border: 2px dashed #aaa;
            border-radius: 6px;
            font-size: 3em;
            margin-bottom: 30px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .custom-file-upload:hover {
            background-color: #cfcfcf;
        }

        .custom-file-upload input[type="file"] {
            display: none;
        }

        #file-name {
            font-size: 3em;
            color: #666;
            margin-bottom: 20px;
        }

        button {
            width: 100%;
            height: 20%;
            padding: 16px;
            font-size: 3.5em;
            background-color: #2980b9;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: #1c5d8c;
        }

        button:hover {
            background-color: #1c5d8c;
        }
    </style>

</head>
<body>
    <h1>AI 기반 나이 예측</h1>
    <h1>이미지를 업로드하세요</h1>
    <h2>*주의: 되도록 얼굴 정면, 해상도가 높은 사진을 사용하세요</h2>
    <form action="/upload" method="post" enctype="multipart/form-data">
        <label class="custom-file-upload">
            사진 업로드
            <input type="file" name="image" id="image-upload" accept="image/*" required="required" />
        </label>
        <p id="file-name">선택된 파일 없음</p>

      <button type="submit">업로드</button>
    </form>

    <script>
        window.addEventListener("DOMContentLoaded", function () {
            const input = document.getElementById("image-upload");
            const fileNameDisplay = document.getElementById("file-name");

            input.addEventListener("change", function () {
                const file = this.files[0];
                console.log("선택된 파일:", file);
                if (file) {
                    fileNameDisplay.textContent = `파일 선택 완료`;
                } else {
                    fileNameDisplay.textContent = "선택된 파일 없음";
                }
            });
        });
    </script>
</body>
</html>
