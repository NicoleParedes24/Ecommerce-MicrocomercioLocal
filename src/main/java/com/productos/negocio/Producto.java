package com.productos.negocio;

import java.io.InputStream;
import java.sql.*;
import java.util.*;
import com.productos.datos.Conexion;

public class Producto {
    
    // 🔹 NUEVOS CAMPOS
    private boolean oferta;
    private double precioOferta;
    
    int id;
    int categoria;
    String nombre;
    int cantidad;
    double precio;
    byte[] foto;
    String imagen;

    // ======================
    // GETTERS Y SETTERS
    // ======================
    public boolean isOferta() {
        return oferta;
    }

    public void setOferta(boolean oferta) {
        this.oferta = oferta;
    }

    public double getPrecioOferta() {
        return precioOferta;
    }

    public void setPrecioOferta(double precioOferta) {
        this.precioOferta = precioOferta;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCategoria() {
        return categoria;
    }

    public void setCategoria(int categoria) {
        this.categoria = categoria;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public byte[] getFoto() {
        return foto;
    }

    public void setFoto(byte[] foto) {
        this.foto = foto;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

 // ACTUALIZAR STOCKKKKKKK

 public boolean actualizarStock(int id, int nuevoStock) {
     Conexion con = new Conexion();
     String sql = "UPDATE tb_producto SET cantidad_pr = ? WHERE id_pr = ?";
     try {
         PreparedStatement ps = con.getConexion().prepareStatement(sql);
         ps.setInt(1, nuevoStock);
         ps.setInt(2, id);
         ps.executeUpdate();
         return true;
     } catch (Exception e) {
         e.printStackTrace();
         return false;
     }
 }



    // INSERTAR PRODUCTO

    public String insertarProducto() {
        String result = "";
        Conexion con = new Conexion();
        String sql = "INSERT INTO tb_producto (id_cat, nombre_pr, cantidad_pr, precio_pr, imagen_pr, oferta, precio_oferta) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = con.getConexion().prepareStatement(sql);
            ps.setInt(1, this.getCategoria());
            ps.setString(2, this.getNombre());
            ps.setInt(3, this.getCantidad());
            ps.setDouble(4, this.getPrecio());
            ps.setString(5, this.getImagen());
            ps.setBoolean(6, this.isOferta());
            
            if (this.getPrecioOferta() > 0) {
                ps.setDouble(7, this.getPrecioOferta());
            } else {
                ps.setNull(7, Types.DOUBLE);
            }
            
            ps.executeUpdate();
            result = " Inserción correcta";
        } catch (Exception e) {
            result = "Error al insertar producto: " + e.getMessage();
            e.printStackTrace();
        }
        return result;
    }

    // LISTAR PRODUCTOS TODOS
    public List<Producto> listarProductos() {
        List<Producto> lista = new ArrayList<>();
        Conexion con = new Conexion();
        String sql = "SELECT * FROM tb_producto ORDER BY id_pr";
        try {
            PreparedStatement ps = con.getConexion().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Producto p = new Producto();
                p.setId(rs.getInt("id_pr"));
                p.setCategoria(rs.getInt("id_cat"));
                p.setNombre(rs.getString("nombre_pr"));
                p.setCantidad(rs.getInt("cantidad_pr"));
                p.setPrecio(rs.getDouble("precio_pr"));
                p.setImagen(rs.getString("imagen_pr"));
                p.setOferta(rs.getBoolean("oferta"));
                p.setPrecioOferta(rs.getDouble("precio_oferta"));
                lista.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return lista;
    }


    // LISTAR SOLO LOA  PRODUCTOS EN OFERTA

    public List<Producto> listarProductosEnOferta() {
        List<Producto> lista = new ArrayList<>();
        Conexion con = new Conexion();
        String sql = "SELECT * FROM tb_producto WHERE oferta = TRUE ORDER BY id_pr";
        try {
            PreparedStatement ps = con.getConexion().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Producto p = new Producto();
                p.setId(rs.getInt("id_pr"));
                p.setCategoria(rs.getInt("id_cat"));
                p.setNombre(rs.getString("nombre_pr"));
                p.setCantidad(rs.getInt("cantidad_pr"));
                p.setPrecio(rs.getDouble("precio_pr"));
                p.setImagen(rs.getString("imagen_pr"));
                p.setOferta(true);
                p.setPrecioOferta(rs.getDouble("precio_oferta"));
                lista.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return lista;
    }

        // ELIMINAR PRODUCTO  POR ID

    public String eliminarProducto(int id) {
        String result = "";
        Conexion con = new Conexion();
        String sql = "DELETE FROM tb_producto WHERE id_pr=?";
        try {
            PreparedStatement ps = con.getConexion().prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
            result = " Eliminado correctamente";
        } catch (Exception e) {
            result = " Error al eliminar producto: " + e.getMessage();
            e.printStackTrace();
        }
        return result;
    }


    // ACTIVAR OFERTA POR EL ID Y EL PRECIO

    public String activarOferta(int id, double precioOferta) {
        String mensaje = "";
        Conexion con = new Conexion();
        String sql = "UPDATE tb_producto SET oferta = TRUE, precio_oferta = ? WHERE id_pr = ?";
        try {
            PreparedStatement ps = con.getConexion().prepareStatement(sql);
            ps.setDouble(1, precioOferta);
            ps.setInt(2, id);
            ps.executeUpdate();
            mensaje = "✅ Producto puesto en oferta correctamente.";
        } catch (Exception e) {
            mensaje = " Error al activar oferta: " + e.getMessage();
            e.printStackTrace();
        }
        return mensaje;
    }

    // QUITAR OFERTA POR ID
    public String quitarOferta(int id) {
        String mensaje = "";
        Conexion con = new Conexion();
        String sql = "UPDATE tb_producto SET oferta = FALSE, precio_oferta = NULL WHERE id_pr = ?";
        try {
            PreparedStatement ps = con.getConexion().prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
            mensaje = "Oferta eliminada correctamente.";
        } catch (Exception e) {
            mensaje = "Error al quitar oferta: " + e.getMessage();
            e.printStackTrace();
        }
        return mensaje;
    }
}
