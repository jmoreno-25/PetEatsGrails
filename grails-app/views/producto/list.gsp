<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title>Productos</title>
</head>
<body>

<g:if test="${flash.message}">
    <div class="alert alert-success">${flash.message}</div>
</g:if>

<div class="btn-toolbar toolbar mb-3">
    <div class="btn-group">
        <g:link controller="inicio" action="index" class="btn btn-secondary">
            <i class="fa fa-arrow-left"></i> Regresar
        </g:link>
    </div>
    <div class="btn-group">
        <a href="#" class="btn btn-primary btnCrear">
            <i class="fa fa-plus"></i> Nuevo Producto
        </a>
    </div>
</div>
<div>
    <div class="col-md-12">
        <div class ="col-md-2"></div>
        <div class ="col-md-1">Buscar por:</div>
        <div class ="col-md-2">
            <input type =text placeholder="Criterio" id="criterio" style="width: 120px"></div>
        <div class ="btn-group col-md-3">
            <a href="#" class="btn-primary" id="btnBuscar">
                <i class="fa fa-search-plus"></i> Buscar
            </a>
        </div>
    </div>
</div>

<table class="table table-striped table-bordered">
    <thead>
    <tr>
        <th style="width:5%; text-align:center;">ID</th>
        <th style="width:15%;">Nombre</th>
        <th style="width:45%;">Descripción</th>
        <th style="width:5%; text-align:right;">Precio</th>
        <th style="width:15%;">Marca</th>
        <th style="width:15%;">Categoría</th>
        <th style="width:10%;">Animal</th>
        <th style="width:1%; text-align:center;">Stock</th>
        <th style="width:10%; text-align:center;">Estado</th>
        <th style="width:8%; text-align:center;">Acciones</th>
    </tr>
    </thead>
</table>
<div id="tabla_ajax">
</div>


<script>
    function createEditProducto(id) {
        const data = id ? {id: id} : {};
        const title = id ? "Editar Producto" : "Nuevo Producto";
        $.post("${createLink(controller: 'producto', action: 'form_ajax')}", data, function (form) {
            bootbox.dialog({
                title: title,
                message: form
            });
        });
    }
    function showProducto(id) {
        $.post("${createLink(controller: 'producto', action: 'show_ajax')}", {id: id}, function (html) {
            bootbox.dialog({
                title: "Detalles del Producto",
                message: html,
                buttons: {
                    cerrar: {
                        label: "Cerrar",
                        className: "btn-primary"
                    }
                }
            });
        });
    }
    function deleteProducto(id) {
        bootbox.confirm("¿Deseas eliminar este producto?", function (result) {
            if (result) {
                $.post("${createLink(controller: 'producto', action: 'delete_ajax')}", {id: id}, function (msg) {
                    if (msg === 'ok') {
                        location.reload();
                    } else {
                        log("Error al eliminar el producto", "error");
                    }
                });
            }
        });
    }
    $(function () {
        $(".btnCrear").click(() => createEditProducto());
        $("#btnBuscar").click(); // Ejecuta búsqueda inicial
    });
    $("#btnBuscar").click(function () {
        const criterio = $("#criterio").val();
        $.ajax({
            type: "POST",
            url: "${createLink(controller: 'producto', action: 'buscar_ajax')}",
            data: {criterio: criterio},
            success: function (data) {
                $("#tabla_ajax").html(data);
            }
        });
    });

</script>

</body>
</html>
