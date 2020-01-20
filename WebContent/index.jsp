<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
    <jsp:include page='header.jsp'/>
        <form method="post" action="login.jsp" class="form-horizontal">
            <center>
            <table width="30%" cellpadding="3">
                <thead class="form-group">
                    <tr>
                        <th colspan="2">Login Here</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>User Name</td>
                        <td><input type="text" name="username" value="" class="form-control" style="margin: 10px"/></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" name="password" value="" class="form-control" style="margin: 10px"/></td>
                    </tr>
                    <tr>
                        
                        <td colspan="2" style="text-align: right;">
							<input type="submit" value="Login" class="btn btn-default"/>
                        	<input type="reset" value="Reset" class="btn btn-default"/></td>
                    </tr>
                    <tr>
                        <td colspan="2" style="margin: 10px;">Yet Not Registered!! <a href="reg.jsp" style="margin: 10px;">Register Here</a></td>
                    </tr>
                </tbody>
            </table>
            </center>
        </form>
    </body>
</html>