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
            <main>
                <div class="main-wrapper" style="background-color: #f5f5f5;">
                    <ul class="breadcrumb">
                        <li><a href="<%=request.getContextPath()%>/admin.jsp">Trang chủ</a></li>
                    <li><a href="<%=request.getContextPath()%>/mProduct.jsp">Quản lý sản phẩm</a></li>
                    <li class="active">Thêm sản phẩm</li>
                </ul>
                <h3>Thêm thông tin sản phẩm</h3>
                <div class="container">
        
                        <form class="form-horizontal" method ="POST" action="addProduct" style="height: 57vh; display: block">
                            <fieldset>
                                <!-- Form Name -->
                                <legend>Chọn danh mục sản phẩm</legend>
                                <!--select img 1-->
                                
                                <!-- Select Basic -->
                                <div class="form-group" style="margin-top: 50px; margin-bottom: 20px; ">
                                    <label class="col-md-4 control-label" for="selectbasic">Thương
                                        hiệu <span>*</span>
                                    </label>
                                    <div class="col-md-6">
                                        <select id="brand" name="brand" class="form-control">
                                            <%
                                                for (Thuonghieu th : categDao.getDSBrand()) {
                                            %>
                                                <option value="<%=th.getMath()%>"><%=th.getTenth()%></option>
                                            <%
                                                }
                                            %>
                                        </select>
                                    </div>
                                </div>
                                <!-----------product category------------------>
                                <div class="form-group">
                                    <label class="col-md-4 control-label">Danh Mục
                                        <span>*</span>
                                    </label>
                                    <div class="col-md-6" style="margin-bottom: 20px; ">
                                        <select class="form-control" id="category" name="category">
                                            <%
                                                for (Category categ : categDao.getDSCategory()) {
                                            %>
                                                <option value="<%=categ.getMacateg()%>"><%=categ.getTencateg()%></option>
                                            <%
                                                }
                                            %>
                                        </select>
                                      
                                    </div>
                                </div>

                                <!------------------button------------------------>
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="btn_registrar"></label>
                                    <div class="col-md-8">
                                        <button class="btn btn-primary btn-success" type="submit" >Xác nhận</button>
                                    </div>
                                </div>
                            </fieldset>
                        </form>
           
                </div>
            </div>
        </main>
        <jsp:include page="mFooter.jsp"></jsp:include>
    </body>
</html>
