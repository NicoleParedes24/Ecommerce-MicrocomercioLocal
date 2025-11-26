<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.productos.seguridad.*" %>

<%
    // ✅ Obtener los datos del formulario
    String nombre = request.getParameter("nombre");
    String cedula = request.getParameter("cedula");
    String correo = request.getParameter("correo");
    String clave = request.getParameter("clave");
    int estado = Integer.parseInt(request.getParameter("estado"));
    int perfil = Integer.parseInt(request.getParameter("perfil"));

    // ✅ Crear objeto Usuario y asignar valores
    Usuario u = new Usuario();
    u.setNombre(nombre);
    u.setCedula(cedula);
    u.setCorreo(correo);
    u.setClave(clave);
    u.setEstado(estado);
    u.setPerfil(perfil);

    // ✅ Insertar en la base de datos
    String resultado = u.ingresarUsuario();

    // ✅ Mostrar mensaje y redirigir
    if (resultado.contains("correcta")) {
        out.println("<script>alert('✅ Usuario registrado correctamente'); window.location='usuarios.jsp';</script>");
    } else {
        out.println("<script>alert('❌ Error al registrar usuario: " + resultado + "'); history.back();</script>");
    }
%>
