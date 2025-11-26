<div class="carrusel-contenedor">
  <div id="carouselExample" class="carousel slide">
    <div class="carousel-inner">
      <div class="carousel-item active">
        <img src="imagenes/arroz.jpg" class="d-block w-100" alt="Arroz">
      </div>
      <div class="carousel-item">
        <img src="imagenes/azucar.jpg" class="d-block w-100" alt="Azúcar">
      </div>
      <div class="carousel-item">
        <img src="imagenes/fideo.jpg" class="d-block w-100" alt="Fideo">
      </div>
      <div class="carousel-item">
        <img src="imagenes/tienda.jpg" class="d-block w-100" alt="Tienda">
      </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Next</span>
    </button>
  </div>
</div>

<style>
.carrusel-contenedor {
  width: 600px;          /* o el ancho que uses */
  margin: -40px auto 0;  /* sube 40px y lo centra */
}

.carrusel-contenedor img {
  width: 100%;           /* que la imagen ocupe todo el carrusel */
  height: 400px;         /* ajusta altura si quieres */
  object-fit: cover;
  border-radius: 10px;
}

</style>
