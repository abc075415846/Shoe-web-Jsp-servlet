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
        <link rel="stylesheet" href="css/WS_login.css">
        <link rel="stylesheet" href="css/WS_wrapper.css">
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
        <%
            HoaDonDao hdd = new HoaDonDao();
            Khachhang kh = null;
            TaiKhoanDao tkd = new TaiKhoanDao();
            KhachHangDao khd = new KhachHangDao();
            CTHDDao cthdd = new CTHDDao();

            String username = "";
            if (session.getAttribute("username") != null) {
                username = (String) session.getAttribute("username");
                kh = khd.getKhachHangByUser(username);

            }

        %>
        <div class="container" style="margin-top: 80px">
            <ul class="breadcrumb">
                <li><a href="index.jsp">Home</a></li>
                <li class="active">Lịch sử giao dịch</li>
            </ul>
            <h3>Đơn hàng</h3>
            <div class="container">
                <div class="table-wrapper" style="min-height: 40vh">
                    <div class="table-title">
                    </div>
                    <table class="table table-striped" id="myTable">

                        <thead>
                            <tr>
                                <th>Mã đơn hàng</th>                         
                                <th>Số lượng sản phẩm</th>
                                <th>Ngày đặt hàng</th>                     
                                <th>Tổng hóa đơn</th>
                                <th>Trạng thái</th>
                                <th>Chi tiết</th>

                            </tr>
                            <% 
                                
                                for(Hoadon hd : hdd.getDSHoaDonByMaKh(kh.getMakh())){;

                     
                            %> 
                            <tr>
                                <td><%=hd.getSohd()%></td>
                                <%
                                    Long d = cthdd.getSLSanPham(hd.getSohd());
                                %>
                                <td><%=d%></td>
                                <td><%=hd.getNgayhd()%> </td>
                                <%
                                    int tg = (int) hd.getTrigia();
                                %>
                                <td><%=tg%></td>

                                <%
                                    if (hd.getTrangthai().equals("1")) {
                                %>
                                <td >Đang xử lý</td>
                                <%
                                } else if (hd.getTrangthai().equals("0")) {
                                %>
                                <td >Đã thanh toán</td>
                                <%
                                } else {
                                %>
                                <td>Đã hủy</td>
                                <%
                                    }
                                %>
                                <td>
                                    <a href="detailOrder1.jsp?sohd=<%=hd.getSohd()%>" data-toggle="tooltip"><span class="glyphicon glyphicon-search"></span></a>

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
    </div>
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>