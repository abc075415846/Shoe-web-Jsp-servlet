<%@page import="pojo.DSDoanhthu"%>
<%@page import="pojo.DSBanRa"%>
<%@page import="dao.SanPhamDao"%>
<%@page import="pojo.DTsanpham"%>
<%@page import="java.util.List"%>
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
                printWindow.document.write('<html><head><title>Doanh thu tháng</title>');
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
            SanPhamDao spd = new SanPhamDao();
        %>
        <main style="min-height: 76vh">
            <div class="main-wrapper">
                <ul class="breadcrumb">
                    <li><a href="<%=request.getContextPath()%>/admin.jsp">Trang chủ</a></li>
                    <li><a href="">Thống kê báo cáo</a></li>
                    <li class="active">BẢNG THỐNG KÊ</li>

                </ul>
                <h3>bảng thống kê doanh thu
                    <button style="float: right">
                        <span class="glyphicon glyphicon-print" id="btnPrint"></span>
                    </button>
                </h3>

                <div class="container" style="min-height: 55vh;">
                    <form class="form-horizontal" method="post" action="Report" id="form1">

                        <fieldset>
                            <div class="table-wrapper"> 
                                <h5>Thời điểm</h5>

                                <div class="form-group">
                                    <div class="col-md-2">
                                        <select class="form-control" name="year">
                                            <option value="0">Năm</option>
                                            <option value="2017">2017</option>
                                            <option value="2018">2018</option>
                                            <option value="2019">2019</option>
                                        </select>

                                    </div>

                                    <div class="col-md-2">
                                        <select class="form-control" name="month">
                                            <option value="0">Tháng</option>
                                            <%
                                                for (int i = 1; i < 13; i++) {
                                            %>
                                            <option value="<%=i%>"><%=i%></option>
                                            <%
                                                }
                                            %>
                                        </select>

                                    </div>

                                    <div class="col-md-2">
                                        <button class="btn btn-primary btn-success" type="submit" >Xác nhận</button>
                                    </div>
                                </div>
                            </div>
                        </fieldset>
                    </form>
                    <div id="dvContainer">
                        <div class="form-report">

                            <h4 style="margin: 50px 0 20px 0">Danh sách sản phẩm bán ra</h4>

                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>Mã sản phẩm</th>
                                        <th>Tên Sản phẩm</th>
                                        <th>số lượng</th>
                                        <th>Giá bán</th>
                                        <th>Ngày bán</th>
                                    </tr>
                                    <%
                                        List<DSBanRa> list = null;
                                        if (request.getAttribute("listsp") != null) {
                                            list = (List<DSBanRa>) request.getAttribute("listsp");
                                            for (DSBanRa sp : list) {
                                    %>
                                    <tr>
                                        <td><%=sp.getSanpham().getMasp()%></td>
                                        <td><%=sp.getSanpham().getTensp()%></td>
                                        <td><%=sp.getSoluongban()%></td>
                                        <%
                                            int gban = (int) sp.getSanpham().getGia();
                                        %>
                                        <td><%=gban%></td>
                                        <td><%=sp.getNgayban()%></td>
                                    </tr> 
                                    <%
                                            }
                                        }
                                    %>
                                </thead>
                            </table>
                            <h4 style="margin: 50px 0 20px 0">Sản phẩm doanh thu cao nhất</h4>

                            <table class="table table-striped">

                                <thead>
                                    <tr>
                                        <th>Mã sản phẩm</th>
                                        <th>Tên Sản phẩm</th>
                                        <th>Tổng số lượng</th>
                                        <th>Giá bán</th>
                                        <th>Tổng thu</th>

                                    </tr>
                                    <%
                                        DSDoanhthu dtmax = null;
                                        if (request.getAttribute("spmax") != null) {
                                            dtmax = (DSDoanhthu) request.getAttribute("spmax");
                                            int dtsp = (int) dtmax.getDoanhthu();
                                            Sanpham sp = spd.getSanpham(dtmax.getMasp());
                                            int gmax = (int) sp.getGia();
                                    %>
                                    <tr>
                                        <td><%=dtmax.getMasp()%></td>
                                        <td><%=sp.getTensp()%></td>
                                        <td><%=dtmax.getSoluongban()%> </td>
                                        <td><%=gmax%></td>
                                        <td><%=dtsp%></td>
                                    </tr> 
                                    <%
                                        }
                                    %>
                                </thead>
                            </table>

                            <%
                                String s = "";
                                if (request.getAttribute("tongdoanhthu") != null) {
                                    s = (String) request.getAttribute("tongdoanhthu");
                                    int tong = Integer.parseInt(s);
                            %>
                            <h3 style="margin-top: 40px;">Tổng doanh thu:<%=tong%></h3>
                            <%
                                }
                            %>
                            <hr/>
                        </div>                    
                    </div>
                </div>
            </div>
        </div>
    </main>
    <jsp:include page="mFooter.jsp"></jsp:include>
</body>
</html>