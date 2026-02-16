CREATE TABLE EMPLEAT (
    NSS NUMBER PRIMARY KEY,
    Nom varchar2(100),
    Llinatges varchar2(150),
    Email varchar2(150),
    IBAN varchar2(34) UNIQUE,
    CHECK (IBAN LIKE 'ES%')
);

CREATE TABLE TIPUS_DE_PLACA (
    Nom varchar2(50) PRIMARY KEY,
    Funcio varchar2(150)
);

CREATE TABLE PLACA (
    Codi NUMBER PRIMARY KEY,
    Nom varchar2(100),
    Salari NUMBER,
    Codi_Placa_Supervisora NUMBER,
    Informe_Supervisio varchar2(500),
    Nom_Tipus_Placa varchar2(50),

    FOREIGN KEY (Nom_Tipus_Placa) REFERENCES TIPUS_DE_PLACA (Nom),
    FOREIGN KEY (Codi_Placa_Supervisora) REFERENCES PLACA (Codi)
);

CREATE TABLE OCUPA (
    NSS_Empleat NUMBER,
    Codi_Placa NUMBER,
    DataInici date,
    DataFi date,

    PRIMARY KEY (NSS_Empleat, Codi_Placa),
    FOREIGN KEY (NSS_Empleat) REFERENCES EMPLEAT (NSS),
    FOREIGN KEY (Codi_Placa) REFERENCES PLACA (Codi)
);

CREATE TABLE NOMINA (
    ID NUMBER PRIMARY KEY,
    IBAN_Pagament varchar2(34),
    CHECK (IBAN_Pagament LIKE 'ES%'),

    Import NUMBER,
    NSS_Empleat NUMBER,
    Codi_Placa NUMBER,

    FOREIGN KEY (NSS_Empleat) REFERENCES EMPLEAT (NSS),
    FOREIGN KEY (Codi_Placa) REFERENCES PLACA (Codi)
);