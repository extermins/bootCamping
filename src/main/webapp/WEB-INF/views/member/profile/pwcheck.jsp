<%--
  Created by IntelliJ IDEA.
  User: abab1
  Date: 2023-05-24
  Time: 오전 11:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../incl/header.jsp"%>
<html>
<head>
    <title>Title</title>
</head>

<body>
<div class="container">
    <div class="card m-2">
        <div class="card-body ">
            <div class="align-items-center">

                <h4 class="card-title">비밀번호 확인</h4>
                <form action="/member/pwcheck" method="post">
                    <div class="form-group">
                        <label>password</label><input type="text" class="form-control" placeholder="Password" name="password">
                    </div>
                    <button type="submit" class="btn btn-primary">로그인</button>
                </form>
            </div>
        </div>
    </div>

</div>
</body>
<%@include file="../../incl/footer.jsp"%>
</html>
