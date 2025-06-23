<table class="table table-striped table-bordered">
    <tbody>
    <g:each in="${productos}" var="prd">
        <tr data-id="${prd.id}">
            <td width="3%">${prd.id}</td>
            <td width="8%">${prd.prdNombre}</td>
            <td width="20%">${prd.prdDescripcion}</td>
            <td width="1%">${prd.prdPrecio}</td>
            <td width="10%">${prd.marca?.marcaDes}</td>
            <td width="8%">${prd.categoria?.catDes}</td>
            <td width="1%">${prd.tipoAnimal?.animalDes}</td>
            <td width="1%">${prd.prdStock}</td>
            <td width="1%">${prd.prdEstado}</td>
            <td width="8%">
                <a href="#" class="btn btn-sm btn-warning btn-edit" data-id="${prd.id}" title="Editar">
                    <i class="fa fa-edit"></i>
                </a>
                <a href="#" class="btn btn-sm btn-danger btn-delete" data-id="${prd.id}" title="Eliminar">
                    <i class="fa fa-trash"></i>
                </a>
                <a href="#" class="btn btn-sm btn-info btn-show" data-id="${prd.id}" title="Ver Detalles">
                    <i class="fa fa-eye"></i>
                </a>
            </td>
        </tr>
    </g:each>
    </tbody>
</table>

<script>
    $(".btn-edit").click(function () {
        createEditProducto($(this).data("id"));
    });
    $(".btn-delete").click(function () {
        deleteProducto($(this).data("id"));
    });
    $(".btn-show").click(function () {
        showProducto($(this).data("id"));
    });
</script>