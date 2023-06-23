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

    <title>Get List Board</title>
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
    <div class="row content">
        <div class="col">
            <div class="card">
                <div class="card-header">
                    Get List Board
                </div>
                <div class="card-body">

                    <div class="row content">
                        <div class="col">
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title">Search</h5>
                                    <form action="/board/getListBoard" method="get">
                                        <input type="hidden" name="size" value="${pageRequestDTO.size}">
<%--                                        <div class="mb-3">--%>
<%--                                            <input type="checkbox" name="finished"${pageRequestDTO.finished ? "checked" : ""}> 완료여부--%>
<%--                                        </div>--%>
                                        <div class="mb-3">
                                            <input type="checkbox" name="types" value="t"${pageRequestDTO.checkType("t") ? "checked" : ""}>제목
                                            <input type="checkbox" name="types" value="w"${pageRequestDTO.checkType("w") ? "checked" : ""}>작성자
                                            <input type="checkbox" name="types" value="c"${pageRequestDTO.checkType("c") ? "checked" : ""}>내용
                                            <input type="text" name="keyword" class="dorm-control" value="${pageRequestDTO.keyword}">
                                        </div>
                                        <div class="mb-3 input-group dueDateDiv">
                                            <input type="date" name="from" class="from-control" value="${pageRequestDTO.from}">
                                            <input type="date" name="to" class="from-control" value="${pageRequestDTO.to}">
                                        </div>
                                        <div class="input-group mb-3">
                                            <div class="float-end">
                                                <button class="btn btn-primary" type="submit">SEARCH</button>
                                                <button class="btn btn-info clearBtn" type="reset">CLEAR</button>
                                            </div>

                                        </div>
                                    </form>

                                    <script>
                                        document.querySelector('.clearBtn').addEventListener('click',function (){
                                            self.location = '/todo/list';
                                        })
                                    </script>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="my-4">
                        <div class="float-end">
                            <button type="button" class="btn btn-success">AddBoard</button>
                        </div>
                    </div>
                    <table class="table" style="width: 1000px; margin: 0 auto">
                        <thead>
                        <tr>
                            <th scope="col">번 호</th>
                            <th scope="col">제 목</th>
                            <th scope="col">작성자</th>
                            <th scope="col">조횟수</th>
                            <th scope="col">작성일</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:set var="no" value="${responseDTO.startNo}"/>

                        <c:forEach var="board" items="${responseDTO.dtoList}">
                            <tr>
                                <th scope="row">${no}</th>
                                <td>
                                    <a href="/board/getOneBoard?boardid=${board.boardid}&${pageRequest.link}">${board.title}</a>
                                    <span class="badge progress-bar-success" style="background-color: #0a53be">${board.ripplecount}</span>
                                </td>
                                <td>${board.memberDTO.mid}</td>
                                <td>${board.hit}</td>
                                <td><fmt:formatDate value="${board.regdate}" pattern="yyyy-MM-dd"/></td>
                            </tr>

                            <c:set var="no" value="${no-1}"></c:set>
                        </c:forEach>
                        </tbody>
                    </table>

                    <div class="float-end">
                        <ul class="pagination flex-wrap">
                            <c:if test="${responseDTO.prev}">
                                <li class="page-item">
                                    <a class="page-link" data-num="${responseDTO.start-1}">Privious</a>
                                </li>
                            </c:if>
                            <c:forEach var="num" begin="${responseDTO.start}" end="${responseDTO.end}">
                                <li class="page-item ${responseDTO.page == num ?"active" : ""}">
                                    <a class="page-link" data-num="${num}">${num}</a>
                                </li>
                            </c:forEach>
                            <c:if test="${responseDTO.next}">
                                <li class="page-item">
                                    <a class="page-link" data-num="${responseDTO.end+1}">Next</a>
                                </li>
                            </c:if>
                        </ul>

                        <script>
                            document.querySelector('.pagination').addEventListener('click',function (e){
                                e.preventDefault();
                                e.stopPropagation();

                                const target = e.target;
                                if(target.tagName !=='A'){
                                    return;
                                }
                                const num = target.getAttribute('data-num');

                                const frmPage = document.querySelector('form');
                                frmPage.innerHTML += `<input type="hidden" name="page" value="\${num}">`;
                                frmPage.submit();
                                // self.location = `/todo/list?page=\${num}`;
                            });
                        </script>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
    <script>
        document.querySelector(".btn-success").addEventListener("click", function (e) {

            self.location = `/board/addBoard`
        });

            document.querySelector('.clearBtn').addEventListener('click',function (){
            self.location = '/board/getListBoard';
        })


    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>

    <%@include file="../incl/footer.jsp" %>
</body>
</html>