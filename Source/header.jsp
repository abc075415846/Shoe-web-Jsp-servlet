<%@page import="pojo.Ctsanpham"%>
<%@page import="pojo.SPMS"%>
<%@page import="pojo.Loaisp"%>
<%@page import="pojo.Thuonghieu"%>
<%@page import="dao.CategoryDao"%>
<%@page import="pojo.Category"%>
<%@page import="java.util.TreeMap"%>
<%@page import="pojo.Sanpham"%>
<%@page import="pojo.Giohang"%>
<%@page import="dao.SanPhamDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>header</title>
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        </head>
        <body>
            <%
                Giohang giohang = (Giohang) session.getAttribute("giohang");
                if (giohang == null) {
                    giohang = new Giohang();
                    session.setAttribute("giohang", giohang);
                }
                TreeMap<Ctsanpham, Integer> list = giohang.getListSanpham();
                CategoryDao categDao = new CategoryDao();
            %>
            <div class="header-fix">
                <div class="logo"><a href="index.jsp"><img src="Images/logo-D2C-01.png" alt=""></a></div>
                <div class="header-top">
                    <ul>
                        <%if (session.getAttribute("username") != null) {
                        %> 
                        <li class="dropdown-account"> <a class="dropdown-toggle" data-toggle="dropdown" href="#">Hello <%=session.getAttribute("username")%> <span class="glyphicon glyphicon-menu-down"></span></a>
                            <ul class="dropdown-menu">
                                <ul class="dropdown-child">
                                    <li style="padding-left: 10px"><a href="Profile.jsp">Thông tin tài khoản</a></li>
                                    <li><a href="<%=request.getContextPath()%>/history.jsp">Lịch sử mua hàng</a></li>
                                    <li><a href="<%=request.getContextPath()%>/Logout">Đăng xuất</a></li>

                                </ul>
                            </ul>
                        </li>
                        <%
                        } else {
                        %>
                        <li><a href="login.jsp"><span>Join/Login</span>
                                <i class="fas fa-user"></i></a></li>
                                <%
                                    }
                                %>
                        <i class="fas fa-user"></i></a></li>
                        <li><a href="#">Help</a></li>
                        <li><a href="#">About Us</a></li>
                        <li class="top-sale"><a href="#">Sale</a></li>
                        <li><a href="<%=request.getContextPath()%>/shoppingcart.jsp" id="cart"><i class="fas fa-shopping-cart"></i>
                                <span><%=giohang.countGiohang()%></span></a>
                        </li>
                    </ul>
                </div>
                <nav class="navbar navbar-inverse">
                    <div class="container-fluid">
                        <div class="navbar-header">

                        </div>
                        <ul class="nav navbar-nav">
                            <li class="active"><a href="#">Home</a></li>
                                <%
                                    for (Thuonghieu th : categDao.getDSBrand()) {
                                %>
                            <li class="dropdown">     
                                <a class="dropdown-toggle" data-toggle="dropdown" href="#"><%=th.getTenth()%></a>
                                <ul class="dropdown-menu">

                                    <ul class="dropdown-child">
                                        <%
                                            for (Category categ : categDao.getDSCategory()) {
                                        %> 
                                        <li>
                                            <h5><%=categ.getTencateg()%></h5>
                                            <%
                                                for (Loaisp loaisp : categDao.getDSType(th.getMath(), categ.getMacateg())) {
                                            %>
                                            <a href="productShow.jsp?malsp=<%=loaisp.getMalsp()%>"><%=loaisp.getTenlsp()%></a>
                                            <%
                                                }
                                            %>
                                        </li>
                                        <%
                                            }
                                        %>
                                    </ul>
                                </ul>
                            </li>   
                            <%
                                }
                            %>
                            <!--------search btn-------------------------->
                            <form class="navbar-form navbar-left" action="<%=request.getContextPath()%>/Search" method="POST">
                                <div class="input-group">
                                    <input type="text" class="form-control" placeholder="Tìm kiếm" name="search">
                                    <div class="input-group-btn">
                                        <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
                                    </div>
                                </div>
                            </form>
                        </ul>
                    </div>
                </nav>
            </div>
        </body>
    </html>
