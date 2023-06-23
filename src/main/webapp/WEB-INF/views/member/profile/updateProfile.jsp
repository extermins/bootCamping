<%--
  Created by IntelliJ IDEA.
  User: toyto
  Date: 2023-05-01
  Time: 오후 2:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<html>
<head>
    <title>Title</title>
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
    <%-- //// 주소관련 ////--%>


    <%-- 입력 폼관련--%>
    <script type="text/javascript">
        function checkForm() {
            if (!document.frmMemberInsert.id.value) {
                alert("아이디를 입력하세요.");
                return false;
            }
            if (!document.frmMemberInsert.password.value) {
                alert("비밀번호를 입력하세요.");
                return false;
            }
            if (document.frmMemberInsert.password.value !== document.frmMemberInsert.password_confirm.value) {
                alert("비밀번호를 동일하게 입력하세요.");
                return false;
            }
        }
    </script>
</head>

<%--주소 관련--%>

<%-- //// 입력 폼관련 ////--%>

<body>

<div class="container">
    <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
        <div class="col-md-3 mb-2 mb-md-0">
            <a href="/" class="d-inline-flex link-body-emphasis text-decoration-none">
                <svg class="bi" width="40" height="32" role="img" aria-label="Bootstrap">
                    <use xlink:href="#bootstrap"/>
                </svg>
            </a>
        </div>

        <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
            <h3>회원가입</h3>
        </ul>

        <div class="col-md-3 text-end">

        </div>
    </header>
</div>


<div class="container">
    <div class="card m-2">
        <div class="card-body">
            <form name="frmMemberInsert" class="form-horizontal form" action="/member/modifyMember" method="post"
                  onsubmit="return checkForm()">
                <input type="hidden" name="mid" value="${member.mid}">
                <div class="form-group row">
                    <label class="col-sm-2">아이디</label>
                    <div class="col-sm-3">
                        <input name="id" type="text" class="form-control" value="${member.id}" placeholder="id" readonly><span class="idCheck"></span>
                    </div>
                </div>

                <div class="form-group row">
                    <label class="col-sm-2">비밀번호</label>
                    <div class="col-sm-3">
                        <input name="password" type="text" class="form-control" placeholder="password">
                    </div>
                </div>

                <div class="form-group row">
                    <label class="col-sm-2">비밀번호확인</label>
                    <div class="col-sm-3">
                        <input name="password_confirm" type="text" class="form-control" placeholder="password confirm">
                    </div>
                </div>

                <div class="form-group row">
                    <label class="col-sm-2">성명</label>
                    <div class="col-sm-3">
                        <input name="name" type="text" class="form-control" value="${member.name}" placeholder="name" readonly>
                    </div>
                </div>

                <input type="hidden" name="birth" id="birth" value="<fmt:formatDate value="${member.birth}" pattern="yyyy-MM-dd"/>">

                <div class="form-group row">
                    <label class="col-sm-2">전화번호</label>
                    <div class="col-sm-3">
                        <input name="phone" type="text" class="form-control" value="${member.phone}" placeholder="phone">
                    </div>
                </div>


                <div class="form-group row">
                    <label class="col-sm-2">우편번호</label>
                    <div class="col-sm-2">
                        <input name="zipcode" type="text" class="form-control" placeholder="zipcode" value="${member.zipcode}" readonly>
                        <input type="button" value="우편번호검색" onclick="execDaumPostcode()">
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2">주소1</label>
                    <div class="col-sm-5">
                        <input name="address1" type="text" class="form-control" value="${member.address1}" placeholder="address1" readonly>
                    </div>
                </div>


                <div class="form-group row">
                    <label class="col-sm-2">주소2</label>
                    <div class="col-sm-5">
                        <input name="address2" type="text" class="form-control" value="${member.address2}" placeholder="address2">
                    </div>
                </div>


                <div class="form-group row">
                    <label class="col-sm-2"></label>
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="button" class="btn btn-primary insertBtn">회원가입</button>
                        <input type="reset" class="btn btn-primary" value="취소" onclick="reset()">
                        <button type="button" class="btn btn-primary modify-cancel" onclick="location.href='/member/mypage'">취소</button>
                    </div>
                </div>


            </form>
            <script>
                const frmMemberInsert = document.frmMemberInsert;


                const form = document.querySelector('.form');
                const insertBtn = document.querySelector('.insertBtn');
                insertBtn.addEventListener("click", function (e) {
                    // e.stopPropagation();
                    // e.preventDefault();

                    function checkForm() {
                        if (!document.frmMemberInsert.password.value) {
                            alert("비밀번호를 입력하세요.");
                            return false;
                        }
                        if (document.frmMemberInsert.password.value !== document.frmMemberInsert.password_confirm.value) {
                            alert("비밀번호를 동일하게 입력하세요.");
                            return false;
                        }
                        return true;
                    }
                    if (!checkForm()) {
                        return false;
                    }

                    form.action = `/member/modifyMember`
                    form.method = `post`
                    form.submit();

                });
            </script>
        </div>
    </div>
</div>
<%@include file="../../incl/footer.jsp" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</body>
</html>