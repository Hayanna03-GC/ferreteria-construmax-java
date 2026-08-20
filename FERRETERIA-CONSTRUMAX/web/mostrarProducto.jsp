<%-- 
    Document   : mostrarProducto
    Created on : 2 abr. 2026, 14:59:55
    Author     : hayan
--%>

<%@page import="java.sql.*"%>
<%@page import="Proyecto.ConectarBD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="estilo3.css">
        <title>Lista de Productos</title>
    </head>
    <body>
        <h1>Lista de Productos</h1>
        <br>
        <table border="1">
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Precio</th>
                <th>Cantidad</th>
                <th>Opciones</th>
            </tr>
            <%
                ConectarBD con = new ConectarBD();
                PreparedStatement ps = con.crearPreparedStatement("SELECT * FROM producto");
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getInt("id")%></td>
                <td><%= rs.getString("nombre")%></td>
                <td><%= rs.getFloat("precio")%></td>
                <td><%= rs.getInt("cantidad")%></td>
                <td>
                    <a href="ServletProducto?accion=eliminar&id=<%= rs.getInt("id")%>">Eliminar</a>
                    |        
                    <a href="editarProducto.jsp?id=<%= rs.getInt("id")%>">Editar</a>
                </td>
            </tr>
            <%}
                con.cerrarConexion();
            %>
        </table>
        <br><br>
        <a href="agregarProducto.jsp">
            <button>Volver a agregar</button>
        </a>
        <br><br>
        <a href="index.jsp">
            <button>Volver al inicio</button>
        </a>
        <br><br>
    </body>
</html>