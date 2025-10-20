<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Display Student Attendance</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            color: #333;
        }

        h1 {
            text-align: center;
            color: #444;
            margin-bottom: 20px;
        }

        form {
            background-color: #fff;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            text-align: center;
            width: 80%;
            max-width: 600px;
        }

        form label {
            display: block;
            margin: 10px 0 5px;
            font-weight: bold;
            color: #555;
        }

        form input, form button {
            width: 90%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
        }

        form button {
            background-color: #007bff;
            color: #fff;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease-in-out;
        }

        form button:hover {
            background-color: #0056b3;
        }

        table {
            width: 90%;
            margin: 20px 0;
            border-collapse: collapse;
            background: #fff;
            border: 1px solid #ddd;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        table th, table td {
            padding: 12px 15px;
            text-align: center;
            border: 1px solid #ddd;
        }

        table th {
            background-color: #007bff;
            color: #fff;
            font-weight: bold;
            text-transform: uppercase;
        }

        table tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        table tr:hover {
            background-color: #f1f1f1;
        }

        .present {
            color: #28a745;
            font-weight: bold;
        }

        .absent {
            color: #dc3545;
            font-weight: bold;
        }

        p {
            text-align: center;
            color: #666;
            margin: 20px 0;
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
        String sessionDate = request.getParameter("session_date");
        String studentIdParam = request.getParameter("student_id");
        String jdbcURL = "jdbc:mysql://localhost:3306/two";
        String dbUser = "root";
        String dbPassword = "Dhruthik10";
        Connection conn = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
        } catch (Exception e) {
            out.println("<p>Database connection error: " + e.getMessage() + "</p>");
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

                if (studentIdParam != null && !studentIdParam.trim().isEmpty()) {
                    query.append(" AND a.student_id = ?");
                }

                pstmt = conn.prepareStatement(query.toString());
                pstmt.setString(1, sessionDate);

                if (studentIdParam != null && !studentIdParam.trim().isEmpty()) {
                    pstmt.setInt(2, Integer.parseInt(studentIdParam));
                }

                rs = pstmt.executeQuery();

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
                if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
                if (pstmt != null) try { pstmt.close(); } catch (SQLException ignore) {}
                if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
            }
        }
    %>
</body>
</html>
