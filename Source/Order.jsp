
<%@page import="pojo.Hoadon"%>
<%@page import="dao.HoaDonDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Login</title>
    <link rel="stylesheet" href="css/WS_login.css">
    <link rel="stylesheet" href="css/WS_wrapper.css">

</head>
<body>
    <jsp:include page="header.jsp"></jsp:include>
    <%
        HoaDonDao hdd = new HoaDonDao();
        Hoadon hd = hdd.getDonHangCuoi();
    %>

        <div class="container" style="margin-top: 80px">
            <ul class="breadcrumb">
                <li><a href="index.jsp">Home</a></li>
                <li class="active">Thanh toán</li>
            </ul>
            <h3>THANH TOÁN THÀNH CÔNG</h3>
            <fieldset style="margin-bottom: 50px;">
                
                <legend>Thông tin đơn hàng</legend>
                <p>Mã số đơn hàng: <%=hd.getSohd()%></p>
                
                <p>Ngày đặt hàng: <%=hd.getNgayhd()%></p>
                <p>Địa chỉ giao hàng: <%=hd.getDiachi() %></p>
                <a href="<%=request.getContextPath()%>/history.jsp">Chi tiết đơn hàng</a>
                
                <div class="form-group" style="padding-top: 20px;" >
                    <label class="col-md-4 control-label"></label>
                    <div class="col-md-8">
                        <a  href="productShow.jsp" class="btn btn-primary btn-success">Tiếp tục mua hàng</a>
                    </div>
                </div>

            </fieldset>

        </div>
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
