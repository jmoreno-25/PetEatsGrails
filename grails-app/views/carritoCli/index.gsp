<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Mi Carrito - PetEats</title>

  <link rel="stylesheet" href="${resource(dir:'css', file:'style.css')}" />
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"/>

  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  <script src="${resource(dir:'js', file:'carrito.js')}" defer></script>
</head>
<body onload="cargarCarrito();">

  <g:render template="/layouts/header" />

  <div class="container py-5">
    <div class="row">
      <!-- Lista de productos en el carrito -->
      <div class="col-lg-8 mb-4">
        <h4 class="mb-3">Carrito de compras</h4>
        <div id="carrito-contenedor" class="vstack gap-3">
          <!-- Aquí se insertan los productos desde carrito.js -->
        </div>
      </div>

      <!-- Detalles de pago -->
      <div class="col-lg-4">
        <div class="card shadow-sm border-0">
          <div class="card-body">
            <h5 class="card-title mb-3">Detalles de pago</h5>
            <div class="d-flex justify-content-between">
              <span>Subtotal</span>
              <span id="subtotal">$0.00</span>
            </div>
            <div class="d-flex justify-content-between">
              <span>IVA (15%)</span>
              <span id="iva">$0.00</span>
            </div>
            <div class="border-top my-2"></div>
            <div class="d-flex justify-content-between fw-bold mb-3">
              <span>Total</span>
              <span id="total">$0.00</span>
            </div>
            <button class="btn w-100 text-white" style="background-color: #B98046;" onclick="completarPedido()">Pagar</button>
          </div>
        </div>
      </div>
    </div>
  </div>


  <g:render template="/layouts/footer" />
</body>
</html>
