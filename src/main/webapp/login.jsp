<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Ingreso al sistema</title>
	<link rel="stylesheet" href="css/estilos.css">
	<link rel="stylesheet" href="css/estilosLogin.css">
	
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
	
</head>
<body>
<jsp:include page="header_footer/header.jsp" />
		
<h3>Ingreso al sistema</h3>

<div class="login-container">
  <form action="validarLogin.jsp" method="post" class="login-form">
  <table>
    <tr>
      <td>Correo electrónico:</td>
      <td><input type="email" name="correo" size="30" required/></td>
    </tr>
    <tr>
      <td>Clave:</td>
      <td><input type="password" name="clave" size="30" required/></td>
    </tr>
    <tr>
      <td colspan="2" style="text-align:center;">
        <input type="submit" value="Enviar" class="btn"/>
        <input type="reset" value="Limpiar" class="btn"/>
      </td>
    </tr>
  </table>
</form>

<%
    // Mostrar mensaje de error si viene en los parámetros
    if (request.getParameter("error") != null) {
        out.println("<p style='color:red;'>" + request.getParameter("error") + "</p>");
    }
%>
</div>



		


	<footer style="margin-top: 50px;">
		
			<ul>
				<li><a href="https://www.facebook.com/SupermercadoFrescura">Facebook</a></li>
				<li><a href="https://www.instagram.com/SupermercadoFrescura">Instagram</a></li>
				<li><a href="https://www.twitter.com/FrescuraStore">Twitter</a></li>
			</ul>
			
			
		
		
		</footer>
</body>

<%
    String mensaje = request.getParameter("mensaje");
    if (mensaje != null) {
%>
    <script>
        alert("<%= mensaje %>");
    </script>
<%
    }
%>


</html>
