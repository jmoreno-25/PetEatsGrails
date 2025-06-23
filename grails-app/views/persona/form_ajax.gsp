<div class="modal-contenido">
    <g:form class="form-horizontal" name="frmPersona" role="form" action="save_ajax" method="POST">
        <g:hiddenField name="id" value="${persona?.id}"/>

        <div class="form-group col-md-12">
            <label class="col-md-2 control-label">Cédula</label>
            <div class="col-md-10">
                <g:textField name="cedula" class="form-control input-sm" value="${persona?.cedula}"/>
            </div>
        </div>

        <div class="form-group col-md-12">
            <label class="col-md-2 control-label">Nombre</label>
            <div class="col-md-10">
                <g:textField name="nombre" class="form-control input-sm required" value="${persona?.nombre}"/>
            </div>
        </div>

        <div class="form-group col-md-12">
            <label class="col-md-2 control-label">Apellido</label>
            <div class="col-md-10">
                <g:textField name="apellido" class="form-control input-sm" value="${persona?.apellido}"/>
            </div>
        </div>

        <div class="form-group col-md-12">
            <label class="col-md-2 control-label">Email</label>
            <div class="col-md-10">
                <g:textField name="mail" class="form-control input-sm required" value="${persona?.mail}"/>
            </div>
        </div>

        <div class="form-group col-md-12">
            <label class="col-md-2 control-label">Teléfono</label>
            <div class="col-md-10">
                <g:textField name="telefono" class="form-control input-sm" value="${persona?.telefono}"/>
            </div>
        </div>

        <div class="form-group col-md-12">
            <label class="col-md-2 control-label">Dirección</label>
            <div class="col-md-10">
                <g:textArea name="direccion" class="form-control input-sm" value="${persona?.direccion}"/>
            </div>
        </div>

        <div class="form-group col-md-12">
            <label class="col-md-2 control-label">Sexo</label>
            <div class="col-md-10">
                <g:select name="sexo" from="${['M', 'F']}" class="form-control input-sm" value="${persona?.sexo}"/>
            </div>
        </div>

        <div class="form-group col-md-12">
            <label class="col-md-2 control-label">Activo</label>
            <div class="col-md-10">
                <g:select name="activo"
                          from="${[1:'ACT', 0:'INA']}"
                          optionKey="key"
                          optionValue="value"
                          class="form-control input-sm"
                          value="${persona?.activo}"/>
            </div>
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
            url: "${createLink(controller: 'persona', action: 'save_ajax')}",
            data: $("#frmPersona").serialize(),
            success: function (msg) {
                if (msg === 'ok') {
                    location.reload();
                } else {
                    bootbox.alert("Error al guardar: " + msg);
                }
            }
        });
    });


    $("#cerrar").click(() => location.reload(true));

</script>
