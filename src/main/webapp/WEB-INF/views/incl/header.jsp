<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>BOOT CAMPING</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <style>
        * {
            box-sizing: border-box;
        }

        ul, li {
            list-style: none;
        }

        ul {
            display: flex;
        }

        li {
            margin-left: 10px;
        }

    </style>
</head>
<body>
<%--<nav class="navbar navbar-expand-md bg-dark navbar-dark">--%>
<%--    <div class="ul_container">--%>
<%--        <ul>--%>
<%--            <a href="/">BOOT CAMPING</a>--%>
<%--            <c:choose>--%>
<%--                <c:when test="${empty customer}">--%>
<%--                    <li><a href="/customer/login">로그인</a></li>--%>
<%--                    <li><a href="/customer/addCustomer">회원가입</a></li>--%>
<%--                </c:when>--%>
<%--                <c:otherwise>--%>
<%--                    <li style="color: white">${customer.name}님 환영합니다.</li>--%>
<%--                    <li><a href="/customer/logout">로그아웃</a></li>--%>
<%--                    <li><a href="/customer/myPage/detailPage">마이페이지</a></li>--%>
<%--                </c:otherwise>--%>
<%--            </c:choose>--%>
<%--        </ul>--%>
<%--    </div>--%>
<%--</nav>--%>


<div class="container">
    <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
        <div class="col-md-3 mb-2 mb-md-0">
            <a href="/" class="d-inline-flex link-body-emphasis text-decoration-none">
                <svg class="bi" width="40" height="32" role="img" aria-label="Bootstrap">
                    <use xlink:href="#bootstrap"/>
                </svg>
            </a>
        </div>

        <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
            <li><a href="/menu/mealkit" class="nav-link px-2">밀키트</a></li>
            <li><a href="/menu/camp" class="nav-link px-2">캠핑용품</a></li>
            <li><a href="/board/getListBoard" class="nav-link px-2">커뮤니티</a></li>
        </ul>

        <div class="col-md-3 text-end">
            <c:choose>
                <c:when test="${empty member}">
                    <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
                        <li><a href="/member/login" class="nav-link px-2">로그인</a></li>
                        <li><a href="/signup" class="nav-link px-2">회원가입</a></li>
                    </ul>
                </c:when>
                <c:otherwise>
                    <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
                        <li><a href="/member/logout" class="nav-link px-2">로그아웃</a></li>
                        <li><a href="/member/mypage" class="nav-link px-2">마이페이지</a></li>
                    </ul>
                </c:otherwise>
            </c:choose>
        </div>
    </header>
</div>
</body>
</html>