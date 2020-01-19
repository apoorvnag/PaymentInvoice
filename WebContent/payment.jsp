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
<div style='text-align:center;'>
<form name='paymentform' onsubmit="return false;">

Amount: <input type='number' min='0' id='amount' />
User Id: <input type='hidden' value='1' id='userid'/>
<button onclick="initiate();">Pay</button>
</form>


<%
String username = (String)session.getAttribute("username");
if (username.isEmpty()){
	username="user";
}
%>
<form style='display: hidden' name="razorpayForm" action="http://localhost:8080/PaymentInvoice/payment_success.jsp" method="POST">
<script
    src="https://checkout.razorpay.com/v1/checkout.js"
    data-key="rzp_test_25DvslaTSjz9fD"
    data-amount="50000"
    data-currency="INR"
    data-order_id=""
    data-buttontext="Pay with Razorpay"
    data-name="Adani Ports and SEZ"
    data-description="Ports and Logistics"
    data-image="https://www.adaniports.com/-/media/E22DAD7A3F5B4EF484A6D41626D9BEB4.ashx"
    data-prefill.name="<%=username %>"
    data-prefill.email="<%=username %>"
    data-prefill.contact="9999999999"
    data-theme.color="#F37254"
    id='myscript'
></script>
<input type="hidden" custom="Hidden Element" name="hidden">
</form>

</div>
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
	'success': function(order_id){
		console.log(order_id);
		$('#myscript').attr('data-order_id', order_id);
	},
	'error': function(error){
		console.log(error);
	}
	});
}
</script>
</body>
</html>