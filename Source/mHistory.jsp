<%@page import="pojo.Cthd"%>
<%@page import="dao.CTHDDao"%>
<%@page import="dao.KhachHangDao"%>
<%@page import="dao.TaiKhoanDao"%>
<%@page import="pojo.Khachhang"%>
<%@page import="pojo.Hoadon"%>
<%@page import="dao.HoaDonDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" href="css/MWS_main.css">
        <link rel="stylesheet" href="css/MWS_update.css">
    </head>
    <body>
        <jsp:include page="mHeader.jsp"></jsp:include>
        <%
            HoaDonDao hdd = new HoaDonDao();
            Khachhang kh = null;
            TaiKhoanDao tkd = new TaiKhoanDao();
            KhachHangDao khd = new KhachHangDao();
            CTHDDao cthdd = new CTHDDao();
            String makh = "";
            if(request.getParameter("makh") != null){
                makh = (String) request.getParameter("makh");
            }

        %>
        <div class="main-wrapper" style="background-color: #f5f5f5">
            <ul class="breadcrumb">
                <li><a href="<%=request.getContextPath()%>/admin.jsp">Trang chủ</a></li>
                <li><a href="">Tài khoản</a></li>
                <li class="active">Lịch sử giao dịch</li>

            </ul>
            <h3>Lịch sử mua hàng</h3>
            <div class="container">
                    <div class="table-wrapper" style="min-height: 55vh">
                        <div class="table-title">
                        </div>
                        <table class="table table-striped" id="myTable">

                            <thead>
                                <tr>
                                    <th>Mã đơn hàng</th>
                                    <th>Tên khách hàng</th>
                                    <th style="width: 11%;">Số điện thoại</th>
                                    <th>Ngày đặt hàng</th>
                                    <th>Giới tính</th>
                                    <th>Địa chỉ</th>
                                    <th>Tổng hóa đơn</th>
                                    <th>Trạng thái</th>
                                    <th>Chi tiết</th>
                                </tr>
                                <%
                                    for (Hoadon hd : hdd.getDSHoaDonByMaKh(Integer.parseInt(makh))) {
                                %>

                                <tr>
                                    <td><%=hd.getSohd()%></td>
                                    <td><%=hd.getTenkhach()%> </td>
                                    <td><%=hd.getSdt()%> </td>
                                    <td><%=hd.getNgayhd()%></td>
                                    <%
                                        if (hd.getGioitinh().equals("1")) {
                                    %>
                                    <td>Nam</td>
                                    <%
                                    } else {
                                    %>
                                    <td>Nữ</td>
                                    <%
                                        }
                                    %>
                                    <td><%=hd.getDiachi()%> </td>
                                    <%
                                        int tghd = (int) hd.getTrigia();
                                    %>
                                    <td style="text-align: right"><%=tghd%></td>
                                    <%
                                        if (hd.getTrangthai().equals("1")) {
                                    %>
                                    <td style="text-align: right">Đang xử lý</td>
                                    <%
                                    } else if (hd.getTrangthai().equals("0")) {
                                    %>
                                    <td style="text-align: right">Đã thanh toán</td>
                                    <%
                                    } else {
                                    %>
                                    <td style="text-align: right">Đã hủy</td>
                                    <%
                                        }
                                    %>
                                    <td>
                                        <a href="detailOrder.jsp?sohd=<%=hd.getSohd()%>" data-toggle="tooltip"><span class="glyphicon glyphicon-search"></span></a>

                                    </td>
                                </tr>  
                                <%
                                    }
                                %>
                            </thead>
                        </table>
                    </div>
              </div>
        </div>
        <jsp:include page="mFooter.jsp"></jsp:include>
    </body>
</html>