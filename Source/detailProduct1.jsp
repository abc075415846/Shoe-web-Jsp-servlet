<%@page import="dao.CTSanPhamDao"%>
<%@page import="pojo.Ctsanpham"%>
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
            CTSanPhamDao ctspd = new CTSanPhamDao();
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
                                    <th style="width: 11%;">Màu sắc</th>
                                    <th>Kích cỡ</th>
                                    <th>Số lượng tồn kho</th>                                 
                                </tr>
                                <%
                                    if(request.getParameter("masp") != null){
                                      String masp = (String) request.getParameter("masp");
                                      for (Ctsanpham sp : ctspd.getDSCtsanpham(Integer.parseInt(masp))) {
                                        
                                %>
                                    
                                <tr>
                                    <td><%=sp.getSanpham().getMasp()%></td>
                                    <td><%=sp.getSanpham().getTensp()%></td>                                 
                                    <td><%=sp.getMausac().getTenmau()%></td>
                                    <td><%=sp.getKichco().getKichco()%></td>
                                    <td><%=sp.getSoluong()%></td>
                                 
                                </tr>  
                                <%
                                    }}
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