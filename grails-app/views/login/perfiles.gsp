<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Seleccionar Perfil - PetEats</title>
    <style>
    body {
        font-family: 'Segoe UI', sans-serif;
        background-color: #fefdf9;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }

    .perfil-container {
        background-color: white;
        padding: 2rem;
        border-radius: 1rem;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
        width: 350px;
        text-align: center;
    }

    h3 {
        color: #4a752c;
        margin-bottom: 1.5rem;
    }

    select.form-control {
        width: 100%;
        padding: 0.6rem;
        border: 1px solid #ccc;
        border-radius: 0.4rem;
        font-size: 1rem;
        margin-bottom: 1.5rem;
    }

    .btn-submit {
        background-color: #4a752c;
        color: white;
        border: none;
        padding: 0.8rem;
        width: 100%;
        border-radius: 0.4rem;
        cursor: pointer;
        font-size: 1.1rem;
    }

    .message {
        color: red;
        font-size: 0.9rem;
        margin-bottom: 1rem;
    }

    #cargando {
        display: none;
        margin-top: 1rem;
    }
    </style>
</head>
<body>

<div class="perfil-container">
    <h3>Seleccione su perfil de trabajo</h3>

    <g:if test="${flash.message}">
        <div class="message" role="alert">${flash.message}</div>
    </g:if>

    <g:form name="frmPerfiles" action="savePer">
        <g:select name="prfl" class="form-control" from="${perfilesUsr}" optionKey="id" optionValue="descripcion" required="true" />
        <button type="button" id="btnPerfiles" class="btn-submit">Entrar</button>
    </g:form>

    <div id="cargando">
        <img src="${resource(dir: 'images', file: 'spinner32.gif')}" alt="Cargando..." width="32" height="32"/>
        <p>Validando perfil...</p>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    function doSubmit() {
        $("#btnPerfiles").hide();
        $("#cargando").show();
        $("form[name='frmPerfiles']").submit();
    }

    $(function() {
        $("#btnPerfiles").click(function() {
            doSubmit();
        });

        $("select[name='prfl']").keypress(function(e) {
            if (e.keyCode === 13) {
                doSubmit();
            }
        });
    });
</script>

</body>
</html>
