<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Delete Student</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #f093fb, #f5576c);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
        }

        .container {
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
            text-align: center;
            width: 100%;
            max-width: 400px;
        }

        h1 {
            color: #333;
            margin-bottom: 20px;
        }

        form {
            margin: 0;
        }

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 10px;
        }

        input[type="number"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1rem;
        }

        input[type="number"]:focus {
            border-color: #f5576c;
            outline: none;
            box-shadow: 0 0 5px rgba(245, 87, 108, 0.5);
        }

        button {
            background: linear-gradient(135deg, #ff512f, #dd2476);
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 1rem;
            cursor: pointer;
            transition: 0.3s ease;
        }

        button:hover {
            background: linear-gradient(135deg, #dd2476, #ff512f);
        }

        .message {
            margin-top: 10px;
            font-weight: bold;
            color: #4CAF50;
        }

        .error {
            margin-top: 10px;
            font-weight: bold;
            color: #ff4d4d;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Delete Student</h1>
        <form method="post">
            <label for="studentID">Student ID:</label>
            <input type="number" id="studentID" name="studentID" required>
            <button type="submit">Delete Student</button>
        </form>

        <%
            String dbURL = "jdbc:mysql://localhost:3306/two";
            String dbUser = "root";
            String dbPassword = "Dhruthik10";

            if (request.getMethod().equalsIgnoreCase("POST")) {
                String studentID = request.getParameter("studentID");

                if (studentID != null && !studentID.isEmpty()) {
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection connection = DriverManager.getConnection(dbURL, dbUser, dbPassword);

                        String sql = "DELETE FROM Attendance WHERE student_id = ?";
                        PreparedStatement statement = connection.prepareStatement(sql);
                        statement.setInt(1, Integer.parseInt(studentID));
                        statement.executeUpdate();

                        // Then delete from Students table
                        sql = "DELETE FROM Students WHERE student_id = ?";
                        statement = connection.prepareStatement(sql);
                        statement.setInt(1, Integer.parseInt(studentID));
                        int rows = statement.executeUpdate();

                        if (rows > 0) {
                            out.println("<p class='message'>Student successfully deleted!</p>");
                        } else {
                            out.println("<p class='error'>No student found with the given ID.</p>");
                        }

                        statement.close();
                        connection.close();
                    } catch (SQLException e) {
                        out.println("<p class='error'>Database error: " + e.getMessage() + "</p>");
                    } catch (ClassNotFoundException e) {
                        out.println("<p class='error'>Driver not found: " + e.getMessage() + "</p>");
                    }
                } else {
                    out.println("<p class='error'>Please provide a valid Student ID.</p>");
                }
            }
        %>
    </div>
</body>
</html>
