<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.io.*, java.util.*, javax.servlet.http.*, com.productos.negocio.*, com.productos.datos.Conexion" %>

<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Administrar Productos - Comercial Otavalo</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="css/estilos.css">
<link rel="stylesheet" href="css/menuu.css">
<link rel="stylesheet" href="css/administrarProductos.css">
<script type="module" src="https://ajax.googleapis.com/ajax/libs/model-viewer/4.0.0/model-viewer.min.js"></script>

</head>

<body class="procesar-usuarios-body">
<jsp:include page="header_footer/headerSitioPrivado.jsp" />


<nav class="menu-principal">
			<a href="cerrarsesion.jsp">Cerrar Sesion</a>
		    <a href="productosOferta.jsp">Administrar Ofertas</a>
		 <a href="administrarProductos.jsp">Administrar Productos</a>
</nav>


<div class="container mt-4 mb-5">
  <h2 class="text-center text-success fw-bold mb-4">ADMINISTRAR PRODUCTOS Y CATEGORÍAS</h2>

  <%
    String accion = request.getParameter("accion");
    String mensaje = "";

    System.out.println("🔹 Acción recibida: " + accion);

    // =====================
    // GUARDAR CATEGORÍA
    // =====================
    if ("guardarCategoria".equals(accion)) {
        try {
            String descripcion = request.getParameter("descripcion");
            if (descripcion != null && !descripcion.isEmpty()) {
                Categoria c = new Categoria();
                c.setDescripcion(descripcion);
                mensaje = c.insertarCategoria();
            } else {
                mensaje = "⚠️ La descripción no puede estar vacía.";
            }
        } catch (Exception e) {
            mensaje = "❌ Error al guardar categoría: " + e.getMessage();
            e.printStackTrace();
        }
    }

    // =====================
    // EDITAR CATEGORÍA
    // =====================
    if ("editarCategoria".equals(accion)) {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String descripcion = request.getParameter("descripcion");
            Categoria c = new Categoria();
            c.setId(id);
            c.setDescripcion(descripcion);
            mensaje = c.actualizarCategoria();
        } catch (Exception e) {
            mensaje = "❌ Error al editar categoría: " + e.getMessage();
        }
    }

    // =====================
    // ELIMINAR CATEGORÍA
    // =====================
    if ("eliminarCategoria".equals(accion)) {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            Categoria c = new Categoria();
            mensaje = c.eliminarCategoria(id);
        } catch (Exception e) {
            mensaje = "❌ Error al eliminar categoría: " + e.getMessage();
        }
    }

    // =====================
    // GUARDAR PRODUCTO
    // =====================
    if ("guardarProducto".equals(accion)) {
        try {
            String nombre = request.getParameter("nombre");
            String catStr = request.getParameter("categoria");
            String cantStr = request.getParameter("cantidad");
            String precStr = request.getParameter("precio");
            String imagen = request.getParameter("imagen"); // solo nombre, ej: imagen1.jpg

            if (nombre != null && !nombre.isEmpty() &&
                catStr != null && !catStr.isEmpty() &&
                cantStr != null && !cantStr.isEmpty() &&
                precStr != null && !precStr.isEmpty() &&
                imagen != null && !imagen.isEmpty()) {

                int categoria = Integer.parseInt(catStr);
                int cantidad = Integer.parseInt(cantStr);
                double precio = Double.parseDouble(precStr);

                Producto p = new Producto();
                p.setCategoria(categoria);
                p.setNombre(nombre);
                p.setCantidad(cantidad);
                p.setPrecio(precio);
                p.setImagen(imagen); // 🔹 Guardar solo el nombre

                mensaje = p.insertarProducto();

            } else {
                mensaje = "⚠️ Todos los campos son obligatorios para el producto.";
            }

        } catch (Exception e) {
            mensaje = "❌ Error al guardar producto: " + e.getMessage();
            e.printStackTrace();
        }
    }

    // =====================
    // ELIMINAR PRODUCTO
    // =====================
    if ("eliminarProducto".equals(accion)) {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            Producto p = new Producto();
            mensaje = p.eliminarProducto(id);
        } catch (Exception e) {
            mensaje = "❌ Error al eliminar producto: " + e.getMessage();
        }
    }

    // =====================
    // CARGAR DATOS
    // =====================
    Categoria cat = new Categoria();
    List<Categoria> listaCat = cat.listarCategorias();

    Producto prod = new Producto();
    List<Producto> listaProd = prod.listarProductos();
  %>

  <% if (mensaje != null && !mensaje.isEmpty()) { %>
    <div class="alert alert-info text-center mt-3"><%= mensaje %></div>
  <% } %>

  <!-- ===================== -->
  <!-- SECCIÓN: CATEGORÍAS -->
  <!-- ===================== -->
  <div class="card shadow-sm p-4 mt-4">
    <h4 class="text-success mb-3">Registrar Nueva Categoría</h4>
    <form method="post">
      <input type="hidden" name="accion" value="guardarCategoria">
      <div class="row g-3 align-items-center">
        <div class="col-md-8">
          <input type="text" name="descripcion" class="form-control" placeholder="Ej: Zona Gastronómica" required>
        </div>
        <div class="col-md-4">
          <button type="submit" class="btn btn-success w-100">Guardar Categoría</button>
        </div>
      </div>
    </form>
  </div>

  <div class="card shadow-sm p-4 mt-4">
    <h5 class="text-success mb-3">Categorías Existentes</h5>
    <table class="table table-bordered text-center align-middle">
      <thead class="table-success">
        <tr>
          <th>ID</th>
          <th>Descripción</th>
          <th>Acciones</th>
        </tr>
      </thead>
      <tbody>
        <% for (Categoria c : listaCat) { %>
        <tr>
          <td><%= c.getId() %></td>
          <td><%= c.getDescripcion() %></td>
          <td>
            <form method="post" style="display:inline;">
              <input type="hidden" name="accion" value="eliminarCategoria">
              <input type="hidden" name="id" value="<%= c.getId() %>">
              <button type="submit" class="btn btn-danger btn-sm">Eliminar</button>
            </form>

            <form method="post" style="display:inline;">
              <input type="hidden" name="accion" value="editarCategoria">
              <input type="hidden" name="id" value="<%= c.getId() %>">
              <input type="text" name="descripcion" value="<%= c.getDescripcion() %>" required>
              <button type="submit" class="btn btn-warning btn-sm">Editar</button>
            </form>
          </td>
        </tr>
        <% } %>
      </tbody>
    </table>
  </div>

  <!-- ===================== -->
  <!-- SECCIÓN: PRODUCTOS -->
  <!-- ===================== -->
  <div class="card shadow-sm p-4 mt-5">
    <h4 class="text-success mb-3">Registrar Nuevo Producto</h4>

    <form method="post">
      <input type="hidden" name="accion" value="guardarProducto">

      <div class="row g-3">
        <div class="col-md-3">
          <label class="form-label fw-semibold">Categoría</label>
          <select name="categoria" class="form-select" required>
            <option value="">Seleccione...</option>
            <% for (Categoria c : listaCat) { %>
              <option value="<%= c.getId() %>"><%= c.getDescripcion() %></option>
            <% } %>
          </select>
        </div>

        <div class="col-md-3">
          <label class="form-label fw-semibold">Nombre</label>
          <input type="text" name="nombre" class="form-control" required>
        </div>

        <div class="col-md-2">
          <label class="form-label fw-semibold">Cantidad</label>
          <input type="number" name="cantidad" class="form-control" required>
        </div>

        <div class="col-md-2">
          <label class="form-label fw-semibold">Precio</label>
          <input type="number" step="0.01" name="precio" class="form-control" required>
        </div>

        <div class="col-md-2">
          <label class="form-label fw-semibold">Imagen (nombre .glb .jpg)</label>
          <input type="text" name="imagen" class="form-control" placeholder="ej: imagen1.jpg" required>
        </div>

        <div class="col-12 text-center mt-3">
          <button type="submit" class="btn btn-success px-4">Guardar Producto</button>
        </div>
      </div>
    </form>
  </div>

  <!-- ===================== -->
  <!-- LISTADO DE PRODUCTOS -->
  <!-- ===================== -->
  <div class="card shadow-sm p-4 mt-5 mb-5">
    <h4 class="text-success mb-3">Productos Registrados</h4>

    <table class="table table-bordered text-center align-middle">
      <thead class="table-success">
        <tr>
          <th>ID</th>
          <th>Nombre</th>
          <th>Cantidad</th>
          <th>Precio</th>
          <th>Imagen</th>
          <th>Acciones</th>
        </tr>
      </thead>
      <tbody>
        <% 
        String carpetaImagenes = "C:/imagenesHotel/"; // 📁 Carpeta fija local
        for (Producto p : listaProd) { 
        %>
        <tr>
          <td><%= p.getId() %></td>
          <td><%= p.getNombre() %></td>
          <td><%= p.getCantidad() %></td>
          <td>$<%= p.getPrecio() %></td>
          <td>
			  <% if (p.getImagen() != null && !p.getImagen().isEmpty()) { %>
			      <model-viewer src="<%= request.getContextPath() %>/3D/<%= p.getImagen() %>"
			                    alt="Modelo 3D"
			                    style="width:100px; height:100px;"
			                    camera-controls
			                    auto-rotate>
			      </model-viewer>
			  <% } else { %>
			      <span class="text-muted">Sin imagen</span>
			  <% } %>
			</td>


          <td>
            <form method="post" style="display:inline;">
              <input type="hidden" name="accion" value="eliminarProducto">
              <input type="hidden" name="id" value="<%=p.getId()%>">
              <button type="submit" class="btn btn-danger btn-sm"
                onclick="return confirm('¿Eliminar producto?')">Eliminar</button>
            </form>
          </td>
        </tr>
        <% } %>
      </tbody>
    </table>
  </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
