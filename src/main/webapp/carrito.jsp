<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*, javax.servlet.http.*, com.productos.negocio.*" %>

<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Carrito de Compras - Comercial Otavalo</title>

<!-- BootstraAPPP -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">


<link rel="stylesheet" href="css/estilosCarrito.css">
<link rel="stylesheet" href="css/estilos.css">
<!-- model-viewer -->
<script type="module" src="https://ajax.googleapis.com/ajax/libs/model-viewer/4.0.0/model-viewer.min.js"></script>
</head>

<body class="menu-body">
<jsp:include page="header_footer/headerSitioPrivado.jsp" />

<nav class="menu-principal">
  <a href="carrito.jsp">Carrito de productos</a>
  <a href="cerrarsesion.jsp">Cerrar Sesión</a> 
</nav>

<div class="container my-5">
<h2 class="text-center text-dark mb-4"> CARRITO DE PRODUCTOS Y SERVICIOS</h2>


<%

    // Cargar categorías y productos
    Categoria categoriaDAO = new Categoria();
    List<Categoria> categorias = categoriaDAO.listarCategorias();

    Producto productoDAO = new Producto();
    List<Producto> listaProductos = productoDAO.listarProductos();
    

    // carrito
    HttpSession sesion = request.getSession();
    List<Producto> carrito = (List<Producto>) sesion.getAttribute("carrito");
    if (carrito == null) {
        carrito = new ArrayList<>();
        sesion.setAttribute("carrito", carrito);
    }

    
    // Acciones del carrito
    String accion = request.getParameter("accion");
    String idProd = request.getParameter("id");
    String mensaje = "";

    if ("agregar".equals(accion) && idProd != null) {
        int id = Integer.parseInt(idProd);

        String cant = request.getParameter("cantidad");
        int cantidadSolicitada = (cant != null) ? Integer.parseInt(cant) : 1;

        for (Producto p : listaProductos) {
            if (p.getId() == id) {

                int cantidadEnCarrito = 0;
                for (Producto c : carrito) {
                    if (c.getId() == id) cantidadEnCarrito++;
                }

                if (cantidadEnCarrito + cantidadSolicitada > p.getCantidad()) {
                    mensaje = "❌ Stock insuficiente. Disponible: " + p.getCantidad();
                    break;
                }

                for (int i = 0; i < cantidadSolicitada; i++) {
                    carrito.add(p);
                }

                p.setCantidad(p.getCantidad() - cantidadSolicitada);

                sesion.setAttribute("carrito", carrito);
                mensaje = "Producto agregado: " + p.getNombre() + " x" + cantidadSolicitada;
                break;
            }
        }
    }




    if ("vaciar".equals(accion)) {
        carrito.clear();
        sesion.setAttribute("carrito", carrito);
        mensaje = "Carrito vaciado correctamente.";
    }

   
    // Calcular total considerando precio en oferta
  
    double total = 0;
    for (Producto p : carrito) {
        if (p.getPrecioOferta() > 0 && p.getPrecioOferta() < p.getPrecio()) {
            total += p.getPrecioOferta();
        } else {
            total += p.getPrecio();
        }
    }

    //PAHT PAR LAS IMAGENES 3D
    String carpetaModelos = request.getContextPath() + "/3D/";
%>

<% if (!mensaje.isEmpty()) { %>
<div class="alert alert-info text-center"><%= mensaje %></div>
<% } %>

