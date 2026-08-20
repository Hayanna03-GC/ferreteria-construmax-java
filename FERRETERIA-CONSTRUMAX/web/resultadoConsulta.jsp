<%-- 
    Document   : resultadoConsulta
    Created on : 2 abr. 2026, 17:01:31
    Author     : hayan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="estilo5.css">
        <title>Resultado</title>
    </head>
    <body>
        <h2 class="titulo">RESULTADO DE LA CONSULTA</h2>
        <div class="resultado">
            <p>${mensaje}</p>

            <p>ID: <%= request.getAttribute("id")%></p>
            <p>Nombre: <%= request.getAttribute("nombre")%></p>
            <p>Precio: <%= request.getAttribute("precio")%></p>
            <p>Cantidad: <%= request.getAttribute("cantidad")%></p>

            <br>

            <div class="botones">
                <a href="consultaProducto.jsp">
                    <button>Volver a consultar</button>
                </a>
                <br><br>
                <a href="index.jsp">
                    <button>Inicio</button>
                </a>
            </div>
            <img src="img/goma.gif" class="imagen">
        </div>
    </body>
</html>
