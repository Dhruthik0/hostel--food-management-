<%@ page import="java.sql.*, java.io.*, java.time.LocalDate" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Marking Validation Page</title>
    <style>
        /* General styles */
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #ff7eb3, #8b72ff, #72dbff);
            background-size: 400% 400%;
            animation: gradientAnimation 15s ease infinite;
            color: #333;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            text-align: center;
        }

        /* Keyframes for animated gradient */
        @keyframes gradientAnimation {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        /* Container for the result message */
        .container {
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
            padding: 30px;
            max-width: 600px;
            width: 90%;
            margin: 20px;
            text-align: center;
        }

        /* Success message */
        .container h3 {
            color: #4caf50;
            font-size: 24px;
            margin-bottom: 20px;
        }

        /* Error message */
        .container h3.error {
            color: #f44336;
        }

        /* Paragraphs */
        .container p {
            font-size: 18px;
            color: #555;
            margin: 10px 0;
        }

        /* Link button */
        .container a {
            display: inline-block;
            text-decoration: none;
            font-size: 16px;
            color: #fff;
            background: #007bff;
            padding: 10px 20px;
            border-radius: 5px;
            margin-top: 20px;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        /* Hover effect for link button */
        .container a:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }
    </style>
</head>
<body>
<%
    // Get the form data
    String studentId = request.getParameter("student_id");
    String sessionName = request.getParameter("session");
    String attendanceStatus = request.getParameter("attendance_status");

    // Get the current date using java.time.LocalDate (modern approach)
    LocalDate currentDate = LocalDate.now();  // Gets the current date (YYYY-MM-DD)
    
    // Convert currentDate to a string in the format of 'YYYY-MM-DD'
    String sessionDate = currentDate.toString();

    // Database connection details
    String url = "jdbc:mysql://localhost:3306/two"; // Change to your DB details
    String username = "root"; // Change to your DB username
    String password = "Dhruthik10"; // Change to your DB password

    Connection connection = null;
    PreparedStatement statement = null;

    try {
        // Load MySQL JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Establish connection
        connection = DriverManager.getConnection(url, username, password);

        // SQL to insert attendance record with the current date
        String insertQuery = "INSERT INTO Attendance (student_id, session_name, session_date, attendance_status) VALUES (?, ?, ?, ?)";

        // Create PreparedStatement
        statement = connection.prepareStatement(insertQuery);
        statement.setInt(1, Integer.parseInt(studentId)); 
        statement.setString(2, sessionName); 
        statement.setString(3, sessionDate); 
        statement.setInt(4, Integer.parseInt(attendanceStatus)); // Mark attendance as present (1)

        // Execute the query
        int rowsAffected = statement.executeUpdate();

        if (rowsAffected > 0) {
%>
<div class="container">
    <h3>Attendance Marked Successfully!</h3>
    <p>Student ID: <%= studentId %></p>
    <p>Session: <%= sessionName %></p>
    <p>Session Date: <%= sessionDate %></p>
    <a href="Marking.jsp">Go back to mark more attendance</a>
</div>
<%
        } else {
%>
<div class="container">
    <h3 class="error">Error: Attendance could not be marked.</h3>
    <a href="Marking.jsp">Go back to mark more attendance</a>
</div>
<%
        }
    } catch (Exception e) {
%>
<div class="container">
    <h3 class="error">Error: <%= e.getMessage() %></h3>
    <a href="Marking.jsp">Go back to mark more attendance</a>
</div>
<%
        e.printStackTrace();
    } finally {
        // Clean up resources
        try {
            if (statement != null) statement.close();
            if (connection != null) connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
</body>
</html>
