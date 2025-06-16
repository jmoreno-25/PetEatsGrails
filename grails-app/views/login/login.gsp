<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Iniciar Sesión - PetEats</title>
    <style>
    body {
        font-family: 'Segoe UI', sans-serif;
        background-color: #fefdf9;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    .login-container {
        background-color: white;
        padding: 2rem;
        border-radius: 1rem;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
        width: 350px;
    }

    h2 {
        text-align: center;
        color: #4a752c;
        margin-bottom: 1rem;
    }

    form {
        display: flex;
        flex-direction: column;
    }

    input[type="text"], input[type="password"] {
        padding: 0.6rem;
        margin: 0.5rem 0;
        border: 1px solid #ccc;
        border-radius: 0.4rem;
    }

    input[type="submit"] {
        background-color: #4a752c;
        color: white;
        border: none;
        padding: 0.8rem;
        margin-top: 1rem;
        border-radius: 0.4rem;
        cursor: pointer;
    }

    .error {
        color: red;
        font-size: 0.9rem;
        text-align: center;
    }

    .footer-text {
        text-align: center;
        font-size: 0.85rem;
        margin-top: 1.2rem;
    }

    .footer-text a {
        color: #4a752c;
        text-decoration: underline;
    }
    </style>
</head>
<body>

<div class="login-container">
    <h2>Iniciar Sesión</h2>

    <g:if test="${flash.message}">
        <div class="error">${flash.message}</div>
    </g:if>

    <g:form controller="login" action="validar">
        <input type="text" name="login" placeholder="Usuario" required autofocus />
        <input type="password" name="pass" placeholder="Contraseña" required />
        <input type="submit" value="Ingresar" />
    </g:form>

    <div class="footer-text">
        ¿Olvidaste tu contraseña? Contacta al administrador.
    </div>
</div>

</body>
</html>
