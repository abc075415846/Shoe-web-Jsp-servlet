<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/MWS_main.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <body>
        <header>
         <div class="container">
            <a href="Website_Shopping_2.0.html"><img src="Images/logo-D2C-02.png" alt=""></a>
            <div class="stepwizard">
                <div class="stepwizard-row setup-panel">
                    <div class="stepwizard-step">
                        <a href="#step-1" type="button" class="btn btn-primary btn-circle">1</a>
                        <p>Information</p>
                    </div>
                    <div class="stepwizard-step">
                        <a href="#step-2" type="button" class="btn btn-default btn-circle" disabled="disabled">2</a>
                        <p>Images</p>
                    </div>
                    <div class="stepwizard-step">

                        <a href="#step-3" type="button" class="btn btn-default btn-circle" disabled="disabled">3</a>
                        <p>Finish</p>
                    </div>
                </div>
            </div>
        </div>
        <nav class="navbar-wrapper">
                <div class="container-fluid">
                    <div class="navbar-header">

                    </div>
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="#">Trang chủ</a></li>
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">Quản lý sản phẩm <span class="glyphicon glyphicon-menu-down"></span></a>
                            <ul class="dropdown-menu">
                                <ul class="dropdown-child"> 
                                    <li><a href="<%=request.getContextPath()%>/addProduct.jsp">Thêm sản phẩm</a></li>
                                    <li><a href="<%=request.getContextPath()%>/mProduct.jsp">Xóa sản phẩm</a></li>
                                    <li><a href="<%=request.getContextPath()%>/mProduct.jsp">Sửa sản phẩm</a></li>
                                    <li><a href="<%=request.getContextPath()%>/mProduct.jsp">Tra cứu sản phẩm</a></li>
                                    <li><a href="">Thêm loại sản phẩm</a></li>               
                                </ul>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">Quản lý tài khoản <span class="glyphicon glyphicon-menu-down"></span></a>
                            <ul class="dropdown-menu">
                                <ul class="dropdown-child">
                                    <li><a href="<%=request.getContextPath()%>/mAccount.jsp">Tra cứu tài khoản</a></li>
                                </ul>
                            </ul>
                        </li>
                        <li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">Quản lý đơn hàng <span
							class="glyphicon glyphicon-menu-down"></span></a>
						<ul class="dropdown-menu">
							<ul class="dropdown-child">
								<li><a href="<%=request.getContextPath()%>/mOrder.jsp">Tra cứu đơn hàng</a></li>
								<li><a href="">Xóa đơn hàng</a></li>
							</ul>
						</ul></li>
                    </ul>
                </div>
            </nav>
        </header>
    </body>
</html>
