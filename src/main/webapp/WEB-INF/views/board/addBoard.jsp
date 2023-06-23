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

    <!-- include libraries(jQuery, bootstrap) -->
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

    <!-- include summernote css/js-->
    <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>

    <title>Add Board</title>
    <style>
        .board_body{
            width: 1110px;
            margin: 0 auto;
        }
    </style>
</head>
<%@include file="../incl/header.jsp" %>
<body>

<div class="board_body">
<div class="container-fluid">
    <div class="row content">
        <div class="card">

            <div class="card-body">
                <form method="post" class="formMain" enctype="multipart/form-data" onsubmit="return checkForm()">
                    <input type="hidden" name="memberid" value="${member.mid}">

                    <div class="input-group mb-3">
                        <span class="input-group-text">제 목</span>
                        <div class="col-sm-11">
                            <input type="text" name="title" class="form-control" placeholder="제목을 써주세요">
                        </div>
                    </div>

                    <div class="input-group mb-3">
                        <span class="input-group-text">선 택</span>
                        <div class="col-sm-11">
                            <select name="category" class="form-control">
                                <option value="" class="dropdown-item">선택해주세요</option>
                                <option value="normal" class="dropdown-item">일반 게시판</option>
                                <option value="question" class="dropdown-item">질문 게시판</option>
                                <option value="recommend" class="dropdown-item">추천 게시판</option>
                            </select>
                        </div>
                    </div>

                    <div class="input-group mb-3">
                        <span class="input-group-text">내 용</span>
                        <div class="col-sm-11">
                            <textarea id="summernote" class="form-control" name="content" wrap="hard" cols="20" rows="2"></textarea>
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
                            <input class="form-control" type="file" name="file" onchange="readURL(this)">
                        </div>
                    </div>

                    <div>
                        <img id="preview">
                    </div>

                    <div class="my-4">
                        <div class="float-end">
                            <button type="submit" class="btn btn-success">Submit</button>
                            <button type="reset" class="btn btn-danger">Reset</button>
                            <button type="button" class="btn btn-secondary">List</button>
                        </div>
                    </div>
                </form>
                <script>
                    const serverValidResult = {};

                    <c:forEach items="${errors}" var="error">
                    serverValidResult['${error.getField()}'] = '${error.defaultMessage}';
                    </c:forEach>
                    console.log(serverValidResult);

                    document.querySelector(".btn-secondary").addEventListener("click", function (e) {
                        self.location = `/customer/board/getListBoard`
                    });

                    document.querySelector(".btn-success").addEventListener("click",function (){

                    })


                    function readURL(input) {
                        if (input.files && input.files[0]) {
                            var reader = new FileReader();
                            reader.onload = function(e) {
                                document.getElementById('preview').src = e.target.result;
                            };
                            reader.readAsDataURL(input.files[0]);
                        } else {
                            document.getElementById('preview').src = "";
                        }
                    }


                    const formMain = document.querySelector('.formMain');

                    function checkForm() {
                        if (!formMain.title.value) {
                            alert("제목를 입력하세요.");
                            return false;
                        }
                        if (!formMain.content.value) {
                            alert("내용을 입력하세요.");
                            return false;
                        }
                    }

                </script>
            </div>
        </div>
    </div>
</div>
</div>
<%@include file="../incl/footer.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>


</body>
</html>