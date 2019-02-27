<%@page import="pojo.Kichco"%>
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


                    <fieldset>

                        <!-- Form Name -->

                        <legend>Nhập thông tin sản phẩm</legend>
                        <form class="form-horizontal" method="post" action="updateProduct" style="min-height: 57vh">
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="">Số lượng <span>*</span></label>
                                <div class="col-md-6">

                                    <input name="soluong" type="text"
                                           value="" class="form-control input-md" required=""
                                           style="text-transform: uppercase">
                                </div>
                            </div>                   
                            <div class="form-group">
                                <label class="col-md-4 control-label">Kích cỡ <span>*</span>
                                </label>
                                <div class="col-md-6">
                                    <select class="form-control" name ="kichco">
                                        <%
                                            String mams = "";
                                            if (request.getAttribute("mausac") != null) {
                                                mams = (String) request.getAttribute("mausac");
                                            }
                                            for (Kichco kc : spd.getDSKichCoSP(Integer.parseInt(masp), Integer.parseInt(mams))) {
                                        %>
                                        <option value="<%=kc.getMakc()%>"><%=kc.getKichco()%></option>
                                        <%
                                            }
                                        %>
                                    </select>
                                    <div class="invalid-feedback"></div>
                                </div>
                            </div> 

                            <input type="hidden" value="<%=sp.getMasp()%>" name="masp">
                            <div class="form-group" style="padding-top: 20px;">
                                <label class="col-md-4 control-label"></label>
                                <div class="col-md-8">
                                    <button class="btn btn-primary btn-success" type="submit" >Xác nhận</button>
                                </div>
                            </div>
                        </form>                       
                    </fieldset>

                </div>
        </main>
        <jsp:include page="mFooter.jsp"></jsp:include>

    </body>
    <script type="text/javascript" src="javascript/MWS_main_InputFile.js"></script>
</html>
