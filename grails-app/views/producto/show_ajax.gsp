<g:if test="${producto?.id}">
    <div class="row mb-2">
        <div class="col-md-3 show-label">
            ID
        </div>
        <div class="col-md-9">
            ${producto?.id}
        </div>
    </div>
</g:if>

<g:if test="${producto?.prdNombre}">
    <div class="row mb-2">
        <div class="col-md-3 show-label">
            Nombre
        </div>
        <div class="col-md-9">
            ${producto?.prdNombre}
        </div>
    </div>
</g:if>

<g:if test="${producto?.prdDescripcion}">
    <div class="row mb-2">
        <div class="col-md-3 show-label">
            Descripción
        </div>
        <div class="col-md-9">
            ${producto?.prdDescripcion}
        </div>
    </div>
</g:if>

<g:if test="${producto?.prdPrecio != null}">
    <div class="row mb-2">
        <div class="col-md-3 show-label">
            Precio
        </div>
        <div class="col-md-9">
            $${producto?.prdPrecio}
        </div>
    </div>
</g:if>

<g:if test="${producto?.prdStock != null}">
    <div class="row mb-2">
        <div class="col-md-3 show-label">
            Stock
        </div>
        <div class="col-md-9">
            ${producto?.prdStock}
        </div>
    </div>
</g:if>

<g:if test="${producto?.prdEstado}">
    <div class="row mb-2">
        <div class="col-md-3 show-label">
            Estado
        </div>
        <div class="col-md-9">
            ${producto?.prdEstado}
        </div>
    </div>
</g:if>

<g:if test="${producto?.categoria}">
    <div class="row mb-2">
        <div class="col-md-3 show-label">
            Categoría
        </div>
        <div class="col-md-9">
            ${producto?.categoria?.catDes}
        </div>
    </div>
</g:if>

<g:if test="${producto?.tipoAnimal}">
    <div class="row mb-2">
        <div class="col-md-3 show-label">
            Tipo de Animal
        </div>
        <div class="col-md-9">
            ${producto?.tipoAnimal?.animalDes}
        </div>
    </div>
</g:if>
