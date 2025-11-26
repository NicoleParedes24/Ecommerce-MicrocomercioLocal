<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,com.productos.seguridad.*" %>

<%
    int id = Integer.parseInt(request.getParameter("id"));
    Usuario u = new Usuario();
    ResultSet rs = u.obtenerUsuarioPorId(id);
    rs.next();
%>

<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Editar Usuario</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="p-4 bg-light">

<div class="container bg-white p-4 rounded shadow">
  <h3 class="text-success mb-4">✏️ Editar Usuario</h3>

<form action="actualizarUsuario.jsp" method="post">
  <input type="hidden" name="id" value="<%= id %>">

  <div class="mb-3">
    <label class="form-label">Nombre</label>
    <input type="text" name="nombre" class="form-control" value="<%= rs.getString("nombre_us") %>" required>
  </div>

  <div class="mb-3">
    <label class="form-label">Correo</label>
    <input type="email" name="correo" class="form-control" value="<%= rs.getString("correo_us") %>" required>
  </div>

  <div class="mb-3">
    <label class="form-label">Clave</label>
    <input type="text" name="clave" class="form-control" value="<%= rs.getString("clave_us") %>" required>
  </div>

  <div class="mb-3">
    <label class="form-label">Estado Civil</label>
    <select name="estado" class="form-select">
      <option value="1" <%= (rs.getInt("id_est")==1?"selected":"") %>>Divorciado</option>
      <option value="2" <%= (rs.getInt("id_est")==2?"selected":"") %>>Soltero</option>
      <option value="3" <%= (rs.getInt("id_est")==3?"selected":"") %>>Casado</option>
    </select>
  </div>

  <div class="mb-3">
    <label class="form-label">Perfil</label>
    <select name="perfil" class="form-select">
      <option value="1" <%= (rs.getInt("id_per")==1?"selected":"") %>>Administrador</option>
<%--       <option value="2" <%= (rs.getInt("id_per")==2?"selected":"") %>>Cliente</option> --%>
      <option value="3" <%= (rs.getInt("id_per")==3?"selected":"") %>>Vendedor</option>
    </select>
  </div>

  <button type="submit" class="btn btn-success">💾 Guardar Cambios</button>
  <a href="usuarios.jsp" class="btn btn-secondary">↩️ Volver</a>
</form>

</div>

</body>
</html>
