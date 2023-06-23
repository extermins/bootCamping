<%--
  Created by IntelliJ IDEA.
  User: abab1
  Date: 2023-05-08
  Time: 오후 5:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            position: relative;
        }

        .container {
            position: absolute;
            left: 50%;
            top: 50%;
            transform: translate(-50%,-50%);
            max-width: 600px;
            padding: 20px;
            border: 1px solid #ccc;
            background-color: #f4f4f4;
        }

        .container h2 {
            text-align: center;
        }

        .container label {
            display: block;
            margin-bottom: 10px;
        }

        .container input[type="text"],
        .container input[type="password"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            margin-bottom: 20px;
        }

        .container button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
        }

        .container button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>로그인</h2>
    <form action="/admin/login" method="post">
        <label for="id">사용자 이름:</label>
        <input type="text" id="id" name="id" placeholder="사용자 이름을 입력하세요." required>

        <label for="passwd">비밀번호:</label>
        <input type="password" id="passwd" name="password" placeholder="비밀번호를 입력하세요." required>

        <button type="submit">로그인</button>
    </form>
</div>
</body>
</html>
