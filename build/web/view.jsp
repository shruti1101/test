<%-- 
    Document   : view.jsp
    Created on : 22 Nov, 2019, 3:15:18 PM
    Author     : abhi1
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
             Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn=DriverManager.getConnection("jdbc:derby://localhost:1527/jsp","test","test");
            Statement stmt=conn.createStatement();

                ResultSet rs=stmt.executeQuery("select * from employee");
                out.println("<table border='5' cellspacing=5 cellpadding=2");
                out.println("<tr><td><B>name</B></td><td><B>id</B></td><td><B>gender</B></td><td><B>language</B></td><td><B>course</B></td></tr>");
                while(rs.next())
                {
                    out.println("<tr><td>"+rs.getString(1)+"</td>");
                    out.println("<td>"+rs.getInt(2)+"</td>");
                    out.println("<td>"+rs.getString(3)+"</td>");
                    out.println("<td>"+rs.getString(4)+"</td>");
                    out.println("<td>"+rs.getString(5)+"</td>");
                    out.println("</tr>");
                }
                out.println("</table>");
        %>
    </body>
</html>
