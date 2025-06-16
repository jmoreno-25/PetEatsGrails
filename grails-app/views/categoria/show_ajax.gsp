<g:if test="${categoria}">
    <div class="row">
        <div class="col-md-3"><strong>ID:</strong></div>
        <div class="col-md-9">${categoria.id}</div>
    </div>
    <div class="row mt-2">
        <div class="col-md-3"><strong>Descripción:</strong></div>
        <div class="col-md-9">${categoria.catDes}</div>
    </div>
</g:if>
<g:else>
    <p>No se encontró la categoría.</p>
</g:else>
