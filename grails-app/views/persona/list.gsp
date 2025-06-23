<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title>Personas</title>
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
            <i class="fa fa-plus"></i> Nueva Persona
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
        <th style="width:15%;">Cédula</th>
        <th style="width:20%;">Nombre</th>
        <th style="width:20%;">Apellido</th>
        <th style="width:15%;">Mail</th>
        <th style="width:15%;">Teléfono</th>
        <th style="width:10%; text-align:center;">Activo</th>
        <th style="width:10%; text-align:center;">Acciones</th>
    </tr>
    </thead>
</table>
<div id="tabla_ajax"></div>

<script>
    function createEditPersona(id) {
        const data = id ? {id: id} : {};
        const title = id ? "Editar Persona" : "Nueva Persona";
        $.post("${createLink(controller: 'persona', action: 'form_ajax')}", data, function (form) {
            bootbox.dialog({
                title: title,
                message: form
            });
        });
    }
    function showPersona(id) {
        $.post("${createLink(controller: 'persona', action: 'show_ajax')}", {id: id}, function (html) {
            bootbox.dialog({
                title: "Detalles de la Persona",
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



    function deletePersona(id) {
        bootbox.confirm("¿Deseas eliminar esta persona?", function (result) {
            if (result) {
                $.post("${createLink(controller: 'persona', action: 'delete_ajax')}", {id: id}, function (msg) {
                    if (msg === 'ok') {
                        location.reload();
                    } else {
                        console.error("Error al eliminar la persona");
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

    $('#criterio').keypress(function (e) {
        var keycode =(e.keyCode ? e.keyCode : e.which);
        if(keycode=='13'){

            $("#btnBuscar").click();
            return false;
        }
    })

    $("#btnBuscar").click(function () {
        const criterio = $("#criterio").val();
        $.ajax({
            type: "POST",
            url: "${createLink(controller: 'persona', action: 'buscar_ajax')}",
            data: {criterio: criterio},
            success: function (data) {
                $("#tabla_ajax").html(data);
            }
        });
    });
</script>

</body>
</html>
