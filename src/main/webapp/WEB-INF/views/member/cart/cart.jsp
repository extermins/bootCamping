<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>내 장바구니</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #fff;
        }

        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f9f9f9;
        }

        img {
            max-width: 100px;
            max-height: 100px;
        }

        .check_all {
            margin-left: 5px;
        }

        .btn_delete {
            background-color: #e74c3c;
            color: #fff;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
        }

        .btn_purchase {
            display: block;
            width: 200px;
            height: 40px;
            margin: 20px 0;
            background-color: #3498db;
            color: #fff;
            font-size: 16px;
            border: none;
            cursor: pointer;
        }
    </style>
</head>
<body>
<%@include file="../../incl/header.jsp" %>
<div class="container">
    <div class="card-body">

        <table>
            <thead>
            <th><input type="checkbox" class="check_all"></th>
            <th>메뉴명</th>
            <th>메뉴사진</th>
            <th>메뉴 수량</th>
            <th>총 가격</th>
            <th>삭제</th>
            </thead>
            <tbody>
            <c:forEach var="d" items="${cart}">
                <tr>
                    <td><input type="checkbox" name="cartId" class="check_box" value="${d.cartid}"></td>
                    <td>${d.name}</td>
                    <td><img src="/img/menu/${d.filename}" alt="${d.name}"></td>
                    <td>${d.amount}</td>
                    <td>${d.price * d.amount}</td>
                    <td>
                        <button class="btn_delete" onclick="deleteCartItem(${d.cartid})">삭제</button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <c:choose>
            <c:when test="${cart.size() != 0}">
                <form action="/purchase/goPurchase" method="post">
                    <input type="hidden" value="" name="cartIds" class="purchase_cart">
                    <button type="submit" class="btn_purchase">구매하기</button>
                </form>
            </c:when>
            <c:otherwise>
                <button type="button" class="btn_purchase" onclick="location.href='/'">물건담으러가기</button>
            </c:otherwise>
        </c:choose>


    </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script>


    const checkbox = document.querySelectorAll(".check_box");
    const result = document.querySelector(".purchase_cart");
    checkbox.forEach((c, n, a) => {
        c.addEventListener('click', function (e) {
            let str = '';
            result.value = str;
            a.forEach(chc => {
                if (chc.checked) {
                    str = str + chc.value + " ";
                    result.value = str;
                }
            })
        })
    })

    const check_all = document.querySelector('.check_all');
    check_all.addEventListener('click', function (e) {
        if (this.checked) {
            checkbox.forEach(c => {
                c.checked = true;
            });
        } else {
            checkbox.forEach(c => {
                c.checked = false;
            });
        }
        let str = '';
        checkbox.forEach(chc => {
            if (chc.checked) {
                str = str + chc.value + " ";
            }
        });
        result.value = str;
    });

    // 삭제

    const deleteCartItem = function (i) {
        deleteCart(i).then(result => {
            console.log(result);
            alert(result.data.result)
        })
    };

    async function deleteCart(cartid) {
        console.log(cartid);
        const result = await axios.delete(`/cart/` + cartid)
        return result;
    }


</script>
<jsp:include page="../../incl/footer.jsp"/>
</body>
</html>