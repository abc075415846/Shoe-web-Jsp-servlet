<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" href="css/WS_login.css">
        <link rel="stylesheet" href="css/WS_wrapper.css">
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>

            <div class="container" style="margin-top: 80px">
                <ul class="breadcrumb">
                    <li><a href="index.jsp">Home</a></li>
                    <li class="active">Login</li>
                </ul>
                <div class="main-left">
                    <div class="main-form-login">
                        <h3>Login</h3>
                        <!------------------modal forgot password-------------->
                        <a class="fgpass" data-toggle="modal" data-target="#exampleModal">Quên mật khẩu?</a>
                        <div class="modal fade" id="exampleModal" tabindex="-1"
                             role="dialog" aria-labelledby="exampleModalLabel"
                             aria-hidden="true" style="z-index: 2001">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">

                                    <!--modal header-->
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Quên mật khẩu ?</h5>
                                        <button type="button" class="btn-exit" data-dismiss="modal"
                                                aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <!--modal body-->
                                    <div class="modal-body">
                                        <p>Nhập địa chỉ email của bạn bên dưới và nếu tài khoản tồn tại,
                                            chúng tôi sẽ gửi cho bạn một liên kết để đặt lại mật khẩu của bạn.</p>
                                        <form>
                                            <input type="text" placeholder="Email" id="fg-email">
                                        </form>
                                    </div>
                                    <!--modal footer-->
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary"
                                                data-dismiss="modal">Gửi</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <form class="form-horizontal" action="<%=request.getContextPath()%>/Login" method="POST">
                        <fieldset>
                            <%
                                String error = "";
                                if(request.getAttribute("error") != null){
                                    error = (String)request.getAttribute("error");
                                }
                            %>
                            <!----- Username ------------------>
                            <div class="control-group">
                                <label class="control-label" for="username">Tên tài khoản</label>
                                <div class="controls">
                                    <input type="text" id="username" name="username"
                                           placeholder="Username" class="input-xlarge">
                                </div>
                            </div>
                            <!-- Password------------------------------>
            
                            <div class="control-group">
                                <label class="control-label" for="password">Mật khẩu</label>
                                <div class="controls">
                                    <input type="password" id="password" name="password"
                                           placeholder="Password" class="input-xlarge">
                                </div>
                            </div>
                            <p style="color: red"><%=error%></p>
                            <div class="checkbox">
                                <label><input name="remember" type="checkbox"
                                              value="Remember Me" class="check-box"> <span>Remember
                                        Me</span></label>
                            </div>
                            
                            <!----button------------------------------------------------------------>
                            <div class="control-group">
                                <div class="controls">
                                    <button class="btn btn-success" name="submit" type="submit">Đăng nhập</button>
                                </div>
                            </div>
                        </fieldset>
                    </form>
                </div>
            </div>
            <div class="main-right">
                <h3>Register</h3>
                <div class="intro-register">
                    <p>Tận hưởng lợi ích của việc có tài khoản như:</p>
                    <ul class="list-benefit">
                        <li>Theo dõi và kiểm tra đơn hàng của bạn</li>
                        <li>Đăng nhập một lần cho các sản phẩm và dịch vụ của D2C</li>
                        <li>Lịch sử đặt hàng</li>
                        <li>Thanh toán nhanh hơn</li>
                    </ul>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <a class="btn btn-register" href="register.jsp"><span
                                class="glyphicon glyphicon-share-alt"></span> Đăng ký</a>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>