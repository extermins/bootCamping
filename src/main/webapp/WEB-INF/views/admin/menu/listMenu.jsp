<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Simple Sidebar - Start Bootstrap Template</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="../../css/styles.css" rel="stylesheet" />



</head>
<body>

<div class="d-flex" id="wrapper">
    <!-- Sidebar-->
    <div class="border-end bg-white" id="sidebar-wrapper">
        <div class="sidebar-heading border-bottom bg-light"><a href="/admin/index">Main</a></div>
        <div class="list-group list-group-flush">
            <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/admin/menu/add">menu</a>
            <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">#!</a>
            <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">#!</a>
            <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">#!</a>
            <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">#!</a>
            <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">#!</a>
        </div>
    </div>
    <!-- Page content wrapper-->
    <div id="page-content-wrapper">
        <!-- Top navigation-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
            <div class="container-fluid">
                <button class="btn btn-primary" id="sidebarToggle">Toggle Menu</button>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mt-2 mt-lg-0">
                        <c:if test="${admin != null}">
                            <li class="nav-item active"><a class="nav-link" href="#!">${admin.id}반갑습니다.</a></li>
                            <li class="nav-item"><a class="nav-link" href="/admin/logout">로그아웃</a></li>
                        </c:if>
                        <c:if test="${admin == null}">
                            <li class="nav-item active"><a class="nav-link" href="#!">${admin.id}없어요.</a></li>
                            <li class="nav-item"><a class="nav-link" href="/admin/logout">로그아웃</a></li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Page content-->
        <div class="container-fluid">
            <div style="display: flex;justify-content: space-between;margin: 30px 0" >
               <span style="font-size: 50px">Menu List</span><span>ssss</span>
                <button class="btn-primary btn" style="font-size: 30px" onclick="location.href='/admin/menu/add'">메뉴등록하기</button>
            </div>
            <h1 class="mt-4"></h1>
            <table class="table" style="width: 100%; margin: 0 auto">
                <thead>
                <tr>
                    <th scope="col">제품명</th>
                    <th scope="col">이미지</th>
                    <th scope="col">가격</th>
                    <th scope="col">수량</th>
                    <th scope="col">누적판매량</th>
                    <th scope="col">등록일</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="d" items="${menu}">
                    <tr>
                        <td><a href="/admin/menu/getOneMenu?mid=${d.mid}">${d.name}</a></td>
                        <td><img src="/img/menu/${d.filename}" alt="메뉴1" style="width: 50px; height: 50px;"></td>
                        <td>${d.price}</td>
                        <td>${d.amount}</td>
                        <td></td>
                        <td><fmt:formatDate value="${d.regdate}" pattern="yyyy-MM-dd"/></td>

                    </tr>
                </c:forEach>

                </tbody>
            </table>





        </div>
    </div>
</div>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="../../js/scripts.js"></script>
</body>
</html>