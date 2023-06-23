<%--
  Created by IntelliJ IDEA.
  User: abab1
  Date: 2023-06-04
  Time: 오후 10:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <style>
        .receipt {
            font-family: Arial, sans-serif;
            width: 300px;
            padding: 20px;
            border: 1px solid #ccc;
            background-color: #f9f9f9;
        }

        .receipt-header {
            text-align: center;
            margin-bottom: 20px;
        }

        .receipt-header h2 {
            font-size: 20px;
            margin: 0;
        }

        .receipt-info {
            margin-bottom: 10px;
        }

        .receipt-info p {
            margin: 0;
        }

        .receipt-table {
            width: 100%;
            margin-bottom: 20px;
            border-collapse: collapse;
        }

        .receipt-table th,
        .receipt-table td {
            padding: 5px;
            border: 1px solid #ccc;
        }

        .receipt-table th {
            background-color: #f0f0f0;
            text-align: left;
        }

        .receipt-table td {
            text-align: right;
        }

        .receipt-total {
            text-align: right;
        }

        .receipt-total p {
            margin-bottom: 5px;
        }

        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
    </style>
</head>
<body>
<section>

    <div class="receipt">
        <div class="receipt-header">
            <h2>영수증</h2>
        </div>
        <div class="receipt-info">
            <p>상품명 : ${orderName}</p>
            <p>총 가격: ${price}원</p>
            <p>결제 방법: ${method}</p>
            <p><c:if test="${method =='카드'}"> cardNumber : ${cardNumber}</c:if></p>
            <p><c:if test="${method =='가상계좌'}">accountNumber : ${accountNumber}</c:if></p>
            <p><c:if test="${method =='계좌이체'}">bank : ${bank}</c:if></p>
            <p><c:if test="${method =='휴대폰'}">customerMobilePhone : ${customerMobilePhone}</c:if></p>
        </div>

        <div class="receipt-total">
            <button onclick="location.href='/'">홈페이지로</button>
        </div>
    </div>

</section>
</body>
</html>
