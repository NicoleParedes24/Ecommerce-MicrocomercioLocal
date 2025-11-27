## 🏪 Microcomercio Local "Comercial Otavalo" (JSP + CSS + JavaScript +Java + PostgreSQL)

Este repositorio contiene un sistema de e-commerce para un microcomercio de víveres en Otavalo, desarrollado en **JSP, HTML, CSS,  JavaScrip y Java**  ,desplegado en **Tomcat 9**, con conexión a **PostgreSQL**.  
Permite gestionar usuarios, productos y ventas, con roles diferenciados: administrador, vendedor y cliente.

---

## 📁 Estructura del Proyecto
```
microcomercio/
├── src/main/webapp/
│ ├── 3D/ ← Imágenes 3D y recursos gráficos (.gbl)
│ ├── css/ ← Estilos CSS
│ ├── header_footer/ ← Encabezados y pies de página
│ ├── imagenes/ ← Imágenes del sitio
│ ├── js/ ← Scripts JavaScript
│ ├── index.jsp ← Página de inicio
│ ├── login.jsp
│ ├── carrito.jsp
│ ├── actualizarUsuario.jsp
│ ├── administrarProductos.jsp
│ ├── ofertas.jsp
│ ├── pagar.jsp
│ └── ... ← Otros JSPs
├── database/
│ └── script_postgres.sql ← Script para crear base de datos y tablas
└── README.md ← Este archivo

```

## Funcionalidades
- **Administrador**: gestionar usuarios y consultar bitácora (`nicole@gmail.com` / `nicole`).  
- **Vendedor**: administrar productos y ofertas (`jenny@gmail.com` / `jenny`).  
- **Cliente**: registrarse, navegar catálogo, carrito y compras (`andrea@gmail.com` / `andrea`).  

---



## ✅ Características principales
- Gestión de usuarios y roles.  
- Bitácora de cambios de todos los usuarios.  
- Gestión de productos y ofertas.  
- Carrito de compras y simulación de pagos.  
- Registro automático de nuevos clientes.  
- Interfaz web con JSP, HTML, CSS y JavaScript.  
- Conexión a base de datos PostgreSQL.

---
## ▶️ Cómo ejecutar el sistema

1. Clona o descarga este repositorio:
```
git clone https://github.com/NicoleParedes24/Ecommerce-MicrocomercioLocal.git
```

2. Abre el proyecto en tu IDE Java (Eclipse, IntelliJ, NetBeans).
3. Configura Tomcat 9 y despliega el proyecto.
4. Crea una base de datos vacía en PostgreSQL.
5. Ejecuta el script database/script_postgres.sql para crear tablas y datos iniciales.
6. Configura los datos de conexión en tu proyecto (usuario, contraseña, host, puerto).
7. Abre el navegador y accede a:

```
http://localhost:8080/microcomercio
```
---
## 🛠️ Tecnologías utilizadas
- Java 22.0.1
- Tomcat 9
- JSP, HTML, CSS, JavaScript
- PostgreSQL

Desarrollado por Nicole Paredes Espín
