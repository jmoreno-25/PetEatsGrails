<div class="modal-contenido">
    <g:form name="frmCategoria" action="save_ajax" method="POST">
        <g:hiddenField name="id" value="${categoria?.id}"/>

        <div class="form-group">
            <label for="catDes">Descripción</label>
            <g:textField name="catDes" value="${categoria?.catDes}" class="form-control" required="true"/>
        </div>
    </g:form>

    <div class="text-right">
        <button class="btn btn-primary" id="cerrar">Cancelar</button>
        <button class="btn btn-success" id="grabar">Guardar</button>
    </div>
</div>

<script>
    $("#grabar").click(function () {
        const descripcion = $("#catDes").val();
        if (!descripcion || descripcion.trim() === "") {
            bootbox.alert("Debe ingresar la descripción.");
            return;
        }

        $.ajax({
            type: "POST",
            url: "${createLink(controller: 'categoria', action: 'save_ajax')}",
            data: $("#frmCategoria").serialize(),
            success: function (msg) {
                if (msg === 'ok') {
                    location.reload();
                } else {
                    bootbox.alert("Error al guardar: " + msg);
                }
            }
        });
    });

    $("#cerrar").click(() => location.reload());
</script>
