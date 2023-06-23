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

    <style>
        .card-body1 {
            width: 500px;
        }
        .card-body2 {
            width: 700px;
        }


        #cardwrap {
            width: 100%;
            display: flex;
            justify-content: space-evenly;
        }

        .imgimg {
            display: flex;
            justify-content: center;
            width: 300px;
            height: 300px;
            margin: 0 auto;
        }



    </style>
</head>
<body>

<div class="d-flex" id="wrapper">
    <!-- Sidebar-->
    <div class="border-end bg-white" id="sidebar-wrapper">
        <div class="sidebar-heading border-bottom bg-light"><a href="/admin/index">Main</a></div>
        <div class="list-group list-group-flush">
            <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/admin/menu/list">menu</a>
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
            <h1 class="mt-4">Menu List</h1>



            <div class="container" style="width: 100%;">
                <div class="card">
                    <div id="cardwrap">
                        <div class="card">
                            <div class="card-body card-body1">
                                <img src="/img/menu/<c:out value="${dto.filename}"></c:out>" class="imgimg"/>
                            </div>
                        </div>

                        <div class="card">
                            <div class="card-body card-body2">
                                <p><h3>메뉴명</h3></p><h5><c:out value="${dto.name}"></c:out></h5><hr>
                                <p><h3>단품 가격</h3></p><h5 style="font-weight: bold"><c:out value="${dto.price}"></c:out></h5><hr>
                                <p><h3>남은 수량</h3></p><h5 style="font-weight: bold"><c:out value="${dto.amount}"></c:out></h5><hr>
                                <form action="/admin/menu/amount" method="post">
                                    <input type="hidden" name="mid" value="${dto.mid}">
                                    <input type="number" name="amount" min="1">
                                    <button type="submit">입고하기</button>
                                </form>

                            </div>
                        </div>
                    </div>

                    <div class="card" style="margin: 10px 0 0 0">
                        <button style="margin: 20px 0; font-size: 30px" class="update-menu" onclick="location.href='/admin/menu/update?mid=${dto.mid}'">수정하기</button>
                        <button style="margin: 0 0 20px 0; font-size: 30px" class="delete-menu" onclick="location.href='/admin/menu/delete?mid=${dto.mid}'">삭제하기</button>
<%--                        <button style="margin: 0 0 20px 0; font-size: 30px" class="delete-menu" onclick="location.href='/admin/menu/invisible?mid=${dto.mid}'">비활성화 (고객 보이는 메뉴 없애기)</button>--%>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script>

</script>
<!-- Core theme JS-->
<script src="../../js/scripts.js"></script>
</body>
</html>