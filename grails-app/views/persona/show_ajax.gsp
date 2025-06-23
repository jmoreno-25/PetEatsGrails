<g:if test="${persona?.id}">
    <div class="row mb-2">
        <div class="col-md-3 show-label">ID</div>
        <div class="col-md-9">${persona?.id}</div>
    </div>
</g:if>

<g:if test="${persona?.cedula}">
    <div class="row mb-2">
        <div class="col-md-3 show-label">Cédula</div>
        <div class="col-md-9">${persona?.cedula}</div>
    </div>
</g:if>

<g:if test="${persona?.nombre}">
    <div class="row mb-2">
        <div class="col-md-3 show-label">Nombre</div>
        <div class="col-md-9">${persona?.nombre}</div>
    </div>
</g:if>

<g:if test="${persona?.apellido}">
    <div class="row mb-2">
        <div class="col-md-3 show-label">Apellido</div>
        <div class="col-md-9">${persona?.apellido}</div>
    </div>
</g:if>

<g:if test="${persona?.mail}">
    <div class="row mb-2">
        <div class="col-md-3 show-label">Email</div>
        <div class="col-md-9">${persona?.mail}</div>
    </div>
</g:if>

<g:if test="${persona?.telefono}">
    <div class="row mb-2">
        <div class="col-md-3 show-label">Teléfono</div>
        <div class="col-md-9">${persona?.telefono}</div>
    </div>
</g:if>

<g:if test="${persona?.direccion}">
    <div class="row mb-2">
        <div class="col-md-3 show-label">Dirección</div>
        <div class="col-md-9">${persona?.direccion}</div>
    </div>
</g:if>

<g:if test="${persona?.sexo}">
    <div class="row mb-2">
        <div class="col-md-3 show-label">Sexo</div>
        <div class="col-md-9">
            ${persona?.sexo == 'M' ? 'Masculino' : (persona?.sexo == 'F' ? 'Femenino' : persona?.sexo)}
        </div>
    </div>
</g:if>

<g:if test="${persona?.fechaInicio}">
    <div class="row mb-2">
        <div class="col-md-3 show-label">Fecha de Inicio</div>
        <div class="col-md-9"><g:formatDate date="${persona?.fechaInicio}" format="dd-MM-yyyy"/></div>
    </div>
</g:if>

<g:if test="${persona?.fechaFin}">
    <div class="row mb-2">
        <div class="col-md-3 show-label">Fecha de Fin</div>
        <div class="col-md-9"><g:formatDate date="${persona?.fechaFin}" format="dd-MM-yyyy"/></div>
    </div>
</g:if>

<g:if test="${persona?.activo != null}">
    <div class="row mb-2">
        <div class="col-md-3 show-label">Estado</div>
        <div class="col-md-9">${persona?.activo == 1 ? 'ACT' : 'INA'}</div>
    </div>
</g:if>
