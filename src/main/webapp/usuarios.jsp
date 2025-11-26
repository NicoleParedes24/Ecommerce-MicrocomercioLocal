<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true" import="com.productos.seguridad.*" %>

<%@ page import="java.sql.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Administrar Usurios</title>

	<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap Icons -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">

<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css"> -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script> -->

<link rel="stylesheet" href="css/estilos.css">

	
	<link rel="stylesheet" href="css/estilosTablaAdministrarUsuarios.css">

	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
	

	
</head>
<body>


<main>



<jsp:include page="header_footer/headerSitioPrivado.jsp" />
		<nav class="menu-principal">
			<a href="cerrarsesion.jsp">Cerrar Sesion</a>
		    <a href="bitacora.jsp">Bitacora</a> 
			<a href="usuarios.jsp">Administrar Usuarios</a>  
		</nav>


<!-- ✅ Formulario para registrar nuevo usuario -->
<div class="card mb-4 shadow-sm border-0">
  <div class="card-header bg-success text-white fw-bold text-center">
    <i class="bi bi-person-plus-fill me-2"></i>Registrar Nuevo Usuario
  </div>

  <div class="card-body bg-light">
    <form action="nuevoUsuario.jsp" method="post" class="row g-3">

      <div class="col-md-4">
        <label class="form-label">Nombre y Apellido</label>
        <input type="text" name="nombre" class="form-control" placeholder="Ej: Juan Pérez" required>
      </div>

      <div class="col-md-4">
        <label class="form-label">Cédula</label>
        <input type="text" name="cedula" class="form-control" placeholder="Ej: 1712345678" required>
      </div>

      <div class="col-md-4">
        <label class="form-label">Correo</label>
        <input type="email" name="correo" class="form-control" placeholder="correo@ejemplo.com" required>
      </div>

      <div class="col-md-4">
        <label class="form-label">Clave</label>
        <input type="password" name="clave" class="form-control" placeholder="Contraseña" required>
      </div>

      <div class="col-md-4">
        <label class="form-label">Estado Civil</label>
        <select name="estado" class="form-select" required>
          <option value="" disabled selected>Seleccione...</option>
          <option value="1">Casado</option>
          <option value="2">Soltero</option>
          <option value="3">Divorciado</option>
        </select>
      </div>

      <div class="col-md-4">
        <label class="form-label">Perfil</label>
        <select name="perfil" class="form-select" required>
          <option value="" disabled selected>Seleccione...</option>
          <option value="1">Administrador</option>
          <option value="2">Cliente</option>
          <option value="3">Vendedor</option>
        </select>
      </div>

      <div class="col-12 text-center mt-4">
        <button type="submit" class="btn btn-success px-4 fw-bold me-2">
          <i class="bi bi-floppy-fill"></i> Guardar Usuario
        </button>
        <a href="usuarios.jsp" class="btn btn-danger px-4 fw-bold">
          <i class="bi bi-x-circle-fill"></i> Cancelar
        </a>
      </div>

    </form>
  </div>
</div>





	<!--  div>
		<table >
			<tr>
			<th>Codigo</th>
			<th>Nombre</th>
			<th>Email</th>			
			</tr>
			
			<tr>
				
				<td>1</td>
				<td>Nicole</td>
				<td>Email</td>
			
			</tr>
		</table>
	</div-->


<%
    String mensaje = request.getParameter("mensaje");
    String error = request.getParameter("error");

    if (mensaje != null) {
%>
        <div class="alert alert-success"><%= mensaje %></div>
<%
    } else if (error != null) {
%>
        <div class="alert alert-danger"><%= error %></div>
<%
    }

  Usuario usuario = new Usuario();
  out.print(usuario.consultarUsuarios());
%>

<%-- <%Usuario user = new Usuario(); out.print(user.reporteUsuario());--%> 

<%-- %> --%>

<jsp:include page="header_footer/footer.jsp" />

</body>
</html>