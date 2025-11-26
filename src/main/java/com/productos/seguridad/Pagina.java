package com.productos.seguridad;

import java.sql.ResultSet;
import java.sql.SQLException;
import com.productos.datos.Conexion;

public class Pagina {
    /*public String mostrarMenu(Integer nperfil) {
        StringBuilder menu = new StringBuilder();
        String sql = "SELECT pag.id_pag, pag.descripcion_pag, pag.path_pag " +
                     "FROM tb_pagina pag " +
                     "JOIN tb_perfilpagina pper ON pag.id_pag = pper.id_pag " +
                     "WHERE pper.id_per = " + nperfil;

        Conexion con = new Conexion();
        ResultSet rs = null;

        try {
            rs = con.Consulta(sql);
            menu.append("<nav class='menu-container'>");
            while (rs.next()) {
                menu.append("<a class='menu-link' href='")
                    .append(rs.getString("path_pag"))
                    .append("' accesskey='")
                    .append(rs.getInt("id_pag"))
                    .append("'>")
                    .append(rs.getString("descripcion_pag"))
                    .append("</a>");
            }
            menu.append("</nav>");

        } catch (SQLException e) {
            System.out.println("❌ Error generando menú: " + e.getMessage());
        }

        return menu.toString();
    }*/
	
	/*public String mostrarMenu(Integer nperfil) {
	    String menu = "";
	    String sql = "SELECT * FROM tb_pagina pag, tb_perfil per, tb_perfilpagina pper " +
	                 "WHERE pag.id_pag = pper.id_pag AND pper.id_per = per.id_per " +
	                 "AND pper.id_per = " + nperfil;

	    Conexion con = new Conexion();
	    ResultSet rs = null;

	    try {
	        rs = con.Consulta(sql);
	        while (rs.next()) {
	            menu += "<a href=" + rs.getString(3) +
	                    " accesskey=" + rs.getInt(1) + ">" +
	                    rs.getString(2) + "</a>";
	        }
	    } catch (SQLException e) {
	        System.out.print(e.getMessage());
	    }

	    return menu;
	}
*/
	
	 public String mostrarMenu(Integer nperfil) {
	        String menu = "<nav class=\"navbar navbar-expand-lg bg-body-tertiary\">\r\n"
	                + "  <div class=\"container-fluid\">\r\n"
	                + "    <a class=\"navbar-brand\" href=\"#\">Menú</a>\r\n"
	                + "    <button class=\"navbar-toggler\" type=\"button\" data-bs-toggle=\"collapse\" "
	                + "data-bs-target=\"#navbarNav\" aria-controls=\"navbarNav\" aria-expanded=\"false\" "
	                + "aria-label=\"Toggle navigation\">\r\n"
	                + "      <span class=\"navbar-toggler-icon\"></span>\r\n"
	                + "    </button>\r\n"
	                + "    <div class=\"collapse navbar-collapse\" id=\"navbarNav\">\r\n"
	                + "      <ul class=\"navbar-nav\">\r\n";

	        String sql = "SELECT * FROM tb_pagina pag, tb_perfil per, tb_perfilpagina pper "
	                + "WHERE pag.id_pag = pper.id_pag AND pper.id_per = per.id_per "
	                + "AND pper.id_per = " + nperfil;

	        Conexion con = new Conexion();
	        ResultSet rs = null;

	        try {
	            rs = con.Consulta(sql);
	            while (rs.next()) {
	                menu += "        <li class=\"nav-item\">\r\n"
	                        + "          <a class=\"nav-link\" href=\"" + rs.getString(3)
	                        + "?accesskey=" + rs.getInt(1) + "\">"
	                        + rs.getString(2) + "</a>\r\n"
	                        + "        </li>\r\n";
	            }
	        } catch (SQLException e) {
	            System.out.println("Error al generar menú: " + e.getMessage());
	        }

	        menu += "      </ul>\r\n"
	                + "    </div>\r\n"
	                + "  </div>\r\n"
	                + "</nav>\r\n";

	        return menu;
	    }
}
