<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><g:layoutTitle default="PetEats"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <g:layoutHead/>

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootbox@6.0.0/bootbox.min.js"></script>
    <style>
    body {
        padding-top: 70px;
    }
    footer {
        margin-top: 50px;
        padding: 20px;
        background-color: #f8f9fa;
        text-align: center;
    }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container-fluid">
        <a class="navbar-brand" href="/">PetEats</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <g:link controller="producto" action="list" class="nav-link">Productos</g:link>
                </li>
                <li class="nav-item">
                    <g:link controller="categoria" action="list" class="nav-link">Categorías</g:link>
                </li>
                <li class="nav-item">
                    <g:link controller="tipoAnimal" action="list" class="nav-link">Tipos de Animal</g:link>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Contenido -->
<div class="container">
    <g:layoutBody/>
</div>

<!-- Footer -->
<footer>
&copy; 2025 PetEats. Todos los derechos reservados.
</footer>

<!-- Bootstrap 5 JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
