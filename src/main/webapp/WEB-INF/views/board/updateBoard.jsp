<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% pageContext.setAttribute("replaceChar", "\n");%>
<!doctype html>
<html lang="ko">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
          crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

    <!-- include libraries(jQuery, bootstrap) -->
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

    <!-- include summernote css/js-->
    <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>

    <title>Update Board</title>
    <style>
        .board_body{
            width: 1110px;
            margin: 0 auto;
        }
    </style>
</head>
<body>
<jsp:include page="../incl/header.jsp"/>
<div class="board_body">


<div class="container-fluid">
    <div class="row content">
        <div class="card">
            <div class="card-header">
                Update Board
            </div>
            <div class="card-body">
                <form method="get" enctype="multipart/form-data" >
                    <div class="input-group mb-3">
                        <span class="input-group-text">번 호</span>
                        <input type="text" name="boardid" class="form-control" value="${board.boardid}" readonly>
                    </div>

                    <div class="input-group mb-3">
                        <span class="input-group-text">아이디</span>
                        <input type="text" name="customerid" class="form-control" value="${board.memberid}" readonly>
                    </div>

                    <div class="input-group mb-3">
                        <span class="input-group-text">제 목</span>
                        <input type="text" name="title" class="form-control" value="${board.title}">
                    </div>

                    <div class="input-group mb-3">
                        <span class="input-group-text">내 용</span>
                        <div class="col-sm-11">
                            <textarea id="summernote" class="form-control" name="content" wrap="hard" cols="20" rows="2">
                                ${board.content}
                            </textarea>
                        </div>
                        <script>
                            $('#summernote').summernote({
                                placeholder: '내용을 입력하세요',
                                tabsize: 2,
                                height: 300
                            });
                        </script>
                        <script>
                            ${fn:replace(boardVO.content, replaceChar, "<br>/")}
                        </script>
                    </div>

                    <div class="form-group row">
                        <label class="col-sm-2 control-label">첨부파일</label>
                        <div class="col-sm-8">
                            <input class="form-control" type="file" name="file">
                        </div>
                    </div>


                    <div class="my-4">
                        <div class="float-end">
                            <button type="submit" class="btn btn-success">Update</button>
                            <button type="reset" class="btn btn-danger">Delete</button>
                            <button type="button" class="btn btn-secondary">List</button>
                        </div>
                    </div>
                </form>
                <script>
                    const serverValidResult = {};
                    const frmView = document.querySelector("form");

                    <c:forEach items="${errors}" var="error">
                    serverValidResult['${error.getField()}'] = '${error.defaultMessage}';
                    </c:forEach>
                    console.log(serverValidResult);

                    document.querySelector(".btn-success").addEventListener("click", function (e) {
                        frmView.action = "/board/updateBoard";
                        frmView.method = "post";
                        frmView.submit();
                    });

                    document.querySelector(".btn-secondary").addEventListener("click", function (e) {
                        self.location = `/board/getListBoard`
                    });

                    document.querySelector(".btn-danger").addEventListener("click", function (e) {
                        frmView.action = "/board/deleteBoard";
                        frmView.method = "get";
                        frmView.submit();
                    });

                </script>

            </div>
        </div>
    </div>
</div>

</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>

<jsp:include page="../incl/footer.jsp"/>
</body>
</html>