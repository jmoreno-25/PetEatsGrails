<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Bienvenido a PetEats Admin</title>
</head>
<body>
<div class="container mt-5">
    <div class="text-center">
        <h1 class="display-4 mb-4">👋 Bienvenido a PetEats Admin</h1>
        <p class="lead">Gestiona productos, categorías y tipos de animal-</p>

        <div class="row mt-5">
            <div class="col-md-4">
                <a href="${createLink(controller:'producto',action: 'list')}" class="btn btn-primary w-100 p-4 fs-5">🛍 Productos</a>
            </div>
            <div class="col-md-4">
                <a href="${createLink(controller:'categoria',action: 'list')}" class="btn btn-success w-100 p-4 fs-5">📦 Categorías</a>
            </div>
            <div class="col-md-4">
                <a href="${createLink(controller:'tipoAnimal',action: 'list')}" class="btn btn-warning w-100 p-4 fs-5">🐾 Tipos de Animal</a>
            </div>
            <div class="col-md-4">
                <a href="${createLink(controller:'marca',action: 'list')}" class="btn btn-warning w-100 p-4 fs-5">🐾 Marca</a>
            </div>
        </div>
    </div>
    <div class="text-center mb-4">
    </div>
    <div class="text-center mb-4">
        <asset:image src="peteats-banner.jpg" alt="PetEats Banner" class="img-fluid rounded shadow"/>
    </div>

</div>
</body>
</html>
