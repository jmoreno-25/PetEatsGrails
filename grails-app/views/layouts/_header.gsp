<%@ page contentType="text/html;charset=UTF-8" %>
<header class="cabecera">
  <div class="logo logo-con-modelo">
    <model-viewer
      src="${resource(dir:'img', file:'dog-bowl.glb')}"
      auto-rotate
      camera-controls
      disable-zoom
      style="width: 60px; height: 60px; margin-right: 10px;">
    </model-viewer>
    <div class="logo-texto">
      <h1><a href="${createLink(uri: '/')}">PetEats</a></h1>
      <p>Consiente a tu mascota</p>
    </div>
  </div>

  <nav class="menu">
    <ul>
      <li><a href="${createLink(controller:'inicioCli')}">Inicio</a></li>
      <li><a href="${createLink(controller:'productosCli')}">Productos</a></li>
      <li><a href="#">Nosotros</a></li>
      <li><a href="#">Contacto</a></li>
    </ul>
  </nav>

  <div class="iconos-header">
    <div class="menu-hamburguesa" onclick="toggleMenu()">☰</div>

    <i class="bi bi-search busqueda-toggle"></i>
    <input type="text" id="inputBuscar" placeholder="Buscar productos..." class="form-busqueda" />

    <div id="carrito-icono" style="position: relative;">
      <li><a href="${createLink(controller:'carritoCli')}" class="icono-carrito">
        <i class="bi bi-cart"></i>
      </a>
      <span id="contador-carrito" class="contador-carrito">0</span>
    </div>

    <a href="#" class="icono-perfil">
      <i class="bi bi-person-circle"></i>
    </a>

    <button id="toggle-dark" title="Modo oscuro/claro">
      <i class="bi bi-moon"></i>
    </button>
  </div>
</header>
