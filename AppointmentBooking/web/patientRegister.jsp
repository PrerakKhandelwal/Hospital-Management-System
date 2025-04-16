<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Patient Registration</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            padding: 0;
            background-color: #f4f6f9;
        }
        .register-container {
            width: 100%;
            max-width: 400px;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background-color: #ffffff;
            text-align: center;
        }
        .register-container h2 {
            margin: 0;
            margin-bottom: 20px;
            color: #333;
        }
        .register-container p {
            color: #666;
            margin-bottom: 20px;
        }
        .input-field, .gender-select {
            width: calc(100% - 24px);
            padding: 12px;
            margin: 8px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
            box-sizing: border-box;
        }
        .register-button {
            width: calc(100% - 24px);
            padding: 12px;
            margin-top: 20px;
            border: none;
            border-radius: 4px;
            background-color: #4CAF50;
            color: white;
            font-size: 16px;
            cursor: pointer;
            box-sizing: border-box;
        }
        .register-button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

    <div class="register-container">
        <h2>Patient Registration</h2>
        <p>Please fill in your details to register as a patient.</p>

        <form action="patientRegisterServlet" method="post">
            <input type="text" class="input-field" name="name" placeholder="Full Name" required>
            <input type="number" class="input-field" name="age" placeholder="Age" required>
            
            <!-- Gender Dropdown Field -->
            <select class="gender-select" name="gender" required>
                <option value="" disabled selected>Select Gender</option>
                <option value="Male">Male</option>
                <option value="Female">Female</option>
                <option value="Other">Other</option>
            </select>

            <input type="tel" class="input-field" name="phone" placeholder="Phone Number" required>
            <input type="text" class="input-field" name="username" placeholder="Username" required>
            <input type="password" class="input-field" name="password" placeholder="Password" required>
            
            <button type="submit" class="register-button">Register</button>
        </form>
    </div>

</body>
</html>