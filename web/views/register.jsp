<%-- 
    Document   : register
    Created on : Mar 4, 2024, 10:34:46 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <style>
            .password-container {
                position: relative;
            }
            .show-password-btn {
                position: absolute;
                right: 10px;
                top: 50%;
                transform: translateY(-50%);
                cursor: pointer;
            }
        </style>
    </head>
    <body>
        <div class="container mt-3 w-50">
            <h2 class="text-center">Sign Up</h2>
            <h4 class="text-success">${requestScope.success}</h4>
            <h4 class="text-danger">${requestScope.fail}</h4>

            <form method="post" action="register">
                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" class="form-control" id="username" name="username" placeholder="Enter username" value="${user.userName}" required>
                </div>
                <div class="form-group">
                    <label for="email">Email address</label>
                    <input type="email" class="form-control" id="email" name="email" placeholder="Enter email" value="${user.email}" required>
                </div>
                <div class="form-group password-container">
                    <label for="password">Password</label>
                    <input type="password" class="form-control" id="password" name="password" placeholder="Password" value="${user.password}" required>
                </div>
                <div class="form-group">
                    <label for="phoneNumber">Phone Number</label>
                    <input type="text" class="form-control" id="phoneNumber" name="phoneNumber" placeholder="Phone Number" pattern="[0-9]{10,11}" title="Please input a number with 10 to 11 digits!" value="${user.phoneNumber}" required>
                </div>
                <div class="form-group">
                    <label for="name">Full Name</label>
                    <input type="text" class="form-control" id="name" name="name" placeholder="Full Name" value="${user.name}" required>
                </div>
                
                <div class="d-flex justify-content-between">
                    <button type="button" class="btn btn-danger" onclick="location.href = 'http://localhost:8080/BookingFootballTicket/views/login.jsp'">Back</button>
                    <button type="submit" class="btn btn-primary">Sign Up</button>
                </div>
            </form>
        </div>
        <script>
            function togglePasswordVisibility() {
                var passwordInput = document.getElementById("password");
                passwordInput.type = (passwordInput.type === 'password') ? 'text' : 'password';
            }
        </script>
    </body>
</html>
