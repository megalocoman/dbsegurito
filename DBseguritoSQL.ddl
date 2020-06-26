-- Generated by Oracle SQL Developer Data Modeler 19.4.0.350.1424
--   at:        2020-06-24 19:11:27 CLT
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g



CREATE TABLE asesoria (
    id_asesoria         INTEGER NOT NULL,
    fecha_visita        VARCHAR2(20 CHAR) NOT NULL,
    cliente_id_cliente  INTEGER NOT NULL,
    solicitado_por      INTEGER NOT NULL
);

ALTER TABLE asesoria ADD CONSTRAINT asesoria_pk PRIMARY KEY ( id_asesoria );

CREATE TABLE cliente (
    id_cliente         INTEGER NOT NULL,
    nombre             VARCHAR2(100 CHAR) NOT NULL,
    rubro              VARCHAR2(100 CHAR) NOT NULL,
    direccion          VARCHAR2(300 CHAR) NOT NULL,
    monto_mensualidad  INTEGER NOT NULL
);

ALTER TABLE cliente ADD CONSTRAINT cliente_pk PRIMARY KEY ( id_cliente );

CREATE TABLE hist_incidentes (
    id_incidentes       INTEGER NOT NULL,
    incidente           VARCHAR2(100 CHAR) NOT NULL,
    fecha               VARCHAR2(50 CHAR) NOT NULL,
    descripsion         VARCHAR2(3000 CHAR) NOT NULL,
    acidentados         INTEGER NOT NULL,
    fallecidos          INTEGER NOT NULL,
    cliente_id_cliente  INTEGER NOT NULL
);

ALTER TABLE hist_incidentes ADD CONSTRAINT hist_incidentes_pk PRIMARY KEY ( id_incidentes );

CREATE TABLE historial_visitas (
    id                        INTEGER NOT NULL,
    fecha_visita              VARCHAR2(50 CHAR) NOT NULL,
    observacion               VARCHAR2(2500) NOT NULL,
    nivel_seguridad           VARCHAR2(20 CHAR) NOT NULL,
    cliente_id_cliente        INTEGER NOT NULL,
    trabajador_id_trabajador  INTEGER NOT NULL
);

ALTER TABLE historial_visitas ADD CONSTRAINT historial_visitas_pk PRIMARY KEY ( id );

CREATE TABLE mejoras (
    id                     INTEGER NOT NULL,
    fecha                  VARCHAR2(30 CHAR) NOT NULL,
    mejora                 VARCHAR2(300 CHAR) NOT NULL,
    implementacion_mejora  VARCHAR2(3000 CHAR),
    asesoria_id_asesoria   INTEGER NOT NULL,
    plan_accion_id         INTEGER NOT NULL
);

ALTER TABLE mejoras ADD CONSTRAINT mejoras_pk PRIMARY KEY ( id );

CREATE TABLE mensualidad (
    id_mensualidad      INTEGER NOT NULL,
    fecha_pago          VARCHAR2(30 CHAR),
    pago_mensualidad    INTEGER,
    cliente_id_cliente  INTEGER NOT NULL
);

ALTER TABLE mensualidad ADD CONSTRAINT mensualidad_pk PRIMARY KEY ( id_mensualidad );

CREATE TABLE plan_accion (
    id                        INTEGER NOT NULL,
    accion                    VARCHAR2(3000 CHAR),
    realizada                 VARCHAR2(10 CHAR),
    observacion               VARCHAR2(4500 CHAR),
    trabajador_id_trabajador  INTEGER NOT NULL
);

ALTER TABLE plan_accion ADD CONSTRAINT plan_accion_pk PRIMARY KEY ( id );

CREATE TABLE trabajador (
    id_trabajador  INTEGER NOT NULL,
    nombre         VARCHAR2(200 CHAR) NOT NULL,
    usuario        VARCHAR2(50 CHAR) NOT NULL,
    password       VARCHAR2(20 CHAR) NOT NULL
);

ALTER TABLE trabajador ADD CONSTRAINT trabajador_pk PRIMARY KEY ( id_trabajador );

ALTER TABLE asesoria
    ADD CONSTRAINT asesoria_cliente_fk FOREIGN KEY ( cliente_id_cliente )
        REFERENCES cliente ( id_cliente );

ALTER TABLE hist_incidentes
    ADD CONSTRAINT hist_incidentes_cliente_fk FOREIGN KEY ( cliente_id_cliente )
        REFERENCES cliente ( id_cliente );

ALTER TABLE historial_visitas
    ADD CONSTRAINT his_visi_clien_fk FOREIGN KEY ( cliente_id_cliente )
        REFERENCES cliente ( id_cliente );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE historial_visitas
    ADD CONSTRAINT histor_visi_trabaja_fk FOREIGN KEY ( trabajador_id_trabajador )
        REFERENCES trabajador ( id_trabajador );

ALTER TABLE mejoras
    ADD CONSTRAINT mejoras_asesoria_fk FOREIGN KEY ( asesoria_id_asesoria )
        REFERENCES asesoria ( id_asesoria );

ALTER TABLE mejoras
    ADD CONSTRAINT mejoras_plan_accion_fk FOREIGN KEY ( plan_accion_id )
        REFERENCES plan_accion ( id );

ALTER TABLE mensualidad
    ADD CONSTRAINT mensualidad_cliente_fk FOREIGN KEY ( cliente_id_cliente )
        REFERENCES cliente ( id_cliente );

ALTER TABLE plan_accion
    ADD CONSTRAINT plan_accion_trabajador_fk FOREIGN KEY ( trabajador_id_trabajador )
        REFERENCES trabajador ( id_trabajador );



-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                             8
-- CREATE INDEX                             0
-- ALTER TABLE                             16
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   1
-- WARNINGS                                 0
