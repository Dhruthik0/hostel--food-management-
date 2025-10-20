<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <!-- Linking Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <style>
        /* Reset and Basic Styling */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif; /* Using Poppins font */
            background-image: url('https://st2.depositphotos.com/1309454/7143/v/950/depositphotos_71435831-stock-illustration-food-icons-thin-line-background.jpg'); /* Food icon image as background */
            background-size: cover; /* Cover the entire screen */
            background-position: center; /* Center the background image */
            background-attachment: fixed; /* Keep the image fixed when scrolling */
            color: #333;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            animation: fadeIn 1.5s ease-in-out;
        }

        /* Keyframe for page load fade-in effect */
        @keyframes fadeIn {
            0% {
                opacity: 0;
            }
            100% {
                opacity: 1;
            }
        }

        .container {
            text-align: center;
            background:rgba(255, 255, 255, 0.8); /* White background with transparency */
            box-shadow: 0 12px 24px rgba(0, 0, 0, 0.15);
            padding: 50px;
            border-radius: 10px;
            width: 100%;
            max-width: 450px;
            transform: scale(0.95);
            animation: zoomIn 0.6s ease-in-out forwards;
        }

        /* Keyframe for zoom-in effect */
        @keyframes zoomIn {
            0% {
                transform: scale(0.8);
                opacity: 0;
            }
            100% {
                transform: scale(1);
                opacity: 1;
            }
        }

        h1 {
            font-size: 2.5rem;
            color: #333;
            margin-bottom: 30px;
            letter-spacing: 1px;
            font-weight: 600; /* Bold font weight for emphasis */
            animation: slideIn 1s ease-out;
        }

        /* Keyframe for heading slide-in effect */
        @keyframes slideIn {
            0% {
                transform: translateY(-30px);
                opacity: 0;
            }
            100% {
                transform: translateY(0);
                opacity: 1;
            }
        }

        /* Button Style */
        button {
            background: linear-gradient(135deg, #4CAF50, #45a049); /* Gradient background for buttons */
            color: white;
            border: 2px solid #4CAF50;
            padding: 16px 32px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 18px;
            margin: 12px 0;
            cursor: pointer;
            border-radius: 25px;
            width: 100%;
            transition: all 0.3s ease;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
            font-family: 'Poppins', sans-serif; /* Applying the same font for buttons */
        }

        /* Hover Effect */
        button:hover {
            background: linear-gradient(135deg, #45a049, #4CAF50);
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
        }

        /* Active Effect */
        button:active {
            background: #388e3c;
            transform: translateY(0);
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
        }

        /* Media Queries for responsiveness */
        @media (max-width: 480px) {
            .container {
                padding: 30px;
            }

            h1 {
                font-size: 2rem;
            }

            button {
                font-size: 16px;
                padding: 14px 28px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome to the Login Portal</h1>
        <button onclick="location.href='login.jsp'">Student Login</button>
        <button onclick="location.href='login.jsp'">Admin Login</button>
    </div>
</body>
</html>