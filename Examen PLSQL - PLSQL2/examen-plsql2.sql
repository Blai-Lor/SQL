CREATE TABLE TIPUS_PLACA (
    NOM VARCHAR2(50) PRIMARY KEY,
    FUNCIO VARCHAR2(200) NOT NULL
);

CREATE TABLE PLACA (
    CODI NUMBER GENERATED AS IDENTITY PRIMARY KEY,
    NOM VARCHAR2(50) NOT NULL,
    SALARI NUMBER(10,2) NOT NULL,
    INFORME_SUPERVISIO VARCHAR2(1000),
    CODI_PLACA_SUPERVISORA NUMBER,
    NOM_TIPUS_PLACA VARCHAR2(50) NOT NULL,
    FOREIGN KEY (CODI_PLACA_SUPERVISORA) REFERENCES PLACA (CODI),
    FOREIGN KEY (NOM_TIPUS_PLACA) REFERENCES TIPUS_PLACA (NOM)
);

CREATE TABLE EMPLEAT (
    NSS NUMBER(12) PRIMARY KEY,
    NOM VARCHAR2(50) NOT NULL,
    LLINATGES VARCHAR2(100) NOT NULL,
    EMAIL VARCHAR2(100),
    IBAN VARCHAR2(24) UNIQUE NOT NULL CHECK (IBAN LIKE 'ES%')
);

CREATE TABLE OCUPA (
    NSS_EMPLEAT NUMBER(12) NOT NULL,
    CODI_PLACA NUMBER(10) NOT NULL,
    DATA_INICI DATE NOT NULL,
    DATA_FI DATE,
    PRIMARY KEY (NSS_EMPLEAT, CODI_PLACA),
    FOREIGN KEY (NSS_EMPLEAT) REFERENCES EMPLEAT (NSS),
    FOREIGN KEY (CODI_PLACA) REFERENCES PLACA (CODI)
);

CREATE TABLE NOMINA (
    ID_NOMINA NUMBER GENERATED AS IDENTITY PRIMARY KEY,
    IBAN_PAGAMENT VARCHAR2(24) NOT NULL,
    IMPORT NUMBER(7,2) NOT NULL,
    NSS_EMPLEAT NUMBER(12) NOT NULL,
    CODI_PLACA NUMBER(10) NOT NULL,
    DATA_PAGAMENT DATE,
    FOREIGN KEY (NSS_EMPLEAT) REFERENCES EMPLEAT (NSS),
    FOREIGN KEY (CODI_PLACA) REFERENCES PLACA (CODI)
);

-- TIPUS_PLACA
INSERT INTO TIPUS_PLACA VALUES ('Administrativa', 'Gestió administrativa i documentació');
INSERT INTO TIPUS_PLACA VALUES ('Tecnica', 'Tasques tècniques especialitzades');
INSERT INTO TIPUS_PLACA VALUES ('Supervisio', 'Supervisió d''equips i processos');

-- PLACA (primer sense supervisora)
INSERT INTO PLACA (NOM, SALARI, INFORME_SUPERVISIO, CODI_PLACA_SUPERVISORA, NOM_TIPUS_PLACA)
VALUES ('Cap Direccio', 5000, 'Informe general de direcció', NULL, 'Administrativa');

INSERT INTO PLACA (NOM, SALARI, INFORME_SUPERVISIO, CODI_PLACA_SUPERVISORA, NOM_TIPUS_PLACA)
VALUES ('Supervisor Tecnic', 3800, 'Control de qualitat tècnica', 1, 'Supervisio');

INSERT INTO PLACA (NOM, SALARI, INFORME_SUPERVISIO, CODI_PLACA_SUPERVISORA, NOM_TIPUS_PLACA)
VALUES ('Tecnica Senior', 3200, 'Tasques tècniques avançades', 2, 'Tecnica');

INSERT INTO PLACA (NOM, SALARI, INFORME_SUPERVISIO, CODI_PLACA_SUPERVISORA, NOM_TIPUS_PLACA)
VALUES ('Administrativa RRHH', 2500, 'Gestió de personal', 1, 'Administrativa');

