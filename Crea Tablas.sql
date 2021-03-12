/*==============================================================*/
/* DBMS name:      PostgreSQL 8                                 */
/* Created on:     16/12/2020 18:18:44                          */
/*==============================================================*/


/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE (
   C_ID                 INT4                 not null,
   D_ID                 INT4                 not null,
   C_NOMBRE             CHAR(100)            not null,
   C_APELLIDO           CHAR(100)            not null,
   C_TELEFONO           INT4                 not null,
   constraint PK_CLIENTE primary key (C_ID)
);
/*==============================================================*/
/* Table: DETALLE_FACTURA                                       */
/*==============================================================*/
create table DETALLE_FACTURA (
   DF_ID                INT4                 not null,
   F_ID                 INT4                 not null,
   DF_TOTAL             DECIMAL(4)           not null,
   constraint PK_DETALLE_FACTURA primary key (DF_ID)
);

/*==============================================================*/
/* Table: DUENO                                                 */
/*==============================================================*/
create table DUENO (
   D_ID                 INT4                 not null,
   D_NOMBRE             CHAR(100)            not null,
   D_APELLIDO           CHAR(100)            not null,
   D_TELEFONO           CHAR(100)            not null,
   constraint PK_DUENO primary key (D_ID)
);

/*==============================================================*/
/* Table: ENTRENADOR                                            */
/*==============================================================*/
create table ENTRENADOR (
   E_ID                 INT4                 not null,
   E_CEDULA             INT4                 not null,
   E_NOMBRE             CHAR(100)            not null,
   E_APELLIDO           CHAR(100)            not null,
   E_TELEFONO           INT4                 not null,
   constraint PK_ENTRENADOR primary key (E_ID)
);

/*==============================================================*/
/* Table: FACTURA                                               */
/*==============================================================*/
create table FACTURA (
   F_ID                 INT4                 not null,
   F_SUBTOTAL           DECIMAL(4)           not null,
   constraint PK_FACTURA primary key (F_ID)
);

/*==============================================================*/
/* Table: HORA_PREDEFINIDA                                      */
/*==============================================================*/
create table HORA_PREDEFINIDA (
   HP_ID                INT4                 not null,
   HP_ENTRADA           TIME                 not null,
   HP_SALIDA            TIME                 not null,
   constraint PK_HORA_PREDEFINIDA primary key (HP_ID)
);

/*==============================================================*/
/* Table: MEMBRESIA                                             */
/*==============================================================*/
create table MEMBRESIA (
   M_ID                 INT4                 not null,
   TC_ID                INT4                 not null,
   F_ID                 INT4                 not null,
   C_ID                 INT4                 not null,
   M_MENSUAL            DECIMAL(4)           not null,
   M_QUINCENAL          DECIMAL(4)           not null,
   M_DIARIO             DECIMAL(4)           not null,
   M_CONSUMO            DECIMAL(4)           not null,
   constraint PK_MEMBRESIA primary key (M_ID)
);

/*==============================================================*/
/* Table: NIVEL_DE_ENTRENAMIENTO                                */
/*==============================================================*/
create table NIVEL_DE_ENTRENAMIENTO (
   NE_ID                INT4                 not null,
   E_ID                 INT4                 not null,
   NE_REGULAR           VARCHAR(25)          not null,
   NE_BUENA             VARCHAR(25)          not null,
   NE_EXCELENTE         VARCHAR(25)          not null,
   constraint PK_NIVEL_DE_ENTRENAMIENTO primary key (NE_ID)
);

/*==============================================================*/
/* Table: NIVEL_DE_RUTINA                                       */
/*==============================================================*/
create table NIVEL_DE_RUTINA (
   NR_ID                INT4                 not null,
   TR_ID                INT4                 not null,
   NR_FACIL             VARCHAR(25)          not null,
   NR_NORMAL            VARCHAR(25)          not null,
   NR_DIFICIL           VARCHAR(25)          not null,
   constraint PK_NIVEL_DE_RUTINA primary key (NR_ID)
);

/*==============================================================*/
/* Table: TIPO_DE_CLIENTE                                       */
/*==============================================================*/
create table TIPO_DE_CLIENTE (
   TC_ID                INT4                 not null,
   E_ID                 INT4                 not null,
   HP_ID                INT4                 not null,
   TC_MAO               CHAR(100)            not null,
   TC_LINO              CHAR(100)            null,
   constraint PK_TIPO_DE_CLIENTE primary key (TC_ID)
);

