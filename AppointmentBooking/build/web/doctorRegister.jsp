<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doctor Registration</title>
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
        .register-container {
            width: 600px;
            padding: 20px;
            margin-top: 50px;
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
        .form-row {
            display: flex;
            gap: 10px;
            justify-content: space-between;
            margin-bottom: 15px;
        }
        .input-field {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
            box-sizing: border-box;
        }
        .full-width {
            width: 100%;
        }
        .register-button {
            width: calc(100% - 24px);
            padding: 12px;
            margin-top: 15px;
            border: none;
            border-radius: 4px;
            background-color: #2196F3;
            color: white;
            font-size: 16px;
            cursor: pointer;
            box-sizing: border-box;
        }
        .register-button:hover {
            background-color: #1976d2;
        }
    </style>
</head>
<body>

    <div class="register-container">
        <h2>Doctor Registration</h2>
        <p>Complete your details to register as a doctor.</p>

        <form action="doctorRegisterServlet" method="post">
            <!-- Name and Age -->
            <div class="form-row">
                <input type="text" class="input-field" name="name" placeholder="Full Name" required>
                <input type="number" class="input-field" name="age" placeholder="Age" required>
            </div>

            <!-- Gender and Phone Number -->
            <div class="form-row">
                <select class="input-field" name="gender" required>
                    <option value="" disabled selected>Gender</option>
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                    <option value="Other">Other</option>
                </select>
                <input type="tel" class="input-field" name="phone" placeholder="Phone Number" required>
            </div>

            <!-- Email and Address -->
            <div class="form-row">
                <input type="email" class="input-field" name="email" placeholder="Email Address" required>
                <input type="text" class="input-field" name="address" placeholder="Address" required>
            </div>

            <!-- License Number and Specialty Dropdown -->
            <div class="form-row">
                <input type="text" class="input-field" name="license" placeholder="License Number" required>
                <select class="input-field" name="specialty" required>
                    <option value="" disabled selected>Specialty</option>
                    <option value="Physician">Physician</option>
                    <option value="Cardiologist">Cardiologist</option>
                    <option value="Dermatologist">Dermatologist</option>
                    <option value="ENT">ENT</option>
                    <option value="Pediatrician">Pediatrician</option>
                    <option value="Orthopedist">Orthopedist</option>
                </select>
            </div>

            <!-- Qualification and Experience -->
            <div class="form-row">
                <input type="text" class="input-field" name="qualification" placeholder="Qualification" required>
                <input type="number" class="input-field" name="experience" placeholder="Experience (Years)" required>
            </div>

            <!-- Username and Password -->
            <div class="form-row">
                <input type="text" class="input-field" name="username" placeholder="Username" required>
                <input type="password" class="input-field" name="password" placeholder="Password" required>
            </div>
            
            <button type="submit" class="register-button">Register</button>
        </form>
    </div>

</body>
</html>