<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Display Student Attendance</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        h1 {
            color: #333;
        }
        form {
            margin-bottom: 20px;
        }
        label {
            margin-right: 10px;
        }
        input, select {
            margin-right: 20px;
            padding: 5px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }
        table, th, td {
            border: 1px solid #aaa;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        .present {
            color: green;
            font-weight: bold;
        }
        .absent {
            color: red;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <h1>Student Attendance Records</h1>
    <form method="get" action="viewAttendance.jsp">
        <label for="session_date">Session Date:</label>
        <input type="date" id="session_date" name="session_date" required>
        
        <label for="student_id">Student ID (Optional):</label>
        <input type="number" id="student_id" name="student_id" min="1">
        
        <button type="submit">View Attendance</button>
    </form>

    <%
        // Check if the form is submitted
        String sessionDate = request.getParameter("session_date");
        String studentIdParam = request.getParameter("student_id");
        
        // Database connection parameters
        String jdbcURL = "jdbc:mysql://localhost:3306/two";
        String dbUser = "root";         // Replace with your DB username
        String dbPassword = "Dhruthik10"; // Replace with your DB password

        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
        } catch (Exception e) {
            out.println("Database connection error: " + e.getMessage());
        }
    

        if (sessionDate != null && !sessionDate.trim().isEmpty()) {
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            try {
                StringBuilder query = new StringBuilder(
                    "SELECT a.session_name, a.session_date, a.attendance_status, s.student_id, s.student_name " +
                    "FROM Attendance a " +
                    "JOIN Students s ON a.student_id = s.student_id " +
                    "WHERE a.session_date = ?"
                );

                // If student_id is provided, add it to the query
                if (studentIdParam != null && !studentIdParam.trim().isEmpty()) {
                    query.append(" AND a.student_id = ?");
                }

                pstmt = conn.prepareStatement(query.toString());
                pstmt.setString(1, sessionDate);

                if (studentIdParam != null && !studentIdParam.trim().isEmpty()) {
                    pstmt.setInt(2, Integer.parseInt(studentIdParam));
                }

                rs = pstmt.executeQuery();

                // Check if records exist
                if (!rs.isBeforeFirst()) {
                    out.println("<p>No attendance records found for the given criteria.</p>");
                } else {
    %>
                    <table>
                        <tr>
                            <th>Student ID</th>
                            <th>Student Name</th>
                            <th>Session</th>
                            <th>Date</th>
                            <th>Status</th>
                        </tr>
                        <%
                            while (rs.next()) {
                                int studentId = rs.getInt("student_id");
                                String studentName = rs.getString("student_name");
                                String sessionName = rs.getString("session_name");
                                Date date = rs.getDate("session_date");
                                int status = rs.getInt("attendance_status");
                                String statusText = (status == 1) ? "Present" : "Absent";
                                String statusClass = (status == 1) ? "present" : "absent";
                        %>
                            <tr>
                                <td><%= studentId %></td>
                                <td><%= studentName %></td>
                                <td><%= sessionName %></td>
                                <td><%= date %></td>
                                <td class="<%= statusClass %>"><%= statusText %></td>
                            </tr>
                        <%
                            }
                        %>
                    </table>
    <%
                }
            } catch (Exception e) {
                out.println("<p>Error retrieving attendance records: " + e.getMessage() + "</p>");
            } finally {
                // Close resources
                if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
                if (pstmt != null) try { pstmt.close(); } catch (SQLException ignore) {}
                if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
            }
        }
    %>
</body>
</html>
