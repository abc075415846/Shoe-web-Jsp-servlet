<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Web Shop</title>
<link rel="stylesheet" href="css/style_test_wrap.css">
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="banner.jsp"></jsp:include>
	<div class="main-wrapper-links">
		<div class="box-link box-1">
			<a href="#"></a>
			<div class="box-content">
				<h3>NIKE</h3>
				<a href="productShow.jsp">
					<p>SHOP NOW</p> <i class="fas fa-arrow-right"></i>
				</a>
			</div>
		</div>
		<div class="box-link box-2">
			<div class="box-content box-content-2">
				<h3>VANS</h3>
				<a href="productShow.jsp">
					<p>SHOP NOW</p> <i class="fas fa-arrow-right"></i>
				</a>
			</div>
		</div>
	</div>
	<!--banner main---------------------------------->
	<div class="main-banner">
		<div class="main-banner-left"></div>
		<div class="main-banner-right"></div>
	</div>
	<div class="main-bottom"></div>
	<jsp:include page="content.jsp"></jsp:include>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
