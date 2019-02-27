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
    </head>
    <body>
        <jsp:include page="mHeader.jsp"></jsp:include>
        <%
            HoaDonDao hdd = new HoaDonDao();
        %>
        <main style="min-height: 73vh">
            <div class="main-wrapper">
                <ul class="breadcrumb">
                    <li><a href="<%=request.getContextPath()%>/admin.jsp">Trang chủ</a></li>
                    <li><a href="">Quản lý đơn hàng</a></li>
                    <li class="active">Đơn hàng</li>

                    <div class="col-sm-4" style="float:right; margin-right: 5.5%;">
                        <div class="search-box">
                            <div class="input-group">
                                <input type="text" id="myInput" onkeyup="myFunction()" class="form-control" placeholder="Tìm kiếm">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-search"></span></span>
                            </div>
                        </div>
                    </div>
                    
                </ul>
                <h3>Đơn hàng</h3>
                <div class="container">
                    <div class="table-wrapper">
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
                                    for (Hoadon hd : hdd.getDSHoaDon()) {
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
        </main>
        <jsp:include page="mFooter.jsp"></jsp:include>
    </body>
    <script>
        function myFunction() {
            // Declare variables 
            var input, filter, table, tr, td, i, txtValue;
            input = document.getElementById("myInput");
            filter = input.value.toUpperCase();
            table = document.getElementById("myTable");
            tr = table.getElementsByTagName("tr");

            // Loop through all table rows, and hide those who don't match the search query
            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td")[1];
                if (td) {
                    txtValue = td.textContent || td.innerText;
                    if (txtValue.toUpperCase().indexOf(filter) > -1) {
                        tr[i].style.display = "";
                    } else {
                        tr[i].style.display = "none";
                    }
                }
            }
        }
    </script>
</html>