INSERT INTO PLACA (NOM, SALARI, INFORME_SUPERVISIO, CODI_PLACA_SUPERVISORA, NOM_TIPUS_PLACA)
VALUES ('Suport IT', 2200, 'Assistència informàtica interna', 2, 'Tecnica');

-- EMPLEAT
INSERT INTO EMPLEAT VALUES (111111111111, 'Joan', 'Garcia Pons', 'joan.garcia@empresa.cat', 'ES9121000418450200051332');
INSERT INTO EMPLEAT VALUES (222222222222, 'Maria', 'López Serra', 'maria.lopez@empresa.cat', 'ES9820385778983000760236');
INSERT INTO EMPLEAT VALUES (333333333333, 'Pere', 'Martí Vidal', 'pere.marti@empresa.cat', 'ES7921000813610123456789');
INSERT INTO EMPLEAT VALUES (444444444444, 'Laura', 'Riera Bosch', 'laura.riera@empresa.cat', 'ES6621000418401234567891');
INSERT INTO EMPLEAT VALUES (555555555555, 'Anna', 'Ferrer Mas', 'anna.ferrer@empresa.cat', 'ES4521000418459876543210');

-- OCUPA
INSERT INTO OCUPA VALUES (111111111111, 1, DATE '2022-01-01', DATE '2023-12-31');
INSERT INTO OCUPA VALUES (222222222222, 2, DATE '2022-03-01', DATE '2024-06-30');
INSERT INTO OCUPA VALUES (333333333333, 3, DATE '2023-01-15', DATE '2025-01-31');
INSERT INTO OCUPA VALUES (444444444444, 4, DATE '2021-09-01', DATE '2023-08-31');
INSERT INTO OCUPA VALUES (555555555555, 5, DATE '2023-06-01', DATE '2024-12-31');
-- NOMINA
INSERT INTO NOMINA (IBAN_PAGAMENT, IMPORT, NSS_EMPLEAT, CODI_PLACA, DATA_PAGAMENT)
VALUES ('ES9121000418450200051332', 5000, 111111111111, 1, DATE'2022-01-31');

INSERT INTO NOMINA (IBAN_PAGAMENT, IMPORT, NSS_EMPLEAT, CODI_PLACA, DATA_PAGAMENT)
VALUES ('ES9121000418450200051332', 5000, 111111111111, 1, DATE'2022-02-28');

INSERT INTO NOMINA (IBAN_PAGAMENT, IMPORT, NSS_EMPLEAT, CODI_PLACA, DATA_PAGAMENT)
VALUES ('ES9121000418450200051332', 6000, 111111111111, 1, DATE'2022-03-31');

INSERT INTO NOMINA (IBAN_PAGAMENT, IMPORT, NSS_EMPLEAT, CODI_PLACA, DATA_PAGAMENT)
VALUES ('ES9121000418450200051332', 6000, 111111111111, 1, DATE'2022-12-31');

INSERT INTO NOMINA (IBAN_PAGAMENT, IMPORT, NSS_EMPLEAT, CODI_PLACA, DATA_PAGAMENT)
VALUES ('ES9820385778983000760236', 3800, 222222222222, 2, DATE'2023-09-30');

INSERT INTO NOMINA (IBAN_PAGAMENT, IMPORT, NSS_EMPLEAT, CODI_PLACA, DATA_PAGAMENT)
VALUES ('ES9820385778983000760236', 3400, 222222222222, 2, DATE'2023-10-31');

INSERT INTO NOMINA (IBAN_PAGAMENT, IMPORT, NSS_EMPLEAT, CODI_PLACA, DATA_PAGAMENT)
VALUES ('ES7921000813610123456789', 3200, 333333333333, 3, DATE'2023-09-30');