<!-- Productos por la cateegoria -->
<% for (Categoria cat : categorias) {
       List<Producto> productosCat = new ArrayList<>();
       for (Producto p : listaProductos) {
           if (p.getCategoria() == cat.getId()) productosCat.add(p);
       }
       if (!productosCat.isEmpty()) {
%>
<section class="seccion-productos mb-5">
    <h3 class="text-success text-center mb-3"><%= cat.getDescripcion() %></h3>
    <p class="text-center text-muted mb-4">Elige productos de la categoría <%= cat.getDescripcion() %>.</p>

    <div class="productos-grid">
        <% for (Producto p : productosCat) { %>
        <div class="producto">
            <model-viewer src="<%= carpetaModelos + p.getImagen() %>" alt="Modelo 3D de <%= p.getNombre() %>"
                          camera-controls auto-rotate></model-viewer>
            <h5 class="mt-3"><%= p.getNombre() %></h5>
            
            <p class="text-muted">
		    <% if (p.getPrecioOferta() > 0 && p.getPrecioOferta() < p.getPrecio()) { %>
		        Precio: <span class="text-decoration-line-through">$<%= String.format("%.2f", p.getPrecio()) %></span>
		        <span class="text-danger fw-bold">$<%= String.format("%.2f", p.getPrecioOferta()) %></span>
		    <% } else { %>
		        Precio: $<%= String.format("%.2f", p.getPrecio()) %>
		    <% } %>
		</p>
		<!-- 🔥 MOSTRAR STOCK -->
		<p class="text-muted mb-1">Stock: <strong><%= p.getCantidad() %></strong></p>
		            

            <form method="post">
    <input type="hidden" name="accion" value="agregar">
    <input type="hidden" name="id" value="<%= p.getId() %>">

    <% if (p.getCantidad() > 0) { %>

        <!-- SPINNER PARA ELEGIR UNIDADES -->
        <input type="number"
               name="cantidad"
               class="form-control mb-2"
               min="1"
               max="<%= p.getCantidad() %>"
               value="1">

        <!-- BOTÓN ACTIVO -->
        <button type="submit" class="btn btn-success btn-sm px-3">Agregar al Carrito</button>

    <% } else { %>

        <input type="number"
               class="form-control mb-2"
               value="0"
               disabled>

        <!-- BOTÓN DESACTIVADO -->
        <button class="btn btn-secondary btn-sm px-3" disabled>Sin Stock</button>

    <% } %>

</form>

        </div>
        <% } %>
    </div>
</section>
<% }} %>
<!-- // Contar unidades por producto -->
<%
Map<Integer, Integer> cantidades = new HashMap<>();
for (Producto p : carrito) {
    cantidades.put(p.getId(), cantidades.getOrDefault(p.getId(), 0) + 1);
}
%>


<!-- Carrito actualll -->
<section class="carrito mt-5">
    <h3 class="text-success mb-3">Carrito Actual</h3>

    <% if (carrito.isEmpty()) { %>
        <p class="text-muted text-center">El carrito está vacío.</p>
    <% } else { %>
        <table class="table table-bordered text-center align-middle">
            <thead class="table-success">
                <tr>
                    <th>Producto</th>
                    <th>Precio</th>
                    <th>Unidades</th>
                </tr>
            </thead>
            <tbody>
				    <% 
				    Set<Integer> mostrados = new HashSet<>();
				    for (Producto p : carrito) { 
				        if (mostrados.contains(p.getId())) continue;
				        mostrados.add(p.getId());
				    %>
				    <tr>
				        <td><%= p.getNombre() %></td>
				
				        <td>
				            <% if (p.getPrecioOferta() > 0 && p.getPrecioOferta() < p.getPrecio()) { %>
				                $<%= String.format("%.2f", p.getPrecioOferta()) %>
				            <% } else { %>
				                $<%= String.format("%.2f", p.getPrecio()) %>
				            <% } %>
				        </td>
				
				        <td><%= cantidades.get(p.getId()) %></td>
				    </tr>
				    <% } %>
				</tbody>

        </table>

        <h5 class="text-end mt-3">Total: $<%= String.format("%.2f", total) %></h5>



		<!-- Botón de pagar -->
		<!-- Botón PAGAR simple -->
			<form method="get" action="pagar.jsp" class="text-end mt-3">
			    <button type="submit" class="btn btn-primary"> Pagar Ahora </button>
			</form>

		
        <form method="post" class="text-end mt-3">
            <input type="hidden" name="accion" value="vaciar">
            <button type="submit" class="btn btn-danger">Vaciar Carrito</button>
        </form>
    <% } %>
</section>
</div>

<jsp:include page="header_footer/footer.jsp" />
</body>
</html>
