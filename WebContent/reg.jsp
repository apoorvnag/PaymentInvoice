<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
    </head>
    <body>
    <jsp:include page='header.jsp'/>
        <form method="post" action="registration.jsp">
            <center>
            <table border="1" width="30%" cellpadding="5">
                <thead>
                    <tr>
                        <th colspan="2">Enter Information Here</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>First Name</td>
                        <td><input type="text" name="fname" value="" /></td>
                    </tr>
                    <tr>
                        <td>Last Name</td>
                        <td><input type="text" name="lname" value="" /></td>
                    </tr>                    
                    <tr>
                        <td>User Name</td>
                        <td><input type="email" name="username" value="" /></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" name="password" value="" /></td>
                    </tr>
                    <tr>
                        <td>Contact</td>
                        <td><input type="text" name="contact" size="10" pattern="[789][0-9]{9}" value="" /><span> start: 

7or8or9 rest 0-9 </span></td>
                    </tr>
                    <tr>
                        <td>Address</td>
                        <td><input type="text" name="address" size="50" value="" /></td>
                    </tr>
	  <!-- <tr>
                        <td>Email</td>
                        <td><input type="text" name="email" value="" /></td>
                    </tr> -->

                    <tr>
                        <td><input type="submit" value="Submit" /></td>
                        <td><input type="reset" value="Reset" /></td>
                    </tr>
                    <tr>
                        <td colspan="2">Already registered!! <a href="index.jsp">Login Here</a></td>
                    </tr>
                </tbody>
            </table>
            </center>
        </form>
    </body>
</html>