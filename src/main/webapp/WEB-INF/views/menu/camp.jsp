<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../incl/header.jsp" %>
<html>
<head>
    <title>BOOT CAMPING</title>
    <link href="../main.css" rel="stylesheet" type="text/css">
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

        /*.menu-description {*/
        /*    margin-top: 5px;*/
        /*    font-size: 16px;*/
        /*    color: #777;*/
        /*    height: 40px;*/
        /*    overflow: hidden;*/
        /*}*/

        .menu-price {
            margin-top: 10px;
            font-size: 20px;
            font-weight: bold;
            color: #ff5e00;
        }

        .align-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        table {
            margin: 0 auto;
        }
        .css_p{
            font-size: 20px;
            margin: 20px 0;
        }
    </style>

    <title>main</title>
    <script>
        window.onload = () => init();
        var pageButtons;
        var imageTable;
        var currentPage = 1;
        var flipTimer;

        function init() {
            pageButtons = document.getElementsByClassName("pagebutton");
            imageTable = document.getElementById("imagetable");

            pageButtons[0].style.boxShadow = "0 0 25px #E70012";
            pageButtons[0].style.backgroundColor = "#E70012";

            flipTimer = setTimeout(autoFlip, 3000);
        }

        function autoFlip() {
            currentPage += 1;
            if (currentPage > pageButtons.length) currentPage = 1;
            setPage(currentPage);
        }

        function setPage(num) {
            clearTimeout(flipTimer);
            for (var i = 0; i < pageButtons.length; i++) {

                if (i != num - 1) {
                    pageButtons[i].style.boxShadow = "0 0 18px white";
                    pageButtons[i].style.backgroundColor = "transparent";
                } else {
                    pageButtons[i].style.boxShadow = "0 0 25px #E70012";
                    pageButtons[i].style.backgroundColor = "#FF1744";
                }

            }
            imageTable.style.marginLeft = -((num - 1) * 350) + "px";
            currentPage = num;
            flipTimer = setTimeout(autoFlip, 3000);

        }
    </script>

</head>
<body>


<div class="container">
    <div class="card m-2">
        <div class="card-body">
            <h4 class="card-title">인기상품</h4>
            <hr>
            <div style="display: flex; justify-content: center;">
                <table style="margin: 0 0 50px 0">
                    <tr>
                        <td width="270px" height="600px">
                            <div class="margin">
                                <div class="pagebutton" onclick="setPage(1)">
                                    <img src="/img/menu/${popularItem[0].filename}">
                                </div>
                            </div>
                            <div class="margin">
                                <div class="pagebutton" onclick="setPage(2)">
                                    <img src="/img/menu/${popularItem[1].filename}">
                                </div>
                            </div>
                        </td>

                        <td width="450px" height="600px" >
                            <div id="mainimage">
                                <table id="imagetable" >
                                    <tr>
                                        <c:forEach var="items" items="${popularItem}">
                                            <td>
                                                <div style="width: 348px; height: 533px;">
                                                    <img src="/img/menu/${items.filename}" style="width: 348px; height: 348px;">
                                                    <div style="text-align: center">
                                                        <p class="css_p">${items.name}</p>
                                                        <p class="css_p">${items.price}</p>
                                                        <p class="css_p"><a href="/menu/getOneMenu?mid=${items.mid}">메뉴바로가기</a></p>
                                                    </div>
                                                </div>
                                            </td>
                                        </c:forEach>
                                    </tr>
                                </table>
                            </div>
                        </td>

                        <td width="270px" height="600px">
                            <div class="margin2">
                                <div class="pagebutton" onclick="setPage(3)">
                                    <img src="/img/menu/${popularItem[2].filename}">
                                </div>
                            </div>
                            <div class="margin2">
                                <div class="pagebutton" onclick="setPage(4)">
                                    <img src="/img/menu/${popularItem[3].filename}">
                                </div>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>

    <div class="container-fluid">
        <div class="row justify-content-center">
            <div class="col-md-12">
                <div class="card m-2">
                    <div class="card-body">
                        <h3 class="card-title" style="margin-left:10px">그냥상품</h3><hr>
                        <div class="menu-container">
                            <c:forEach var="d" items="${camp}">
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
<%@include file="../incl/footer.jsp" %>
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



