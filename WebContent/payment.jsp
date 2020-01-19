<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Adani Ports | Payment Page</title>
</head>
<body>
<jsp:include page='header.jsp'/>
<form>

Amount: <input type='number' min='0' />
User Id: <input type='hidden' value='1'/>
<button onclick="initiate();"></button>
</form>
<script>

</script>
</body>
</html>