/*==============================================================*/
/* Table: TIPO_DE_RUTINA                                        */
/*==============================================================*/
create table TIPO_DE_RUTINA (
   TR_ID                INT4                 not null,
   TC_ID                INT4                 not null,
   TR_1                 CHAR(100)            not null,
   TR_2                 CHAR(100)            not null,
   TR_3                 CHAR(100)            not null,
   TR_4                 CHAR(100)            not null,
   TR_5                 CHAR(100)            not null,
   TR_6                 CHAR(100)            not null,
   constraint PK_TIPO_DE_RUTINA primary key (TR_ID)
);

alter table CLIENTE
   add constraint FK_CLIENTE_RELATIONS_DUENO foreign key (D_ID)
      references DUENO (D_ID)
      on delete restrict on update restrict;

alter table DETALLE_FACTURA
   add constraint FK_DETALLE__RELATIONS_FACTURA foreign key (F_ID)
      references FACTURA (F_ID)
      on delete restrict on update restrict;

alter table MEMBRESIA
   add constraint FK_MEMBRESI_RELATIONS_CLIENTE foreign key (C_ID)
      references CLIENTE (C_ID)
      on delete restrict on update restrict;

alter table MEMBRESIA
   add constraint FK_MEMBRESI_RELATIONS_TIPO_DE_ foreign key (TC_ID)
      references TIPO_DE_CLIENTE (TC_ID)
      on delete restrict on update restrict;

alter table MEMBRESIA
   add constraint FK_MEMBRESI_RELATIONS_FACTURA foreign key (F_ID)
      references FACTURA (F_ID)
      on delete restrict on update restrict;

alter table NIVEL_DE_ENTRENAMIENTO
   add constraint FK_NIVEL_DE_RELATIONS_ENTRENAD foreign key (E_ID)
      references ENTRENADOR (E_ID)
      on delete restrict on update restrict;

alter table NIVEL_DE_RUTINA
   add constraint FK_NIVEL_DE_RELATIONS_TIPO_DE_ foreign key (TR_ID)
      references TIPO_DE_RUTINA (TR_ID)
      on delete restrict on update restrict;

alter table TIPO_DE_CLIENTE
   add constraint FK_TIPO_DE__RELATIONS_HORA_PRE foreign key (HP_ID)
      references HORA_PREDEFINIDA (HP_ID)
      on delete restrict on update restrict;

alter table TIPO_DE_CLIENTE
   add constraint FK_TIPO_DE__RELATIONS_ENTRENAD foreign key (E_ID)
      references ENTRENADOR (E_ID)
      on delete restrict on update restrict;

alter table TIPO_DE_RUTINA
   add constraint FK_TIPO_DE__RELATIONS_TIPO_DE_ foreign key (TC_ID)
      references TIPO_DE_CLIENTE (TC_ID)
      on delete restrict on update restrict;




///////////////////////////////////////////////////////////////////////////////////////////////
SERVER 2005*/

/*==============================================================*/
/* DBMS name:      PostgreSQL 8                                 */
/* Created on:     16/12/2020 18:18:44                          */
/*==============================================================*/


/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE (
   C_ID                 INT                 not null,
   D_ID                 INT                 not null,
   C_NOMBRE             CHAR(100)            not null,
   C_APELLIDO           CHAR(100)            not null,
   C_TELEFONO           INT                 not null,
   constraint PK_CLIENTE primary key (C_ID)
);
/*==============================================================*/
/* Table: DETALLE_FACTURA                                       */
/*==============================================================*/
create table DETALLE_FACTURA (
   DF_ID                INT                 not null,
   F_ID                 INT                 not null,
   DF_TOTAL             DECIMAL(4)           not null,
   constraint PK_DETALLE_FACTURA primary key (DF_ID)
);

/*==============================================================*/
/* Table: DUENO                                                 */
/*==============================================================*/
create table DUENO (
   D_ID                 INT                 not null,
   D_NOMBRE             CHAR(100)            not null,
   D_APELLIDO           CHAR(100)            not null,
   D_TELEFONO           CHAR(100)            not null,
   constraint PK_DUENO primary key (D_ID)
);

/*==============================================================*/
/* Table: ENTRENADOR                                            */
/*==============================================================*/
create table ENTRENADOR (
   E_ID                 INT                 not null,
   E_CEDULA             INT                 not null,
   E_NOMBRE             CHAR(100)            not null,
   E_APELLIDO           CHAR(100)            not null,
   E_TELEFONO           INT                 not null,
   constraint PK_ENTRENADOR primary key (E_ID)
);

/*==============================================================*/
/* Table: FACTURA                                               */
/*==============================================================*/
create table FACTURA (
   F_ID                 INT                 not null,
   F_SUBTOTAL           DECIMAL(4)           not null,
   constraint PK_FACTURA primary key (F_ID)
);

/*==============================================================*/
/* Table: HORA_PREDEFINIDA                                      */
/*==============================================================*/
create table HORA_PREDEFINIDA (
   HP_ID                INT                 not null,
   HP_ENTRADA           DATETIME                 not null,
   HP_SALIDA            DATETIME                 not null,
   constraint PK_HORA_PREDEFINIDA primary key (HP_ID)
);

