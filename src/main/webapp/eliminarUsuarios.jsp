<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.productos.seguridad.*" %>
<%
    String idParam = request.getParameter("id");

    if (idParam != null) {
        int idUsuario = Integer.parseInt(idParam);
        Usuario usuario = new Usuario();
        boolean eliminado = usuario.eliminarUsuario(idUsuario);

        if (eliminado) {
%>
            <script type="text/javascript">
                alert("✅ Usuario eliminado con éxito");
                window.location.href = "usuarios.jsp";
            </script>
<%
        } else {
%>
            <script type="text/javascript">
                alert("❌ No se pudo eliminar el usuario");
                window.location.href = "usuarios.jsp";
            </script>
<%
        }
    } else {
%>
        <script type="text/javascript">
            alert("⚠️ ID no válido");
            window.location.href = "usuarios.jsp";
        </script>
<%
    }
%>
