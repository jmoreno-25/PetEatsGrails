<div style="position: absolute; right: 240px; top: 140px;">
    Número de registros:${contador}
</div>
<table class="table table-striped table-bordered">
    <tbody>
    <g:each in="${marcas}" var="marca">
        <tr data-id="${marca.id}">
            <td width="5%">${marca.id}</td>
            <td width="50%">${marca.marcaDes}</td>
            <td width="20%">
                <a href="#" class="btn btn-sm btn-warning btn-edit" data-id="${marca.id}" title="Editar">
                    <i class="fa fa-edit"></i>
                </a>
                <a href="#" class="btn btn-sm btn-danger btn-delete" data-id="${marca.id}" title="Eliminar">
                    <i class="fa fa-trash"></i>
                </a>
                <a href="#" class="btn btn-sm btn-info btn-show" data-id="${marca.id}" title="Ver Detalles">
                    <i class="fa fa-eye"></i>
                </a>
            </td>
        </tr>
    </g:each>
    </tbody>
</table>
<script>

    $(function () {
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