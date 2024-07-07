<%-- 
    Document   : myTicketDetail
    Created on : Jul 7, 2024, 7:27:36 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ticket Detail</title>
    </head>
    <body>
        <p>${request.contextPath}${qrCode}</p>
        <img src="${request.contextPath}${qrCode}" alt="alt"/>
        <img src="" alt="alt"/>
    </body>
</html>
