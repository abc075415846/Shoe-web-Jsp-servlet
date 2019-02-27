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
                    <li class="active">Xóa sản phẩm</li>
                </ul>
            </div>

     
            <div class="container">

                <form class="form-horizontal" method="post" action="deleteProduct" style="min-height: 57vh">
                    <fieldset>

                        <!-- Form Name -->

                        <legend>Thông tin sản phẩm</legend>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="">Tên sản phẩm <span>*</span>
                            </label>
                            <div class="col-md-6">
                                
                                <input id="ci_usuario" name="name" type="text"
                                       value="<%=sp.getTensp()%>" class="form-control input-md"  disabled="disabled" >

                            </div>
                        </div>

                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label">Thương hiệu
                                <span>*</span>
                            </label>
                            <div class="col-md-6">
                                <select id="brand" name="brand" class="form-control"  disabled="disabled">
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
                                <select class="form-control" id="category" name="category"  disabled="disabled">
                                    <%
                                        for (Category categ : cateDao.getDSCategory()) {
                                    %>
                                    <option value="<%=categ.getMacateg()%>"><%=categ.getTencateg()%></option>
                                    <%
                                        }
                                    %>
                                </select>
                                <div class="invalid-feedback">Please provide a category.</div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-md-4 control-label" >Màu sắc <span>*</span>
                            </label>
                            <div class="col-md-6">
                                <select id="selectbasic" name="mausac" class="form-control"  disabled="disabled">
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
                                <select class="form-control" name="xuatsu"  disabled="disabled">
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
                            <label class="col-md-4 control-label">Giá <span>*</span></label>
                            <div class="col-md-6">
                                <input name="gia" type="text" class="form-control input-md" 
                                        disabled="disabled" value="<%=sp.getGia()%>" style="text-transform: uppercase">
                            
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
                                <textarea name="noidung" id="descript"  disabled="disabled"
                                          class="form-control input-md" style="height: 150px;"
                                          ><%=sp.getMota()%></textarea>
                            </div>
                        </div>

                        <input type="hidden" value="<%=sp.getMasp()%>" name="masp">


                        <div class="form-group" style="padding-top: 20px;">
                            <label class="col-md-4 control-label"></label>
                            <div class="col-md-8">
                                <button class="btn btn-primary" type="submit" >Xác nhận xóa</button>

                            </div>
                        </div>


                    </fieldset>
                </form>
            </div>
        </main>
        <jsp:include page="mFooter.jsp"></jsp:include>
    </body>
</html>
