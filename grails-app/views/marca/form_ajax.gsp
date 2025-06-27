<div class="modal-contenido">
    <g:form name="frmMarca" action="save_ajax" method="POST">
        <g:hiddenField name="id" value="${marca?.id}"/>

        <div class="form-group">
            <label for="marcaDes" >Descripción</label>
            <g:textField name="marcaDes" value="${marca?.marcaDes}" class="form-control" required="true"/>
        </div>
    </g:form>

    <div class="text-right">
        <button class="btn btn-primary" id="cerrar">Cancelar</button>
        <button class="btn btn-success" id="grabar">Guardar</button>
    </div>
</div>

<script>
    $("#grabar").click(function () {
        const descripcion = $("#marcaDes").val();
        if (!descripcion || descripcion.trim() === "") {
            bootbox.alert("Debe ingresar la descripción.");
            return;
        }

        $.ajax({
            type: "POST",
            url: "${createLink(controller: 'marca', action: 'save_ajax')}",
            data: $("#frmMarca").serialize(),
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
