<%@ page import="java.util.*, com.productos.negocio.Producto" %>

<%
    // Recuperar carrito desde la sesión
    List<Producto> carrito = (List<Producto>) session.getAttribute("carrito");
    String mensaje = "";

    if (carrito == null || carrito.isEmpty()) {
        mensaje = "No hay productos en el carrito.";
    }

    String accion = request.getParameter("accion");

    // Procesar pago
    if ("procesar".equals(accion)) {

    Producto pdao = new Producto();

    // 1. Contar unidades por producto
    Map<Integer, Integer> cantidades = new HashMap<>();
    Map<Integer, Producto> productosUnicos = new HashMap<>();

    for (Producto p : carrito) {
        cantidades.put(p.getId(), cantidades.getOrDefault(p.getId(), 0) + 1);
        productosUnicos.put(p.getId(), p); // guardar referencia del producto
    }

    // 2. Restar stock UNA SOLA VEZ por producto
    for (Map.Entry<Integer, Integer> entry : cantidades.entrySet()) {
        int idProducto = entry.getKey();
        int unidadesCompradas = entry.getValue();

        Producto prod = productosUnicos.get(idProducto);

        int stockActual = prod.getCantidad()+1;
        int nuevoStock = stockActual - unidadesCompradas;

        // 🔥 IMPRIMIR EN TERMINAL PARA DEPURAR
        System.out.println("==== PROCESANDO PRODUCTO ====");
        System.out.println("ID producto: " + idProducto);
        System.out.println("Stock actual (antes de pagar): " + stockActual);
        System.out.println("Unidades compradas: " + unidadesCompradas);
        System.out.println("Stock que deberia quedar: " + nuevoStock);
        System.out.println("=============================");
       
        
        pdao.actualizarStock(idProducto, nuevoStock);
    }

    // 3. Vaciar carrito
    carrito.clear();
    session.setAttribute("carrito", carrito);

    mensaje = "Pago realizado con exito. ¡Gracias por su compra!";
}

%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Pagar</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-light">

<div class="container d-flex justify-content-center mt-5">
    <div class="card shadow p-4" style="width: 420px;">

        <h3 class="text-center mb-4">Pago con Tarjeta</h3>

        <% if (!mensaje.isEmpty()) { %>

            <div class="alert alert-success text-center">
                <%= mensaje %>
            </div>

            <div class="text-center mt-3">
                <a href="carrito.jsp" class="btn btn-primary w-100">Volver al Carrito</a>
            </div>

        <% } else { %>

        <!-- FORMULARIO DE PAGO -->
        <form method="post">
            <input type="hidden" name="accion" value="procesar">

            <div class="mb-3">
                <label class="form-label">Nombre del titular</label>
                <input type="text" name="nombre" class="form-control" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Numero de tarjeta</label>
                <input type="text" name="tarjeta" maxlength="16" class="form-control" required>
            </div>

            <div class="row mb-3">
                <div class="col">
                    <label class="form-label">Mes</label>
                    <input type="number" name="mes" class="form-control" min="1" max="12" required>
                </div>
                <div class="col">
                    <label class="form-label">Año</label>
                    <input type="number" name="anio" class="form-control" min="2025" max="2050" required>
                </div>
            </div>

            <div class="mb-3">
                <label class="form-label">CVV</label>
                <input type="number" name="cvv" maxlength="3" class="form-control" required>
            </div>

            <button type="submit" class="btn btn-success w-100 mb-2">Confirmar Pago</button>

            <!-- BOTÓN DE CANCELAR -->
            <a href="carrito.jsp" class="btn btn-secondary w-100">Cancelar</a>

        </form>

        <% } %>

    </div>
</div>

</body>
</html>
