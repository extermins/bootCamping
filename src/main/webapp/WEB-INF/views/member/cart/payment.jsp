<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="https://js.tosspayments.com/v1/payment-widget"></script>
    <title>주문 결제 BOOT CAMPING</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <style>
        #title {
            padding: 30px 0;
            display: flex;
            justify-content: center;
        }

        .card-body1 {
            width: 650px;
        }

        .card-body2 {
            width: 350px;
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

        #payment {
            padding-top: 50px;
            display: flex;
            justify-content: center;
        }

        #payment-button {

            margin: 20px auto;
            width: 95%;
            padding: 15px;
            background-color: #3065AC;
            color: white;
            border-radius: 3px;
            font-size: 16px;
            border: none;

        }

    </style>
    <script src="https://spi.maps.daum.net/imap/map_js_init/postcode.v2.js"></script>
    <script>
        function execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function (data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var fullAddr = ''; // 최종 주소 변수
                    var extraAddr = ''; // 조합형 주소 변수

                    // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        fullAddr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        fullAddr = data.jibunAddress;
                    }

                    // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                    if (data.userSelectedType === 'R') {
                        //법정동명이 있을 경우 추가한다.
                        if (data.bname !== '') {
                            extraAddr += data.bname;
                        }
                        // 건물명이 있을 경우 추가한다.
                        if (data.buildingName !== '') {
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                        fullAddr += (extraAddr !== '' ? ' (' + extraAddr + ')' : '');
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.querySelector('input[name=zipcode]').value = data.zonecode; //5자리 새우편번호 사용
                    document.querySelector('input[name=address1]').value = fullAddr;

                    // 커서를 상세주소 필드로 이동한다.
                    document.querySelector('input[name=address2]').focus();
                }
            }).open();
        }
    </script>
</head>
<body>
<jsp:include page="../../incl/header.jsp"/>

