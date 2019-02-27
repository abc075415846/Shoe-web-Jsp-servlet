<%@page import="java.util.List"%>
<%@page import="pojo.Mausac"%>
<%@page import="dao.ThemSPDao"%>
<%@page import="pojo.Xuatsu"%>
<%@page import="pojo.Loaisp"%>
<%@page import="pojo.Category"%>
<%@page import="pojo.Thuonghieu"%>
<%@page import="dao.CategoryDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Website D2C</title>
        <link rel="stylesheet" href="css/MWS_main.css">
        <link rel="stylesheet" href="css/MWS_update.css">
    </head>
    <body>
        <%
            CategoryDao categDao = new CategoryDao();
            ThemSPDao tspDao = new ThemSPDao();


        %>
        <jsp:include page="mHeader.jsp"></jsp:include>
            <div class="main-wrapper" style="background-color: #f5f5f5;">
                <ul class="breadcrumb">
                    <li><a href="<%=request.getContextPath()%>/admin.jsp">Trang chủ</a></li>
                <li><a href="<%=request.getContextPath()%>/mProduct.jsp">Quản lý sản phẩm</a></li>
                <li class="active">Thêm sản phẩm</li>
            </ul>
            <h3>Thêm thông tin sản phẩm</h3>
            <div class="container">

                <form class="form-horizontal"  method="POST" action="addProduct">
                    <fieldset>

                        <legend>Nhập thông tin sản phẩm</legend>
                        <%
                            String error = "";
                            if (request.getAttribute("err") != null) {
                                error = (String) request.getAttribute("err");
                            }
                        %>
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="">Tên sản phẩm
                                <span>*</span>
                            </label>
                            <div class="col-md-6">
                                <input name="name" type="text"
                                       placeholder="Nhập tên sản phẩm" class="form-control input-md" required="">

                            </div>
                            <p><%=error%></p>
                        </div>         

                        <div class="form-group">
                            <label class="col-md-4 control-label" for="">Loại
                                sản phẩm <span>*</span>
                            </label>
                            <div class="col-md-6">
                                <select class="form-control" name = "loaisp">
                                    <%
                                        List<Loaisp> listType = null;
                                        if (request.getAttribute("listType") != null) {
                                            listType = (List<Loaisp>) request.getAttribute("listType");

                                            for (Loaisp l : listType) {
                                    %>
                                    <option value="<%=l.getMalsp()%>"><%=l.getTenlsp()%></option>
                                    <%
                                            }
                                        }
                                    %> 
                                </select>

                            </div>
                        </div>
                        <!-------price--------->
                        <%
                            String err_gia = "";
                            if (request.getAttribute("err_gia") != null) {
                                err_gia = (String) request.getAttribute("err_gia");
                            }
                        %>
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="">Giá <span>*</span></label>
                            <div class="col-md-6">
                                <input name="gia" type="number"
                                       placeholder="200000" class="form-control input-md" required=""
                                       style="text-transform: uppercase">
                            </div>
                            <p><%=err_gia%></p>
                        </div>
                        
                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="">Sản xuất<span>*</span>
                            </label>
                            <div class="col-md-6">
                                <select class="form-control" name="xuatsu">
                                    <%
                                        for (Xuatsu xs : categDao.getDSXuatSu()) {
                                    %>
                                    <option value="<%=xs.getMaxs()%>"><%=xs.getTenxs()%></option>
                                    <%
                                        }
                                    %>
                                </select> 
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="">Kích cỡ <span>*</span></label>
                            <div class="col-md-6">
                                <input id="form-tags-1" name="kichco" type="text"
                                       value="38,39,40">
                            </div>
                        </div>
                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label">Màu
                                sắc <span>*</span>
                            </label>
                            <div class="col-md-6">
                                <select name="mausac" class="form-control">
                                    <%
                                        for (Mausac ms : categDao.getDSMausac()) {
                                    %>
                                    <option value="<%=ms.getMams()%>"><%=ms.getTenmau()%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                        </div>
                        <!---------------->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="">Số lượng <span>*</span></label>
                            <div class="col-md-6">

                                <input name="soluong" type="number"
                                       placeholder="0" class="form-control input-md" required=""
                                       style="text-transform: uppercase">
                            </div>
                        </div>
                        <!--select img-->
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
                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label">Nội
                                dung <span>*</span>
                            </label>
                            <div class="col-md-6">
                                <textarea name="noidung" id="descript"
                                          class="form-control input-md" style="height: 150px;"
                                          required=""></textarea>
                            </div>
                        </div>
                        <!-- Button (Double) -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="btn_registrar"></label>
                            <div class="col-md-8">
                                <button id="btn_registrar" name="btn_registrar"
                                        class="btn btn-success nextBtn">Xác nhận</button>
                                <button id="btn_cancelar" name="btn_cancelar"
                                        class="btn btn-danger">Hủy</button>

                            </div>
                        </div>
                    </fieldset>
                </form>
            </div>
        </div>
    </main>
    <jsp:include page="mFooter.jsp"></jsp:include>
    <script type="text/javascript"
    src="javascript/MWS_main_DynamicSelectDropdown.js"></script>
    <script type="text/javascript" src="javascript/MWS_main_InputFile.js"></script>
    <script type="text/javascript" src="javascript/WS_checkout.js"></script>
</body>
</html>
