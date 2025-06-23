<table class="table table-striped table-bordered">
    <tbody>
    <g:each in="${personas}" var="persona">
        <tr data-id="${persona.id}">
            <td width="5%">${persona.id}</td>
            <td width="10%">${persona.cedula}</td>
            <td width="15%">${persona.nombre}</td>
            <td width="15%">${persona.apellido}</td>
            <td width="10%">${persona.mail}</td>
            <td width="10%">${persona.telefono}</td>
            <td width="5%">${persona.activo == 1 ? 'Activo' : 'Inactivo'}</td>
            <td width="15%">
                <a href="#" class="btn btn-sm btn-warning btn-edit" data-id="${persona.id}" title="Editar">
                    <i class="fa fa-edit"></i>
                </a>
                <a href="#" class="btn btn-sm btn-danger btn-delete" data-id="${persona.id}" title="Eliminar">
                    <i class="fa fa-trash"></i>
                </a>
                <a href="#" class="btn btn-sm btn-info btn-show" data-id="${persona.id}" title="Ver Detalles">
                    <i class="fa fa-eye"></i>
                </a>
            </td>
        </tr>
    </g:each>
    </tbody>
</table>

<script>
    $(".btn-edit").click(function () {
        createEditPersona($(this).data("id"));
    });
    $(".btn-delete").click(function () {
        deletePersona($(this).data("id"));
    });
    $(".btn-show").click(function () {
        showPersona($(this).data("id"));
    });
</script>
