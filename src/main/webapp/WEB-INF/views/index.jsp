<html>
<%@ include file="header.jsp" %>
<body>
<div class="col_center pd_md">
<h2 class="mg-sm text_center mg_b_xs">HyperGrid Co.</h2>
    <p> Smart Energy for a Brighter Tomorrow </p>
    <i class="fa-solid fa-bolt text-warning mg_t_sm"></i>
</div>
<hr/>
<div class="container">
    <div class="w_100 col_center mg_v_lg">
        <form action="login" method="post" class="w_100 max_500">
            <div class="mb-3">
                <label for="uname" class="form-label">Username</label>
                <input name="username" class="form-control" id="uname" type="text" placeholder="Enter your username">
            </div>
            <div class="mb-3">
                <label for="pass" class="form-label">Password</label>
                <input type="password" name="password" class="form-control" id="pass" placeholder="Enter your password" >
            </div>
            <button type="submit" class="btn btn-primary">Login</button>
        </form>
    </div>
</div>
</body>
</html>
