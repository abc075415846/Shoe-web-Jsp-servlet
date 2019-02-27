<%@page import="pojo.Ctsanpham"%>
<%@page import="pojo.SPMS"%>
<%@page import="dao.SanPhamDao"%>
<%@page import="java.util.Map"%>
<%@page import="pojo.Sanpham"%>
<%@page import="java.util.TreeMap"%>
<%@page import="pojo.Giohang"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Website D2C</title>
        <link rel="stylesheet" href="css/WS_cartpro.css">
        <link rel="stylesheet" href="css/WS_wrapper.css">
    </head>
    <body>
        <%
            SanPhamDao spdao = new SanPhamDao();
            Giohang giohang = (Giohang) session.getAttribute("giohang");

            if (giohang == null) {
                giohang = new Giohang();
                session.setAttribute("giohang", giohang);
            }
            TreeMap<Ctsanpham, Integer> list = giohang.getListSanpham();


        %>
        <jsp:include page="header.jsp"></jsp:include>
            <main>
                <div class="wrapper">
                    <h1>Giỏ hàng <span style="font-size: 14px;">( <%=giohang.countGiohang()%> Sản phẩm )</span></h1>

                <div class="main-left">

                    <%
                        for (Map.Entry<Ctsanpham, Integer> entry : list.entrySet()) {
                    %>
                    <div class="product-info">
                        <div class="product">
                            <div class="product-image">
                                <img src="<%=spdao.getHinhSanPham(entry.getKey().getSanpham().getMasp()).getHinhanh()%>">
                            </div>
                            <div class="product-details">
                                <div class="product-title"><%=entry.getKey().getSanpham().getTensp()%> (<%=entry.getKey().getMausac().getTenmau()%>)</div>
                                <p class="product-description"><%=entry.getKey().getSanpham().getMota()%></p>
                            </div>
                            <%
                                int dongia = (int) entry.getKey().getSanpham().getGia();
                            %>
                            <div class="product-price"><%=dongia%></div>
                            <div class="product-quantity">     
                                
                                <a class="product-quantity-down" href="Cart?command=subItem&masp=<%=entry.getKey().getSanpham().getMasp()%>&mams=<%=entry.getKey().getMausac().getMams()%>&kichco=<%=entry.getKey().getKichco().getMakc()%>&magh=<%=System.currentTimeMillis()%>"> - </a>
                                <input type="text" value="<%=entry.getValue()%>" min="1" size ="2">
                                <a class="product-quantity-up" href="Cart?command=addItem&masp=<%=entry.getKey().getSanpham().getMasp()%>&mams=<%=entry.getKey().getMausac().getMams()%>&kichco=<%=entry.getKey().getKichco().getMakc()%>&magh=<%=System.currentTimeMillis()%>"> + </a>

                            </div>
                            <%
                                double tg = entry.getValue() * entry.getKey().getSanpham().getGia();
                                int tong = (int) tg;

                            %>
                            <div class="product-line-price" style="width: 15%;"><%=tong%></div>
                        </div>
                        <a class="remove-product" href="Cart?command=deleteItem&masp=<%=entry.getKey().getSanpham().getMasp()%>&mams=<%=entry.getKey().getMausac().getMams()%>&kichco=<%=entry.getKey().getKichco().getMakc()%>&magh=<%=System.currentTimeMillis()%>" style="font-size: 12px;">Xóa</a>
                        
                    </div>
                        <%
                            String err_slton = "";
                            if (request.getAttribute("err_slton") != null) {
                                err_slton = (String) request.getAttribute("err_slton");
                            }
                        %>
                        <p><%=err_slton%></p>
                    <%
                        }
                    %>

                    <!------------------------------------------------More product-------------------------->
                    <div class="main-left-bottom">
                        <div class="product-seller-recommended" style="padding: 20px;">
                            <h3 class="mb-5">Sản phẩm mới</h3>
                            <br>
                            <div class="recommended-items card-deck">
                                <%
                                    int i = 0;
                                    for (SPMS sp : spdao.getDSSanPhamMauSac()) {
                                        i++;
                                        if (i == 6) {
                                            break;
                                        }
                                %>
                                <div class="card">
                                    <a href="product.jsp?masp=<%=sp.getSanpham().getMasp()%>&mams=<%=sp.getMausac().getMams()%>">
                                        <img src="<%=spdao.getHinhSanPham(sp.getSanpham().getMasp()).getHinhanh()%>" alt="" class="card-img-top">
                                    </a>
                                    <div class="card-body">
                                        <%
                                            int gn = (int) sp.getSanpham().getGia();
                                        %>
                                        <span class="text-muted"><small><%=sp.getSanpham().getTensp()%></small></span>
                                        <h5 class="card-title"><%=gn%></h5>

                                    </div>         
                                </div>
                                <%
                                    }
                                %>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="main-right">
                    <div class="totals">
                        <div class="totals-item">
                            <label>Tạm tính:</label>
                            <div class="totals-value" id="cart-subtotal">
                                <%
                                    int total = (int) giohang.totalGiohang();
                                %>
                                <%=total%>
                            </div>
                        </div>           
                        <div class="form-group">
                            <hr>
                        </div>
                        <div class="totals-item totals-item-total">
                            <label>Tổng tiền:</label>
                            <div class="totals-value" id="cart-total" style="color: #fe3834">
                                <%=total%>
                            </div>
                        </div>
                        <span>(Đã bao gồm VAT)</span>
                    </div>
                    <div class="row-check">
                        <div class="col-xs-6">
                            <a href="payment.jsp" class="btn btn-primary btn-sm btn-block"
                               role="button"
                               style="margin-left: 4px; background-color: #ff8000; border: 0px; text-transform: uppercase;"
                               >Thanh toán</a>
                        </div>
                        <div class="col-xs-6">
                            <a href="productShow.jsp" class="btn btn-primary btn-sm btn-block"
                               role="button" style="text-transform: uppercase"><span class="glyphicon glyphicon-share-alt"></span>
                                Tiếp tục mua sắm</a>
                        </div>

                    </div>
                </div>

        </main>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>