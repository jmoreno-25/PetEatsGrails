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

<table class="table table-striped table-bordered table-hover">
    <thead>
    <tr>
        <th>ID</th>
        <th>Nombre</th>
        <th>Descripción</th>
        <th>Precio</th>
        <th>Marca</th>
        <th>Animal</th>
        <th>Categoria</th>
        <th>Stock</th>
        <th>Estado</th>
        <th>Acciones</th>
    </tr>
    </thead>
    <tbody>
    <g:if test="${productos?.size() > 0}">
        <g:each in="${productos}" var="producto">
            <tr data-id="${producto.id}">
                <td>${producto.id}</td>
                <td>${producto.prdNombre}</td>
                <td>${producto.prdDescripcion}</td>
                <td>${producto.prdPrecio}</td>
                <td>${producto.marca}</td>
                <td>${producto.categoria}</td>
                <td>${producto.tipoAnimal}</td>
                <td>${producto.prdStock}</td>
                <td>${producto.prdEstado}</td>
                <td>
                    <a href="#" class="btn btn-sm btn-success btn-edit btn-ajax" data-id="${producto.id}" title="Editar">
                        <i class="fa fa-edit"></i>
                    </a>
                    <a href="#" class="btn btn-sm btn-danger btn-borrar btn-ajax" data-id="${producto.id}" title="Eliminar">
                        <i class="fa fa-trash"></i>
                    </a>
                    <a href="#" class="btn btn-sm btn-info btn-show btn-ajax" data-id="${producto.id}" title="Ver Producto">
                        <i class="fa fa-eye"></i>
                    </a>
                </td>
            </tr>
        </g:each>
    </g:if>
    <g:else>
        <tr>
            <td colspan="7" class="text-center">No hay productos para mostrar</td>
        </tr>
    </g:else>
    </tbody>
</table>

<script>
    function submitForm() {
        const $form = $("#frmProducto");
        $.ajax({
            type: "POST",
            url: $form.attr("action"),
            data: $form.serialize(),
            success: function (msg) {
                if (msg === 'ok') {
                    log("Producto guardado correctamente", "success");
                    setTimeout(() => location.reload(), 500);
                } else {
                    log("Error al guardar el producto", "error");
                }
            }
        });
    }

    function deleteRow(id) {
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

    function createEditRow(id) {
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

    $(function () {
        $(".btnCrear").click(() => {
            createEditRow();
        return false;
    });

        $(".btn-edit").click(function () {
            createEditRow($(this).data("id"));
        });

        $(".btn-borrar").click(function () {
            deleteRow($(this).data("id"));
        });

        $(".btn-show").click(function () {
            showProducto($(this).data("id"));
        });
    });
</script>

</body>
</html>
