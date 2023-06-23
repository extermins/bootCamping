<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>

    <style>
        #title {
            padding: 30px 0;
            display: flex;
            justify-content: center;
        }

        .card-body1 {
            width: 500px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .card-body2 {
            width: 500px;
        }

        .card-title {
            padding: 20px 0;
        }

        #cardwrap {
            display: flex;
            justify-content: space-evenly;
        }

        #image {
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0 auto;
            width: 200px;
            height: 200px;
            background-color: #0dcaf0;
        }

        .review_button {
            margin: 0 40px 40px;
            display: flex;
            justify-content: right;
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
            margin: 10px 0;
        }

        /*별점*/

        .star-rating {
            width: 100%;
        }

        .star-rating input {
            display: none;
        }

        .star-rating label {
            color: #ccc;
            cursor: pointer;
        }

        .star-rating :checked ~ label {
            color: #f90;
        }

        .star-rating label:hover,
        .star-rating label:hover ~ label {
            color: #fc0;
        }


    </style>
    <script>
        function checkReviewCheck(){
            if (!form.rating.value) {
                alert("별점을 선택해주세요!");
                return false;
            }
            if (!form.content.value) {
                alert("리뷰내용을 입력해주세요!");
                return false;
            }
        }
    </script>
</head>
<%@include file="../../incl/header.jsp" %>
<body>
<div class="container">

    <div class="card">
        <div id="cardwrap" style="margin: 50px 0 50px 0 ">
            <div class="card">
                <div class="card-body card-body1">
                    <img src="/img/menu/<c:out value="${order.filename}"></c:out>"
                         style="width: 350px; height: 350px;"/>
                </div>
            </div>

            <div class="card">
                <div class="card-body card-body2">
                    <h4><c:out value="${order.name}"></c:out></h4>
                    <hr>
                    <p>단품가격</p><h4 style="font-weight: bold"><c:out value="${order.price}"/></h4>
                    <hr>
                    <p>주문 수량</p><h4 style="font-weight: bold"><c:out value="${order.amount}"/></h4>
                    <hr>
                    <div>
                        <p>총가격</p><h4 style="font-weight: bold"><c:out value="${order.price * order.amount}"/>원</h4>
                    </div>
                </div>
            </div>
        </div>
        <div class="review_button">
            <button class="btn btn-secondary" onclick="location.href='/menu/getOneMenu?mid=${order.menuid}'"
                    style="font-size: 25px; margin-right: 30px">메뉴로 가기
            </button>


            <c:choose>
                <c:when test="${order.reviewcheck == false}">
                    <button class="btn btn-primary modal_open_button" style="font-size: 25px">리뷰작성하기</button>
                </c:when>
                <c:otherwise>
                    <button class="btn btn-dark" style="font-size: 25px">리뷰작성완료</button>
                </c:otherwise>
            </c:choose>

        </div>
    </div>


</div>
</div>

<div class="modal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">리뷰</h5>
            </div>
            <div class="modal-body">

                <form class="review_form" method="post" onsubmit="return checkReviewCheck()">
                    <div class="star-rating">
                        <input type="radio" id="5-stars" name="rating" value="5"/>
                        <label for="5-stars" class="star">&#9733;</label>
                        <input type="radio" id="4-stars" name="rating" value="4"/>
                        <label for="4-stars" class="star">&#9733;</label>
                        <input type="radio" id="3-stars" name="rating" value="3"/>
                        <label for="3-stars" class="star">&#9733;</label>
                        <input type="radio" id="2-stars" name="rating" value="2"/>
                        <label for="2-stars" class="star">&#9733;</label>
                        <input type="radio" id="1-star" name="rating" value="1"/>
                        <label for="1-star" class="star">&#9733;</label>
                    </div>
                    <input type="hidden" name="memberid" value="${member.mid}">
                    <input type="hidden" name="menuid" value="${order.menuid}">
                    <input type="hidden" name="orderid" value="${order.orderId}">
                    <div class="input-group mb-3" style="margin-right: 10px;">
                        <textarea rows="6" name="content" class="form-control"></textarea>
                    </div>
                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary review_submit_button" data-bs-dismiss="modal">등록하기</button>
                <button type="button" class="btn btn-secondary modal_close" data-bs-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>
<%@include file="../../incl/footer.jsp" %>
</body>
<script>
    const modal = new bootstrap.Modal(document.querySelector('.modal'));
    const modal_open = document.querySelector('.modal_open_button');
    const modal_close = document.querySelector('.modal_close');

    modal_open.addEventListener("click", function () {
        modal.show();
    })

    modal_close.addEventListener("click", function () {
        modal.hide();
    })


    const form = document.querySelector('.review_form');
    const submit_button = document.querySelector('.review_submit_button');

    submit_button.addEventListener('click',function (){

        function checkReviewCheck(){
            if (!form.rating.value) {
                alert("별점을 선택해주세요!");
                return false;
            }
            if (!form.content.value) {
                alert("리뷰내용을 입력해주세요!");
                return false;
            }
            return true;
        }

        if (!checkReviewCheck()) {
            return false;
        }

        form.action = '/review/add';
        form.submit();
        alert("등록되었습니다.");
    });

</script>
</html>
