<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Confirm Your Payment</title>
    <link rel="stylesheet" href="assets/css/style.css">
    <style>
        /* Styling */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f8fb;
            color: #333;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        header {
            background-color: #2196F3;
            color: white;
            padding: 20px;
            width: 100%;
            text-align: center;
        }

        .payment-form, .card-details {
            background-color: white;
            width: 90%;
            max-width: 600px;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
        }

        .payment-details p, .card-details p {
            font-size: 1.1em;
            margin: 10px 0;
        }

        button {
            background-color: #2196F3;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
        }

        input[type="text"], input[type="number"] {
            width: 100%;
            padding: 8px;
            margin: 8px 0;
            border-radius: 4px;
            border: 1px solid #ddd;
        }
    </style>
</head>
<body>
    <header>
        <h1>Confirm Your Payment</h1>
    </header>

    <%
        String errorMessage = request.getParameter("error");
        String successMessage = (String) request.getAttribute("successMessage");
        String doctorName = (String) request.getAttribute("doctorName");
    %>

    <!-- Display Error Message if Present -->
    <%
        if (errorMessage != null && !errorMessage.isEmpty()) {
    %>
        <div class="message error-message">
            <p><%= errorMessage %></p>
        </div>
    <%
        }
    %>

    <!-- Display Success Message if Present -->
    <%
        if (successMessage != null && !successMessage.isEmpty()) {
    %>
        <div class="message success-message">
            <p><%= successMessage %></p>
        </div>
    <%
        }
    %>

    <!-- Payment Confirmation Form -->
    <div class="payment-form">
        <form action="PaymentServlet" method="POST">
            <!-- Hidden fields to pass necessary details to the PaymentServlet -->
            <input type="hidden" name="doctorId" value="<%= request.getAttribute("doctorId") %>">
            <input type="hidden" name="doctorName" value="<%= request.getAttribute("doctorName") %>">
            <input type="hidden" name="date" value="<%= request.getAttribute("date") %>">
            <input type="hidden" name="slotNumber" value="<%= request.getAttribute("slotNumber") %>">
            <input type="hidden" name="patientId" value="<%= request.getAttribute("patientId") %>">
            <input type="hidden" name="consultationFee" value="500">

            <h2>Booking Details</h2>
            <div class="payment-details">
                <p><strong>Doctor Name:</strong> <%= doctorName %></p>
                <p><strong>Doctor ID:</strong> <%= request.getAttribute("doctorId") %></p>
                <p><strong>Appointment Date:</strong> <%= request.getAttribute("date") %></p>
                <p><strong>Slot Number:</strong> <%= request.getAttribute("slotNumber") %></p>
                <p><strong>Patient ID:</strong> <%= request.getAttribute("patientId") %></p>
                <p><strong>Consultation Fee:</strong> INR 500</p>
            </div>

            <!-- Card Details Section -->
            <div class="card-details">
                <h3>Enter Your Card Details</h3>
                <p>
                    <label for="cardNumber">Card Number:</label>
                    <input type="text" id="cardNumber" name="cardNumber" required>
                </p>
                <p>
                    <label for="expiryDate">Expiry Date (MM/YY):</label>
                    <input type="text" id="expiryDate" name="expiryDate" required>
                </p>
                <p>
                    <label for="cvv">CVV:</label>
                    <input type="number" id="cvv" name="cvv" required>
                </p>
            </div>

            <button type="submit">Confirm Booking</button>
        </form>
    </div>
</body>
</html>