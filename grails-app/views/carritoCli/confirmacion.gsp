<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <title>Confirmación - PetEats</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="${resource(dir:'css', file:'style.css')}" />
</head>
<body>
  <g:render template="/layouts/header" />
  <section class="content">
    <div class="texto-contacto">
      <h3>¡Gracias por tu compra!</h3>
      <p>Tu pedido ha sido confirmado exitosamente.</p>
      <p>En breve recibirás un correo con los detalles.</p>
      <g:link controller="productosCli" action="index" class="btn-completar">Volver al inicio</g:link>
    </div>
  </section>

  <g:render template="/layouts/footer" />

  <script>
    document.addEventListener('DOMContentLoaded', function () {
      const dark = localStorage.getItem('dark-mode') === 'true';
      document.body.classList.toggle('dark-mode', dark);
    });
  </script>
</body>
</html>
