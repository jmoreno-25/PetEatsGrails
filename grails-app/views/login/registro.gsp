<!DOCTYPE html>
<html>
<head>
    <title>Registrarse - PetEats</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #fefdf9;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .register-container {
            background-color: white;
            padding: 2rem;
            border-radius: 1rem;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            width: 350px;
        }

        h2 {
            text-align: center;
            color: #4a752c;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        input {
            padding: 0.6rem;
            margin: 0.4rem 0;
            border: 1px solid #ccc;
            border-radius: 0.4rem;
        }

        input[type="submit"] {
            background-color: #4a752c;
            color: white;
            cursor: pointer;
        }

        .error {
            color: red;
            text-align: center;
        }
    </style>
</head>
<body>
<div class="register-container">
    <h2>Crear cuenta</h2>

    <g:if test="${flash.message}">
        <div class="error">${flash.message}</div>
    </g:if>

    <g:form controller="login" action="registrarNuevo">
        <input type="text" name="cedula" placeholder="Cédula/RUC" required/>
        <input type="text" name="nombre" placeholder="Nombre" required/>
        <input type="text" name="apellido" placeholder="Apellido" required/>
        <input type="text" name="telefono" placeholder="Teléfono"/>
        <input type="text" name="correo" placeholder="Correo electrónico" required/>
        <input type="password" name="password" placeholder="Contraseña" required/>
        <input type="submit" value="Registrarse"/>
    </g:form>
</div>
</body>
</html>

