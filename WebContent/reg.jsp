<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration | Adani Ports</title>
    </head>
    <body>
    <jsp:include page='header.jsp'/>
        <form method="post" action="registration.jsp" class="form-horizontal">
            <center>
            <table width="30%" cellpadding="5">
                <thead class="form-group">
                    <tr>
                        <th colspan="2">Enter Information Here</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>First Name</td>
                        <td><input type="text" name="fname" placeholder="Write your first name" value="" class="form-control" style="margin: 10px"/></td>
                    </tr>
                    <tr>
                        <td>Last Name</td>
                        <td><input type="text" name="lname" value="" placeholder="Write your last name" class="form-control" style="margin: 10px"/></td>
                    </tr>                    
                    <tr>
                        <td>User Name</td>
                        <td><input type="email" name="username" value="" placeholder="Write your user name" class="form-control" style="margin: 10px"/></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" name="password" value="" placeholder="Write a secure password" class="form-control" style="margin: 10px"/></td>
                    </tr>
                    <tr>
                        <td>Contact</td>
                        <td><input type="text" name="contact" maxlength="10" pattern="[789][0-9]{9}" placeholder="Must start with 7 or 8 or 9" value="" class="form-control" style="margin: 10px"/><span> start: 

7or8or9 rest 0-9 </span></td>
                    </tr>
                    <tr>
                        <td>Address</td>
                        <td><input type="text" name="address" size="50" value="" placeholder="Address" class="form-control" style="margin: 10px"/></td>
                    </tr>
	  <!-- <tr>
                        <td>Email</td>
                        <td><input type="text" name="email" value="" class="form-control" style="margin: 10px"/></td>
                    </tr> -->

                    <tr>
                        <td colspan="2" style="margin: 10px; text-align:right;">
                        <input type="submit" value="Submit" class="btn btn-primary"/>
                        <input type="reset" value="Reset" class="btn btn-default"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="padding-top: 20px;">Already registered!! <a href="index.jsp">Login Here</a></td>
                    </tr>
                </tbody>
            </table>
            </center>
        </form>
    </body>
</html>