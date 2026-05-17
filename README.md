# 🗄️ Scripts SQL - Gestión de Reservas

Este repositorio contiene los scripts necesarios para la creación del esquema y la población inicial 
de la base de datos utilizada en la aplicación de **Gestión de Reservas**.

---

## 📐 Modelo de Datos

La base de datos se compone de **3 tablas principales** interconectadas, diseñadas para gestionar 
el flujo completo de usuarios y habitaciones:

### 📋 Descripción de las Tablas

1. **`usuario`**: Almacena la información de los clientes o administradores del sistema (ID, nombre, correo, etc.).
2. **`habitacion`**: Contiene el inventario de las habitaciones disponibles (ID, número, tipo, precio por noche).
3. **`reserva`**: Tabla relacional que conecta un `usuario` con una `habitacion`, guardando las fechas de entrada (`check_in`) y salida (`check_out`).


