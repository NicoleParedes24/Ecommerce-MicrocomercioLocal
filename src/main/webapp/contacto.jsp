<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Microcomercioo</title>
	<link rel="stylesheet" href="css/estilos.css">
	<link rel="stylesheet" href="css/estilosContacto.css">
<link rel="stylesheet" href="css/estilosRegistro.css">
	 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">


	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
	

</head>
<body>

	<jsp:include page="header_footer/header.jsp" />
	
		
 <h2>Contáctanos</h2>

  
    <div class="contenedor-contacto">

        <section class="formulario">
           
            <form action="enviarMensaje.jsp" method="post">
                <label for="nombre">Nombre:</label>
                <input type="text" id="nombre" name="nombre" required>

                <label for="correo">Correo electrónico:</label>
                <input type="email" id="correo" name="correo" required>

                <label for="mensaje">Mensaje:</label>
                <textarea id="mensaje" name="mensaje" rows="5" required></textarea>

                <button type="submit">Enviar</button>
            </form>
        </section>

        <section class="info">
           
            <p><strong>Dirección:</strong> Calle Bolívar y Sucre, Otavalo, Ecuador</p>
            <p><strong>Teléfono:</strong> +593 99 123 4567</p>
            <p><strong>Correo electrónico:</strong> info@comercialotavalo.com</p>
            <p><strong>Horario de atención:</strong> Lunes a viernes de 9:00 a 18:00</p>
        </section>

    </div>















<jsp:include page="header_footer/footer.jsp" />

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
