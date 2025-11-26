<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true" import="com.productos.seguridad.*, java.time.*, java.time.format.*" %>

<%
    HttpSession sesion = request.getSession();
    if (sesion.getAttribute("usuario") == null || sesion.getAttribute("perfil") == null) {
%>
    <jsp:forward page="login.jsp">
        <jsp:param name="error" value="Debe registrarse en el sistema."/>
    </jsp:forward>
<%
    } else {
        String usuario = (String) sesion.getAttribute("usuario");
        int perfil = (Integer) sesion.getAttribute("perfil");

        // Obtener fecha y hora actual
        LocalDateTime ahora = LocalDateTime.now();
        DateTimeFormatter formatoFecha = DateTimeFormatter.ofPattern("EEE, MMM dd yyyy");
        DateTimeFormatter formatoHora = DateTimeFormatter.ofPattern("HH:mm");

        String fecha = ahora.format(formatoFecha);
        String hora = ahora.format(formatoHora);
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Panel Privado</title>

    <!-- Enlaces a los estilos -->
    
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="css/estilosMenu.css">

    <link rel="stylesheet" href="css/estilosMenuBienvenida.css">
    
    <link rel="stylesheet" href="css/estilos.css">

<!-- 	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous"> -->
</head>
<body>


<header></center>
			<h1>SITIO PRIVADO DE PRODUCTOS</h1>
			<section class="imagen-banner">
  		<img src="imagenes/banne.png" alt="Vista de la tienda de abarrotes">
	</section>
			<h2 class="destacado">Productos de calidad</h2>
			<h4 id="favorito">Apoyar el comercio local y sostenible</h4>
			
			
	</header>
    
    
    

    <main>
        <%
            Pagina pag = new Pagina();
            String menu = pag.mostrarMenu(perfil);
            out.print(menu);
        %>

        <!-- Cuadro sencillo de bienvenida debajo del menú -->
        <div class="bienvenida">
            <h2>BIENVENID@</h2>
            <p><%= usuario %></p>
            <p><%= fecha %> — <%= hora %></p>
        </div>
    </main>

    <footer>
        <p>© Microcomercio Local - Todos los derechos reservados</p>
    </footer>
</body>
</html>
<%
    }
%>
