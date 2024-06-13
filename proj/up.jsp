<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<html lang="en">

<body>
    

    <% 
        String studentName = request.getParameter("studentName");
        String studentID = request.getParameter("studentID");
        String bookReceived = request.getParameter("bookReceived");
        String dateReceived = request.getParameter("dateReceived");

        // JDBC driver name and database URL
        String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
        String DB_URL = "jdbc:mysql://localhost/your_database_name";

        // Database credentials
        String USER = "your_database_username";
        String PASS = "your_database_password";

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // Register JDBC driver
            Class.forName("com.mysql.jdbc.Driver");

            // Open a connection
            conn = DriverManager.getConnection(DB_URL, USER, PASS);

            // Prepare SQL query
            String sql = "INSERT INTO Students(studentName, studentID, bookTaken, dateReceived) VALUES (?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);

            // Set parameters
            pstmt.setString(1, studentName);
            pstmt.setString(2, studentID);
            pstmt.setString(3, bookReceived);
            pstmt.setString(4, dateReceived);

            // Execute the query
            pstmt.executeUpdate();
            
            // Close all resources
            pstmt.close();
            conn.close();
        } catch (Exception e) {
            out.println("Exception occurred: " + e.getMessage());
        }
    %>
</body>
</html>
