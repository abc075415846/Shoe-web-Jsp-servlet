<%@page import="pojo.SPMS"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="pojo.Giohang"%>
<%@page import="pojo.Category"%>
<%@page import="dao.CategoryDao"%>
<%@page import="pojo.Sanpham"%>
<%@page import="dao.SanPhamDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Website D2C</title>
        <link rel="stylesheet" href="css/WS_wrapper.css">
        <link rel="stylesheet" href="css/WS_shoes.css">
    </head>
    <body>
        <%
            CategoryDao cDao = new CategoryDao();
            SanPhamDao spDao = new SanPhamDao();
            String macateg = request.getParameter("macateg");
            String math = request.getParameter("math");
            String gia = request.getParameter("gia");

            Giohang giohang = (Giohang) session.getAttribute("giohang");
            if (giohang == null) {
                giohang = new Giohang();
                session.setAttribute("giohang", giohang);
            }
        %>

        <%  String malsp = "";
            List<SPMS> listT = null;

            if (request.getParameter("malsp") != null) {
                malsp = request.getParameter("malsp");
                listT = spDao.getDSSanPhamByType1(Integer.parseInt(malsp));
            }
        %>
        <%
            String page1 = "", page2 = "";
            int start = 0, end;
            List<SPMS> ds = null;
            List<SPMS> listString = null;
            if (request.getAttribute("listString") != null) {
                listString = (List<SPMS>) request.getAttribute("listString");
            }
            if (listString != null) {
                ds = listString;
            } else if (listT != null) {
                ds = listT;
            } else if (math == null && macateg == null && gia == null) {
                ds = spDao.getDSSanPhamMauSac();
            } else {
                if (math != null) {
                    ds = spDao.getDSSanPhamByBrand1(Integer.parseInt(math));
                }
                if (gia != null) {
                    ds = spDao.getDSSanPhamByPrice1(Integer.parseInt(gia));
                }
                if (macateg != null) {
                    ds = spDao.getDSSanPhamByCategory1(Integer.parseInt(macateg));
                }
            }
            
            if (ds.size() >= 13) {
                end = 12;
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
            List<SPMS> list = spDao.getSanphamByPagination1(ds, start, end);
        %>
        <jsp:include page="header.jsp"></jsp:include>
            <main>
                <ul class="breadcrumb">
                    <li><a href="<%=request.getContextPath()%>/index.jsp">Home</a></li>
                    <li class="active">Shoes</li>
                </ul>
                <div class="main-bottom-links" style="min-height: 50vh">
                    <div class="main-left"
                         style="float: left; display: block; width: 20vw; margin: 0 2.5vw;">
                        <div class="container">
                            <div class="row">
                                <div class="col-sm-3 col-md-3">
                                    <div class="panel-group" id="accordion">

                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a <%=math%>>Thương hiệu</a>
                                            </h4>
                                        </div>
                                        <div id="collapseOne" class="panel-collapse collapse in">
                                            <ul class="list-group">
                                                <li class="list-group-item"><a href="productShow.jsp?math=1">Nike</a></li>
                                                <li class="list-group-item"><a href="productShow.jsp?math=2">Adidas</a></li>
                                                <li class="list-group-item"><a href="productShow.jsp?math=3">Vans</a></li>
                                                <li class="list-group-item"><a href="productShow.jsp?math=4">Converses</a></li>

                                            </ul>
                                        </div>
                                    </div>
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a <%=gia%>>Mức giá</a>
                                            </h4>
                                        </div>
                                        <div id="collapseFour" class="panel-collapse collapse in">
                                            <ul class="list-group">
                                                <li class="list-group-item"><a href="productShow.jsp?gia=1">0 - 1.000.000</a></li>
                                                <li class="list-group-item"><a href="productShow.jsp?gia=2">1.000.000 -
                                                        2.000.000</a></li>
                                                <li class="list-group-item"><a href="productShow.jsp?gia=3">2.000.000 -
                                                        3.000.000</a></li>
                                                <li class="list-group-item"><a href="productShow.jsp?gia=4">3.000.000 -
                                                        4.000.000</a></li>
                                                <li class="list-group-item"><a href="productShow.jsp?gia=5">4.000.000 - 5.000.000</a></li>
                                                <li class="list-group-item"><a href="productShow.jsp?gia=6">5.000.000 trở lên</a></li>

                                            </ul>
                                        </div>
                                    </div>
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a <%=macateg%>>Danh mục</a>
                                            </h4>
                                        </div>

                                        <div id="collapseFive" class="panel-collapse collapse in">
                                            <ul class="list-group">
                                                <%
                                                    for (Category categ : cDao.getDSCategory()) {
                                                %>
                                                <li class="list-group-item"><a href="productShow.jsp?macateg=<%=categ.getMacateg()%> "><%=categ.getTencateg()%></a></li>
                                                    <%
                                                        }
                                                    %>
                                            </ul>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="main-right">
                    <div class="sort">
                        <h3>SHOES</h3>
                        <select name="" id="short-by">
                            <option value="0">Sắp xếp</option>
                            <option value="1">Tên [A - Z]</option>
                            <option value="2">Tên [Z - A]</option>
                            <option value="3">giá [thấp - cao]</option>
                            <option value="4">giá [cao - thấp]</option>
                        </select>
                    </div>
                    <%         
                        for (SPMS sp : list) {     
                    %>
                    <!-------------product----------------->
                    <div class="product">
                        <div class="col-md-3 col-sm-6">
                            <div class="product-grid6">
                                <div class="product-image6">                            
                                    <a href="product.jsp?masp=<%=sp.getSanpham().getMasp()%>&mams=<%=sp.getMausac().getMams()%>">
                                        <img class="pic-1" src="<%=spDao.getHinhSanPham(sp.getSanpham().getMasp()).getHinhanh()%>">
                                    </a>
                                </div>
                                <%
                                    int g = (int) sp.getSanpham().getGia();
                                %>
                                <div class="product-content">
                                    <h3 class="title"><a href="#"><%=sp.getSanpham().getTensp()%></a></h3>
                                    <div class="price"><%=g%></div>
                                </div>
                                <ul class="social">
                                    <li><a href="product.jsp?masp=<%=sp.getSanpham().getMasp()%>&mams=<%=sp.getMausac().getMams()%>" data-tip="Quick View"><i class="fa fa-search"></i></a></li>
                                    <li><a href="product.jsp?masp=<%=sp.getSanpham().getMasp()%>&mams=<%=sp.getMausac().getMams()%>" data-tip="Add to Cart"><i class="fa fa-shopping-cart"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <%
                        }
                    %> 
                    <!--                pagination------------------------------------->
                    <ul class="pagination">
                        <%
                            int a, b;
                            int s = ds.size() / 12;
                            if (s * 12 < ds.size()) {
                                s += 1;
                            }
                            for (int i = 1; i <= s; i++) {
                                a = (i - 1) * 12;
                                b = i * 12;
                                if (b > ds.size()) {
                                    b = ds.size();
                                }
                        %>
                        <li><a class="active" href="productShow.jsp?start=<%=a%>&end=<%=b%>"><%=i%></a></li>
                            <%
                                }
                            %>
                    </ul>
                </div>
            </div>
        </main>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>