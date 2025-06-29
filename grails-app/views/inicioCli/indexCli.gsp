<!DOCTYPE html>
<html lang="es">
    <head>
      <meta charset="UTF-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
      <title>PetEats - Inicio</title>
      <link rel="stylesheet" href="${resource(dir: 'public/css', file: 'style.css')}" />
      <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
      <script type="module" src="https://unpkg.com/@google/model-viewer/dist/model-viewer.min.js"></script>
    </head>
    <body>
        <g:render template="/layouts/header" />
        <div id="header-container"></div>

        <section class="vista_principal">
          <div class="vista_principal_capa">
            <div class="vista_principal_texto">
              <h2>Bienvenido a PetEats</h2>
              <p>Tu tienda de confianza para consentir a tus mascotas</p>
            </div>
          </div>
        </section>

        <section class="seccion-categorias-3d">
          <div class="bone-3d left">
            <model-viewer src="${resource(dir: 'public/img', file: 'dog-biscuit.glb')}" auto-rotate rotation-per-second="30deg" camera-controls disable-zoom exposure="0.9" id="bone-left" style="width: 100px; height: 100px;"></model-viewer>
          </div>

          <div class="categorias-centro">
            <h2>Categorías</h2>
            <div class="contenedor-categorias">
              <a class="categoria-tarjeta" href="/cliente/productos?categoria=Alimentos Mascotas"><img src="https://st2.depositphotos.com/5372232/7899/i/450/depositphotos_78997064-stock-photo-multicolored-dry-cat-or-dog.jpg" alt="Alimentos"><p>Alimento</p></a>
              <a class="categoria-tarjeta" href="/cliente/productos?categoria=Juguetes Mascotas"><img src="https://i.pinimg.com/originals/39/36/04/3936046832eff2a639b460f1057c3249.jpg" alt="Juguetes"><p>Juguete</p></a>
              <a class="categoria-tarjeta" href="/cliente/productos?categoria=Accesorios Mascotas"><img src="https://feroz.com.co/cdn/shop/files/129_2048x.jpg?v=1738527586" alt="Accesorios"><p>Accesorio</p></a>
              <a class="categoria-tarjeta" href="/cliente/productos?categoria=Higiene Mascotas"><img src="https://static.miscota.com/media/1/photos/features/010/052999/sumsu-gamas-65645d891252a.png" alt="Higiene"><p>Higiene</p></a>
              <a class="categoria-tarjeta" href="/cliente/productos?categoria=Salud Mascotas"><img src="https://static.vecteezy.com/system/resources/previews/002/746/118/non_2x/animal-protection-and-care-flat-color-icon-pet-healthcare-service-veterinary-clinic-wildlife-and-environmental-protection-cartoon-style-clip-art-for-mobile-app-isolated-rgb-illustration-vector.jpg" alt="Salud"><p>Salud</p></a>
            </div>
          </div>

          <div class="bone-3d right">
            <model-viewer src="${resource(dir: 'public/img', file: 'dog-biscuit.glb')}" auto-rotate rotation-per-second="30deg" camera-controls disable-zoom exposure="0.9" id="bone-right" style="width: 100px; height: 100px;"></model-viewer>
          </div>
        </section>

        <section class="productos_destacados">
          <h2>Descubre nuestras secciones</h2>
          <div class="contenedor_productos">
            <div class="tarjeta_producto">
              <img src="${resource(dir: 'public/img', file: 'principal6.jpg')}" alt="Productos">
              <h3>Productos</h3>
              <p class="precio">Alimentos, juguetes, accesorios y más</p>
              <a href="/cliente/productos" class="boton_carrito">Ver productos</a>
            </div>
          </div>
        </section>

        <div id="footer-container"></div>

        <asset:javascript src="public/js/Busqueda.js" />
        <asset:javascript src="public/js/carrito.js" />
        <asset:javascript src="public/js/menjar_carrito.js" />

        <script>
        fetch("/public/components/header.html").then(res => res.text()).then(data => {
          document.getElementById("header-container").innerHTML = data;
          iniciarBusqueda();
        });
        fetch("/public/components/footer.html").then(res => res.text()).then(data => {
          document.getElementById("footer-container").innerHTML = data;
        });
        </script>

        <script>
          function rotarHueso3D() {
            let angle = 0;
            setInterval(() => {
              angle += 2;
              const rad = angle * (Math.PI / 180);
              const x = (Math.sin(rad * 1.2) * 90).toFixed(2);
              const y = (Math.cos(rad * 0.8) * 120).toFixed(2);
              const z = (Math.sin(rad * 1.5) * 70).toFixed(2);
              const rotacion = `${x}deg ${y}deg ${z}deg`;
              const boneL = document.getElementById("bone-left");
              const boneR = document.getElementById("bone-right");
              if (boneL) boneL.setAttribute("camera-orbit", rotacion);
              if (boneR) boneR.setAttribute("camera-orbit", `-${x}deg ${y}deg -${z}deg`);
            }, 40);
          }
          document.addEventListener("DOMContentLoaded", rotarHueso3D);
        </script>

    </body>
</html>
