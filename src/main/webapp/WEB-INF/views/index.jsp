<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="incl/header.jsp" %>
<html>
<head>
    <title>BOOT CAMPING</title>
    <link href="main.css" rel="stylesheet" type="text/css">
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


        table {
            margin: 0 auto;
        }
    </style>

    <title>main</title>


</head>
<body>


<div class="container">
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
<%--            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>--%>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="main1.png" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="main2.png" class="d-block w-100" alt="...">
            </div>
<%--            <div class="carousel-item">--%>
<%--                <img src="qwa.jpg" class="d-block w-100" alt="...">--%>
<%--            </div>--%>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>



    <div class="container-fluid" style="margin: 30px 0;">
        <div class="row justify-content-center">
            <div class="col-md-12">

                <div class="card m-2">
                    <div class="card-body">
                        <div class="d-flex justify-content-between align-items-center" style="align-items: center">
                            <h4 class="card-title" style="margin-left:30px">최신상품</h4>
                            <a href="/menu" style="margin-right:50px">더보기</a>

                        </div>
                        <div class="menu-container">
                            <c:forEach var="d" items="${dto}">
                                <div class="menu-item">
                                    <a href="/menu/getOneMenu?mid=${d.mid}" class="menu-information">
                                        <input type="hidden" value="${d.menutype}">
                                        <img src="/img/menu/${d.filename}" alt="메뉴1" class="menu-img">
                                        <h2 class="menu-title">${d.name}</h2>
                                        <p class="menu-price">${d.price}</p>
                                    </a>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>

                <div class="card m-2" style="margin-top: 50px">
                    <div class="card-body">
                        <div class="d-flex justify-content-between align-items-center">
                            <h4 class="card-title" style="margin-left:30px">캠핑도구</h4>
                            <a href="/menu/camp" style="margin-right:50px">더보기</a>

                        </div>
                        <div class="menu-container">
                            <c:forEach var="d" items="${dtoCamp}">
                                <div class="menu-item">
                                    <a href="/menu/getOneMenu?mid=${d.mid}" class="menu-information">
                                        <input type="hidden" value="${d.menutype}">
                                        <img src="/img/menu/${d.filename}" alt="메뉴1" class="menu-img">
                                        <h2 class="menu-title">${d.name}</h2>
                                        <p class="menu-price">${d.price}</p>
                                    </a>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>


                <div class="card m-2" style="margin-top: 50px">
                    <div class="card-body">
                        <div class="d-flex justify-content-between align-items-center">
                            <h4 class="card-title" style="margin-left:30px">밀키트</h4>
                            <a href="/menu/mealkit" style="margin-right:50px">더보기</a>

                        </div>
                        <div class="menu-container">
                            <c:forEach var="d" items="${dtoMealKit}">
                                <div class="menu-item">
                                    <a href="/menu/getOneMenu?mid=${d.mid}" class="menu-information">
                                        <input type="hidden" value="${d.menutype}">
                                        <img src="/img/menu/${d.filename}" alt="메뉴1" class="menu-img">
                                        <h2 class="menu-title">${d.name}</h2>
                                        <p class="menu-price">${d.price}</p>
                                    </a>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>


            </div>
        </div>
    </div>

    <div class="modal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title"></h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p class="modal-p">${error}</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary modal_close" data-bs-dismiss="modal">Close
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
<%@include file="incl/footer.jsp" %>
<script>
    const error = '${error}';

    const modal = new bootstrap.Modal(document.querySelector(".modal"));
    const modal_close = document.querySelector('.modal_close');
    if (error != '') {
        modal.show();
    }

    modal_close.addEventListener("click", function () {
        modal.hide();
    })
</script>
</html>



