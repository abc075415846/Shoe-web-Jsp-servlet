
<%@page import="dao.SanPhamDao"%>
<%@page import="java.util.List"%>
<%@page import="pojo.Sanpham"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Website D2C</title>
        <link rel="stylesheet" href="css/MWS_main.css">
        <link rel="stylesheet" href="css/MWS_admin.css">
    </head>
    <body>
        <%
            SanPhamDao spDao = new SanPhamDao();
            String page1 = "", page2 = "";
            int start = 0, end;
            List<Sanpham> ds = spDao.getDSSanPham();

            if (ds.size() >= 11) {
                end = 10;
            } else {
                end = ds.size();
            }
            if (request.getParameter("start") != null) {
                page1 = request.getParameter("start");
                start = Integer.parseInt(page1);
            }
            if (request.getParameter("end") != null) {
                page2 = request.getParameter("end");
                end = Integer.parseInt(page2);
            }
            List<Sanpham> list = spDao.getSanphamByPagination(ds, start, end);

        %>
        <jsp:include page="mHeader.jsp"></jsp:include>
            <main>
                <div class="main-wrapper">
                    <ul class="breadcrumb">
                        <li><a href="<%=request.getContextPath()%>/admin.jsp">Trang chủ</a></li>
                    <li class="active">Sản Phẩm</li>
                    <div class="col-sm-2">
                        <div class="search-box">
                            <form class="navbar-form navbar-left" action="<%=request.getContextPath()%>/aSearch" method="POST">
                                <div class="input-group">
                                    <input type="text" class="form-control" placeholder="Tìm kiếm" name="search">
                                    <div class="input-group-btn">
                                        <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
                                    </div>
                                </div>
                            </form>

                        </div>
                    </div>
                </ul>
                <h3>SẢN PHẨM</h3>
                <div class="container">
                    <div class="row">
                        <%
                            for (Sanpham sp : list) {
                        %>

                        <!-------------product----------------->
                        <div class="col-md-3 col-sm-6" style ="margin-bottom: 20px">
                            <div class="product-grid6">
                                <div class="product-image6">
                                    <a href="dProduct1.jsp?masp=<%=sp.getMasp()%>"><img src="<%=spDao.getHinhSanPham(sp.getMasp()).getHinhanh()%>" alt=""></a>
                                </div>
                                <div class="product-content">
                                    <h3 class="title">
                                        <a href="#"><%=sp.getTensp()%></a>
                                    </h3>
                                    <div class="price"><%=sp.getGia()%></div>
                                    <div class="price price-b">

                                    </div>
                                </div>
                            </div>
                        </div>

                        <%
                            }
                        %>

                        <!-------------product----------------->
                    </div>
                    <!--pagination------------------------------------->
                    <ul class="pagination">
                        <%
                            int a, b;
                            int s = ds.size() / 10;
                            if (s * 10 < ds.size()) {
                                s += 1;
                            }
                            for (int i = 1; i <= s; i++) {
                                a = (i - 1) * 10;
                                b = i * 10;
                                if (b > ds.size()) {
                                    b = ds.size();
                                }
                        %>
                        <li><a class="active" href="mProduct.jsp?start=<%=a%>&end=<%=b%>"><%=i%></a></li>
                            <%
                                }
                            %>

                    </ul>
                </div>
            </div>
        </main>
        <jsp:include page="mFooter.jsp"></jsp:include>
    </body>
</html>