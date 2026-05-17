/* He decidido unir los dos tipos de usuario en una única tabla. El problema
   es que tendré campos NULL, pero me será más fácil a la hora de hacer los
   JOIN desde las clases DAO.
 */
CREATE DATABASE IF NOT EXISTS hotel_reservas;
USE hotel_reservas;

CREATE TABLE USUARIO (
    IDusuario INT,
    tipo_usuario VARCHAR(30) NOT NULL,
    correo_electronico VARCHAR(30),
    nombre VARCHAR(30) NOT NULL,
    fecha_nacimiento DATE,
    edad INT,
    telefono_guardia VARCHAR(14), -- Columna Administrador --
    horario_guardia TIME, -- Columna Administrador --
    perfil VARCHAR(30), -- Columna UsuarioNormal --
    direccion VARCHAR(60), -- Columna UsuarioNormal --
    CONSTRAINT usu_id_pk PRIMARY KEY (IDusuario),
    CONSTRAINT usu_tip_ck CHECK (tipo_usuario IN('Administrador', 'Normal'))
);

CREATE TABLE HABITACION (
    IDhabitacion INT,
    numero_hab VARCHAR(15) NOT NULL,
    cama_extra BOOLEAN DEFAULT FALSE,
    tipo VARCHAR(20),
    precio_noche DECIMAL(10,2),
    disponible BOOLEAN DEFAULT TRUE,
    CONSTRAINT hab_id_pk PRIMARY KEY(IDhabitacion),
    CONSTRAINT hab_tip_ck CHECK(tipo IN('Normal', 'Doble', 'Suite'))
);

CREATE TABLE RESERVA (
    IDreserva INT,
    IDusuario INT,
    IDhabitacion INT,
    fecha_entrada DATE NOT NULL,
    fecha_salida DATE NOT NULL,
    motivo VARCHAR(20),
    CONSTRAINT res_idr_pk PRIMARY KEY(IDreserva),
    CONSTRAINT res_idu_fk FOREIGN KEY(IDusuario) REFERENCES USUARIO(IDusuario),
    CONSTRAINT res_idh_fk FOREIGN KEY(IDhabitacion) REFERENCES HABITACION(IDhabitacion),
    CONSTRAINT res_mot_ck CHECK (motivo IN('Trabajo', 'Placer'))
);
