<%-- 
    Document   : emp
    Created on : 20 Nov, 2019, 7:50:18 PM
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
        <h1 align='center'>employee form</h1>
        <form name='f1'>
            <table align='center'>
                <tr><td>enter name
                            <input type='text' name='txtname' value=''/></td></tr>
                <tr> <td>enter id
                        <input type='text' name='txtid' value=''/></td></tr>
                <tr>  <td>gender</td>
                    <td>male <input type='radio' name="gender" value="male"/></td>
                    <td>female<input type='radio' name="gender" value="female"/></td></tr>
                <tr><td>language
    <td>english<input type='checkbox' name="lang" value="english"/></td>
    <td>hindi<input type='checkbox' name="lang" value="hindi"/></td>
    <td>french<input type='checkbox' name="lang" value="french"/></td>
                </td></tr>
<tr><td>course<select name="course">
            <option>mca</option>
            <option>btech</option>
            <option>mtech</option>
            <option>bca</option>
        </select>
    </td></tr>
 
<tr><td>insert</td><td><input type="submit" value="insert" name="btninsert"/></td></tr>
<tr><td>update</td><td><input type="submit" value="update" name="btnupdate"/></td></tr>
<tr><td>view</td><td><input type="submit" value="view" name="btnview"/></td></tr>
<tr><td>delete</td><td><input type="submit" value="delete" name="btndelete"/></td></tr>
            </table>
        </form>
    </body>
</html>
<%
    try{
                  String g,c,n,l;
        int i;
        
            
            if(request.getParameter("btninsert")!=null)
            {
                 
                 n=request.getParameter("txtname");
                 i=Integer.parseInt(request.getParameter("txtid"));
                 c=request.getParameter("course");
                 g=request.getParameter("gender");
                 l=request.getParameter("lang");
            
                Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn=DriverManager.getConnection("jdbc:derby://localhost:1527/jsp","test","test");
            Statement stmt=conn.createStatement();
                
                int x=stmt.executeUpdate("insert into employee values('"+n+"',"+i+",'"+g+"','"+l+"','"+c+"')");
                 if(x>0)
                    out.println("done");
                else
                    out.println("error");
                
            }
             if(request.getParameter("btnview")!=null)
            {
                response.sendRedirect("view.jsp");
                
            }
            if(request.getParameter("btnupdate")!=null)
            {
                     PreparedStatement ps = null;
                     n=request.getParameter("txtname");
                     i=Integer.parseInt(request.getParameter("txtid"));
                     c=request.getParameter("course");
                     g=request.getParameter("gender");
                     l=request.getParameter("lang");
                 Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn=DriverManager.getConnection("jdbc:derby://localhost:1527/jsp","test","test");
            Statement stmt=conn.createStatement();

               String sql="update employee set name=?,gender=?,language=?,course=? where id="+i+"";
               ps = conn.prepareStatement(sql);
               ps.setString(1,n);
               ps.setString(2,g);
               ps.setString(3,l);
               ps.setString(4,c);
               int s1=ps.executeUpdate();
                if(s1>0)
                {
                    out.println("record updated successfully");
                }
                else
                    out.println("error in updation");
            }
            if(request.getParameter("btndelete")!=null)
            {
                    
                     i=Integer.parseInt(request.getParameter("txtid"));
                    
                 Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn=DriverManager.getConnection("jdbc:derby://localhost:1527/jsp","test","test");
            Statement stmt=conn.createStatement();

                int x=stmt.executeUpdate("delete from employee where id="+i+"");
                if(x>0)
                {
                    out.println("deleted successfully");
                }
                else
                    out.println("not deleted");
            }
        
    }
    catch(Exception ex)
    {
        ex.printStackTrace();
    }
%>