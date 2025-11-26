package com.productos.negocio;

import java.sql.*;
import java.util.*;
import com.productos.datos.Conexion;

public class Categoria {
    int id;
    String descripcion;

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getDescripcion() { return descripcion; }
    public void setDescripcion(String descripcion) { this.descripcion = descripcion; }

    // Listar todas las categorías
    public List<Categoria> listarCategorias() {
        List<Categoria> lista = new ArrayList<>();
        Conexion con = new Conexion();
        String sql = "SELECT * FROM tb_categoria ORDER BY id_cat";
        try {
            PreparedStatement ps = con.getConexion().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Categoria c = new Categoria();
                c.setId(rs.getInt("id_cat"));
                c.setDescripcion(rs.getString("descripcion_cat"));
                lista.add(c);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return lista;
    }

    // Insertar nueva categoría
    public String insertarCategoria() {
        String result = "";
        Conexion con = new Conexion();
        String sql = "INSERT INTO tb_categoria (descripcion_cat) VALUES (?)";
        try {
            PreparedStatement ps = con.getConexion().prepareStatement(sql);
            ps.setString(1, this.getDescripcion());
            ps.executeUpdate();
            result = "Inserción correcta";
        } catch (Exception e) {
            result = e.getMessage();
        }
        return result;
    }

 // ACTUALIZAR CATEGORÍA

 public String actualizarCategoria() {
     String result = "";
     Conexion con = new Conexion();
     PreparedStatement ps = null;
     String sql = "UPDATE tb_categoria SET descripcion_cat = ? WHERE id_cat = ?";

     try {
         ps = con.getConexion().prepareStatement(sql);
         ps.setString(1, this.getDescripcion());
         ps.setInt(2, this.getId());
         int filas = ps.executeUpdate();
         if (filas > 0) {
             result = "Categoría actualizada correctamente";
         } else {
             result = "No se encontró la categoría para actualizar";
         }
     } catch (Exception e) {
         result = "Error al actualizar categoría: " + e.getMessage();
         e.printStackTrace();
     } finally {
         try { if (ps != null) ps.close(); } catch (Exception e) {}
     }
     return result;
 }


 // ELIMINAR CATEGORÍA POR ID

 public String eliminarCategoria(int id) {
     String result = "";
     Conexion con = new Conexion();
     PreparedStatement ps = null;
     String sql = "DELETE FROM tb_categoria WHERE id_cat = ?";

     try {
         ps = con.getConexion().prepareStatement(sql);
         ps.setInt(1, id);
         int filas = ps.executeUpdate();
         if (filas > 0) {
             result = "Categoría eliminada correctamente";
         } else {
             result = "No se encontró la categoría para eliminar";
         }
     } catch (Exception e) {
         result = "Error al eliminar categoría: " + e.getMessage();
         e.printStackTrace();
     } finally {
         try { if (ps != null) ps.close(); } catch (Exception e) {}
     }
     return result;
 }

}
