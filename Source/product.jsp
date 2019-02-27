<%@page import="pojo.SPMS"%>
<%@page import="pojo.Mausac"%>
<%@page import="pojo.Ctsanpham"%>
<%@page import="pojo.Kichco"%>
<%@page import="pojo.Hinhsp"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="pojo.Thuonghieu"%>
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
        <link rel="stylesheet" href="css/test_product.css">
    </head>
    <body>

      <%
            SanPhamDao spDao = new SanPhamDao();
//            Sanpham sp = new Sanpham();
            SPMS sp = new SPMS();
            Ctsanpham ct = new Ctsanpham();
            Thuonghieu th = new Thuonghieu();
            List<SPMS> list = spDao.getDSSanPhamMauSac();
            String masp = "";
            String mams = "";
            if (request.getParameter("masp") != null && request.getParameter("mams") != null) {
                masp = request.getParameter("masp");
                mams = request.getParameter("mams");
                sp = spDao.getSanpham1(Integer.parseInt(masp), Integer.parseInt(mams));

            }


        %>
        <jsp:include page="header.jsp"></jsp:include>
            <div class="container" style="margin-top: 80px">
                <ul class="breadcrumb">
                    <li><a href="<%=request.getContextPath()%>/admin.jsp">Home</a></li>
                    <li><a href="">Nike</a></li>
                    <li class="active"><%=sp.getSanpham().getTensp()%></li>
            </ul>
            <div class="row">
                <div class="col-lg-12">
                    <div class="card mb-10">
                        <div class="card-header">
                            <nav class="header-navigation">
                                <a href="productShow.jsp" class="btn btn-link">Danh sách sản phẩm</a>
                            </nav>
                        </div>
                        <div class="card-body store-body">
                            <div class="product-info">
                                <div class="product-gallery">
                                    <div class="product-gallery-thumbnails">
                                        <ol class="thumbnails-list list-unstyled">
                                            <%
                                                for (Hinhsp h : spDao.getDSHinhSanPham(Integer.parseInt(masp))) {
                                            %>
                                            <li><img src="<%=h.getHinhanh()%>" alt=""></li>

                                            <%
                                                }
                                            %>
                                        </ol>
                                    </div>
                                    <div class="product-gallery-featured">

                                        <img src="<%=spDao.getHinhSanPham(Integer.parseInt(masp)).getHinhanh()%>" alt="">

                                    </div>
                                </div>
                                <div class="product-seller-recommended">
                                    <h3 class="mb-5">Sản phẩm mới từ D2C</h3><br>

                                    <div class="recommended-items card-deck">
                                        <%
                                            int i = 0;
                                            for (SPMS s : list) {
                                                i++;
                                                if (i == 5) {
                                                    break;
                                                }
                                        %>
                                        <div class="card">
                                            <a href="product.jsp?masp=<%=s.getSanpham().getMasp()%>&mams=<%=s.getMausac().getMams()%>">

                                                <img src="<%=spDao.getHinhSanPham(s.getSanpham().getMasp()).getHinhanh()%>" alt="" class="card-img-top">
                                            </a>
                                            <div class="card-body">
                                                <%
                                                    int g = (int) sp.getSanpham().getGia();
                                                %>
                                                <span class="text-muted"><small><%=s.getSanpham().getTensp()%></small></span>
                                                <h5 class="card-title"><%=g%></h5>
                                                
                                            </div>

                                        </div>
                                        <%
                                            }
                                        %>
                                    </div>
                                    <!-- /.recommended-items-->
                                    <p class="mb-5 mt-5"><a href="#">Xem sản phẩm liên quan</a></p>
                                    <div class="product-description mb-5">
                                        <h2 class="mb-5">Đặc điểm</h2>
                                        <dl class="row mb-5">
                                            <dt class="col-sm-3">Thương hiệu</dt>
                                            <dd class="col-sm-9"><%=spDao.getSThuongHieuByMasp(Integer.parseInt(masp)).getTenth()%></dd>
                                            <dt class="col-sm-3">Màu sắc</dt>
                                            <dd class="col-sm-9"><%=sp.getMausac().getTenmau()%></dd>
                                            <dt class="col-sm-3">Kích cỡ</dt>
                                            <dd class="col-sm-9">Đang cập nhật</dd>

                                        </dl>
                                        <h2 class="mb-5">Mô tả</h2>
                                        <p><%=sp.getSanpham().getMota()%></p>
                                    </div>

                                    <!--form QA------->

                                    <div class="product-comments">
                                        <h2 class="mb-2">Bình luận</h2>
                                        <form action="" class="form-inline mb-5">
                                            <textarea name="" id="" class="form-control mr-4" placeholder="" style="width: 90%; height: 80px; display: block;"></textarea>
                                            <button class="btn btn-primary" style="display: block; line-height: 0px;">Bình luận</button>
                                        </form>                                
                                    </div>
                                </div>
                            </div>
                            <div class="product-payment-details">
                                <h2 class="product-title mb-2" style="margin-top: 0px; padding-bottom: 20px; text-transform: uppercase"><%=sp.getSanpham().getTensp()%></h2>
                                <%
                                    int g1 = (int) sp.getSanpham().getGia();
                                %>
                                <h3 class="product-price display-4" ><%=g1%> VND</h3>

                                <p class="mb-0"><i class="fa fa-truck"></i> Giao hàng 2h</p>

                                <div class="form-detail-product">
                                    <a class="size-chart" data-toggle="modal" data-target="#exampleModal">...Size Chart</a><br><br>
                                    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="z-index: 2001">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel">Size chart</h5>
                                                </div>
                                                <div class="modal-body">
                                                    <img src="Images/WSProduct/sizevans.jpg" alt="">
                                                    <img src="Images/WSProduct/sizecon.jpg" alt="">
                                                </div>
                                                <div class="modal-footer">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <form method="POST" action="<%=request.getContextPath()%>/Cart" >
                                        <%
                                            String err_sl = "", err_kc = "";
                                            if (request.getAttribute("err_sl") != null) {
                                                err_sl = (String) request.getAttribute("err_sl");
                                            }
                                            if (request.getAttribute("err_kc") != null) {
                                                err_kc = (String) request.getAttribute("err_kc");
                                            }
                                        %>
                                        <select name="kichco" id="size">
                                            <option value="0">Kích cỡ</option>
                                            <%
                                                for (Kichco kc : spDao.getDSKichCoSP(Integer.parseInt(masp), Integer.parseInt(mams))) {
                                            %>
                                            <option value="<%=kc.getMakc()%>"><%=kc.getKichco()%></option>
                                            <%
                                                }
                                            %>
                                        </select><br>

                                        <p style="color: red; padding-left: 5px;"><%=err_kc%></p>

                                        <label for="quant">Số lượng</label>
                                        <input type="number" name="soluong"  min="1" class="form-control mb-5 input-lg" placeholder="Chọn số lượng">  
                                        <p style="color: red; padding-left: 5px;"><%=err_sl%></p>
                                        <input type="hidden" value="insertItem" name="command">
                                        <input type="hidden" value="<%=System.currentTimeMillis()%>" name="magh">
                                        <input type="hidden" value="<%=sp.getSanpham().getMasp()%>" name="masp">
                                        <input type="hidden" value="<%=sp.getMausac().getMams()%>" name="mams">


                                        <%
                                            if(spDao.KiemTraSoLuongSanPham(Integer.parseInt(masp))== true){
                                        %>
                                        <button type="submit" class="btn btn-lg btn-primary text-uppercase">
                                            <i class="fas fa-shopping-cart"></i> Thêm vào giỏ
                                        </button>
                                        <%
                                            }else{
                                        %>
                                        <p style="color: red">HẾT HÀNG</p>
                                        <%
                                            }
                                        %>
                                    </form>

                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <jsp:include page="footer.jsp"></jsp:include>

        <script type="text/javascript" src="javascript/WS_product.js"></script>
    </body>
</html>
