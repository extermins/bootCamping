<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
          rel="stylesheet" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

    <title>개별 상품 페이지</title>

    <style>
        .card-body1 {
            width: 400px;
        }

        * {
            margin: 0;
            padding: 0;
        }

        .card-body2 {
            width: 600px;
        }

        .card-title {
            padding: 20px 0;
        }

        #cardwrap {
            display: flex;
            justify-content: space-evenly;
        }

        .imgimg {
            display: flex;
            justify-content: center;
            width: 350px;
            height: 400px;
            margin: 0 auto;
        }

        .ul_style {
            width: 100%;
            padding: 0;
            margin: 0;
        }

        .li_style {
            display: inline-block;
            line-height: 80px;
            font-size: 30px;
            width: 100%;
            height: 100%;
            margin: 0;
            text-align: center;
        }

        .a_style {
            width: 100%;
            height: 80px;

        }


    </style>
    <style>
        .container {
            width: 1300px;
            margin: 0 auto;
        }

        table {
            margin: 0 auto;
        }


        .menu-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            gap: 30px;
            margin-top: 30px;
        }

        .menu-item {
            width: calc(24.13% - 20px);
            margin-bottom: 30px;
            text-align: center;
            background-color: rgba(238, 238, 238, 0.7);
            border: 1px solid #ddd;
            border-radius: 5px;
            transition: box-shadow 0.3s ease-in-out;
        }

        .menu-item:hover {
            box-shadow: 0px 0px 10px 1px rgba(0, 0, 0, 0.6);
        }

        .menu-img {
            width: 100%;
            height: 200px;
            object-fit: cover;
            border-radius: 5px 5px 0 0;
        }

        .menu-title {
            margin-top: 10px;
            font-size: 20px;
            font-weight: bold;
        }

        .menu-price {
            margin-top: 10px;
            font-size: 20px;
            font-weight: bold;
            color: #ff5e00;
        }

        .star-rating {
            /*border:solid 1px #ccc;*/
            display: flex;
            flex-direction: row-reverse;
            font-size: 1.5em;
            justify-content: space-around;
            padding: 0 .2em;
            text-align: center;
            width: 5em;
        }

        /*별점*/

        .star-rating {
            width: 30%;
            margin-bottom: 20px;
        }

        .star-rating input {
            display: none;
        }

        .star-rating label {
            color: #ccc;
            cursor: pointer;
        }

        .review_box {
            display: flex;
            justify-content: space-between;
        }
        .review_text{
            font-size: 25px;
            margin: 20px 30px 10px;
        }
        .review_content{
            margin: 30px 30px 10px;
            font-size: 25px;
        }

    </style>
</head>
<body>
<jsp:include page="../incl/header.jsp"/>

<div class="container">
    <div class="card">
        <div id="cardwrap" style="margin: 50px 0 50px 0 ">
            <div class="card">
                <div class="card-body card-body1">
                    <img src="/img/menu/<c:out value="${dto.filename}"></c:out>" class="imgimg"/>
                </div>
            </div>

            <div class="card">
                <div class="card-body card-body2">
                    <h4><c:out value="${dto.name}"></c:out></h4>
                    <hr>
                    <p>단품가격</p><h4 style="font-weight: bold"><c:out value="${dto.price}"></c:out></h4>
                    <hr>
                    <p>남은 수량</p><h4 style="font-weight: bold"><c:out value="${dto.amount}"></c:out></h4>
                    <hr>
                    <div>
                        <p>총가격</p>
                        <p class="total_price"></p>
                    </div>
                    <form class="cart-form" method="post">
                        <div class="input-group">
                            <input type="hidden" name="menuid" value="${dto.mid}">
                            <input type="hidden" name="memberid" value="${member.mid}">
                            <input type="number" name="amount" value="1" style="width: 50px; text-align: right;"
                                   readonly>
                            <div class="input-group-append">
                                <button class="btn btn-outline-secondary" style="width: 50px" type="button"
                                        onclick="decreaseQuantity()">-
                                </button>
                                <button class="btn btn-outline-secondary" style="width: 50px" type="button"
                                        onclick="increaseQuantity()">+
                                </button>
                            </div>
                            <button type="button" style="width: 200px" class="btn btn-primary btn-gocart">장바구니 담기
                            </button>
                            <button type="button" style="width: 200px" class="btn btn-secondary btn-purchase"
                                    onclick="location.href='/cart/myCart'">구매하기
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div class="card" style="margin: 20px 0">
        <span style="font-size: 30px; font-weight: bold; margin: 20px 20px 0 20px">관련상품</span>
        <div class="menu-container">
            <c:forEach var="a" items="${related}">
                <div class="menu-item">
                    <a href="/menu/getOneMenu?mid=${a.mid}" class="menu-information">
                        <input type="hidden" value="${a.menutype}">
                        <img src="/img/menu/${a.filename}" alt="메뉴1" class="menu-img">
                        <h2 class="menu-title">${a.name}</h2>
                        <p class="menu-price">${a.price}</p>
                    </a>
                </div>
            </c:forEach>
        </div>
    </div>


    <div id="review">
        <h1 style="margin: 20px 0;">리뷰</h1>
        <c:forEach var="rev" items="${review}">
            <hr>
            <div>
                <div class="review_box">
                    <span class="review_text">${rev.name}</span>
                    <span class="review_text"><fmt:formatDate value="${rev.regdate}" pattern="yyyy-MM-dd"></fmt:formatDate></span>
                </div>
                <div>
                    <div class="star-rating">

                        <c:choose>
                            <c:when test="${rev.rating == 5}">
                                <c:forEach begin="1" end="${rev.rating}">
                                    <label class="star" style="color: #fc0;">&#9733;</label>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <c:forEach begin="${rev.rating}" end="4">
                                    <label class="star">&#9733;</label>
                                </c:forEach>
                                <c:forEach begin="1" end="${rev.rating}">
                                    <label class="star" style="color: #fc0;">&#9733;</label>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>

                    </div>
                    <span class="review_content">${rev.content}</span>
                </div>
            </div>
            <hr>
        </c:forEach>
    </div>

</div>


<jsp:include page="../incl/footer.jsp"/>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script>
    var quantity = 1; // 초기값 설정
    const total_price = document.querySelector('.total_price');
    total_price.innerHTML = quantity * ${dto.price};

    function decreaseQuantity() {
        var inputElement = document.getElementsByName("amount")[0];
        if (quantity > 1) {
            quantity--;
            inputElement.value = quantity;
            total_price.innerHTML = quantity * ${dto.price};
        }
    }

    function increaseQuantity() {
        var inputElement = document.getElementsByName("amount")[0];
        quantity++;
        inputElement.value = quantity;
        total_price.innerHTML = quantity * ${dto.price};
    }


    const form = document.querySelector(".cart-form");
    document.querySelector(".btn-gocart").addEventListener("click", function () {
        form.method = 'post';
        form.action = "/addcart";  // 경로 수정요망
        form.submit();
    });
</script>

</body>
</html>