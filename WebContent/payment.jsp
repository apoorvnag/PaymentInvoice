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
<form name='paymentform'>

Amount: <input type='number' min='0' id='amount' />
User Id: <input type='hidden' value='1' id='userid'/>
<button onclick="initiate();"></button>
</form>
<script>
$.ajax({
	'url': 'Payment',
	'method': 'POST',
	'success': function(data){
		console.log(data);
	},
	'error': function(error){
		console.log(error);
	}
	});
</script>
</body>
</html>