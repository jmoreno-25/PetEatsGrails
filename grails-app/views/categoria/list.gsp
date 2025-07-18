<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title>Categorías</title>
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
            <i class="fa fa-plus"></i> Nueva Categoría
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
    function createEditCategoria(id) {
        console.log("Abriendo modal con ID:", id); // ✅ Verifica si aparece dos veces en consola

        const url = "${createLink(controller: 'categoria', action: 'form_ajax')}";
        $.post(url, {id: id}, function (data) {
            const modal = bootbox.dialog({
                title: id ? "Editar Categoría" : "Nueva Categoría",
                message: data,
                size: 'medium'
            });
        });
    }


    function showCategoria(id) {
        const url = "${createLink(controller: 'categoria', action: 'show_ajax')}";
        $.post(url, {id: id}, function (data) {
            bootbox.dialog({
                title: "Detalle de Categoría",
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

    function deleteCategoria(id) {
        bootbox.confirm("¿Seguro que deseas eliminar esta categoría?", function (result) {
            if (result) {
                $.post("${createLink(controller: 'categoria', action: 'delete_ajax')}", {id: id}, function (msg) {
                    if (msg === 'ok') {
                        location.reload();
                    } else {
                        alert("Error: " + msg);
                    }
                });
            }
        });
    }
    $(document).ready(function () {
        $("#criterio").html("maria");
        $("#btnBuscar").click();

    })
    $("#btnBuscar").click(function () {
        var criterio =$("#criterio").val();
        console.log('valor',criterio);
        $.ajax({
            type:"POST",
            url:"${createLink(controller: 'categoria',action:'buscar_ajax')}",
            data:{criterio:criterio},
            success: function (msg) {
                console.log(msg)
                $("#tabla_ajax").html(msg)

            }//successJava
        })
    })


</script>

</body>
</html>
