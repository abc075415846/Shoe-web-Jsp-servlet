<%@page import="pojo.Nhanvien"%>
<%@page import="dao.NhanVienDao"%>
<%@page import="pojo.Taikhoan"%>
<%@page import="dao.TaiKhoanDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
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
            NhanVienDao nvd = new NhanVienDao();
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
                <div class="container" style="min-height: 55vh">
                    <div class="table-wrapper">
                        <div class="table-title"></div>
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>Mã tài khoản</th>
                                    <th>Tên đăng nhập</th>

                                    <th>Họ tên</th>
                                    <th>Giới tính</th>
                                    <th>Ngày sinh</th>
                                    <th>Địa chỉ</th>
                                    <th style="width: 11%;">Số điện thoại</th>
                                    <th>Chức vụ</th>
                                    <th>Chỉnh sửa</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    for (Taikhoan tk : tkd.getDSTaiKhoanEmp()) {
                                        Nhanvien nv = nvd.getNhanVien(tk.getMatk());
                                %>

                                <tr>
                                    <td><%=tk.getMatk()%></td>
                                    <td><%=tk.getUsername()%></td>
                                    <td><%=nv.getHoten()%></td>
                                    <td><%=nv.getGioitinh()%></td>
                                    <td><%=nv.getNgaysinh()%></td>
                                    <td><%=nv.getDiachi()%></td>
                                    <td><%=nv.getSdt()%></td>
                                    <td><%=tkd.getLoaiTaiKhoan(tk.getMatk()).getTenltk()%> </td>
                                    <td></td>

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