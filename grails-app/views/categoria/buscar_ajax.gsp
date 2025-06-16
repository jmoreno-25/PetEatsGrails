<table class="table table-striped table-bordered">
    <tbody>
    <g:each in="${categorias}" var="cat">
        <tr data-id="${cat.id}">
            <td width="5%">${cat.id}</td>
            <td width="50%">${cat.catDes}</td>
            <td width="20%">
                <a href="#" class="btn btn-sm btn-warning btn-edit" data-id="${cat.id}" title="Editar">
                    <i class="fa fa-edit"></i>
                </a>
                <a href="#" class="btn btn-sm btn-danger btn-delete" data-id="${cat.id}" title="Eliminar">
                    <i class="fa fa-trash"></i>
                </a>
                <a href="#" class="btn btn-sm btn-info btn-show" data-id="${cat.id}" title="Ver Detalles">
                    <i class="fa fa-eye"></i>
                </a>
            </td>
        </tr>
    </g:each>
    </tbody>
</table>
