<%@page import="dao.SanPhamDao"%>
<%@page import="pojo.Sanpham"%>
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
            SanPhamDao spd = new SanPhamDao();
        %>
        <main style="min-height: 73vh">
            <div class="main-wrapper">
                <ul class="breadcrumb">
                    <li><a href="<%=request.getContextPath()%>/admin.jsp">Trang chủ</a></li>
                    <li><a href="">Quản lý sản phẩm</a></li>
                    <li class="active">Danh sách sản phẩm</li>

                    <div class="col-sm-4" style="float:right; margin-right: 5.5%;">
                        <div class="search-box">
                            <div class="input-group">
                                <input type="text" id="myInput" onkeyup="myFunction()" class="form-control" placeholder="Tìm kiếm">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-search"></span></span>
                            </div>
                        </div>
                    </div>
                    
                </ul>
                <h3>Danh sách sản phẩm</h3>
                <div class="container">
                    <div class="table-wrapper">
                        <div class="table-title">
                        </div>
                        <table class="table table-striped" id="myTable">

                            <thead>
                                <tr>
                                    <th>Mã sản phẩm</th>
                                    <th>Tên sản phẩm</th>
                                    <th style="width: 11%;">Giá sản phẩm</th>
                                    <th>Thương hiệu</th>
                                    <th>Loại sản phẩm</th>
                                    <th>Xuất sứ</th>                                
                                    <th>Chi tiết</th>
                                </tr>
                                <%
                                    for (Sanpham sp : spd.getDSSanPham()) {
                                        
                                %>
                                    
                                <tr>
                                    <td><%=sp.getMasp()%></td>
                                    <td><%=sp.getTensp()%></td>
                                    <%
                                        int g = (int) sp.getGia();
                                    %>
                                    <td><%=g%></td>
                                    <td><%=sp.getLoaisp().getThuonghieu().getTenth()%></td>
                                    <td><%=sp.getLoaisp().getCategory().getTencateg()%></td>
                                    <td><%=sp.getXuatsu().getTenxs()%></td>
                                    <td>
                                        <a href="detailProduct1.jsp?masp=<%=sp.getMasp()%>" data-toggle="tooltip"><span class="glyphicon glyphicon-search"></span></a>

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