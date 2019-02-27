<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Register</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/WS_register.css">
        <link rel="stylesheet" href="css/WS_wrapper.css">
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>

            <div class="container" style="margin-top: 80px">
                <ul class="breadcrumb">
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="login.jsp">Login</a></li>
                    <li class="active">Register</li>
                </ul>
                <div class="main-left">
                    <div class="main-form-login">
                        <h3>Register</h3>
                        <form class="form-horizontal" action="<%=request.getContextPath()%>/Register" method="POST">
                        <fieldset>
                            <%
                                String user_err = "", pass_err = "", name_err = "", email_err = "", add_err = "", phone_err = "", day_err = "";
                                if (request.getAttribute("user_err") != null) {
                                    user_err = (String) request.getAttribute("user_err");
                                }
                                if (request.getAttribute("pass_err") != null) {
                                    pass_err = (String) request.getAttribute("pass_err");
                                }
                                if (request.getAttribute("name_err") != null) {
                                    name_err = (String) request.getAttribute("name_err");
                                }

                                if (request.getAttribute("day_err") != null) {
                                    day_err = (String) request.getAttribute("day_err");
                                }
                                if (request.getAttribute("email_err") != null) {
                                    email_err = (String) request.getAttribute("email_err");
                                }
                                if (request.getAttribute("phone_err") != null) {
                                    phone_err = (String) request.getAttribute("phone_err");
                                }
                                if (request.getAttribute("add_err") != null) {
                                    add_err = (String) request.getAttribute("add_err");
                                }
                            %>
                            <!-----Username ------------------>
                            <div class="control-group">
                                <label class="control-label" for="username">Tên tài khoản</label>
                                <div class="controls">
                                    <input type="text" name="username"
                                           placeholder="Nhập tên tài khoản" class="form-control">
                                </div>
                            </div>
                            <p style="color: red"><%=user_err%></p>
                            <!-- Password------------------------------>
                            <div class="control-group">
                                <label class="control-label" for="password">Mật khẩu</label>
                                <div class="controls">
                                    <input type="password" name="pass"
                                           placeholder="Nhập họ và tên" class="form-control">
                                </div>
                            </div>
                            <p style="color: red"><%=pass_err%></p>
                            <!-------Name------------------------------>
                            <div class="control-group">
                                <label class="control-label" for="name">Họ và tên</label>
                                <div class="controls">
                                    <input type="text" name="name"
                                           placeholder="Nhập họ và tên" class="form-control">
                                </div>
                            </div>
                            <p style="color: red"><%=name_err%></p>
                            <!-- Select Basic -->
                            <div class="control-group">
                                <label class="control-label" for="sex">Giới tính</label>
                                <div class="controls">
                                    <select name="selectsex" class="form-control">
                                        <option value="1">Nam</option>
                                        <option value="2">Nữ</option>
                                    </select>
                                </div>
                            </div>
                            <!-----------datepicked----------->
                            <div class='control-group'>
                                <label class="control-label" for="birthday">Ngày sinh</label>
                                <div class="input-group date" 
                                     style="padding-left: 0px; border: 2px solid #fff;">
                                    <input type="text" name="birthday" class="form-control datepicker" placeholder="01/12/1990">
                                    <span class="input-group-addon"><span
                                            class="glyphicon glyphicon-calendar"></span></span>
                                </div>

                            </div>
                            <p style="color: red"><%=day_err%></p>
                            <!----- Email ------------------>
                            <div class="control-group">
                                <label class="control-label" for="email">Email</label>
                                <div class="controls">
                                    <input type="text" name="email" placeholder="Email"
                                           class="form-control">
                                </div>
                            </div>
                            <p style="color: red"><%=email_err%></p>
                            <!----- Phone ------------------>
                            <div class="control-group">
                                <label class="control-label" for="phone">Số điện thoại</label>
                                <div class="controls">
                                    <input type="text" name="phone" placeholder="Nhập số điện thoại"
                                           class="form-control">
                                </div>
                            </div>
                            <p style="color: red"><%=phone_err%></p>
                            <!----- Address ------------------>
                            <div class="control-group">
                                <label class="control-label" for="address">Địa chỉ</label>
                                <div class="controls">
                                    <input type="text" name="address"
                                           placeholder="Nhập địa chỉ" class="form-control">
                                </div>
                            </div>
                            <p style="color: red"><%=add_err%></p>
                            <!----button------------------------------------------------------------>
                            <div class="checkbox">
                                <label><input name="remember" type="checkbox" value=""
                                              class="check-box"><span>Tôi đồng ý với tất cả</span><span><a
                                            href="#">Điều khoản &amp; Chích sách</a></span></label>
                            </div>

                            <div class="control-group">
                                <div class="controls">
                                    <button type="submit" class="btn btn-success">Đăng ký</button>
                                </div>
                            </div>

                            <div class="have-account">
                                <span>Đã có tài khoản?</span><span><a href="login.jsp">
                                        Đăng nhập</a></span>
                            </div>

                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>