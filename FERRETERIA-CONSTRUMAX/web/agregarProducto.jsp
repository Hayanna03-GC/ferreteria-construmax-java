<%-- 
    Document   : index
    Created on : 2 abr. 2026, 14:57:22
    Author     : hayan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="estilo2.css">
        <title>Registro</title>
    </head>
    <body>
        <div class="contenedor-general">
            <h1>REGISTRO DE NUEVOS PRODUCTOS</h1>
            <div class="contenido">
                <div class="caja">
                    <form action="ServletProducto" method="POST">
                        <p><label>ID: </label><input type="text" name="id"></p>
                        <br><p><label>NOMBRE: </label><input type="text" name="nombre"></p>
                        <br>
                        <p><label>PRECIO: </label><input type="text" name="precio"></p>
                        <br>
                        <p><label>CANTIDAD: </label><input type="text" name="cantidad"></p>
                        <br>
                        <button type="submit">GUARDAR</button>
                    </form>
                    <br>
                    <a href="index.jsp">
                        <button>Volver al inicio</button>
                    </a>
                </div>
                <img src="img/busy.gif" class="imagen">
            </div>
        </div>
    </body>
</html>
