<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*, com.productos.negocio.*" %>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Productos en Oferta - Comercial Otavalo</title>

<!-- BOOTSTRAP  -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">

<link rel="stylesheet" href="css/estilos.css">
</head>
<body>
<jsp:include page="header_footer/headerSitioPrivado.jsp" />

	<nav class="menu-principal">
			<a href="administrarProductos.jsp">Regresar Administrar Productos</a>  
		</nav>
<div class="container mt-5 mb-5">
  <h2 class="text-center text-success fw-bold mb-4"> Administrar Productos en Oferta</h2>

  <%
    String accion = request.getParameter("accion");
    String mensaje = "";
    Producto prod = new Producto();

    if ("activarOferta".equals(accion)) {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            double precioOferta = Double.parseDouble(request.getParameter("precioOferta"));
            mensaje = prod.activarOferta(id, precioOferta);
        } catch (Exception e) {
            mensaje = "Error al activar oferta: " + e.getMessage();
        }
    }

    if ("quitarOferta".equals(accion)) {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            mensaje = prod.quitarOferta(id);
        } catch (Exception e) {
            mensaje = " Error al quitar oferta: " + e.getMessage();
        }
    }

    List<Producto> lista = prod.listarProductos();
  %>

  <% if (!mensaje.isEmpty()) { %>
    <div class="alert alert-info text-center"><%= mensaje %></div>
  <% } %>

  <table class="table table-bordered text-center align-middle">
    <thead class="table-success">
      <tr>
        <th>ID</th>
        <th>Nombre</th>
        <th>Precio Antes</th>
        <th>Precio Oferta</th>
        <th>Estado</th>
        <th>Acciones</th>
      </tr>
    </thead>
    <tbody>
      <% for (Producto p : lista) { %>
      <tr>
        <td><%= p.getId() %></td>
        <td><%= p.getNombre() %></td>
        <td>
          <% if (p.isOferta()) { %>
            <span class="text-muted text-decoration-line-through">$<%= p.getPrecio() %></span>
          <% } else { %>
            $<%= p.getPrecio() %>
          <% } %>
        </td>
        <td>
          <% if (p.isOferta()) { %>
            <span class="text-danger fw-bold">$<%= p.getPrecioOferta() %></span>
          <% } else { %>
            -
          <% } %>
        </td>
        <td>
          <% if (p.isOferta()) { %>
            <span class="badge bg-success">En oferta</span>
          <% } else { %>
            <span class="badge bg-secondary">Normal</span>
          <% } %>
        </td>
        <td>
          <% if (!p.isOferta()) { %>
            <form method="post" style="display:inline-block;">
              <input type="hidden" name="accion" value="activarOferta">
              <input type="hidden" name="id" value="<%= p.getId() %>">
              <input type="number" step="0.01" name="precioOferta" placeholder="Nuevo precio" required class="form-control form-control-sm mb-1">
              <button class="btn btn-warning btn-sm">Poner en oferta</button>
            </form>
          <% } else { %>
            <form method="post" style="display:inline-block;">
              <input type="hidden" name="accion" value="quitarOferta">
              <input type="hidden" name="id" value="<%= p.getId() %>">
              <button class="btn btn-danger btn-sm">Quitar oferta</button>
            </form>
          <% } %>
        </td>
      </tr>
      <% } %>
    </tbody>
  </table>
</div>
</body>
</html>
