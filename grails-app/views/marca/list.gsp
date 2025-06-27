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
</div>


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

    $(document).ready(function () {
        $("#btnBuscar").click();
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
