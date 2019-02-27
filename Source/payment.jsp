<%@page import="pojo.Ctsanpham"%>
<%@page import="dao.SanPhamDao"%>
<%@page import="dao.HoaDonDao"%>
<%@page import="pojo.Khuvuc"%>
<%@page import="java.util.Map"%>
<%@page import="pojo.Sanpham"%>
<%@page import="java.util.TreeMap"%>
<%@page import="pojo.Giohang"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Website D2C</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/WS_payment.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>

    <body>
        <%
            HoaDonDao hdDao = new HoaDonDao();
            SanPhamDao spd = new SanPhamDao();
            Giohang giohang = (Giohang) session.getAttribute("giohang");

            if (giohang == null) {
                giohang = new Giohang();
                session.setAttribute("giohang", giohang);
            }
            TreeMap<Ctsanpham, Integer> list = giohang.getListSanpham();

        %>

        <header>
            <div class="container">
                <a href="<%=request.getContextPath()%>/index.jsp"><img src="Images/logo-D2C-02.png" alt=""></a>
            </div>
        </header>
        <main>
            <div class="container">
                <div class="container">
                    <div class="row setup-content" id="step-2">
                        <div class="container wrapper">
                            <div class="row cart-body">
                                <form class="form-horizontal" action="<%=request.getContextPath()%>/Checkout" method="POST">
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 col-md-push-6 col-sm-push-6">

                                        <!--REVIEW ORDER-->

                                        <div class="panel panel-info">
                                            <div class="panel-heading">
                                                Đơn đặt hàng
                                                <div class="pull-right"><small><a class="afix-1" href="shoppingcart.jsp">Cập nhật giỏ hàng</a></small></div>
                                            </div>
                                            <div class="panel-body">
                                                <%
                                                    for (Map.Entry<Ctsanpham, Integer> entry : list.entrySet()) {
                                                %>
                                                <div class="review-wrapper">
                                                    <div class="form-group">
                                                        <div class="col-sm-3 col-xs-3">
                                                            <img class="img-responsive" src="<%=spd.getHinhSanPham(entry.getKey().getSanpham().getMasp()).getHinhanh()%>" />
                                                        </div>
                                                        <div class="col-sm-6 col-xs-6">
                                                            <div class="col-xs-12"><%=entry.getKey().getSanpham().getTensp()%></div>
                                                            <div class="col-xs-12"><small>Số lượng:<span><%=entry.getValue()%></span></small></div>
                                                        </div>
                                                        <div class="col-sm-3 col-xs-3 text-right">
                                                            <%
                                                                double g = entry.getValue() * entry.getKey().getSanpham().getGia();
                                                                int dongia = (int) g;
                                                            %>
                                                            <h6><span>VND </span><%=dongia%></h6>
                                                        </div>
                                                    </div>
                                                </div>
                                               
                                                <%
                                                    }
                                                %>

                                                <div class="form-group">
                                                    <hr />
                                                </div>

                                                <div class="form-group">
                                                    <div class="col-xs-12">
                                                        <strong>Tạm tính</strong>
                                                        <%
                                                            int tam = (int) giohang.totalGiohang();
                                                        %>
                                                        <div class="pull-right"><span>VND <%=tam%></span></div>
                                                    </div>
                                                    <div class="col-xs-12">
                                                        <small>Phí ship</small>

                                                        <div class="pull-right"><span></span></div>

                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <hr />
                                                </div>

                                                <div class="form-group">
                                                    <div class="col-xs-12">
                                                        <strong>Tổng hóa đơn</strong>
                                                      
                                                        <div class="pull-right"><span>VND <%=tam%></span></div>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>

                                        <!--REVIEW ORDER END-->
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 col-md-pull-6 col-sm-pull-6">
                                        <!--SHIPPING METHOD-->
                                        <div class="panel panel-info">
                                            <%
                                                String name_err = "", email_err = "", add_err = "", phone_err = "", day_err = "";

                                                if (request.getAttribute("name_err") != null) {
                                                    name_err = (String) request.getAttribute("name_err");
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
                                            <div class="panel-heading">Địa chỉ giao hàng</div>
                                            <div class="panel-body">
                                                <div class="form-group">
                                                    <div class="col-md-12"><strong>Họ và tên</strong></div>
                                                    <div class="col-md-12">
                                                        <input type="text" name="name" class="form-control" placeholder="Nhập họ và tên">
                                                        <p style="color: red"><%=name_err%></p>
                                                    </div>

                                                </div>
                                                <div class="form-group">
                                                    <div class="col-md-12"><strong>Số điện thoại</strong></div>
                                                    <div class="col-md-12">
                                                        <input type="text" name="phone" class="form-control" placeholder="Nhập số điện thoại">
                                                        <p style="color: red"><%=phone_err%></p>
                                                    </div>

                                                </div>
                                                <div class="form-group">
                                                    <div class="col-md-12"><strong>Tỉnh/Thành phố</strong></div>
                                                    <div class="col-md-12">
                                                        <select id="" name="city" class="form-control">
                                                            <%
                                                                for (Khuvuc kv : hdDao.getDSKhuVuc()) {
                                                            %>

                                                            <option value="<%=kv.getMakv()%>"><%=kv.getTenkv()%></option>
                                                            <%
                                                                }
                                                            %>

                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="col-md-12"><strong>Địa chỉ giao hàng</strong></div>
                                                    <div class="col-md-12">
                                                        <input type="text" name="address" class="form-control" placeholder="Nhập địa chỉ">
                                                        <p style="color: red"><%=add_err%></p>
                                                    </div>

                                                </div>
                                                <div class="form-group">
                                                    <div class="col-md-12"><strong>Giới tính</strong></div>
                                                    <div class="col-md-12">
                                                        <select id="selectsex" name="sex" class="form-control">
                                                            <option value="1">Nam</option>
                                                            <option value="2">Nữ</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                        <!--SHIPPING METHOD END-->
                                        <!--CREDIT CART PAYMENT-->
                                        <div class="panel panel-info">
                                            <div class="panel-heading">Phương thức thanh toán</div>
                                            <div class="panel-body">
                                                <div class="form-group">
                                                    <div class="col-md-12">
                                                        <div class="input-group-prepend">
                                                            <div class="input-group-text">
                                                                <input type="radio" aria-label="Radio button for following text input" checked><span> Thanh toán khi nhận hàng</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <button type="submit" class="btn btn-primary btn-submit-fix">Xác nhận</button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <footer>
            <div class="container">
                <span>&copy; 2018 - D2C Store VN</span>
                <span><a href="">Help</a></span>
            </div>
        </footer>
    </body>
</html>
