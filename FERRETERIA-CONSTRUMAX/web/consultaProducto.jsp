<%-- 
    Document   : ConsultaProducto
    Created on : 2 abr. 2026, 17:00:44
    Author     : hayan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="estilo4.css">
        <title>Consulta de Productos</title>
    </head>

    <body>
        <h1>CONSULTA PRODUCTO</h1>
        <br>
        <div class="caja-img">
            <img src="img/bear.gif" class="imgagen">
        </div>
        <div class="caja">
            <form action="ServletProducto" method="GET">
                <label>Ingrese nombre del producto:</label>
                <br><br>
                <input type="text" name="nombreBuscar">
                <br><br>
                <button type="submit">BUSCAR</button>
            </form>
            <br>
            <a href="index.jsp">
                <button>Volver al inicio</button>
            </a>
        </div>

    </body>
</html>
