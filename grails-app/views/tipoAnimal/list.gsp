<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title>Tipos de Animal</title>
</head>
<body>

<div class="btn-toolbar mb-3">
    <div class="btn-group">
        <g:link controller="inicio" action="index" class="btn btn-secondary">
            <i class="fa fa-arrow-left"></i> Regresar
        </g:link>
    </div>

    <div class="btn-group">
        <a href="#" class="btn btn-primary btnCrear">
            <i class="fa fa-plus"></i> Nuevo Tipo de Animal
        </a>
    </div>
</div>

<table class="table table-striped table-bordered">
    <thead>
    <tr>
        <th>ID</th>
        <th>Descripción</th>
        <th>Acciones</th>
    </tr>
    </thead>
    <tbody>
    <g:each in="${tiposAnimales}" var="animal">
        <tr data-id="${animal.id}">
            <td>${animal.id}</td>
            <td>${animal.animalDes}</td>
            <td>
                <a href="#" class="btn btn-sm btn-warning btn-edit" data-id="${animal.id}" title="Editar">
                    <i class="fa fa-edit"></i>
                </a>
                <a href="#" class="btn btn-sm btn-danger btn-delete" data-id="${animal.id}" title="Eliminar">
                    <i class="fa fa-trash"></i>
                </a>
                <a href="#" class="btn btn-sm btn-info btn-show" data-id="${animal.id}" title="Ver Detalles">
                    <i class="fa fa-eye"></i>
                </a>
            </td>
        </tr>
    </g:each>
    </tbody>
</table>

<script>
    function createEditTipoAnimal(id) {
        const url = "${createLink(controller: 'tipoAnimal', action: 'form_ajax')}";
        $.post(url, {id: id}, function (data) {
            bootbox.dialog({
                title: id ? "Editar Tipo de Animal" : "Nuevo Tipo de Animal",
                message: data,
                size: 'medium'
            });
        });
    }

    function showTipoAnimal(id) {
        const url = "${createLink(controller: 'tipoAnimal', action: 'show_ajax')}";
        $.post(url, {id: id}, function (data) {
            bootbox.dialog({
                title: "Detalle del Tipo de Animal",
                message: data,
                buttons: {
                    ok: {
                        label: "Aceptar",
                        className: "btn-primary"
                    }
                }
            });
        });
    }

    function deleteTipoAnimal(id) {
        bootbox.confirm("¿Seguro que deseas eliminar este tipo de animal?", function (result) {
            if (result) {
                $.post("${createLink(controller: 'tipoAnimal', action: 'delete_ajax')}", {id: id}, function (msg) {
                    if (msg === 'ok') {
                        location.reload();
                    } else {
                        alert("Error: " + msg);
                    }
                });
            }
        });
    }

    $(function () {
        $(".btnCrear").click(() => createEditTipoAnimal());
        $(".btn-edit").click(function () {
            createEditTipoAnimal($(this).data("id"));
        });
        $(".btn-show").click(function () {
            showTipoAnimal($(this).data("id"));
        });
        $(".btn-delete").click(function () {
            deleteTipoAnimal($(this).data("id"));
        });
    });
</script>

</body>
</html>
