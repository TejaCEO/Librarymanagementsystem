<%@page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<html>
<body>
<%

String userid=request.getParameter("user");
String password=request.getParameter("password");
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","manager");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select  * from users1");
int flag=0;

while(rs.next())
{

if(rs.getString(4).equals(userid) && rs.getString(5).equals(password))
{
flag=1;
break;
}
} 
if (flag==0)  
{
out.print(" Username or Password not correct"+"<br/>");
out.print("<a href='Login.html'><p>Back to Login</p></a>");
}
else
{
out.print("Login Successful"+"<br>");
session.setAttribute("uname",userid);
session.setMaxInactiveInterval(30);
out.print("<a href='Login.html'>logout</a>");

}

%>

</body>
</html>