/*==============================================================*/
/* Table: MEMBRESIA                                             */
/*==============================================================*/
create table MEMBRESIA (
   M_ID                 INT                 not null,
   TC_ID                INT                 not null,
   F_ID                 INT                 not null,
   C_ID                 INT                 not null,
   M_MENSUAL            DECIMAL(4)           not null,
   M_QUINCENAL          DECIMAL(4)           not null,
   M_DIARIO             DECIMAL(4)           not null,
   M_CONSUMO            DECIMAL(4)           not null,
   constraint PK_MEMBRESIA primary key (M_ID)
);

/*==============================================================*/
/* Table: NIVEL_DE_ENTRENAMIENTO                                */
/*==============================================================*/
create table NIVEL_DE_ENTRENAMIENTO (
   NE_ID                INT                 not null,
   E_ID                 INT                 not null,
   NE_REGULAR           VARCHAR(25)          not null,
   NE_BUENA             VARCHAR(25)          not null,
   NE_EXCELENTE         VARCHAR(25)          not null,
   constraint PK_NIVEL_DE_ENTRENAMIENTO primary key (NE_ID)
);

/*==============================================================*/
/* Table: NIVEL_DE_RUTINA                                       */
/*==============================================================*/
create table NIVEL_DE_RUTINA (
   NR_ID                INT                 not null,
   TR_ID                INT                 not null,
   NR_FACIL             VARCHAR(25)          not null,
   NR_NORMAL            VARCHAR(25)          not null,
   NR_DIFICIL           VARCHAR(25)          not null,
   constraint PK_NIVEL_DE_RUTINA primary key (NR_ID)
);

/*==============================================================*/
/* Table: TIPO_DE_CLIENTE                                       */
/*==============================================================*/
create table TIPO_DE_CLIENTE (
   TC_ID                INT                 not null,
   E_ID                 INT                 not null,
   HP_ID                INT                 not null,
   TC_MAO               CHAR(100)            not null,
   TC_LINO              CHAR(100)            null,
   constraint PK_TIPO_DE_CLIENTE primary key (TC_ID)
);

/*==============================================================*/
/* Table: TIPO_DE_RUTINA                                        */
/*==============================================================*/
create table TIPO_DE_RUTINA (
   TR_ID                INT                 not null,
   TC_ID                INT                 not null,
   TR_1                 CHAR(100)            not null,
   TR_2                 CHAR(100)            not null,
   TR_3                 CHAR(100)            not null,
   TR_4                 CHAR(100)            not null,
   TR_5                 CHAR(100)            not null,
   TR_6                 CHAR(100)            not null,
   constraint PK_TIPO_DE_RUTINA primary key (TR_ID)
);

alter table CLIENTE
   add constraint FK_CLIENTE_RELATIONS_DUENO foreign key (D_ID)
      references DUENO (D_ID)
      

alter table DETALLE_FACTURA
   add constraint FK_DETALLE__RELATIONS_FACTURA foreign key (F_ID)
      references FACTURA (F_ID)

alter table MEMBRESIA
   add constraint FK_MEMBRESI_RELATIONS_CLIENTE foreign key (C_ID)
      references CLIENTE (C_ID)

alter table MEMBRESIA
   add constraint FK_MEMBRESI_RELATIONS_TIPO_DE_ foreign key (TC_ID)
      references TIPO_DE_CLIENTE (TC_ID)

alter table MEMBRESIA
   add constraint FK_MEMBRESI_RELATIONS_FACTURA foreign key (F_ID)
      references FACTURA (F_ID)

alter table NIVEL_DE_ENTRENAMIENTO
   add constraint FK_NIVEL_DE_RELATIONS_ENTRENAD foreign key (E_ID)
      references ENTRENADOR (E_ID)
    

alter table NIVEL_DE_RUTINA
   add constraint FK_NIVEL_DE_RELATIONS_TIPO_DE_ foreign key (TR_ID)
      references TIPO_DE_RUTINA (TR_ID)
     

alter table TIPO_DE_CLIENTE
   add constraint FK_TIPO_DE__RELATIONS_HORA_PRE foreign key (HP_ID)
      references HORA_PREDEFINIDA (HP_ID)
     

alter table TIPO_DE_CLIENTE
   add constraint FK_TIPO_DE__RELATIONS_ENTRENAD foreign key (E_ID)
      references ENTRENADOR (E_ID)
      

alter table TIPO_DE_RUTINA
   add constraint FK_TIPO_DE__RELATIONS_TIPO_DE_ foreign key (TC_ID)
      references TIPO_DE_CLIENTE (TC_ID)
      

