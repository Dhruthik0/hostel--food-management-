<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Student</title>
    <style>
        /* General Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(135deg, #89f7fe, #66a6ff);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .container {
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 400px;
            text-align: center;
        }

        h1 {
            margin-bottom: 20px;
            font-size: 1.8rem;
            color: #333;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            text-align: left;
        }

        input {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1rem;
        }

        input:focus {
            border-color: #66a6ff;
            box-shadow: 0 0 5px rgba(102, 166, 255, 0.5);
            outline: none;
        }

        button {
            background: linear-gradient(135deg, #4CAF50, #3e8e41);
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-size: 1rem;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        button:hover {
            background: linear-gradient(135deg, #3e8e41, #4CAF50);
            transform: scale(1.05);
        }

        button:active {
            transform: scale(0.98);
        }

        .message {
            color: #4CAF50;
            font-weight: bold;
            margin-top: 10px;
        }

        .error {
            color: #ff4d4d;
            font-weight: bold;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>[ Add New Student ]</h1>
        <form method="post">
            <label for="studentID">Student ID:</label>
            <input type="number" id="studentID" name="studentID" required>

            <label for="studentName">Student Name:</label>
            <input type="text" id="studentName" name="studentName" required>

            <label for="user_id">User ID:</label>
            <input type="text" id="user_id" name="user_id" required>

            <label for="pass">Password:</label>
            <input type="password" id="pass" name="pass" required>

            <button type="submit">Add Student</button>
        </form>
        <%
            String dbURL = "jdbc:mysql://localhost:3306/two";
            String dbUser = "root";
            String dbPassword = "Dhruthik10";

            if (request.getMethod().equalsIgnoreCase("POST")) {
                String studentID = request.getParameter("studentID");
                String studentName = request.getParameter("studentName");
                String user_id = request.getParameter("user_id");
                String pass = request.getParameter("pass");

                if (studentID != null && studentName != null && user_id != null && pass != null) {
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection connection = DriverManager.getConnection(dbURL, dbUser, dbPassword);

                        // Insert into Students table
                        String sql = "INSERT INTO Students (student_id, student_name) VALUES (?, ?)";
                        PreparedStatement statement = connection.prepareStatement(sql);
                        statement.setInt(1, Integer.parseInt(studentID));
                        statement.setString(2, studentName);
                        statement.executeUpdate();

                        // Insert into User table
                        sql = "INSERT INTO user (id, pass) VALUES (?, ?)";
                        statement = connection.prepareStatement(sql);
                        statement.setInt(1, Integer.parseInt(user_id));
                        statement.setString(2, pass);
                        int rows = statement.executeUpdate();

                        if (rows > 0) {
                            out.println("<p class='message'>Student added successfully!</p>");
                        }

                        statement.close();
                        connection.close();
                    } catch (SQLIntegrityConstraintViolationException e) {
                        out.println("<p class='error'>Try with a different ID. The entered ID already exists.</p>");
                    } catch (SQLException e) {
                        out.println("<p class='error'>Database error: " + e.getMessage() + "</p>");
                    } catch (ClassNotFoundException e) {
                        out.println("<p class='error'>Driver not found: " + e.getMessage() + "</p>");
                    }
                } else {
                    out.println("<p class='error'>Invalid input!</p>");
                }
            }
        %>
    </div>
</body>
</html>
