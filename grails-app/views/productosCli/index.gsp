<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Productos - PetEats</title>
    <link rel="stylesheet" href="${resource(dir:'css', file:'style.css')}" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <script src="${resource(dir:'js', file:'jquery-3.3.1.min.js')}"></script>
    <script src="${resource(dir:'js', file:'Busqueda.js')}"></script>
    <script src="${resource(dir:'js', file:'carrito.js')}"></script>
    <script src="${resource(dir:'js', file:'menjar_carrito.js')}"></script>
</head>
<body onload="iniciarBusqueda(); cargarCarrito();">

    <g:render template="/layouts/header" />


    <div class="contenedor_productos mt-4" id="productos-container">
        <g:each in="${productos}" var="producto">
            <div class="tarjeta_producto" data-nombre="${producto.prdNombre}">
                <g:if test="${producto.prdImagen}">
                    <img src="${producto.prdImagen}" alt="${producto.prdNombre}">
                </g:if>
                <h3>${producto.prdNombre}</h3>
                <p class="precio">$${producto.prdPrecio}</p>

                <div class="acciones_producto">
                    <label for="cantidad_${producto.id}">Cantidad:</label>
                    <select id="cantidad_${producto.id}" class="cantidad_producto">
                        <g:each in="${1..5}" var="i">
                            <option value="${i}">${i}</option>
                        </g:each>
                    </select>
                </div>

                <button class="añadir_carrito" data-id="${producto.id}" data-nombre="${producto.prdNombre}" data-precio="${producto.prdPrecio}">
                    Agregar al carrito
                </button>
            </div>
        </g:each>
    </div>

    <g:render template="/layouts/footer" />


</body>
</html>
