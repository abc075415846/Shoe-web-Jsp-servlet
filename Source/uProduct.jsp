<%@page import="java.util.List"%>
<%@page import="pojo.Kichco"%>
<%@page import="dao.SanPhamDao"%>
<%@page import="pojo.Sanpham"%>
<%@page import="pojo.Loaisp"%>
<%@page import="pojo.Category"%>
<%@page import="pojo.Thuonghieu"%>
<%@page import="pojo.Mausac"%>
<%@page import="dao.CategoryDao"%>
<%@page import="pojo.Xuatsu"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
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

            String masp = "";
            if (request.getAttribute("masp") != null) {
                masp = (String) request.getAttribute("masp");
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

                    <form class="form-horizontal" method="post" action="updateProduct" style="height: 57vh;">
                        <fieldset>
                            <legend>Sửa thông tin sản phẩm</legend>

                            <div class="form-group">
                                <label class="col-md-4 control-label">Loại sản phẩm <span>*</span>
                                </label>
                                <div class="col-md-6">
                                    <select class="form-control" name="loaisp">
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
                                    <div class="invalid-feedback"></div>
                                </div>
                            </div>
                     
                            <%
                                
                                String s = request.getParameter("gia");
                            %>        
                            <input type="hidden" value="<%=request.getParameter("name")%>" name="name">
                            <input type="hidden" value="<%=request.getParameter("noidung")%>" name="noidung">
                            <input type="hidden" value="<%=sp.getMasp()%>" name="masp">
                            <input type="hidden" value="<%=request.getParameter("mausac")%>" name="mausac">
                            <input type="hidden" value="<%=sp.getXuatsu().getMaxs()%>" name="xuatsu">
                            <input type="hidden" value="<%=s%>" name="gia">

                            <div class="form-group" style="padding-top: 20px;">
                                <label class="col-md-4 control-label"></label>
                                <div class="col-md-8">
                                    <button class="btn btn-primary btn-success" type="submit" >Cập nhật</button>
                                </div>
                            </div>

                        </fieldset>
                    </form>
                </div>

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