<%@page import="java.sql.*"%>
<%@page import="Proyecto.ConectarBD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <link rel="stylesheet" href="estilo6.css">
        <title>Editar Producto</title>
    </head>
    <body>

        <div class="contenedor-general">

            <div class="contenido">

                <img src="img/editar.gif" class="imagen" alt="Imagen">
                <div>
                    <h1>EDITAR PRODUCTO</h1>

                    <%int id = Integer.parseInt(request.getParameter("id"));
                        ConectarBD con = new ConectarBD();
                        PreparedStatement ps = con.crearPreparedStatement(
                                "SELECT * FROM producto WHERE id=?"
                        );
                        ps.setInt(1, id);
                        ResultSet rs = ps.executeQuery();
                        if (rs.next()) {
                    %>

                    <div class="caja">
                        <form action="ServletProducto" method="POST">

                            <input type="hidden" name="id" value="<%= rs.getInt("id")%>">

                            <label>NOMBRE:</label><br>
                            <input type="text" name="nombre" value="<%= rs.getString("nombre")%>">
                            <br><br>

                            <label>PRECIO:</label><br>
                            <input type="text" name="precio" value="<%= rs.getFloat("precio")%>">
                            <br><br>

                            <label>CANTIDAD:</label><br>
                            <input type="text" name="cantidad" value="<%= rs.getString("cantidad")%>">
                            <br><br>

                            <button type="submit" name="accion" value="editar">Actualizar</button>

                        </form>
                    </div>

                    <% } else { %>
                    <p>No se encontró el producto</p>
                    <% }%>

                </div>

            </div>

        </div>

    </body>
</html>