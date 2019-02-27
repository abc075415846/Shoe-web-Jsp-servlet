<%@page import="dao.SanPhamDao"%>
<%@page import="pojo.Sanpham"%>
<%@page import="pojo.Loaisp"%>
<%@page import="pojo.Category"%>
<%@page import="pojo.Thuonghieu"%>
<%@page import="pojo.Mausac"%>
<%@page import="dao.CategoryDao"%>
<%@page import="pojo.Xuatsu"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Insert title here</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update product</title>
        <link rel="stylesheet" href="css/MWS_main.css">
        <link rel="stylesheet" href="css/MWS_update.css">
    </head>
    <body>
        <%

            CategoryDao cateDao = new CategoryDao();
            Sanpham sp = new Sanpham();
            SanPhamDao spd = new SanPhamDao();

            String t = null;
            if (request.getAttribute("t") != null) {
                t = (String) request.getAttribute("t");
            }

            String masp = "";
            if (request.getParameter("masp") != null) {
                masp = request.getParameter("masp");
                sp = spd.getSanpham(Integer.parseInt(masp));
            }

        %>
        <jsp:include page="mHeader.jsp"></jsp:include>
            <main>
                <div class="main-wrapper" style="background-color: #f5f5f5;">
                    <ul class="breadcrumb">
                        <li><a href="<%=request.getContextPath()%>/admin.jsp">Trang chủ</a></li>
                    <li><a href="">Quản lý sản phẩm</a></li>
                    <li class="active">Cập nhật sản phẩm</li>
                </ul>


                <h3>Cập nhật thông tin sản phẩm</h3>
                <div class="container">

                    <form class="form-horizontal" method="post" action="updateProduct" style="min-height: 57vh">
                        <fieldset>


                            <legend>Sửa thông tin sản phẩm</legend>


                            <div class="form-group">
                                <label class="col-md-4 control-label" for="">Tên sản phẩm <span>*</span>
                                </label>
                                <div class="col-md-6">
                                    <input id="ci_usuario" name="name" type="text"
                                           value="<%=sp.getTensp()%>" class="form-control input-md" required="">

                                </div>
                            </div>


                            <div class="form-group">
                                <label class="col-md-4 control-label">Thương hiệu
                                    <span>*</span>
                                </label>
                                <div class="col-md-6">
                                    <select id="brand" name="brand" class="form-control">
                                        <%
                                            for (Thuonghieu th : cateDao.getDSBrand()) {
                                        %>
                                        <option value="<%=th.getMath()%>"><%=th.getTenth()%></option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                            </div>
                            <!----------------------------->
                            <div class="form-group">
                                <label class="col-md-4 control-label">
                                    Category <span>*</span>
                                </label>
                                <div class="col-md-6">
                                    <select class="form-control" id="category" name="category">
                                        <%
                                            for (Category categ : cateDao.getDSCategory()) {
                                        %>
                                        <option value="<%=categ.getMacateg()%>"><%=categ.getTencateg()%></option>
                                        <%
                                            }
                                        %>
                                    </select>

                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-4 control-label" >Màu sắc <span>*</span>
                                </label>
                                <div class="col-md-6">
                                    <select id="selectbasic" name="mausac" class="form-control">
                                        <%
                                            for (Mausac ms : spd.getDSMausacSanPham(Integer.parseInt(masp))) {
                                        %>
                                        <option value="<%=ms.getMams()%>"><%=ms.getTenmau()%></option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-4 control-label" for="">Sản xuất<span>*</span>
                                </label>
                                <div class="col-md-6">
                                    <select class="form-control" name="xuatsu">
                                        <%
                                            for (Xuatsu xs : cateDao.getDSXuatSu()) {
                                        %>
                                        <option value="<%=xs.getMaxs()%>"><%=xs.getTenxs()%></option>
                                        <%
                                            }
                                        %>
                                    </select> 
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-4 control-label" for="">Giá <span>*</span></label>
                                <div class="col-md-6">
                                    <%
                                        int gia = (int) sp.getGia();
                                    %>
                                    <input name="gia" type="text" class="form-control input-md" 
                                           required="" value="<%=gia%>" style="text-transform: uppercase">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Hình
                                    ảnh <span>*</span>
                                </label>
                                <div class="col-md-6">

                                    <div class="input-group image-preview">

                                        <input type="text" class="form-control image-preview-filename"
                                               disabled="disabled">

                                        <span class="input-group-btn"> 
                                            <div class="btn btn-default image-preview-input">
                                                <span class="glyphicon glyphicon-folder-open"></span> <span
                                                    class="image-preview-input-title">Browse</span> <input
                                                    type="file" accept="image/png, image/jpeg, image/gif"
                                                    name="hinhanh" />
                                                <!-- rename it -->
                                            </div>
                                        </span>
                                    </div>
                                    <!-- /input-group image-preview [TO HERE]-->
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-4 control-label">Nội
                                    dung <span>*</span>
                                </label>
                                <div class="col-md-6">
                                    <textarea name="noidung" id="descript"
                                              class="form-control input-md" style="height: 150px;"
                                              required=""><%=sp.getMota()%></textarea>
                                </div>
                            </div>

                            <input type="hidden" value="<%=sp.getMasp()%>" name="masp">


                            <div class="form-group" style="padding-top: 20px;">
                                <label class="col-md-4 control-label"></label>
                                <div class="col-md-8">
                                    <button class="btn btn-primary" type="submit" >Xác nhận</button>

                                </div>
                            </div>
                        </fieldset>
                    </form>
                </div>
            </div>
        </main>
        <jsp:include page="mFooter.jsp"></jsp:include>

    </body>
    <script type="text/javascript" src="javascript/MWS_main_InputFile.js"></script>
</html>
