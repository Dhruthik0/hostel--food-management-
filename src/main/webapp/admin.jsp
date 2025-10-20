<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Attendance Management</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: lightgrey; /* Light neutral background for a professional look */
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            color: #333;
            text-align: center;
            padding: 20px;
        }

        h1 {
            font-size: 2.5rem;
            margin-bottom: 20px;
            color: #3b3b3b;
            text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.1);
            animation: fadeIn 1s ease-out;
        }

        p {
            font-size: 1.1rem;
            color: #555;
            margin-bottom: 40px;
            animation: fadeIn 1s ease-out 0.5s;
        }

        .button-container {
            display: flex;
            justify-content: center;
            gap: 20px;
            flex-wrap: wrap;
            animation: fadeIn 1s ease-out 1s;
        }

        .button-container a {
            display: inline-block;
            padding: 14px 28px;
            font-size: 1.1rem;
            color: white;
            background-color: #4CAF50; /* Professional green for the buttons */
            border-radius: 30px;
            text-decoration: none;
            transition: all 0.3s ease;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            cursor: pointer;
            animation: buttonAnimation 0.6s ease-out;
        }

        .button-container a:hover {
            background-color: #45a049; /* Slightly darker green on hover */
            transform: translateY(-4px); /* Button lift effect */
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
        }

        .button-container a:active {
            background-color: #388e3c; /* Darker green on click */
            transform: translateY(0);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        /* Button animation on page load */
        @keyframes buttonAnimation {
            0% {
                transform: scale(0);
                opacity: 0;
            }
            100% {
                transform: scale(1);
                opacity: 1;
            }
        }

        /* Fade-in animation for text and buttons */
        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            h1 {
                font-size: 2rem;
            }

            p {
                font-size: 1rem;
            }

            .button-container {
                flex-direction: column;
                gap: 15px;
            }
        }
    </style>
</head>
<body>
    <div>
        <h1>Student Attendance Management</h1>
        <p>Welcome! Please choose an action:</p>
        <div class="button-container">
            <a href="viewAttendance.jsp">View Attendance</a>
            <a href="NewStudent.jsp">Add Student</a>
            <a href="deleteStudent.jsp">Delete Student</a>
        </div>
    </div>
</body>
</html>
