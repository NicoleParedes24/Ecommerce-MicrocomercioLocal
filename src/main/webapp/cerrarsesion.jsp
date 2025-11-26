<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true" import="javax.servlet.http.HttpSession" %>

<%
    // Obtener la sesión actual y eliminarla
    HttpSession sesionOk = request.getSession();
    sesionOk.invalidate(); // Cierra la sesión
%>

<jsp:forward page="login.jsp">
    <jsp:param name="error" value="Sesion cerrada correctamente."/>
</jsp:forward>
