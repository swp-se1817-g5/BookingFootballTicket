<%-- 
    Document   : newjsp
    Created on : Jul 5, 2024, 2:46:50 PM
    Author     : thuat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Homepage Bán Vé Đá Bóng</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="https://kit.fontawesome.com/a076d05399.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .profile-image {
                width: 150px;
                height: 150px;
                background-color: green;
                color: white;
                font-size: 72px;
                display: flex;
                justify-content: center;
                align-items: center;
                border-radius: 50%;
                margin: auto;
            }
            .profile-container {
                max-width: 600px;
                margin: 50px auto;
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp" />
        <div class="container profile-container">
            <div class="card">
                <div class="card-header">
                    Edit details
                </div>
                <div class="card-body">
                    <form method="post" id="form_edit_details" action="userProfile" enctype="multipart/form-data">
                        <div class="form-group">
                            <label>Name*</label><br/>
                            <span id="nameError" class="text-danger"></span>
                            <input class="form-control" id="name" type="text" name="name" value="${user.name}" required/>
                            <p class="error"></p>
                        </div>
                        <div class="form-group">
                            <label>Email</label>
                            <input class="form-control" type="email" name="email" value="${user.email}" required readonly/>
                            <p class="error"></p>
                        </div>
                        <div class="form-group">
                            <label for="tel_no">Mobile Number*</label><br/>
                            <span id="phoneError" class="text-danger"></span>
                            <input class="form-control" id="phoneNumber" type="text" name="mobile" value="${user.phoneNumber}" />
                            <p class="error"></p>
                        </div>
                        <div class="form-group text-center">
                            <img class="img-account-profile rounded-circle mb-2" src="${user.avatar}" alt="">
                            <label for="profileImage" class="d-block mt-3">JPG or PNG no larger than 5 MB</label>
                            <input id="imageUploadInput" name="avatar" type="file" accept="image/*" class="form-control">
                        </div>
                        <div class="form-group text-center">
                            <a href="changepass" type="button" class="btn btn-primary mr-2" formId="form_edit_details" style="margin-right: 2px;">Đổi mật khẩu</a>
                            <button type="submit" class="btn btn-success mr-2" formId="form_edit_details">Lưu thay đổi</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- Footer -->
        <footer class="footer">
            <div class="container">
                <p>&copy; 2024 Your Website. All rights reserved.</p>
            </div>
        </footer>
        <script>
            function validateName() {
                var name = document.getElementById("name").value;
                var nameError = document.getElementById("nameError");
                if (name.trim() === "") {
                    nameError.textContent = "Name cannot be null or empty.";
                    nameError.classList.remove("valid");
                    nameError.classList.add("error");
                } else {
                    nameError.textContent = "";
                    nameError.classList.remove("error");
                    nameError.classList.add("valid");
                }
            }

            function validatePhoneNumber() {
                var phoneNumber = document.getElementById("phoneNumber").value;
                var phoneError = document.getElementById("phoneError");
                var phoneRegex = /^0[3-9][0-9]{8}$/;
                if (!phoneRegex.test(phoneNumber)) {
                    phoneError.textContent = "Invalid phone number format. It should follow VN phone number format.";
                    phoneError.classList.remove("valid");
                    phoneError.classList.add("error");
                } else {
                    phoneError.textContent = "";
                    phoneError.classList.remove("error");
                    phoneError.classList.add("valid");
                }
            }

            document.addEventListener("DOMContentLoaded", function () {
                document.getElementById("name").addEventListener("input", validateName);
                document.getElementById("phoneNumber").addEventListener("input", validatePhoneNumber);
            });
        </script>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    </body>
</html>