<div class="container">
    <h3 id="title">상품 결제하기</h3>
    <h4>상품정보</h4>
    <table class="table">
        <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">메뉴명</th>
            <th scope="col">수량</th>
            <th scope="col">가격</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="items" items="${payment}">
            <tr class="items-container">
                <td value="/img/menu/${items.filename}"><img src="/img/menu/${items.filename}" width="50px"
                                                             height="50px"></td>
                <td value="${items.menuid}">${items.name}</td>
                <td value="${items.amount}"><span class="amount">${items.amount}</span></td>
                <td value="${items.price}"><span class="price">${items.price}</span></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <div id="cardwrap" style="margin-top: 50px">

        <div class="card">
            <div class="card-body card-body1">
                <h4 class="card-title">배송지 정보</h4>
                <form name="order_form" method="post" class="order_form_form">
                    <div class="form-group row">
                        <label class="col-sm-3">주문자 이름</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" name="recipient" value="${member.name}" placeholder="NAME"
                                   id="name">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label class="col-sm-3">전화번호</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" name="phone" value="${member.phone}"
                                   placeholder="PHONE" id="phone">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label class="col-sm-3">우편번호</label>
                        <div class="col-sm-9">
                            <input name="zipcode" type="text" value="${member.zipcode}" class="form-control" placeholder="zipcode" readonly>
                            <input type="button" value="우편번호검색" onclick="execDaumPostcode()">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3">주소1</label>
                        <div class="col-sm-9">
                            <input name="address1" type="text" value="${member.address1}" class="form-control" placeholder="address1" readonly>
                        </div>
                    </div>


                    <div class="form-group row">
                        <label class="col-sm-3">주소2</label>
                        <div class="col-sm-9">
                            <input name="address2" type="text" value="${member.address2}" class="form-control" placeholder="address2">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label class="col-sm-3">요청사항</label>
                        <div class="col-sm-9">
                            <input name="request" type="text" class="form-control" placeholder="요청사항을 직접 입력합니다.">
                        </div>
                    </div>
                </form>



            </div>
        </div>


        <div class="card">
            <div class="card-body card-body2">
                <h4 class="card-title">주문 내역</h4>

                <div id="image"><img src="/img/menu/${payment[0].filename}" class="item_img" style="width: 200px; height: 200px"></div>
                <br>

                <div class="form-group row">
                    <label class="col-sm-3">메뉴명</label>
                    <div class="col-sm-8">
                        <input class="items_name form-control" type="text" value="${payment[0].name}" readonly>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-3">수량</label>
                    <div class="col-sm-8">
                        <input class="items_amount form-control" type="text" value="${payment[0].amount}" readonly>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-3">총 가격</label>
                    <div class="col-sm-8">
                        <input class="items_total_price form-control" type="text" value="${payment[0].amount * payment[0].price}" readonly>
                    </div>
                </div>
            </div>
        </div>

    </div>



    <button type="submit" id="payment-button" class="pay_button">결제하기</button>


    <script>
        const form = document.querySelector('.order_form_form');
        const form_button = document.querySelector('.pay_button');

        form_button.addEventListener('click',function (){
            form.method = 'post';
            form.action = '/toss/payment';
            form.submit();
        })

        const items_img = document.querySelector(".item_img");
        const items_name = document.querySelector(".items_name");
        const items_amount = document.querySelector(".items_amount");
        const items_total_price = document.querySelector(".items_total_price");



        const item_tr = document.querySelectorAll(".items-container");
        item_tr.forEach(a => {
            a.addEventListener("click", function (e) {
                const clickedRow = e.target.closest("tr");
                const imgCell = clickedRow.querySelector("td:nth-child(1) img");
                const nameCell = clickedRow.querySelector("td:nth-child(2)");
                const amountCell = clickedRow.querySelector("td:nth-child(3)");
                const priceCell = clickedRow.querySelector("td:nth-child(4)");

                items_img.src = imgCell.src;
                console.log(items_img);
                items_name.value = nameCell.textContent;
                items_amount.value = amountCell.textContent;
                items_total_price.value = priceCell.textContent * amountCell.textContent;


            })

        })

        let total_price = 0;
        let amount = document.querySelectorAll('.amount');
        let prices = document.querySelectorAll('.price');
        prices.forEach(b=>{
            amount.forEach(b=>{
                prices += b.textContent * b.textContent;
            })
        })
        console.log(prices);


    </script>
    <%--    <script>--%>
    <%--        // ------ 클라이언트 키로 객체 초기화 --------%>
    <%--        var clientKey = 'test_ck_Z0RnYX2w532N6xLoLxk3NeyqApQE'--%>
    <%--        var tossPayments = TossPayments(clientKey)--%>

    <%--        // ------ 결제창 띄우기 --------%>
    <%--        tossPayments.requestPayment('카드', { // 결제수단 파라미터 (카드, 계좌이체, 가상계좌, 휴대폰 등)--%>
    <%--            // 결제 정보 파라미터--%>
    <%--            // 더 많은 결제 정보 파라미터는 결제창 Javascript SDK에서 확인하세요.--%>
    <%--            // https://docs.tosspayments.com/reference/js-sdk--%>
    <%--            amount: 100, // 결제 금액--%>
    <%--            orderId: 'nCEzwBvO0dOU7OnoNEeaM', // 주문 ID(주문 ID는 상점에서 직접 만들어주세요.)--%>
    <%--            orderName: '테스트 결제', // 주문명--%>
    <%--            customerName: '김토스', // 구매자 이름--%>
    <%--            successUrl: 'http://localhost:8080/customer/menu/paySuccess', // 결제 성공 시 이동할 페이지(이 주소는 예시입니다. 상점에서 직접 만들어주세요.)--%>
    <%--            failUrl: 'https://localhost:8080/customer/menu/payment', // 결제 실패 시 이동할 페이지(이 주소는 예시입니다. 상점에서 직접 만들어주세요.)--%>
    <%--        })--%>
    <%--                // ------결제창을 띄울 수 없는 에러 처리 --------%>
    <%--                // 메서드 실행에 실패해서 reject 된 에러를 처리하는 블록입니다.--%>
    <%--                // 결제창에서 발생할 수 있는 에러를 확인하세요.--%>
    <%--                // https://docs.tosspayments.com/reference/error-codes#결제창공통-sdk-에러--%>
    <%--                .catch(function (error) {--%>
    <%--                    if (error.code === 'USER_CANCEL') {--%>
    <%--                        // 결제 고객이 결제창을 닫았을 때 에러 처리--%>
    <%--                    } else if (error.code === 'INVALID_CARD_COMPANY') {--%>
    <%--                        // 유효하지 않은 카드 코드에 대한 에러 처리--%>
    <%--                    }--%>
    <%--                });--%>
    <%--    </script>--%>
</div>


<jsp:include page="../../incl/footer.jsp"/>
</body>
</html>