<g:if test="${tipoAnimal}">
    <div class="row">
        <div class="col-md-3"><strong>ID:</strong></div>
        <div class="col-md-9">${tipoAnimal.id}</div>
    </div>
    <div class="row mt-2">
        <div class="col-md-3"><strong>Descripción:</strong></div>
        <div class="col-md-9">${tipoAnimal.animalDes}</div>
    </div>
</g:if>
<g:else>
    <p>No se encontró el tipo de animal.</p>
</g:else>
