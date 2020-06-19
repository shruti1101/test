<%
    try{
        String id,password;
        if(request.getParameter("btnlogin")!=null)
        {
            id=request.getParameter("txtid");
            password=request.getParameter("txtpwd");
            {
             if(id.equals("test")&&password.equals("test")) 
                 response.sendRedirect("emp.jsp");
             else
                 out.println("error");
            }
        }  
    }catch(Exception ex){ex.printStackTrace();}
        
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <form name='f1'>
            <h1 align='center'>login</h1>
            <table align='center'>
                <tr><td>enter id
                <input type='text' name='txtid' value=''/></td>
            <tr><td>enter password
                <input type='text' name='txtpwd'value=''/><td></tr>
            <tr>
            <td><input type='submit' value='submit' name='btnlogin'/></td>
            </tr> 
            </table>
        
        
        </form>
    </body>
</html>
