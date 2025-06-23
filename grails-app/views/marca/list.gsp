<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title>Marcas</title>
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
            <i class="fa fa-plus"></i> Nueva Marca
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
        <th style="width: 5%">ID</th>
        <th style="width: 50%">Descripción</th>
        <th style="width: 20%">Acciones</th>
    </tr>
    </thead>
</table>
<div id="tabla_ajax">
    Hola Mundo
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
    <g:each in="${marcas}" var="marca">
        <tr data-id="${marca.id}">
            <td>${marca.id}</td>
            <td>${marca.marcaDes}</td>
            <td>
                <a href="#" class="btn btn-sm btn-warning btn-edit" data-id="${marca.id}" title="Editar">
                    <i class="fa fa-edit"></i>
                </a>
                <a href="#" class="btn btn-sm btn-danger btn-delete" data-id="${marca.id}" title="Eliminar">
                    <i class="fa fa-trash"></i>
                </a>
                <a href="#" class="btn btn-sm btn-info btn-show" data-id="${marca.id}" title="Ver Detalles">
                    <i class="fa fa-eye"></i>
                </a>
            </td>
        </tr>
    </g:each>
    </tbody>
</table>

<script>
    function createEditMarca(id) {
        const url = "${createLink(controller: 'marca', action: 'form_ajax')}";
        $.post(url, {id: id}, function (data) {
            const modal = bootbox.dialog({
                title: id ? "Editar Marca" : "Nueva Marca",
                message: data,
                size: 'medium'
            });
        });
    }


    function showMarca(id) {
        const url = "${createLink(controller: 'marca', action: 'show_ajax')}";
        $.post(url, {id: id}, function (data) {
            bootbox.dialog({
                title: "Detalle de Marca",
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

    function deleteMarca(id) {
        bootbox.confirm("¿Seguro que deseas eliminar esta marca?", function (result) {
            if (result) {
                $.post("${createLink(controller: 'marca', action: 'delete_ajax')}", {id: id}, function (msg) {
                    if (msg === 'ok') {
                        location.reload();
                    } else {
                        alert("Error: " + msg);
                    }
                });
            }
        });
    }

    $("#btnBuscar").click(function () {
        var criterio =$("#criterio").val();
        console.log('valor',criterio);
        $.ajax({
            type:"POST",
            url:"${createLink(controller: 'marca',action:'buscar_ajax')}",
            data:{criterio:criterio},
            success: function (msg) {
                console.log(msg)
                $("#tabla_ajax").html(msg)

            }//successJava
        })
    })

    $(function () {
        $(".btnCrear").click(() => createEditMarca());
        $(".btn-edit").click(function () {
            createEditMarca($(this).data("id"));
        });
        $(".btn-show").click(function () {
            showMarca($(this).data("id"));
        });
        $(".btn-delete").click(function () {
            deleteMarca($(this).data("id"));
        });
    });
</script>

</body>
</html>
