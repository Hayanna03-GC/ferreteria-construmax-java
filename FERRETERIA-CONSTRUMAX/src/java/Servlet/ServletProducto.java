
package Servlet;

import Proyecto.ConectarBD;

import java.io.IOException;

import java.io.PrintWriter;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;
 
import java.io.IOException;

import java.sql.PreparedStatement;

import java.sql.ResultSet;

import javax.servlet.ServletException;

import javax.servlet.http.*;
 
public class ServletProducto extends HttpServlet {
 
    @Override

    protected void doGet(HttpServletRequest request, HttpServletResponse response)

            throws ServletException, IOException {

        String accion = request.getParameter("accion");

        String nombreBuscar = request.getParameter("nombreBuscar");

        if (nombreBuscar != null && !nombreBuscar.isEmpty()) {

            try {

                ConectarBD con = new ConectarBD();

                PreparedStatement ps = con.crearPreparedStatement(

                        "SELECT * FROM producto WHERE nombre LIKE ?"

                );
 
                ps.setString(1, "%" + nombreBuscar + "%");
 
                ResultSet rs = ps.executeQuery();
 
                if (rs.next()) {

                    request.setAttribute("id", rs.getInt("id"));

                    request.setAttribute("nombre", rs.getString("nombre"));

                    request.setAttribute("precio", rs.getFloat("precio"));

                    request.setAttribute("cantidad", rs.getInt("cantidad"));

                } else {

                    request.setAttribute("mensaje", "Producto no encontrado");

                }
 
                con.cerrarConexion();
 
                request.getRequestDispatcher("resultadoConsulta.jsp")

                        .forward(request, response);

                return;
 
            } catch (Exception e) {

                e.printStackTrace();

            }

        }
 
        if (accion != null && accion.equals("eliminar")) {

            int id = Integer.parseInt(request.getParameter("id"));

            try {

                ConectarBD con = new ConectarBD();

                PreparedStatement ps = con.crearPreparedStatement(

                        "DELETE FROM producto WHERE id=?"

                );

                ps.setInt(1, id);

                ps.executeUpdate();

                con.cerrarConexion();

            } catch (Exception e) {

                e.printStackTrace();

            }

        }

        response.sendRedirect("mostrarProducto.jsp");

    }
 
    @Override

    protected void doPost(HttpServletRequest request, HttpServletResponse response)

            throws ServletException, IOException {

        String accion = request.getParameter("accion");

        if (accion != null && accion.equals("editar")) {

            int id = Integer.parseInt(request.getParameter("id"));

            String nombre = request.getParameter("nombre");

            float precio = Float.parseFloat(request.getParameter("precio"));

            int cantidad = Integer.parseInt(request.getParameter("cantidad"));

            try {

                ConectarBD con = new ConectarBD();

                PreparedStatement ps = con.crearPreparedStatement(

                        "UPDATE producto SET nombre=?, precio=?, cantidad=? WHERE id=?"

                );

                ps.setString(1, nombre);

                ps.setFloat(2, precio);

                ps.setInt(3, cantidad);

                ps.setInt(4, id);

                ps.executeUpdate();

                con.cerrarConexion();

            } catch (Exception e) {

                e.printStackTrace();

            }

            response.sendRedirect("mostrarProducto.jsp");

            return;

        }

        int id = Integer.parseInt(request.getParameter("id"));

        String nombre = request.getParameter("nombre");

        float precio = Float.parseFloat(request.getParameter("precio"));

        int cantidad = Integer.parseInt(request.getParameter("cantidad"));

        try {

            ConectarBD con = new ConectarBD();

            PreparedStatement ps = con.crearPreparedStatement(

                    "INSERT INTO producto VALUES (?, ?, ?, ?)"

            );

            ps.setInt(1, id);

            ps.setString(2, nombre);

            ps.setFloat(3, precio);

            ps.setInt(4, cantidad);

            ps.executeUpdate();

            con.cerrarConexion();

        } catch (Exception e) {

            e.printStackTrace();

        }

        response.sendRedirect("mostrarProducto.jsp");

    }

}

 