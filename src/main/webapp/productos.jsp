<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Productos 3D</title>
  <link rel="stylesheet" href="css/estilosProductos.css">
  <script type="module" src="https://ajax.googleapis.com/ajax/libs/model-viewer/4.0.0/model-viewer.min.js"></script>
 
 
 <link rel="stylesheet" href="css/estilos.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">



</head>
<body>


	<jsp:include page="header_footer/header.jsp" />




<h1 >PRODUCTOS</h1>

<div class="contenedor-productos">

  <div class="producto">
    <model-viewer src="3D/bottle.glb" alt="Botella"
      camera-controls auto-rotate environment-image="neutral"
      class="model-viewer"></model-viewer>
    <h3>Botella Agua</h3>
    <p>$1.99</p>
  </div>

  <div class="producto">
    <model-viewer src="3D/ice.glb" alt="Helado"
      camera-controls auto-rotate environment-image="neutral"
      class="model-viewer"></model-viewer>
    <h3>Helado</h3>
    <p>$1.49</p>
  </div>

  <div class="producto">
    <model-viewer src="3D/milk.glb" alt="Leche"
      camera-controls auto-rotate environment-image="neutral"
      class="model-viewer"></model-viewer>
    <h3>Leche</h3>
    <p>$3.75</p>
  </div>
  
   <div class="producto">
    <model-viewer src="3D/cho.glb" alt="Leche"
      camera-controls auto-rotate environment-image="neutral"
      class="model-viewer"></model-viewer>
    <h3>Chocolate</h3>
    <p>$0.75</p>
  </div>
  
  <div class="producto">
    <model-viewer src="3D/atun.glb" alt="Atun"
      camera-controls auto-rotate environment-image="neutral"
      class="model-viewer"></model-viewer>
    <h3>Atun</h3>
    <p>$3.75</p>
  </div>
  
  <div class="producto">
    <model-viewer src="3D/cocacola.glb" alt="Leche"
      camera-controls auto-rotate environment-image="neutral"
      class="model-viewer"></model-viewer>
    <h3>CocaCola</h3>
    <p>$1.75</p>
  </div>
  <div class="producto">
    <model-viewer src="3D/oreo.glb" alt="OREO"
      camera-controls auto-rotate environment-image="neutral"
      class="model-viewer"></model-viewer>
    <h3>Galletas Oreo</h3>
    <p>$1.50</p>
  </div>
    <div class="producto">
    <model-viewer src="3D/egg.glb" alt="Huevos"
      camera-controls auto-rotate environment-image="neutral"
      class="model-viewer"></model-viewer>
    <h3>Cuebeta de huevos</h3>
    <p>$3.50</p>
  </div>



  <!-- div class="producto">
  <model-viewer src="3D/boy.glb" alt="Niño"
      camera-controls auto-rotate environment-image="neutral"
      class="model-viewer"></model-viewer>
    <h3>Niño</h3>
    <p>$7.99</p>
  </div> -->
    
    

</div>




<h1>SERVICIOS</h1>

<div class="contenedor-productos">
  <div class="producto">
    <model-viewer src="3D/Taxi.glb" alt="Leche"
      camera-controls auto-rotate environment-image="neutral"
      class="model-viewer"></model-viewer>
    <h3>Servicio de taxi</h3>

  </div>
   <div class="producto">
    <model-viewer src="3D/parking.glb" alt="Leche"
      camera-controls auto-rotate environment-image="neutral"
      class="model-viewer"></model-viewer>
    <h3>Parqueadero gratuito</h3>

  </div>

  <div class="producto">
    <model-viewer src="3D/Truck.glb" alt="Leche"
      camera-controls auto-rotate environment-image="neutral"
      class="model-viewer"></model-viewer>
    <h3>Servicio a domicilio</h3>

  </div>
    <div class="producto">
    <model-viewer src="3D/Present.glb" alt="Leche"
      camera-controls auto-rotate environment-image="neutral"
      class="model-viewer"></model-viewer>
    <h3>Envia un regalo sorpresa</h3>

  </div>
  
</div>
  

    
 <model-viewer camera-controls touch-action="pan-y" 
 autoplay animation-name="Running" ar ar-modes="webxr scene-viewer" 
 scale="0.2 0.2 0.2" shadow-intensity="1" 
 src="3D/9.glb" 
 alt="An animate 3D model of a robot"></model-viewer> 
</div>
  
  
  
  
  
<!--  model-viewer
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
  scale="8 8 8"
  style="width: 600px; height: 300px; display: block; margin: 0 auto;">
</model-viewer>-->





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
	</main>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	



</html>
