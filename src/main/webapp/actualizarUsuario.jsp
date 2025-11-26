<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.productos.seguridad.*" %>
<%
    request.setCharacterEncoding("UTF-8");

    int id = Integer.parseInt(request.getParameter("id"));
    String nombre = request.getParameter("nombre");
    String correo = request.getParameter("correo");
    String clave = request.getParameter("clave");
    int estado = Integer.parseInt(request.getParameter("estado"));
    int perfil = Integer.parseInt(request.getParameter("perfil"));

    Usuario u = new Usuario();
    boolean actualizado = u.actualizarUsuario(id, nombre, correo, clave, estado, perfil);

    if (actualizado) {
        out.println("<script>alert('✅ Usuario actualizado correctamente'); window.location='usuarios.jsp';</script>");
    } else {
        out.println("<script>alert('❌ No se pudo actualizar el usuario'); window.location='usuarios.jsp';</script>");
    }
%>
