<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            flex-direction: column;
            align-items: center;
            margin: 0;
            padding: 0;
            background-color: #f4f6f9;
        }
        .dashboard-container {
            width: 300px;
            padding: 20px;
            margin-top: 50px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background-color: #ffffff;
            text-align: center;
        }
        .dashboard-container h2 {
            color: #333;
            margin-bottom: 20px;
        }
        .button {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            color: white;
        }
        .button.view-doctors {
            background-color: #4CAF50;
        }
        .button.view-appointments {
            background-color: #2196F3;
        }
        .button:hover {
            opacity: 0.9;
        }
    </style>
</head>
<body>

    <div class="dashboard-container">
        <h2>Admin Dashboard</h2>
        <p>Welcome, Admin. Use the dashboard to manage doctors and patient appointments effectively.</p>
        <button class="button view-doctors" onclick="window.location.href='viewDoctor.jsp'">View Doctors</button>
        <button class="button view-appointments" onclick="window.location.href='viewAppointmentsDoctor.jsp'">View Patient Appointments</button>
    </div>

</body>
</html>
