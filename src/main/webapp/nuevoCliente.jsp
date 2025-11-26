<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.productos.seguridad.*" %>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Registro de Nuevo Cliente</title>

<!-- Bootstrap -->

<link rel="stylesheet" href="css/estilos.css">
	
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">

<!-- Estilos opcionales -->
<link rel="stylesheet" href="css/general.css">
</head>
<body class="bg-light">

<jsp:include page="header_footer/header.jsp" />

<%
    // ====== 1️⃣ Capturar datos del formulario ======
    String nombre = request.getParameter("txtNombre");
    String cedula = request.getParameter("txtCedula");
    String estadoCivil = request.getParameter("cmbEstado");
    String residencia = request.getParameter("rdResidencia");
    String foto = request.getParameter("fotoNombre");
    String color = request.getParameter("cColor");
    String fecha = request.getParameter("mFecha");
    String correo = request.getParameter("txtEmail");
    String clave = request.getParameter("txtClave");

    // ====== 2️⃣ Insertar en la base de datos ======
    Usuario nuevo = new Usuario();
    nuevo.setNombre(nombre);
    nuevo.setCedula(cedula);
    nuevo.setCorreo(correo);
    nuevo.setClave(clave);

    // Convertir estado civil a número
    int estado = 2;
    if ("Casado".equalsIgnoreCase(estadoCivil)) estado = 1;
    else if ("Divorciado".equalsIgnoreCase(estadoCivil)) estado = 3;
    //else if ("Viudo".equalsIgnoreCase(estadoCivil)) estado = 4;
    nuevo.setEstado(estado);

    String resultado = nuevo.ingresarCliente();
%>

<div class="container mt-5">
  <div class="card shadow p-4">
    <h2 class="text-center text-primary mb-4">Datos del Cliente Registrado</h2>

    <%-- ====== 3️⃣ Mensaje de resultado ====== --%>
    <% if (resultado.equals("Inserción correcta")) { %>
        <div class="alert alert-success text-center">
            ✅ El usuario fue creado con éxito. Serás redirigido al inicio de sesión.
        </div>
        <meta http-equiv="refresh" content="4;url=login.jsp">
    <% } else { %>
        <div class="alert alert-danger text-center">
            ❌ Ocurrió un error al registrar el usuario: <%= resultado %>
        </div>
    <% } %>

    <%-- ====== 4️⃣ Tabla con datos ingresados ====== --%>
    <table class="table table-bordered mt-4">
      <thead class="table-light">
        <tr>
          <th colspan="2" class="text-center">Información Personal</th>
        </tr>
      </thead>
      <tbody>
        <tr><td><strong>Nombre:</strong></td><td><%= nombre %></td></tr>
        <tr><td><strong>Cédula:</strong></td><td><%= cedula %></td></tr>
        <tr><td><strong>Estado Civil:</strong></td><td><%= estadoCivil %></td></tr>
        <tr><td><strong>Residencia:</strong></td><td><%= residencia %></td></tr>
        <tr><td><strong>Foto:</strong></td><td><u><%= foto %></u></td></tr>
        <tr><td><strong>Fecha de Nacimiento:</strong></td><td><%= fecha %></td></tr>
        <tr><td><strong>Color Favorito:</strong></td><td><font color="<%= color %>">Este es tu color favorito</font></td></tr>
        <tr><td><strong>Correo Electrónico:</strong></td><td><%= correo %></td></tr>
        <tr><td><strong>Clave:</strong></td><td><%= clave %></td></tr>
      </tbody>
    </table>

    <% if (!resultado.equals("Inserción correcta")) { %>
      <div class="text-center mt-3">
        <a href="registro.jsp" class="btn btn-outline-primary">Volver al Registro</a>
      </div>
    <% } %>

  </div>
</div>

<jsp:include page="header_footer/footer.jsp" />
</body>
</html>
