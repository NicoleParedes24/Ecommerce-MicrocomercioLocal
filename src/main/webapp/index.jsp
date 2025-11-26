<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Microcomercioo Local</title>
	<link rel="stylesheet" href="css/estilos.css">
	
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
	
	<script type="module" src="https://unpkg.com/@google/model-viewer/dist/model-viewer.min.js"></script>
</head>
<body>
<jsp:include page="header_footer/header.jsp" />

	<!-- QUIÉNES SOMOS CENTRADO -->
	<section class="quienes-somos">
  <div class="contenido">
    <h3>Quiénes somos</h3>
    <p>Con más de 15 años, proveemos alimentos frescos y orgánicos para tu hogar.</p>
  </div>
</section>


	
	<!-- SECCIÓN CARRUSEL + EXPERIENCIA 3D -->
<section class="container-fluid mb-1 px-0">
  <div class="row align-items-center">
    
    <!-- 🟩 CARRUSEL BIEN A LA IZQUIERDA -->
    <div class="col-md-6 text-start ps-0 ms-0">
      <jsp:include page="homeBotstrap.jsp" />
    </div>

    <!-- 🟦 DERECHA: EXPERIENCIA 3D -->
    <div class="col-md-6 text-center">
      <h3 style ="color:#A63A2B">Bienvenido a nuestra experiencia 3D</h3>

      <model-viewer
        src="3D/boy.glb"
        alt="Modelo 3D de un niño"
        camera-controls
        auto-rotate
        ar
        ar-scale="fixed"
        touch-action="pan-y"
        shadow-intensity="1"
        skybox-image="imagenes/1.hdr"
        camera-orbit="0deg 75deg 10m"
        camera-target="0m 1m 0m"
        field-of-view="31deg"
        scale="10 10 10"
        style="width: 100%; max-width: 500px; height: 250px; margin: 0 auto 20px auto;">
      </model-viewer>

      <h3 style="color: #A63A2B">Conoce nuestra mascota</h3>
      <model-viewer
        camera-controls
        touch-action="pan-y"
        autoplay
        animation-name="Running"
        ar
        ar-modes="webxr scene-viewer"
        scale="0.2 0.2 0.2"
        shadow-intensity="1"
        src="3D/mascota.glb"
        alt="Modelo 3D animado de una mascota"
        style="width: 100%; max-width: 400px; height: 200px; margin: 0 auto;">
      </model-viewer>
    </div>
  </div>
</section>
	

	<!-- MAPA ABAJO -->
	<div class="mapa-contenedor container text-center mb-5">
        <h3 style = "color: #A63A2B">Donde nos ubicamos</h3>
        <iframe src="https://www.google.com/maps/d/embed?mid=1dJRFqnSVDSaCXj9pFdUjJ9rpoqP9-WE&ehbc=2E312F" width="100%" height="250" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
    </div>



	<jsp:include page="header_footer/footer.jsp" />

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