INSERT INTO NOMINA (IBAN_PAGAMENT, IMPORT, NSS_EMPLEAT, CODI_PLACA, DATA_PAGAMENT)
VALUES ('ES7921000813610123456789', 2800, 333333333333, 3, DATE'2024-09-30');

INSERT INTO NOMINA (IBAN_PAGAMENT, IMPORT, NSS_EMPLEAT, CODI_PLACA, DATA_PAGAMENT)
VALUES ('ES6621000418401234567891', 2500, 444444444444, 4, DATE'2022-01-31');

INSERT INTO NOMINA (IBAN_PAGAMENT, IMPORT, NSS_EMPLEAT, CODI_PLACA, DATA_PAGAMENT)
VALUES ('ES6621000418401234567891', 2700, 444444444444, 4, DATE'2023-01-31');

INSERT INTO NOMINA (IBAN_PAGAMENT, IMPORT, NSS_EMPLEAT, CODI_PLACA, DATA_PAGAMENT)
VALUES ('ES4521000418459876543210', 2200, 555555555555, 5, DATE'2024-12-31');

/*1. Crea un trigger que s'activi cada vegada que s'introdueix una ocupació (OCUPA)
nova i que faci 2 coses:
- Si no s'indica data de fi s'ha de posar per defecte una data posterior en 1 any
a la d'inici. Pista: ADD_MONTHS
-Si ja hi ha alguna ocupació del mateix empleat sense data de fi, s'ha de posar una data de fi a l'ocupació anterior que sigui igual a la data d'inici de la nova ocupació, menys 1 dia.
Pista: restar un nombre sencer N a una data retorna la data anterior en N dies
(3 punts)*/

CREATE OR REPLACE TRIGGER OCUPA_INSERT_TRIGGER
BEFORE INSERT ON OCUPA
FOR EACH ROW
BEGIN
    IF :NEW.DATA_FI IS NULL THEN
        :NEW.DATA_FI := ADD_MONTHS(:NEW.DATA_INICI, 12);
    END IF;
    DECLARE
        v_count INTEGER;
    BEGIN
        SELECT COUNT(*)
        INTO v_count
        FROM OCUPA
        WHERE NSS_EMPLEAT = :NEW.NSS_EMPLEAT AND DATA_FI IS NULL;

        IF v_count > 0 THEN UPDATE OCUPA SET DATA_FI = :NEW.DATA_INICI - 1
            WHERE NSS_EMPLEAT = :NEW.NSS_EMPLEAT AND DATA_FI IS NULL;
        END IF;
    END;
END;

/*2. Crea un trigger que s'activi cada vegada que es canvia qualsevol slari d'una plaça per 
guardar un registre dels canvis al salari. A la taula d'històric hi ha d'haver, almenys:
- Codi de la plaça que s'ha canviat
- Salari abans del canvi
- Data de canvi
Per exemple, si dia 16/05/2025 a les 15:55 canviam el salari de la plaça amb codi P1 i passa
de 2000 a 3000, 
a la taula d'històric hi ha d'haver un registre així: 
ID_CANVI    CODI_PLACA	SALARI	DATA_CANVI
1           P1			2000	16/05/2025 15:55
Mentre que a la taula normal de PLACA hi haurà un 3000, amb tota la informació actual de la plaça.
Proporciona el codi del trigger. 
Pots suposar que ja hi ha una taula creada amb els atributs indicats anteriorment. NO S'HA DE LLIURAR EL CREATE TABLE,
tot i que es recomenable que creeu la taula per provar-ho voltros mateixos.
(2 punts)*/

CREATE OR REPLACE TRIGGER CANVI_SALARI
AFTER UPDATE OF SALARI ON PLACA
FOR EACH ROW
BEGIN
    IF :OLD.SALARI != :NEW.SALARI THEN
        INSERT INTO HISTORIC_CANVI_SALARI (CODI_PLACA, SALARI, DATA_CANVI)
        VALUES (:OLD.CODI, :OLD.SALARI, SYSDATE);
    END IF;
END;


