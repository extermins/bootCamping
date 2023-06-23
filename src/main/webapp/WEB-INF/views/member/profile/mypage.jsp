<%--
  Created by IntelliJ IDEA.
  User: toyto
  Date: 2023-05-01
  Time: 오후 2:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<html>
<head>
    <title>Title</title>
    <script src="https://spi.maps.daum.net/imap/map_js_init/postcode.v2.js"></script>
</head>

<%--주소 관련--%>

<%-- //// 입력 폼관련 ////--%>

<body>

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
            <h3>마이페이지</h3>
        </ul>

        <div class="col-md-3 text-end">

        </div>
    </header>
</div>


<div class="container">
    <div class="card m-2">
        <div class="card-body">
            <div class="d-flex justify-content-between align-items-center">
                <h5 class="card-title">회원정보</h5>
                <a href="/member/pwcheck">수정하기</a>
            </div>
        </div>
    </div>

<%--    <div class="card m-2">--%>
<%--        <div class="card-body">--%>
<%--            <div class="d-flex justify-content-between align-items-center">--%>
<%--                <h5 class="card-title">배송지 관리</h5>--%>
<%--                <a href="#">수정하기</a>--%>

<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>

    <div class="card m-2">
        <div class="card-body">
            <div class="d-flex justify-content-between align-items-center">
                <h5 class="card-title">장바구니</h5>
                <a href="/cart/mycart">더보기</a>
            </div>
        </div>
    </div>

    <div class="card m-2">
        <div class="card-body">
            <div class="d-flex justify-content-between align-items-center">
                <h5 class="card-title">주문내역</h5>
                <a href="/myorder/all">더보기</a>
            </div>
        </div>
    </div>


</div>
<%@include file="../../incl/footer.jsp" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</body>
</html>