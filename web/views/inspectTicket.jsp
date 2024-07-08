<%-- 
    Document   : inspectorTicket
    Created on : Jul 8, 2024, 1:56:35 AM
    Author     : nguye
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>QR Code Reader from Image</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/jsqr/dist/jsQR.js"></script>
    </head>
    <body>
        <div style="margin-bottom: 160px">
            <jsp:include page="header.jsp"/>
        </div>
        <div class="container mt-5">
            <h1 class="text-center">QR Code Reader from Image</h1>
            <form action="inspectTicket" method="post" enctype="multipart/form-data" class="mt-4">
                <div class="form-group">
                    <label for="fileInput">Upload QR Code Image</label>
                    <input name="qrcode" type="file" class="form-control-file" id="fileInput">
                </div>
                <div id="result" class="mt-3"></div>
                <button type="submit" class="btn btn-primary">Submit</button>
            </form>

            <h2 class="mt-5">Scanned Tickets</h2>
            <table class="table table-striped mt-3">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Ticket Info</th>
                    </tr>
                </thead>
                <tbody id="scannedTickets">
                    <!-- Scanned tickets will be appended here -->
                </tbody>
            </table>
        </div>
        <div class="mt-5">
            <jsp:include page="footer.jsp"/>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script>
            document.querySelector('form').addEventListener('submit', function(event) {
                event.preventDefault(); // Prevent the form from submitting normally

                const fileInput = document.getElementById('fileInput');
                const file = fileInput.files[0];
                
                if (file) {
                    const reader = new FileReader();
                    reader.onload = function() {
                        const img = new Image();
                        img.onload = function() {
                            const canvas = document.createElement('canvas');
                            canvas.width = img.width;
                            canvas.height = img.height;
                            const context = canvas.getContext('2d');
                            context.drawImage(img, 0, 0);
                            const imageData = context.getImageData(0, 0, canvas.width, canvas.height);
                            const code = jsQR(imageData.data, imageData.width, imageData.height);

                            if (code) {
                                const ticketTable = document.getElementById('scannedTickets');
                                const newRow = ticketTable.insertRow();
                                newRow.insertCell(0).textContent = ticketTable.rows.length + 1;
                                newRow.insertCell(1).textContent = code.data;
                            } else {
                                alert('No QR code found.');
                            }
                        };
                        img.src = reader.result;
                    };
                    reader.readAsDataURL(file);
                } else {
                    alert('Please select a file.');
                }
            });
        </script>
    </body>
</html>