/*3. Declara (NOMÉS ESPECIFICACIÓ) un paquet EMPLEAT_API que tengui:
- Les següents excepcions: EMPLEAT_NO_EXISTENT, SENSE_PLACA.
- Un procedure DELETE_OCUPACIONS que elimini totes les ocupacions de l'empleat el NSS del qual es passi per paràmetre. (2 punts)
- Un procedure ALTA_EMPLEAT que doni d'alta un empleat donat el seu NSS, nom i llinatges.
- Una funció GET_PLACA_OCUPADA que donat un NSS d'empleat i una data, retorni el codi de la plaça que ocupava l'empleat en aquell moment. La data ha de ser opcional, ja que si es posa com a NULL la funció retornarà la plaça que l'empleat ocupi actualment.
- Una funció GET_EMPLEAT_BY_NSS que, donat un NSS d'empleat, retorni un record amb la informació (TOTA) d'aquest.
- Una funció GET_PLACA_BY_CODI que, donat un codi de plaça, retorni un record amb la informació d'aquest.
- Una funció GET_PLACES_OCUPADES que retorni una col·lecció amb totes les places ocupades al moment actual.
- Una funció SUMA_IMPORT_NOMINES que, donada una col·lecció de nòmines (records de la taula NOMINA) retorni la suma dels seus imports.
- Els tipus que serien necessaris (a nivell públic, no privat de dins el procediment) per les funcions anteriors.
Declara les excepcions i tipus necessaris al mateix paquet.
Les col·leccions utilitzades han de permetre un número indeterminat d'elements.
NO S'HA D'IMPLEMENTAR LA LÒGICA DE CAP FUNCIÓ O PROCEDIMENT. NOMÉS DECLARAR-LES AL PAQUET.
(5 punts)*/

CREATE OR REPLACE PACKAGE EMPLEAT_API AS
    EMPLEAT_NO_EXISTENT EXCEPTION;
    SENSE_PLACA EXCEPTION;


    TYPE EMPLEAT_REC IS RECORD (
        NSS NUMBER(12),
        NOM VARCHAR2(50),
        LLINATGES VARCHAR2(100),
        EMAIL VARCHAR2(100),
        IBAN VARCHAR2(24)
    );

    TYPE PLACA_REC IS RECORD (
        CODI NUMBER,
        NOM VARCHAR2(50),
        SALARI NUMBER(10,2),
        INFORME_SUPERVISIO VARCHAR2(1000),
        CODI_PLACA_SUPERVISORA NUMBER,
        NOM_TIPUS_PLACA VARCHAR2(50)
    );

    TYPE PLACES_OCUPADES_TABLE IS TABLE OF PLACA_REC;

    TYPE NOMINA_REC IS RECORD (
        ID_NOMINA NUMBER,
        IBAN_PAGAMENT VARCHAR2(24),
        IMPORT NUMBER(7,2),
        NSS_EMPLEAT NUMBER(12),
        CODI_PLACA NUMBER,
        DATA_PAGAMENT DATE
    );

    TYPE NOMINA_TABLE IS TABLE OF NOMINA_REC;
    PROCEDURE DELETE_OCUPACIONS(p_nss IN NUMBER);
    PROCEDURE ALTA_EMPLEAT(p_nss IN NUMBER, p_nom IN VARCHAR2, p_llinatges IN VARCHAR2);
    FUNCTION GET_PLACA_OCUPADA(p_nss IN NUMBER, p_data IN DATE DEFAULT NULL) RETURN NUMBER;
    FUNCTION GET_EMPLEAT_BY_NSS(p_nss IN NUMBER) RETURN EMPLEAT_REC;
    FUNCTION GET_PLACA_BY_CODI(p_codi IN NUMBER) RETURN PLACA_REC;
    FUNCTION GET_PLACES_OCUPADES RETURN PLACES_OCUPADES_TABLE;
    FUNCTION SUMA_IMPORT_NOMINES(p_nomines IN NOMINA_TABLE) RETURN NUMBER;
END EMPLEAT_API;