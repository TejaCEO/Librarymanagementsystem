<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<html>
<body>
<%

String studentName = request.getParameter("studentName");
String studentID = request.getParameter("studentID");
String bookTaken = request.getParameter("bookTaken");

Connection con = null;

try {
    // Establish database connection
    Class.forName("oracle.jdbc.driver.OracleDriver");
    con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "manager");
    
    // SQL INSERT statement
    String sql = "INSERT INTO Students (student_name, student_id, book_taken) VALUES (?, ?, ?)";
    PreparedStatement pstmt = con.prepareStatement(sql);
    pstmt.setString(1, studentName);
    pstmt.setString(2, studentID);
    pstmt.setString(3, bookTaken);
    
    // Execute INSERT statement
    pstmt.executeUpdate();
    
    // Redirect to a success page
    response.sendRedirect("success.html");
    out.print("<a href='success.html'></a>");
} catch (Exception e) {
    // Handle exceptions
    out.println("Error: " + e.getMessage());
} finally {
    // Close resources in case of any exception
    if (pstmt != null) {
        try { pstmt.close(); } catch (SQLException e) { /* ignored */ }
    }
    if (con != null) {
        try { con.close(); } catch (SQLException e) { /* ignored */ }
    }
}
%>
</body>
</html>
