<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
</head>
<%@include file="../../incl/header.jsp" %>
<body>
<div class="container">
    <table class="table">
        <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">주문 번호</th>
            <th scope="col">상품명</th>
            <th scope="col">리뷰 작성 여부</th>
            <th scope="col">주문 일자</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="order" items="${orderList}" varStatus="status">
            <tr>
                <td>${status.index+1}</td>
                <td><img src="/img/menu/<c:out value="${order.filename}"></c:out>"
                         style="width: 100px; height: 100px;"/></td>
                <td><a href="/myorder/one?orderid=${order.orderId}">${order.orderItem}</a></td>
                <td>
                    <c:choose>
                        <c:when test="${order.reviewcheck==false}"><button class="btn btn-primary">작성하기</button></c:when>
                        <c:otherwise><button class="btn btn-dark">작성완료</button></c:otherwise>
                    </c:choose>
                </td>
                <td><fmt:formatDate value="${order.regdate}" pattern="yyyy-MM-dd"></fmt:formatDate></td>
            </tr>

        </c:forEach>
        </tbody>
    </table>
</div>
</body>
<%@include file="../../incl/footer.jsp" %>
</html>
