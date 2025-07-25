<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%
	
	String code = request.getParameter("code");
	
	%>
	
	//		response.sendRedirect("https://accounts.google.com/o/oauth2/token?code=" + code + "&"
//				+ "client_id=130847715672-6el7dig21gn5n7ar5j1g098ep6b8u45h.apps.googleusercontent.com&"
//				+ "client_secret=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&"
//				+ "redirect_uri=http://localhost:8080/Shopping-Cart/CallBackSec"
//				+ "grant_type=authorization_code");
	
	<form method="post" action="oauth2.googleapis.com">
		<input type="text" name="code" value="<%=code%>">
		<input type="text" name="client_id" value="130847715672-6el7dig21gn5n7ar5j1g098ep6b8u45h.apps.googleusercontent.com">
		<input type="text" name="client_secret" value="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">
		<input type="text" name="redirect_uri" value="http://localhost:8080/Shopping-Cart/CallBackSec">
		<input type="text" name="grant_type" value="authorization_code">
		<button type="submit">Click Here</button>
	</form>

</body>
</html>