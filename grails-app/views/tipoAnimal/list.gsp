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
<div>
    <div class="col-md-12">
        <div class="col-md-2"></div>
        <div class="col-md-1">Buscar por:</div>
        <div class="col-md-2">
            <input type="text" placeholder="Criterio" id="criterio" style="width: 120px">
        </div>
        <div class="btn-group col-md-3">
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
        <th style="width:20%;">Descripción</th>
        <th style="width:10%; text-align:center;">Acciones</th>
    </tr>
    </thead>
</table>
<div id="tabla_ajax"></div>

<script>
    function createEditAnimal(id) {
        const url = "${createLink(controller: 'tipoAnimal', action: 'form_ajax')}";
        $.post(url, {id: id}, function (data) {
            bootbox.dialog({
                title: id ? "Editar Tipo de Animal" : "Nuevo Tipo de Animal",
                message: data,
                size: 'medium'
            });
        });
    }

    function showAnimal(id) {
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

    function deleteAnimal(id) {
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
    function contar() {
        $.ajax({
            type: "POST",
            url: "${createLink(controller: 'persona', action: 'contar')}",
            success: function(data) {
                $("#contar").text(data);
            },
            error: function(xhr, status, error) {
                console.error("Error al obtener el contador:", error);
                $("#contar").text("Error");
            }
        });
    }
    $("#btnBuscar").click(function () {
        var criterio =$("#criterio").val();
        console.log('valor',criterio);
        $.ajax({
            type:"POST",
            url:"${createLink(controller: 'tipoAnimal',action:'buscar_ajax')}",
            data:{criterio:criterio},
            success: function (msg) {
                console.log(msg)
                $("#tabla_ajax").html(msg)

            }//successJava
        })
    })
    $(document).ready(function () {
        $("#btnBuscar").click();
        $(".btnCrear").click(() => createEditAnimal());
        $(".btn-edit").click(function () {
            createEditAnimal($(this).data("id"));
        });
        $(".btn-show").click(function () {
            showAnimal($(this).data("id"));
        });
        $(".btn-delete").click(function () {
            deleteAnimal($(this).data("id"));
        });
    });
</script>

</body>
</html>
