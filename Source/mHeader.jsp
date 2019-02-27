<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <body>
        <header>
            <div class="container">
                <a href="<%=request.getContextPath()%>/admin.jsp"><img
                        src="Images/logo-D2C-02.png" alt=""></a>
            </div>
            <nav class="navbar-wrapper">
                <div class="container-fluid">
                    <div class="navbar-header"></div>
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="<%=request.getContextPath()%>/admin.jsp">Trang chủ</a></li>
                        <li class="dropdown"><a class="dropdown-toggle"
                                                data-toggle="dropdown" href="mProduct.jsp">Quản lý sản phẩm <span
                                    class="glyphicon glyphicon-menu-down"></span></a>
                            <ul class="dropdown-menu">
                                <ul class="dropdown-child">
                                    <li><a href="<%=request.getContextPath()%>/addProduct1.jsp">Thêm sản phẩm</a></li>
                                    
                                    <li><a href="<%=request.getContextPath()%>/mProduct.jsp">Sửa sản phẩm</a></li>

                         
                                </ul>
                            </ul></li>
                        <li class="dropdown"><a class="dropdown-toggle"
                                                data-toggle="dropdown" href="#">Quản lý tài khoản <span
                                    class="glyphicon glyphicon-menu-down"></span></a>
                            <ul class="dropdown-menu">
                                <ul class="dropdown-child">
                                    <li><a href="<%=request.getContextPath()%>/mAccount.jsp">Tài khoản nhân viên</a></li>
                                    <li><a href="<%=request.getContextPath()%>/mCAccount.jsp">Tài khoản khách hàng</a></li>
                                </ul>
                            </ul></li>
                        <li class="dropdown"><a class="dropdown-toggle"
                                                data-toggle="dropdown" href="#">Quản lý đơn hàng <span
                                    class="glyphicon glyphicon-menu-down"></span></a>
                            <ul class="dropdown-menu">
                                <ul class="dropdown-child">
                                    <li><a href="<%=request.getContextPath()%>/mOrder.jsp">Tra cứu đơn hàng</a></li>

                                </ul>
                            </ul></li>
                        <li class="dropdown"><a class="dropdown-toggle"
                                                data-toggle="dropdown" href="#">Thống kê, báo cáo <span
                                    class="glyphicon glyphicon-menu-down"></span></a>
                            <ul class="dropdown-menu">
                                <ul class="dropdown-child">
                                    <li><a href="<%=request.getContextPath()%>/mReport.jsp">Báo cáo doanh thu</a></li>
                                    <li><a href="<%=request.getContextPath()%>/warehouse.jsp">Danh sách sản phẩm trong cửa hàng</a></li>

                                </ul>
                            </ul></li>
                        <li class="dropdown"><a class="dropdown-toggle"
                                                data-toggle="dropdown" href="#">Tài khoản <span
                                    class="glyphicon glyphicon-menu-down"></span></a>
                            <ul class="dropdown-menu">
                                <ul class="dropdown-child">
                                    <li><a href="<%=request.getContextPath()%>/Logout">Đăng xuất</a></li>

                                </ul>
                            </ul></li>
                    </ul>
                </div>
            </nav>
        </header>
    </body>
</html>