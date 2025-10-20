<%@ page import="java.sql.*, java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Student List</title>
    <style>
        table {
            width: 50%;
            margin: 20px;
            border-collapse: collapse;
        }
        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <h2>Student List</h2>
    <table>
        <thead>
            <tr>
                <th>Student ID</th>
                <th>Student Name</th>
            </tr>
        </thead>
        <tbody>
            <%
                // Database connection setup
                String url = "jdbc:mysql://localhost:3306/two"; 
                String username = "root"; 
                String password = "Dhruthik10"; 
                
                Connection connection = null;
                Statement statement = null;
                ResultSet resultSet = null;
                
                try {
                    // Establishing the database connection
                    Class.forName("com.mysql.cj.jdbc.Driver"); // MySQL JDBC driver
                    connection = DriverManager.getConnection(url, username, password);
                    
                    // SQL query to get all students
                    String query = "SELECT student_id, student_name FROM Students"; // Replace 'Students' with your table name
                    statement = connection.createStatement();
                    resultSet = statement.executeQuery(query);
                    
                    // Loop through the result set and display the data
                    while (resultSet.next()) {
                        int studentId = resultSet.getInt("student_id");
                        String studentName = resultSet.getString("student_name");
            %>
            <tr>
                <td><%= studentId %></td>
                <td><%= studentName %></td>
            </tr>
            <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    // Closing resources
                    try {
                        if (resultSet != null) resultSet.close();
                        if (statement != null) statement.close();
                        if (connection != null) connection.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            %>
        </tbody>
    </table>
</body>
</html>
