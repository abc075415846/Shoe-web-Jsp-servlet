<%-- 
    Document   : test1
    Created on : Dec 24, 2018, 9:39:01 AM
    Author     : ledan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%=request.getAttribute("test")%>
        <%=request.getAttribute("gio")%>
    </body>
</html>
