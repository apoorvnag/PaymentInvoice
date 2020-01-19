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
<form name='paymentform' onsubmit="return false;">

Amount: <input type='number' min='0' id='amount' />
User Id: <input type='hidden' value='1' id='userid'/>
<button onclick="initiate();">Pay</button>
</form>
<script>
function initiate(){
	var amount = $('#amount').val();
	if (!amount){
		alert('Amount is mandatory');
		return false;
	}
$.ajax({
	'url': 'Payment',
	'method': 'POST',
	'data': {
		'amount': $('#amount').val()	
	},
	'success': function(data){
		console.log(data);
		var response = JSON.parse(data);
		console.log(response);
	},
	'error': function(error){
		console.log(error);
	}
	});
}
</script>
</body>
</html>