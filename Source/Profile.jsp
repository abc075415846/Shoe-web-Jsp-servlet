
<%@page import="pojo.Khachhang"%>
<%@page import="dao.KhachHangDao"%>
<%@page import="pojo.Taikhoan"%>
<%@page import="dao.TaiKhoanDao"%>
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
        TaiKhoanDao tkd = new TaiKhoanDao();
        Taikhoan tk = null;
        KhachHangDao khd = new KhachHangDao();
        Khachhang kh = null;
        String username = "";
        if (session.getAttribute("username") != null) {
            username = (String) session.getAttribute("username");
            tk = tkd.getTaiKhoanByUser(username);
            kh = khd.getKhachHangByUser(username);
        }
    %>

    <div class="container" style="margin-top: 80px">
        <ul class="breadcrumb">
            <li><a href="index.jsp">Home</a></li>
            <li class="active">Thông tin tài khoản</li>
        </ul>
        <h3>THÔNG TIN TÀI KHOẢN</h3>
        <fieldset style="margin-bottom: 50px;">
            <legend>Thông tin</legend>
            <form class="form-horizontal"  method="POST" action="upAc" style="">
                <div class="form-group">

                    <div class="col-md-4">
                        <label>Tên đăng nhập</label>
                        <input type="text" value="<%=tk.getUsername()%>"
                               class="form-control input-md" disabled="disabled"
                               style="text-transform: uppercase">
                    </div>
                </div>

                <div class="form-group">

                    <div class="col-md-4">
                        <label>Họ và tên</label>
                        <input name="name" type="text" value="<%=kh.getHoten()%>"
                               class="form-control input-md" required=""
                               style="text-transform: uppercase">
                    </div>
                </div>
                <div class="form-group">

                    <div class="col-md-4">
                        <label>Số điện thoại</label>
                        <input name="sdt" type="text" value=" <%=kh.getSdt()%>"
                               class="form-control input-md" required=""
                               style="text-transform: uppercase">
                    </div>
                </div>
                <div class="form-group">

                    <div class="col-md-4">
                        <label>Email</label>
                        <input  type="text" value=" <%=kh.getEmail()%>"
                               class="form-control input-md" required="" disabled="disabled"
                               style="text-transform: uppercase">
                    </div>
                </div>

                <div class="form-group">

                    <div class="col-md-4">
                        <label>Giới tính</label>
                        <select class="form-control" name="gioitinh">

                            <option value="1">Nam</option>
                            <option value="2">Nữ</option>
                        </select> 
                    </div>
                </div>

                <div class="form-group" style="padding-top: 20px;" >
                    
                    <div class="col-md-8">
                        <button class="btn btn-primary btn-success" type="submit">Cập nhật thông tin</button>
                    </div>
                </div>
            </form>

        </fieldset>

    </div>
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
