<%-- 
    Document   : orderResult
    Created on : Jul 7, 2024, 3:18:30 AM
    Author     : AD
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:if test="${transResult}">
            <div class="text-center mt-5">
                <h3 class="fw-bold">Bạn đã giao dịch thành công! 
                </h3>
            </div>
        </c:if>
          <c:if test="${transResult==false}">
            <div class="text-center mt-5">
                <h3 class="fw-bold">Đơn hàng giao dịch thất bại!</h3>
            </div>
        </c:if>
        <c:if test="${transResult==null}">
            <div class="text-center mt-5">
                <h3 class="fw-bold">Chúng tôi đã tiếp nhận đơn hàng, xin chờ quá trình xử lý!</h3>
            </div>
         </c:if>
    </body>
</html>
