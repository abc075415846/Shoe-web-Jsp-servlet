<%@page import="dao.SanPhamDao"%>
<%@page import="pojo.Sanpham"%>
<%@page import="dao.CTHDDao"%>
<%@page import="pojo.Cthd"%>
<%@page import="pojo.Hoadon"%>
<%@page import="dao.HoaDonDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Website D2C</title>
        <link rel="stylesheet" href="css/MWS_main.css">
        <link rel="stylesheet" href="css/MWS_update.css">
        <style>
            h4 {
                text-transform: uppercase;

            }

        </style>

        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
        <script type="text/javascript">
            $("#btnPrint").live("click", function () {
                var divContents = $("#dvContainer").html();
                var printWindow = window.open('', '', 'height=400,width=600');
                printWindow.document.write('<html><head><title>Hóa đơn mua hàng</title>');
                printWindow.document.write('</head><body >');
                printWindow.document.write(divContents);
                printWindow.document.write('</body></html>');
                printWindow.document.close();
                printWindow.print();
            });
        </script>
    </head>
    <body>
        <jsp:include page="mHeader.jsp"></jsp:include>
        <%
            HoaDonDao hdd = new HoaDonDao();
            CTHDDao cthdd = new CTHDDao();
            SanPhamDao spd = new SanPhamDao();
            String sohd = request.getParameter("sohd");
        %>
        <main style="min-height: 76vh">
            <div class="main-wrapper">
                <ul class="breadcrumb">
                    <li><a href="<%=request.getContextPath()%>/admin.jsp">Trang chủ</a></li>
                    <li><a href="">Quản lý đơn hàng</a></li>
                    <li class="active">CHI TIẾT ĐƠN HÀNG</li>

                </ul>
                <h3>Đơn hàng <%=sohd%>
                    <span class="glyphicon glyphicon-print" id="btnPrint"></span>

                </h3>
                <div class="container">

                    <div class="table-wrapper">
                        <form id="form1">
                            <div id="dvContainer">

                                <h4 style=" margin-top: 20px;">Thông tin khách hàng</h4>
                                <%
                                    Hoadon hd = hdd.getHoaDon(Integer.parseInt(sohd));
                                %>
                                <p>Họ và tên: <%=hd.getTenkhach()%></p>
                                <%
                                    if (hd.getGioitinh().equals("2")) {
                                %>
                                <p>Giới tính: Nữ</p>
                                <%
                                } else {
                                %>
                                <p>Giới tính: Nam</p>
                                <%
                                    }
                                %>
                                <p>Số điện thoại: <%=hd.getSdt()%></p>

                                <p>Tỉnh/ Thành phố: </p>
                                <p>Địa chỉ giao hàng: <%=hd.getDiachi()%></p>

                                <h4 style="margin: 50px 0 20px 0">Danh sách sản phẩm</h4>
                                <table class="table table-striped">

                                    <thead>
                                        <tr>
                                            <th>Mã sản phẩm</th>
                                            <th>Tên Sản phẩm</th>
                                            <th>Màu sắc</th>
                                            <th>Kích cỡ</th>
                                            <th>Số lượng</th>
                                            <th>Đơn giá</th>

                                        </tr>


                                        <%
                                            Sanpham spct = null;
                                            for (Cthd cthd : cthdd.getDSChiTietHoaDon(Integer.parseInt(sohd))) {
                                        %>

                                        <tr>                               
                                            <td><%=cthd.getCtsanpham().getSanpham().getMasp()%></td>
                                            <td><%=cthd.getCtsanpham().getSanpham().getTensp()%></td>
                                            <td><%=cthd.getCtsanpham().getMausac().getTenmau()%></td>
                                            <td><%=cthd.getCtsanpham().getKichco().getKichco()%></td>
                                            <td><%=cthd.getSoluong()%></td>
                                            <%
                                                int g = (int) cthd.getGiaban();
                                            %>
                                            <td><%=g%></td>
                                        </tr> 
                                        <%
                                            }

                                        %>
                                    </thead>
                                </table>
                                <%                                int tong = (int) hd.getTrigia();
                                %>
                                <h4 style="float: right; margin-top: 30px">Tổng hóa đơn:  <%=tong%> VND</h4>
                                <p>Ngày đặt hàng: <%=hd.getNgayhd()%></p>
                            </div>
                            
                        </form>
                        <div class="form-group" style="padding-top: 20px; float: left; margin-top:20px;  " >
                            <%
                                if (hdd.getHoaDon(hd.getSohd()).getTrangthai().equals("1")) {
                            %>
                            <div class="col-md-6">
                                <a  href="upOrder?command=Thanhtoan&sohd=<%=hd.getSohd()%>" class="btn btn-primary btn-success">Đã thanh toán</a>
                            </div>
                            <div class="col-md-6">
                                <a  href="upOrder?command=Huydon&sohd=<%=hd.getSohd()%>" class="btn btn-primary btn-success">Hủy đơn hàng</a>
                            </div>
                            <%
                                }
                            %>

                        </div>
<!--<input type="button" value="Print Div Contents" id="btnPrint" />-->

                    </div>
                </div>
            </div>
        </main>
        <jsp:include page="mFooter.jsp"></jsp:include>
    </body>
</html>