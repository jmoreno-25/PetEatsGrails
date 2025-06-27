<div style="position: absolute; right: 240px; top: 140px;">
    Número de registros:${contador}
</div>
<table class="table table-striped table-bordered">
    <tbody>
    <g:each in="${tipoAnimal}" var="animal">
        <tr data-id="${animal.id}">
            <td>${animal.id}</td>
            <td>${animal.animalDes}</td>
            <td>
                <a href="#" class="btn btn-sm btn-warning btn-edit" data-id="${animal.id}" title="Editar">
                    <i class="fa fa-edit"></i>
                </a>
                <a href="#" class="btn btn-sm btn-danger btn-delete" data-id="${animal.id}" title="Eliminar">
                    <i class="fa fa-trash"></i>
                </a>
                <a href="#" class="btn btn-sm btn-info btn-show" data-id="${animal.id}" title="Ver Detalles">
                    <i class="fa fa-eye"></i>
                </a>
            </td>
        </tr>
    </g:each>
    </tbody>
</table>

<script>

    $(function () {

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