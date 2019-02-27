<%-- 
    Document   : mCAccount
    Created on : Dec 23, 2018, 9:57:53 PM
    Author     : ledan
--%>

<%@page import="dao.KhachHangDao"%>
<%@page import="pojo.Khachhang"%>
<%@page import="pojo.Nhanvien"%>
<%@page import="pojo.Taikhoan"%>
<%@page import="dao.NhanVienDao"%>
<%@page import="dao.TaiKhoanDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Website D2C</title>
        <link rel="stylesheet" href="css/MWS_main.css">
        <link rel="stylesheet" href="css/MWS_user.css">
    </head>
    <body>
        <jsp:include page="mHeader.jsp"></jsp:include>
        <%
            TaiKhoanDao tkd = new TaiKhoanDao();
            KhachHangDao khd = new KhachHangDao();
        %>
        <main>
            <div class="main-wrapper">
                <ul class="breadcrumb">
                    <li><a href="<%=request.getContextPath()%>/admin.jsp">Trang chủ</a></li>
                    <li class="active">Tài khoản</li>
                    <div class="col-sm-6">
                        <div class="search-box">
                            <div class="input-group">
                                <input type="text" id="search" class="form-control"
                                       placeholder="Tìm kiếm"><span class="input-group-addon"><span
                                        class="glyphicon glyphicon-search"></span></span>
                            </div>
                        </div>
                    </div>
                </ul>
                <h3>Tài khoản</h3>
                <div class="container">
                    <div class="table-wrapper">
                        
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>Mã khách hàng</th>
                                    <th style="width: 8%;">Tên đăng nhập</th>
                                    <th>Họ tên</th>
                                    <th style="width: 5%;">Giới tính</th>
                                    <th style="width: 10%;">Ngày sinh</th>
                                    <th>Địa chỉ</th>
                                    <th style="width: 11%;">Số điện thoại</th>
                                    <th>Email</th>
                                    <th>Ngày đăng ký</th>
                                    <th style="width: 5%;">Lịch sử</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    for (Khachhang kh : khd.getKhachhang()) {
                                        Taikhoan tk = tkd.getUsernameByMaKH(kh.getMakh());
                                %>

                                <tr>
                                    <td><%=kh.getMakh()%></td>
                                    <td><%=tk.getUsername()%></td>
                                    <td><%=kh.getHoten()%></td>
                                    <td><%=kh.getGioitinh()%></td>
                                    <td><%=kh.getNgaysinh()%></td>
                                    <td><%=kh.getDiachi()%></td>
                                    <td><%=kh.getSdt()%></td>
                                    <td><%=kh.getEmail()%></td>
                                    <td><%=kh.getNgaydk()%></td>

                            <input type="hidden" value="<%=kh.getMakh()%>" name="makh">
                            <td>
                                <a href="mHistory.jsp?makh=<%=kh.getMakh()%>" data-toggle="tooltip"><span class="glyphicon glyphicon-search"></span></a>
                            </td>
                            </tr>
                            <%
                                }
                            %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </main>
        <jsp:include page="mFooter.jsp"></jsp:include>
    </body>
</html>
