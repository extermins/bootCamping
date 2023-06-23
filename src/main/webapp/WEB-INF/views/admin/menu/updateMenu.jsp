<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Simple Sidebar - Start Bootstrap Template</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="../../css/styles.css" rel="stylesheet" />

    <style>
        .card-body1 {
            width: 500px;
        }
        .card-body2 {
            width: 700px;
        }


        #cardwrap {
            width: 100%;
            display: flex;
            justify-content: space-evenly;
        }

        .imgimg {
            display: flex;
            justify-content: center;
            width: 300px;
            height: 300px;
            margin: 0 auto;
        }



    </style>
</head>
<body>

<div class="d-flex" id="wrapper">
    <!-- Sidebar-->
    <div class="border-end bg-white" id="sidebar-wrapper">
        <div class="sidebar-heading border-bottom bg-light"><a href="/admin/index">Main</a></div>
        <div class="list-group list-group-flush">
            <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/admin/menu/list">menu</a>
            <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">#!</a>
            <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">#!</a>
            <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">#!</a>
            <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">#!</a>
            <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">#!</a>
        </div>
    </div>
    <!-- Page content wrapper-->
    <div id="page-content-wrapper">
        <!-- Top navigation-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
            <div class="container-fluid">
                <button class="btn btn-primary" id="sidebarToggle">Toggle Menu</button>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mt-2 mt-lg-0">
                        <c:if test="${admin != null}">
                            <li class="nav-item active"><a class="nav-link" href="#!">${admin.id}반갑습니다.</a></li>
                            <li class="nav-item"><a class="nav-link" href="/admin/logout">로그아웃</a></li>
                        </c:if>
                        <c:if test="${admin == null}">
                            <li class="nav-item active"><a class="nav-link" href="#!">${admin.id}없어요.</a></li>
                            <li class="nav-item"><a class="nav-link" href="/admin/logout">로그아웃</a></li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Page content-->
        <div class="container-fluid">
            <h1 class="mt-4">Menu List</h1>



            <div class="container">
                <div class="card m-2">
                    <div class="card-body">
                        <h4 class="card-title">수정하기</h4>
                        <hr>

                        <form name="frmMemberInsert" class="form-horizontal form" enctype="multipart/form-data"
                              action="/admin/menu/update"
                              method="post"
                              onsubmit="return checkForm()">
                            <input type="hidden" name="mid" value="${dto.mid}">
                            <div class="form-group row">
                                <label class="col-sm-2">메뉴이름</label>
                                <div class="col-sm-3">
                                    <input name="name" type="text" value="${dto.name}" class="form-control" placeholder="메뉴이름">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="col-sm-2">메뉴타입</label>
                                <div class="col-sm-2">
                                    <select name="menutype" class="btn btn-secondary dropdown-toggle select1_value"
                                            aria-labelledby="dropdownMenuButton1" onchange="updateSecondSelect()">
                                        <option value="" class="dropdown-item">---</option>
                                        <option value="camp" class="dropdown-item">캠핑용품</option>
                                        <option value="mealkit" class="dropdown-item">밀키트</option>
                                    </select>

                                </div>

                                <div class="col-sm-2">
                                    <select name="detailcategory" class="btn btn-secondary dropdown-toggle select2"
                                            aria-labelledby="dropdownMenuButton1">
                                        <option value="" class="dropdown-item">---</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="col-sm-2">메뉴가격</label>
                                <div class="col-sm-3">
                                    <input name="price" value="${dto.price}" type="text" class="form-control" placeholder="메뉴가격">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="col-sm-2">메뉴수량</label>
                                <div class="col-sm-3">
                                    <input name="amount" value="${dto.amount}" type="number" class="form-control" placeholder="메뉴수량">
                                </div>
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

                            <div class="form-group row">
                                <label class="col-sm-2"></label>
                                <div class="col-sm-offset-2 col-sm-10">
                                    <button type="submit" class="btn btn-primary">메뉴등록</button>
                                    <input type="reset" class="btn btn-primary" value="취소" onclick="reset()">
                                </div>
                            </div>
                        </form>


                        <script>
                            //이미지 미리보기
                            function readURL(input) {
                                if (input.files && input.files[0]) {
                                    var reader = new FileReader();
                                    reader.onload = function (e) {
                                        document.getElementById('preview').src = e.target.result;
                                    };
                                    reader.readAsDataURL(input.files[0]);
                                } else {
                                    document.getElementById('preview').src = "";
                                }
                            }

                            //값 유효성검사
                            const formMain = document.querySelector('.frmMemberInsert');

                            function checkForm() {
                                if (!formMain.name.value) {
                                    alert("제목를 입력하세요.");
                                    return false;
                                }
                                if (!formMain.content.value) {
                                    alert("내용을 입력하세요.");
                                    return false;
                                }
                                if (!formMain.content.value) {
                                    alert("내용을 입력하세요.");
                                    return false;
                                }
                            }
                        </script>

                        <script>

                            function updateSecondSelect() {
                                // 첫 번째 셀렉트 박스에서 선택한 값을 가져옴
                                const select1 = document.querySelector('.select1_value').value;
                                const select2 = document.querySelector('.select2');

                                // 두 번째 셀렉트 박스 초기화
                                select2.innerHTML = '';

                                // 첫 번째 셀렉트 박스의 값에 따라 두 번째 셀렉트 박스 옵션을 설정
                                if (select1 === 'camp') {
                                    // 첫 번째 옵션에 해당하는 두 번째 셀렉트 박스 옵션 설정
                                    const option1 = document.createElement('option');
                                    option1.value = '텐트';
                                    option1.text = '텐트';
                                    select2.appendChild(option1);

                                    const option2 = document.createElement('option');
                                    option2.value = '테이블';
                                    option2.text = '테이블';
                                    select2.appendChild(option2);

                                    const option3 = document.createElement('option');
                                    option3.value = '의자';
                                    option3.text = '의자';
                                    select2.appendChild(option3);

                                } else if (select1 === 'mealkit') {
                                    // 두 번째 옵션에 해당하는 두 번째 셀렉트 박스 옵션 설정
                                    const option2_1 = document.createElement('option');
                                    option2_1.value = '찌개류';
                                    option2_1.text = '찌개류';
                                    select2.appendChild(option2_1);

                                    const option2_2 = document.createElement('option');
                                    option2_2.value = '고기류';
                                    option2_2.text = '고기류';
                                    select2.appendChild(option2_2);

                                    const option2_3 = document.createElement('option');
                                    option2_3.value = '볶음';
                                    option2_3.text = '볶음';
                                    select2.appendChild(option2_3);

                                    const option2_4 = document.createElement('option');
                                    option2_4.value = '해산물(구이용)';
                                    option2_4.text = '해산물(구이용)';
                                    select2.appendChild(option2_4);

                                    const option2_5 = document.createElement('option');
                                    option2_5.value = '해산물(탕용)';
                                    option2_5.text = '해산물(탕용)';
                                    select2.appendChild(option2_5);
                                }
                            }




                        </script>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script>

</script>
<!-- Core theme JS-->
<script src="../../js/scripts.js"></script>
</body>
</html>