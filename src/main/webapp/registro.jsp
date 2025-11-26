<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Microcomercioo</title>
	<link rel="stylesheet" href="css/estilos.css">
<link rel="stylesheet" href="css/estilosRegistro.css">
	 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
</head>
<body>

	<jsp:include page="header_footer/header.jsp" />
		
	
		





	<!-- Título del formulario -->
	<h1 id="formClienteTitle">Registro de nuevo Cliente</h1>

	<!-- Formulario -->
	<div class="formulario-container">
	<form action="nuevoCliente.jsp" method="post" id="formCliente">
		<!-- Guarda el nombre del archivo para mostrarlo en la respuesta -->
		<input type="hidden" name="fotoNombre" id="fotoNombre">

		<table border="1">
			<thead>
				<tr>
					<th colspan="2">Complete sus datos</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>Nombre</td>
					<td><input type="text" id="nombre" name="txtNombre" required />
						<span class="req">*</span></td>
				</tr>

				<tr>
					<td>Cédula</td>
					<td><input type="text" id="cedula" name="txtCedula"
						maxlength="10" pattern="\d{10}" placeholder="10 dígitos" required />
						<span class="req">*</span></td>
				</tr>

				<tr>
					<td>Estado Civil</td>
					<td><select name="cmbEstado" id="estado" required>
							<option value="">-- Seleccione --</option>
							<option>Soltero</option>
							<option>Casado</option>
							<option>Divorciado</option>
							<!--  option>Viudo</option>-->
					</select> <span class="req">*</span></td>
				</tr>

				<tr>
					<td>Lugar residencia</td>
					<td><label><input type="radio" name="rdResidencia"
							value="Sur" required /> Sur</label> <label class="ms-2"><input
							type="radio" name="rdResidencia" value="Norte" /> Norte</label> <label
						class="ms-2"><input type="radio" name="rdResidencia"
							value="Centro" /> Centro</label> <span class="req">*</span></td>
				</tr>

				<tr>
					<td>Foto</td>
					<td><input type="file" id="foto" accept=".jpg,.jpeg,.png" />
						<!-- Solo mostramos el nombre en la respuesta (no se sube el archivo) -->
					</td>
				</tr>

				<tr>
					<td>Mes y año de nacimiento</td>
					<td><input type="month" id="fecha" name="mFecha" required />
						<span class="req">*</span></td>
				</tr>

				<tr>
					<td>Color favorito</td>
					<td><input type="color" id="color" name="cColor"
						value="#0088ff" /></td>
				</tr>

				<tr>
					<td>Correo electrónico</td>
					<td><input type="email" id="email" name="txtEmail"
						placeholder="usuario@proveedor.dominio" required /> <span
						class="req">*</span></td>
				</tr>

				<tr>
					<td>Clave</td>
					<td><input type="password" id="clave" name="txtClave" required />
						<span class="req">*</span></td>
				</tr>

				<tr>
					<td>Acciones</td>
					<td><input type="submit" value="Enviar"
						class="btn btn-primary" /> <input type="reset" value="Limpiar"
						class="btn btn-secondary ms-2" /></td>

				</tr>

			</tbody>
		</table>
	</form>
		<script src="js/recuperar.js"></script>
</div>


<footer class="mt-5 text-center">
		<ul class="list-inline">
			<li class="list-inline-item"><a href="https://www.facebook.com/SupermercadoFrescura">Facebook</a></li>
			<li class="list-inline-item"><a href="https://www.instagram.com/SupermercadoFrescura">Instagram</a></li>
			<li class="list-inline-item"><a href="https://www.twitter.com/FrescuraStore">Twitter</a></li>
		</ul>
		
		<!-- 
		nav>
			<a class="active" href="productos.jsp">Productos</a>
			<a href="servicios.jsp">Servicios</a>
			<a href="contacto.jsp">Contacto</a>
		</nav> -->
	</footer>

</body>
</html>