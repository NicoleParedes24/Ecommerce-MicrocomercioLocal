package com.productos.seguridad;
import com.productos.datos.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Usuario {

	int id;
	int perfil;
	int estadoCivil;
	String cedula;
	String nombre;
	String correo;
	String clave;


    // Constructor vacío
    public Usuario() {}

    // Getters y Setters
    
    
    public int getEstado() {
    	return this.estadoCivil;
    }
    
    public void setEstado(int estado) {
    	this.estadoCivil=estado;
    }
    
    public String getCedula() {
    	return this.cedula;
    }
    public void setCedula(String cedula) {
    	this.cedula=cedula;
    }
    
    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public int getPerfil() {
        return perfil;
    }

    public void setPerfil(int perfil) {
        this.perfil = perfil;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public ResultSet obtenerUsuarioPorId(int id) {
        ResultSet rs = null;
        try {
            Conexion clsCon = new Conexion();
            String sql = "SELECT * FROM tb_usuario WHERE id_us = " + id;
            rs = clsCon.Consulta(sql);
        } catch (Exception e) {
            System.out.println("❌ Error al obtener usuario: " + e.getMessage());
        }
        return rs;
    }
    //actulizar usuario 
    public boolean actualizarUsuario(int id, String nombre, String correo, String clave, int estado, int perfil) {
        boolean actualizado = false;
        Conexion con = new Conexion();
        PreparedStatement ps = null;

        try {
            String sql = "UPDATE tb_usuario SET nombre_us=?, correo_us=?, clave_us=?, id_est=?, id_per=? WHERE id_us=?";
            ps = con.getConexion().prepareStatement(sql);
            ps.setString(1, nombre);
            ps.setString(2, correo);
            ps.setString(3, clave);
            ps.setInt(4, estado);
            ps.setInt(5, perfil);
            ps.setInt(6, id);

            if (ps.executeUpdate() > 0) {
                actualizado = true;
                System.out.println("✅ Usuario actualizado correctamente (ID=" + id + ")");
            } else {
                System.out.println("⚠️ No se actualizó ningún usuario (ID=" + id + ")");
            }
        } catch (Exception e) {
            System.out.println("❌ Error al actualizar usuario: " + e.getMessage());
        } finally {
            try {
                if (ps != null) ps.close();
                if (con.getConexion() != null) con.getConexion().close();
            } catch (Exception e) {
                System.out.println("⚠️ Error cerrando conexión: " + e.getMessage());
            }
        }

        return actualizado;
    }


    
    // Método para verificar usuario
    public boolean verificarUsuario(String ncorreo, String nclave) {
        boolean respuesta = false;
        String sentencia = "SELECT * FROM tb_usuario WHERE correo_us='" + ncorreo +
                           "' AND clave_us='" + nclave + "';";

        try {
            Conexion clsCon = new Conexion();
            ResultSet rs = clsCon.Consulta(sentencia);

            if (rs.next()) {
                respuesta = true;
                this.setCorreo(rs.getString("correo_us"));
                this.setClave(rs.getString("clave_us"));
                this.setPerfil(rs.getInt("id_per")); // Ajusta al nombre real de tu columna
                this.setNombre(rs.getString("nombre_us")); // Ajusta al nombre real de tu columna
            }

            rs.close();
        } catch (Exception ex) {
            System.out.println("Error verificando usuario: " + ex.getMessage());
        }

        return respuesta;
    }
    
    public String ingresarCliente() {
        String result = "";
        Conexion con = new Conexion();
        PreparedStatement pr = null;
        String sql = "INSERT INTO tb_usuario (id_per, id_est, nombre_us, cedula_us, correo_us, clave_us) "
                   + "VALUES(?,?,?,?,?,?)";
        try {
            pr = con.getConexion().prepareStatement(sql);
            pr.setInt(1, 2);
            pr.setInt(2, this.getEstado());
            pr.setString(3, this.getNombre());
            pr.setString(4, this.getCedula());
            pr.setString(5, this.getCorreo());
            pr.setString(6, this.getClave());

            if (pr.executeUpdate() == 1) {
                result = "Inserción correcta";
            } else {
                result = "Error en inserción";
            }
        } catch (Exception ex) {
            result = ex.getMessage();
            System.out.print(result);
        } finally {
            try {
                if (pr != null) pr.close();
                if (con.getConexion() != null) con.getConexion().close();
            } catch (Exception ex) {
                System.out.print(ex.getMessage());
            }
        }
        return result;
    }
    public String consultarUsuarios() {
        Conexion con = new Conexion();
        ResultSet rs = null;

        String tabla = "<table class='table table-success table-striped'>"
                     + "<thead><tr>"
                     + "<th scope='col'>ID</th>"
                     + "<th scope='col'>Nombre</th>"
                     + "<th scope='col'>Correo</th>"
                     + "<th scope='col'>Actualizar</th>"
                     + "<th scope='col'>Eliminar</th>"
                     + "</tr></thead><tbody>";

        try {
            String sql = "SELECT id_us, nombre_us, correo_us FROM tb_usuario WHERE id_per !=2 ";
            rs = con.Consulta(sql);

            while (rs.next()) {
            	tabla += "<tr>"
            		       + "<td>" + rs.getInt("id_us") + "</td>"
            		       + "<td>" + rs.getString("nombre_us") + "</td>"
            		       + "<td>" + rs.getString("correo_us") + "</td>"
            		       + "<td>"
            		       + "<a href='editarUsuarios.jsp?id=" + rs.getInt("id_us") + "'>"
            		       + "<img src='imagenes/editar.png' width='25' height='25' alt='Editar'></a>"
            		       + "</td>"
            		       + "<td>"
            		       + "<a href='eliminarUsuarios.jsp?id=" + rs.getInt("id_us")
            		       + "' onclick=\"return confirm('¿Estás segura de eliminar este usuario?');\">"
            		       + "<img src='imagenes/eliminar.png' width='25' height='25' alt='Eliminar'></a>"
            		       + "</td>"
            		       + "</tr>";


            }

            tabla += "</tbody></table>";
        } catch (Exception ex) {
            System.out.print("Error en consultarUsuarios: " + ex.getMessage());
            tabla = "<div class='alert alert-danger'>Error: " + ex.getMessage() + "</div>";
        }

        return tabla;
    }
    /*public boolean eliminarUsuario(int id) {
        boolean eliminado = false;
        try {
            Conexion clsCon = new Conexion();
            String sql = "DELETE FROM tb_usuario WHERE id_us = " + id;
            int filas = clsCon.Ejecutar(sql);
            if (filas > 0) {
                eliminado = true;
                System.out.println("🗑️ Usuario eliminado correctamente (ID=" + id + ")");
            }
        } catch (Exception e) {
            System.out.println("❌ Error al eliminar usuario: " + e.getMessage());
        }
        return eliminado;
    }*/
    public boolean eliminarUsuario(int id) {
        boolean eliminado = false;
        try {
            Conexion clsCon = new Conexion();
            String sql = "DELETE FROM tb_usuario WHERE id_us = " + id;
            String resultado = clsCon.Ejecutar(sql);

            if (resultado != null && resultado.toLowerCase().contains("correcta")) {
                eliminado = true;
                System.out.println("🗑️ Usuario eliminado correctamente (ID=" + id + ")");
            }
        } catch (Exception e) {
            System.out.println("❌ Error al eliminar usuario: " + e.getMessage());
        }
        return eliminado;
    }

    
    // ingresar usuario cuando es el admin
    public String ingresarUsuario() {
        String resultado = "";
        Conexion con = new Conexion();
        PreparedStatement ps = null;

        String sql = "INSERT INTO tb_usuario (nombre_us, cedula_us, correo_us, clave_us, id_est, id_per) "
                   + "VALUES (?, ?, ?, ?, ?, ?)";

        try {
            ps = con.getConexion().prepareStatement(sql);
            ps.setString(1, this.getNombre());
            ps.setString(2, this.getCedula());
            ps.setString(3, this.getCorreo());
            ps.setString(4, this.getClave());
            ps.setInt(5, this.getEstado());  // Estado civil
            ps.setInt(6, this.getPerfil());  // Perfil (1=Admin, 2=Cliente, 3=Vendedor)

            int filas = ps.executeUpdate();

            if (filas > 0) {
                resultado = "Inserción correcta";
            } else {
                resultado = "No se insertó ningún registro";
            }

        } catch (Exception e) {
            resultado = "Error: " + e.getMessage();
            System.out.println(resultado);
        } finally {
            try {
                if (ps != null) ps.close();
                if (con.getConexion() != null) con.getConexion().close();
            } catch (Exception e) {
                System.out.println("⚠️ Error cerrando conexión: " + e.getMessage());
            }
        }

        return resultado;
    }


}
