<div class="modal-contenido">
    <g:form class="form-horizontal" name="frmProducto" role="form" action="save_ajax" method="POST">
        <g:hiddenField name="id" value="${producto?.id}"/>

        <div class="form-group col-md-12">
            <span class="row">
                <label for="prdNombre" class="col-md-2 control-label">
                    Nombre
                </label>
                <div class="col-md-9">
                    <g:textField name="prdNombre" maxlength="100" class="form-control input-sm required"
                                 value="${producto?.prdNombre}"/>
                </div>
            </span>
        </div>

        <div class="form-group col-md-12">
            <span class="row">
                <label for="prdDescripcion" class="col-md-2 control-label">
                    Descripción
                </label>
                <div class="col-md-9">
                    <g:textArea name="prdDescripcion" class="form-control input-sm"
                                value="${producto?.prdDescripcion}"/>
                </div>
            </span>
        </div>

        <div class="form-group col-md-12">
            <span class="row">
                <label for="prdPrecio" class="col-md-2 control-label">
                    Precio
                </label>
                <div class="col-md-3">
                    <g:field name="prdPrecio" type="number" step="0.01" class="form-control input-sm required"
                             value="${producto?.prdPrecio}"/>
                </div>

                <label for="prdStock" class="col-md-2 control-label">
                    Stock
                </label>
                <div class="col-md-3">
                    <g:field name="prdStock" type="number" class="form-control input-sm"
                             value="${producto?.prdStock}"/>
                </div>
            </span>
        </div>

        <div class="form-group col-md-12">
            <span class="row">
                <label for="categoria.id" class="col-md-2 control-label">
                    Categoría
                </label>
                <div class="col-md-9">
                    <g:select name="categoria.id" from="${categorias}" optionKey="id" optionValue="catDes"
                              class="form-control input-sm" value="${producto?.categoria?.id}"/>
                </div>
            </span>
        </div>

        <div class="form-group col-md-12">
            <span class="row">
                <label for="tipoAnimal.id" class="col-md-2 control-label">
                    Tipo Animal
                </label>
                <div class="col-md-9">
                    <g:select name="tipoAnimal.id" from="${tiposAnimales}" optionKey="id" optionValue="animalDes"
                              class="form-control input-sm" value="${producto?.tipoAnimal?.id}"/>
                </div>
            </span>
        </div>
        <div class ="form-group col-md-12">
            <span class ="row">
                <label for="marca.id" class="col-md-2 control-label">
                    Marca
                </label>
                <div class="col-md-9">
                    <g:select name="marca.id" from="${marcas}" optionKey="id" optionValue="marcaDes"
                              class="form-control input-sm" value="${producto?.marca?.id}"></g:select>
                </div>
            </span>
        </div>

        <div class="form-group col-md-12">
            <span class="row">
                <label for="prdEstado" class="col-md-2 control-label">
                    Estado
                </label>
                <div class="col-md-9">
                    <g:select name="prdEstado" from="${['ACT', 'INA']}" class="form-control input-sm"
                              value="${producto?.prdEstado ?: 'ACT'}"/>
                </div>
            </span>
        </div>
    </g:form>

    <div class="col-md-12 text-right">
        <button id="cerrar" class="btn btn-primary">Cancelar</button>
        <button id="grabar" class="btn btn-info">Grabar</button>
    </div>
</div>

<script type="text/javascript">
    $(document).on('click', '#grabar', function () {
        $.ajax({
            type: "POST",
            url: "${createLink(controller: 'producto', action: 'save_ajax')}",
            data: $("#frmProducto").serialize(),
            success: function (msg) {
                if (msg === 'ok') {
                    location.reload();
                } else {
                    bootbox.alert("Error al guardar: " + msg);
                }
            }
        });
    });

    $("#grabar").click(function () {
        const nombre = $("#prdNombre").val();
        const precio = parseFloat($("#prdPrecio").val());
        const stock = parseInt($("#prdStock").val());

        if (!nombre || nombre.trim() === "") {
            bootbox.alert("<i class='fa fa-exclamation-triangle fa-3x pull-left text-warning text-shadow'></i> Ingrese el nombre del producto.");
        } else if (isNaN(precio) || precio <= 0) {
            bootbox.alert("<i class='fa fa-exclamation-triangle fa-3x pull-left text-warning text-shadow'></i> Ingrese un precio válido.");
        } else if (isNaN(stock) || stock < 0) {
            bootbox.alert("<i class='fa fa-exclamation-triangle fa-3x pull-left text-warning text-shadow'></i> Ingrese un stock válido.");
        } else {
            submitForm();
            setTimeout(() => location.reload(true), 300);
        }
    });

    $("#cerrar").click(() => location.reload(true));
</script>
