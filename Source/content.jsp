<%@page import="pojo.SPMS"%>
<%@page import="pojo.Sanpham"%>
<%@page import="dao.SanPhamDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Content</title>
    </head>
    <body>
        <!------------------product demo--------------------------->
        <%
            SanPhamDao spDao = new SanPhamDao();
            int i = 0;
        %>
        <div class="container" style="margin-bottom: 20px;">
            <h4>What's new ?</h4>
            <div class="product">
                <%for (SPMS sp : spDao.getDSSanPhamMauSac()) {               
                        i += 1;
                        if (i == 11) {
                            break;
                        }
                %>
                <div class="col-md-3 col-sm-6">
                    <div class="product-grid6">
                        <div class="product-image6">
                            <a href="product.jsp?masp=<%=sp.getSanpham().getMasp()%>&mams=<%=sp.getMausac().getMams()%>">
                                <img class="pic-1" src="<%=spDao.getHinhSanPham(sp.getSanpham().getMasp()).getHinhanh()%>">
                            </a>
                        </div>
                        <div class="product-content">
                            <h3 class="title"><a href="#"><%=sp.getSanpham().getTensp()%></a></h3>
                            <%
                                int gia = (int) sp.getSanpham().getGia();
                            %>
                            <div class="price"><%=gia%></div>
                        </div>
                        <ul class="social">
                            <li><a href="test.jsp?masp=<%=sp.getSanpham().getMasp()%>&mams=<%=sp.getMausac().getMams()%>" data-tip="Quick View"><i class="fa fa-search"></i></a></li>
                           
                        </ul>
                    </div>
                </div>
                <%
                    }
                %>
            </div>
        </div>
    </div>
    <!---------page------------->
</div>
</body>
</html>
