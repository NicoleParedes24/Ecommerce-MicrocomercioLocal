<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true" import="com.productos.seguridad.*" %>

<%
    Usuario usuario = new Usuario();

    // Recibir parámetros desde el formulario
    String correo = request.getParameter("correo");
    String clave = request.getParameter("clave");

    HttpSession sesion = request.getSession(); // Se crea la variable de sesión

    // Verificar credenciales
    boolean respuesta = usuario.verificarUsuario(correo, clave);

    if (respuesta) {
        sesion.setAttribute("usuario", usuario.getNombre()); // Se añade atributo usuario
        sesion.setAttribute("perfil", usuario.getPerfil());  // Se añade atributo perfil
        response.sendRedirect("menu.jsp"); // Redireccionar si es correcto
    } else {
%>
<jsp:forward page="login.jsp">
    <jsp:param name="error" value="Datos incorrectos.<br/>Vuelva a intentarlo."/>
</jsp:forward>
<%
    }
%>
