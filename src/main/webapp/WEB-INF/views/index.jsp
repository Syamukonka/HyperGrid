<html>
<%@ include file="header.jsp" %>
<body >
<div class="container-xl">
    <div style="height: 100vh" class="row pd_v_xl pd_h_lg">
        <div class="col-md-6 col-12" >
            <div  class="col_center h100 rounded-2 text-light pd_md bg_cool_green" >
                <h2 style="font-size: 4rem" class="mg-sm genos text_center mg_b_xs">Hyper Grid Co.</h2>
                <p> Lighting Up the Future of Smart Energy Solutions </p>
                <i class="fa-solid fa-bolt text-warning mg_t_sm"></i>
            </div>
        </div>
        <div class="col-md-6 col-12">
            <div class="w_100 h100 col_center">
                <div class="row_center mg_b_lg">
                    <h2>Login to continue</h2>
                </div>
                <form action="login" method="post" class="w_100 max_500">
                    <div class="mb-3">
                        <label for="uname" class="form-label"><i class="fa-solid fa-at mg_r_sm"></i>Username</label>
                        <input name="username" class="form-control" id="uname" type="text" placeholder="Enter your username">
                    </div>

                    <div class="mb-3">
                        <label for="pass" class="form-label"><i class="fa-solid fa-key mg_r_sm"></i>Password</label>
                        <input type="password" name="password" class="form-control" id="pass" placeholder="Enter your password" >
                    </div>

                    <p class="txt_xs text-success mg_b_md">Forgot password? come back when you remember. </p>

                    <button type="submit" class="btn w100 btn-success bg_cool_green" >
                        Login
                    </button>
                </form>
            </div>
        </div>
    </div>

</div>
</body>
</html>
