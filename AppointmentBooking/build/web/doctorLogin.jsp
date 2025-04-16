<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doctor Login</title>
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
        .login-container {
            width: 100%;
            max-width: 350px;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background-color: #ffffff;
            text-align: center;
        }
        .login-container h2 {
            margin: 0;
            margin-bottom: 20px;
            color: #333;
        }
        .login-container p {
            color: #666;
            margin-bottom: 20px;
        }
        .input-field {
            width: calc(100% - 24px);
            padding: 12px;
            margin: 8px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
            box-sizing: border-box;
        }
        .login-button {
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
        .login-button:hover {
            background-color: #1976D2;
        }
        .register-option {
            margin-top: 20px;
            color: #333;
            font-size: 14px;
        }
        .register-option a {
            color: #2196F3;
            text-decoration: none;
        }
        .register-option a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <div class="login-container">
        <h2>Doctor Login</h2>
        <p>Welcome back! Please enter your credentials to access your account.</p>

        <form action="doctorLoginServlet" method="post">
            <input type="text" class="input-field" name="username" placeholder="Username" required>
            <input type="password" class="input-field" name="password" placeholder="Password" required>
            <button type="submit" class="login-button">Login</button>
        </form>

        <div class="register-option">
            <p>New to HealthCare Hospital? <a href="doctorRegister.jsp">Register here</a></p>
        </div>
    </div>

</body>
</html>