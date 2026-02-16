CREATE TABLE AGRICULTOR (
    ID_Agricultor NUMBER,
    Nombre varchar2(100),
    Correo varchar2(120),
    Telefono varchar2(20),
    Ubicacion varchar2(150),
    Tipo_Suscripcion varchar2(50),
    Fecha_Inicio_Suscripcion date,
    Fecha_Final_Suscripcion date,

    PRIMARY KEY (ID_Agricultor)
);

CREATE TABLE CONSUMIDOR (
    ID_Consumidor NUMBER,
    Nombre varchar2(100),
    Correo varchar2(120),
    Telefono varchar2(20),
    Ubicacion varchar2(150),

    PRIMARY KEY (ID_Consumidor)
);

CREATE TABLE PRODUCTO (
    ID_Producto NUMBER,
    ID_Agricultor NUMBER,
    Nombre varchar2(100),
    Descripcion varchar2(500),
    Categoria varchar2(50),
    Precio NUMBER,
    Stock NUMBER,

    PRIMARY KEY (ID_Producto),
    FOREIGN KEY (ID_Agricultor) REFERENCES AGRICULTOR(ID_Agricultor)
);

CREATE TABLE FOTO_PRODUCTO_AGRICULTOR (
    ID_Foto_Agricultor NUMBER,
    ID_Producto NUMBER,
    ID_Agricultor NUMBER,
    Instalaciones varchar2(500),

    PRIMARY KEY (ID_Foto_Agricultor),
    FOREIGN KEY (ID_Agricultor) REFERENCES AGRICULTOR(ID_Agricultor),
    FOREIGN KEY (ID_Producto) REFERENCES PRODUCTO(ID_Producto)
);

CREATE TABLE PEDIDO (
    ID_Pedido NUMBER,
    ID_Consumidor NUMBER,
    Fecha_Pedido date,
    Estado varchar2(50),

    PRIMARY KEY (ID_Pedido),
    FOREIGN KEY (ID_Consumidor) REFERENCES CONSUMIDOR(ID_Consumidor)
);

CREATE TABLE DETALLE_PEDIDO (
    ID_Detalle_Pedido NUMBER,
    ID_Pedido NUMBER,
    ID_Producto NUMBER,
    Cantidad NUMBER,
    Precio_Unitario NUMBER,

    PRIMARY KEY (ID_Detalle_Pedido),
    FOREIGN KEY (ID_Pedido) REFERENCES PEDIDO(ID_Pedido),
    FOREIGN KEY (ID_Producto) REFERENCES PRODUCTO(ID_Producto)
);

CREATE TABLE VALORACION (
    ID_Valoracion NUMBER,
    ID_Consumidor NUMBER,
    ID_Producto NUMBER,
    ID_Pedido NUMBER,
    Calificacion NUMBER,
    Comentario varchar2(500),

    PRIMARY KEY (ID_Valoracion),
    FOREIGN KEY (ID_Consumidor) REFERENCES CONSUMIDOR(ID_Consumidor),
    FOREIGN KEY (ID_Producto) REFERENCES PRODUCTO(ID_Producto),
    FOREIGN KEY (ID_Pedido) REFERENCES PEDIDO(ID_Pedido)
);