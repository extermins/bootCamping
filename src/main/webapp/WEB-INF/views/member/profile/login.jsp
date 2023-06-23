<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../incl/header.jsp"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="container">
    <div class="card m-2">
        <div class="card-body">
            <h4 class="card-title">로그인</h4>
            <form action="/member/login" method="post">
                <div class="form-group">
                    <label>id : </label><input type="text" class="form-control" placeholder="ID" name="id">
                </div>
                <div class="form-group">
                    <label>passwd : </label><input type="password" class="form-control" placeholder="passwd" name="password">
                </div>
                <div class="form-group form-check">
                    <label class="form-check-label"><input class="form-check-input" name="auto" type="checkbox">Remember me</label>
                </div>
                <button type="submit" class="btn btn-primary">로그인</button>
            </form>
        </div>
    </div>
</div>

<div class="modal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title"></h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p class="modal-p"></p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary modal_close" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<%@include file="../../incl/footer.jsp"%>
<script>


    const modal_title = document.querySelector('.modal-title');
    const modal_p =document.querySelector('.modal-p');



    const modal = new bootstrap.Modal(document.querySelector(".modal"));
    const modal_close = document.querySelector('.modal_close');

    //에러 모달
    const error = '${error}';
    if (error!=''){
        modal_title.innerHTML = 'Error';
        modal_p.innerHTML = error;
        modal.show();
    }

    //수정 모달
    const Modify_Ok = '${Modify_Ok}';
    const Modify_Ok_Value = '${Modify_Ok_Value}';
    if (Modify_Ok!=''){
        modal_title.innerHTML = Modify_Ok;
        modal_p.innerHTML = Modify_Ok_Value;
        modal.show();
    }

    //로그인 에러 모달
    const UnLogin = '${Not_Login}';
    const UnLogin_Value = '${Not_Login_Value}';
    if (UnLogin!=''){
        modal_title.innerHTML = UnLogin;
        modal_p.innerHTML = UnLogin_Value;
        modal.show();
    }


    //모달창 숨기기
    modal_close.addEventListener("click",function (){
        modal.hide();
    })

</script>
</body>
</html>