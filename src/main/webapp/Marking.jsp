<!DOCTYPE html>
<html>
<head>
    <title>Mark Attendance</title>
    <style>
        /* General Body Styling */
        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(135deg, #2C3E50, #4CA1AF); /* Gradient background */
            color: #fff;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            animation: fadeIn 2s ease-in-out; /* Fade-in effect */
        }

        /* Animation for fading in the page */
        @keyframes fadeIn {
            0% {
                opacity: 0;
            }
            100% {
                opacity: 1;
            }
        }

        /* Form Container */
        .form-container {
            background: rgba(255, 255, 255, 0.95); /* Slight transparency for the background */
            padding: 40px 30px;
            border-radius: 15px;
            box-shadow: 0 12px 30px rgba(0, 0, 0, 0.1), 0 4px 8px rgba(0, 0, 0, 0.2); /* Multiple shadows for depth */
            width: 100%;
            max-width: 600px;
            text-align: center;
            box-sizing: border-box;
            animation: slideUp 0.5s ease-out; /* Slide-in animation */
            backdrop-filter: blur(10px); /* Adds a blur effect for a frosted-glass look */
            overflow: hidden;
        }

        /* Slide-up animation */
        @keyframes slideUp {
            from {
                transform: translateY(20px);
                opacity: 0;
            }
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }

        /* Form Header */
        h2 {
            color: #34495E;
            font-size: 32px;
            margin-bottom: 20px;
            text-transform: uppercase;
            letter-spacing: 2px;
            font-weight: bold;
            animation: fadeInText 1s ease-out;
        }

        /* Fade-in animation for the header */
        @keyframes fadeInText {
            0% {
                opacity: 0;
            }
            100% {
                opacity: 1;
            }
        }

        /* Form Elements */
        label {
            display: block;
            font-size: 18px;
            margin-bottom: 8px;
            color: #34495E;
            text-align: left;
        }

        input[type="text"], select {
            width: 50%;
            padding: 12px;
            margin-bottom: 20px;
            border-radius: 8px;
            border: 1px solid #ccc;
            font-size: 16px;
            box-sizing: border-box;
            transition: all 0.3s ease;
            background-color: #f9f9f9;
        }

        input[type="text"]:focus, select:focus {
            border: 1px solid #3498DB; /* Blue border on focus */
            outline: none;
            background-color: #fff; /* Slightly lighter background on focus */
            box-shadow: 0 0 8px rgba(52, 152, 219, 0.3); /* Glow effect on focus */
        }

        /* Radio buttons and labels */
        input[type="radio"] {
            margin-right: 12px;
        }

        label[for="present"], label[for="absent"] {
            display: inline-block;
            margin-right: 25px;
            font-size: 18px;
            color: #34495E;
            text-align: left;
        }

        /* Submit Button */
        input[type="submit"] {
            background-color: #3498DB; /* Blue background */
            color: white;
            padding: 15px 25px;
            font-size: 18px;
            border: none;
            border-radius: 30px;
            cursor: pointer;
            width: 100%;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        /* Submit Button Hover Effect */
        input[type="submit"]:hover {
            background-color: #2980B9; /* Darker blue */
            transform: translateY(-2px); /* Button lift effect */
        }

        /* Optional Table Styling (for future use) */
        table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
        }
        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #34495E;
            color: white;
        }

    </style>
</head>
<body>
    <div class="form-container">
        <h2>Mark Attendance</h2>
        <form action="MarkingValidation.jsp" method="POST">
            <label for="student_id">Student ID:</label>
            <input type="text" id="student_id" name="student_id" required><br>

            <label for="session">Session:</label>
            <select id="session" name="session" required>
                <option value="Breakfast">Breakfast</option>
                <option value="Lunch">Lunch</option>
                <option value="Dinner">Dinner</option>
            </select><br>

            <label>Attendance Status:</label><br>
            <input type="radio" id="present" name="attendance_status" value="1" required>
            <label for="present">Present</label>
            <input type="radio" id="absent" name="attendance_status" value="0" required>
            <label for="absent">Absent</label><br><br>

            <input type="submit" value="Submit Attendance">
        </form>
    </div>
</body>
</html>