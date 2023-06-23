<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

    <title>Get One Board</title>
    <style>
        .board_body {
            width: 1110px;
            margin: 0 auto;
        }
    </style>
</head>
<body>
<%@include file="../incl/header.jsp" %>
<div class="board_body">


    <div class="container-fluid">
        <div class="row content">
            <div class="card">
                <div class="card-header">
                    Get One Board
                </div>
                <div class="card-body">

                    <div class="input-group mb-3">
                        <input type="text" name="boardid" class="form-control" value="${board.boardid}" readonly>
                    </div>

                    <div class="input-group mb-3">
                        <span class="input-group-text">아이디</span>
                        <input type="text" name="memberid" class="form-control" value="${board.memberDTO.mid}" readonly>
                    </div>

                    <div class="input-group mb-3">
                        <span class="input-group-text">제 목</span>
                        <input type="text" name="title" class="form-control" value="${board.title}" readonly>
                    </div>

                    <div class="input-group mb-3">
                        <span class="input-group-text">내 용</span>
                        <div id="summernote" class="form-control" name="content"
                             style="overflow: auto; height: 300px;">${board.content}</div>
                    </div>
                    <script>
                        $(document).ready(function () {
                            $('#summernote').html('${board.content}');
                        });
                    </script>


                    <div class="input-group mb-3">
                        <img src="/img/board/${board.filename}" alt="${board.filename}">
                    </div>

                    <div class="my-4">
                        <div class="float-end">
                            <c:if test="${board.memberDTO.mid == member.mid}">
                                <button type="button" class="btn btn-success btn-update">Update</button>
                            </c:if>
                            <button type="button" class="btn btn-secondary">List</button>
                        </div>
                    </div>
                    <br><br><br>


                    <%-- 여기서부터 리플 --%>
                    <%-- 댓글 등록 --%>
                    <c:if test="${sessionScope.member != null}">
                        <form name="formObj" style="display: flex;" method="post">
                                <%--                            <input type="hidden" name="customerid" value="${ripple.customerid}">--%>
                            <input type="hidden" name="boardnum" value="${board.boardid}">
                            <div class="input-group mb-3" style="margin-right: 10px;">
                                <span class="input-group-text">댓 글</span>
                                <input type="text" name="content" class="form-control" placeholder="댓글을 써주세요"
                                       style="height: 100%;">
                            </div>

                            <div class="my-4">
                                <div class="float-end" style="display: flex; align-items: center">
                                    <button type="button" class="btn btn-success addRippleBtn"
                                            style="margin-right: 5px;">Submit
                                    </button>
                                    <button type="reset" class="btn btn-danger">Reset</button>
                                </div>
                            </div>
                        </form>
                    </c:if>
                    <div class="rippleList">

                    </div>

                    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
                    <script src="/js/ripple.js"></script>
                    <script>
                        const boardNum = document.querySelector(`input[name="boardid"]`).value
                        document.querySelector(".addRippleBtn") != null ? document.querySelector(".addRippleBtn").addEventListener('click', function (e) {
                            const str = document.formObj.content;
                            console.log(str.value)
                            console.log(${sessionScope.member.mid});
                            let rippleObj = {
                                content: str.value,
                                memberid: ${sessionScope.member.mid != null ? sessionScope.member.mid : "null"},
                                boardnum: ${board.boardid}
                            }
                            addRipple(rippleObj).then(result => {
                                console.log(result)
                                str.value = "";
                                printList(boardNum)
                            })
                        }) : null;
                        <%-- 댓글 목록 출력--%>

                        printList(boardNum)

                        function printList(boardId) {
                            let str = '';
                            getListRipple(boardId).then(result => {
                                console.log("board-------" + boardId)
                                console.log(result);

                                for (r of result.data) {
                                    if(r.memberDTO.mid == ${sessionScope.member.mid}){
                                        str += `<li class="list-group-item d-flex replyItem" style="display: flex; align-items: center;">
                                        <span class="col-6" data-rno="` + r.rippleid + `">` + r.content + `</span>
                                        <span class="col-2">` + r.memberDTO.id + `</span>
                                        <span class="col-2">` + r.regdate + `</span>` +`<button type="button" class="btn btn-danger deleteBtn" data-rno="`
                                            + r.rippleid + `" style="height: 37px;">삭제</button>`
                                            + `</li>`;
                                    }else{
                                        str += `<li class="list-group-item d-flex replyItem" style="display: flex; align-items: center;">
                                        <span class="col-6" data-rno="` + r.rippleid + `">` + r.content + `</span>
                                        <span class="col-2">` + r.memberDTO.id + `</span>
                                        <span class="col-2">` + r.regdate + `</span>`
                                            + `</li>`;
                                    }

                                }
                                document.querySelector(".rippleList").innerHTML = str;
                                //삭제 버튼
                                const deleteBtn = document.querySelectorAll(".deleteBtn");
                                deleteBtn.forEach(button => {
                                    button.addEventListener("click", function (e) {
                                        const rippleid = e.target.getAttribute("data-rno");
                                        console.log(e.target.getAttribute("data-rno"));
                                        deleteRipple(rippleid).then(result => {
                                            console.log(result);
                                            printList(boardId);
                                        }).catch(error => {
                                            console.log(error);
                                        })
                                    })
                                })
                            })
                        }

                    </script>


                    <%-- 여기까지 리플 --%>

                    <script>
                        const serverValidResult = {};

                        <c:forEach items="${errors}" var="error">
                        serverValidResult['${error.getField()}'] = '${error.defaultMessage}';
                        </c:forEach>
                        console.log(serverValidResult);


                        document.querySelector(".btn-update").addEventListener("click", function (e) {
                            self.location = `/board/updateBoard?boardid=${board.boardid}`
                        });

                        document.querySelector(".btn-secondary").addEventListener("click", function (e) {
                            self.location = `/board/getListBoard`
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


<%@include file="../incl/footer.jsp" %>
</body>
</html>