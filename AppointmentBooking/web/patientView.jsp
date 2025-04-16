<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Patient Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            flex-direction: column;
            align-items: center;
            margin: 0;
            padding: 20px;
            background-color: #f4f6f9;
        }
        .welcome-message {
            margin-top: 20px;
            color: #333;
            font-size: 24px;
        }
        .health-reminder {
            margin-top: 10px;
            color: #666;
            font-size: 16px;
            text-align: center;
            max-width: 500px;
        }
        .specialty-section {
            margin-top: 20px;
            font-size: 16px;
            color: #333;
            text-align: center;
        }
        .specialty-list {
            list-style-type: none;
            padding: 0;
            margin: 10px 0 0 0;
        }
        .specialty-list li {
            color: #555;
        }
        .button-container {
            margin-top: 30px;
            display: flex;
            gap: 15px;
        }
        .action-button, .logout-button {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            color: white;
        }
        .book-button { background-color: #4CAF50; }
        .view-button { background-color: #2196F3; }
        .logout-button {
            background-color: #FFC107;
            margin-top: 40px;
        }
        .book-button:hover { background-color: #45a049; }
        .view-button:hover { background-color: #1976D2; }
        .logout-button:hover { background-color: #FFA000; }
    </style>
</head>
<body>

    <div class="welcome-message">
        Welcome, <span id="patientName">[Patient Name]</span>!
    </div>

    <div class="health-reminder">
        It's always a good idea to take care of your health. Regular check-ups and timely care help you lead a healthier and happier life.
    </div>

    <div class="specialty-section">
        <h3>Our Specialties</h3>
        <ul class="specialty-list">
            <li>Physician</li>
            <li>Cardiologist</li>
            <li>Dermatologist</li>
            <li>ENT Specialist</li>
            <li>Pediatrician</li>
            <li>Orthopedist</li>
        </ul>
    </div>

    <div class="button-container">
        <button class="action-button book-button" onclick="window.location.href='appointment.jsp'">Book Appointment</button>
        <button class="action-button view-button" onclick="window.location.href='viewAppointments.jsp'">View Appointments</button>
    </div>

    <button class="logout-button" onclick="window.location.href='logout.jsp'">Logout</button>

</body>
</html>