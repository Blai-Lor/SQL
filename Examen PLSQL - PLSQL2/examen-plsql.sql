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

/*1. Crea un procediment standalone update_placa_salari que, donat un codi de placa i un salari, actualitzi el salari de la plaça a l'indicat. (Taula PLACA)
Si el nou salari de la placa suposa una disminució del salari actual que té la plaça indicada, no s'ha de dur a terme l'actualització i s'ha de mostrar un missatge "Salari invàlid".
(2 punts)
*/
DELETE PROCEDURE update_placa_salari;
    CREATE OR REPLACE PROCEDURE update_placa_salari (p_codi_placa IN NUMBER, p_salari_nou IN NUMBER) AS
    v_salari_act NUMBER(10,2);
BEGIN
    SELECT SALARI INTO v_salari_act FROM PLACA WHERE CODI = p_codi_placa;
    IF p_salari_nou < v_salari_act THEN
            DBMS_OUTPUT.PUT_LINE('Salari invalid');
    ELSE
        UPDATE PLACA SET SALARI = p_salari_nou WHERE CODI = p_codi_placa;
        COMMIT;
    END IF;
END;

/*2. Crea un BLOC ANÒNIM amb una funció (dins el bloc anònim, és a dir, nested) anomenada GET_NOMINES que, donat un NSS d'empleat, retorni una nested table amb records de les nòmines d'aquest empleat. Aquests records han de tenir tota la informació dels registres de la taula NOMINA.
Per exemple, si es crida la funció amb un NSS 111111111111, la funció ha de retornar una nested table amb totes les nòmines d'aquest empleat.
Declara els tipus necessaris dins el bloc anònim. (2,5 punts)
2.1. Crida la funció amb un NSS existent i imprimeix la data de pagament i l'import de totes les seves nòmines. (1 punt).
2.2. Declara una excepció EMPLEAT_INEXISTENT que s'aixequi si l'empleat indicat no existeix i gestiona-la al bloc anònim des d'on crides la funció mostrant un missatge. (1 punt)
2.3. Aseegura't que davant qualsevol altre excepció és mostri un missatge "Error desconegut". (0,5 punts)
*/

DECLARE 
    TYPE nomina_rec IS RECORD (
        id_nomina NUMBER,
        iban_pagament VARCHAR2(24),
        import NUMBER(7,2),
        nss_empleat NUMBER(12),
        codi_placa NUMBER(10),
        data_pagament DATE
    );
    
    TYPE nomina_table IS TABLE OF nomina_rec;
    FUNCTION GET_NOMINES(p_nss_empleat IN NUMBER) RETURN nomina_table IS v_nomina nomina_table;
    BEGIN
        SELECT ID_NOMINA, IBAN_PAGAMENT, IMPORT, NSS_EMPLEAT, CODI_PLACA, DATA_PAGAMENT BULK COLLECT INTO v_nomina 
        FROM NOMINA WHERE NSS_EMPLEAT = p_nss_empleat;
        IF v_nomina.COUNT = 0 THEN RAISE EMPLEAT_INEXISTENT;
        END IF;
        RETURN v_nomina;
    EXCEPTION
        WHEN EMPLEAT_INEXISTENT THEN DBMS_OUTPUT.PUT_LINE('Empleat inexistent');
            RETURN NULL;
        WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE('Error desconegut');
            RETURN NULL;
    END GET_NOMINES;
BEGIN
    v_result := GET_NOMINES(111111111111);
    IF v_result IS NOT NULL THEN
        FOR i IN 1..v_result.COUNT LOOP
            DBMS_OUTPUT.PUT_LINE('Data: ' || TO_CHAR(v_result(i).data_pagament, 'YYYY-MM-DD') || ', Import: ' || v_result(i).import);
        END LOOP;
    END IF;
END;

/*3. Crea una funció anomenada get_nom_placa_supervisora_maxima que, donat un codi de placa, retorni el nom de la plaça supervisora de nivell més alt, 
que no té per què ser la supervisora immediata.
Per exemple, la plaça amb ID 3 és supervisada per la 2, però com que la 2 és supervisada per la 1 s'hauria de retornar el nom de la 1.
Si s'indica un codi de plaça sense supervisora com a paràmetre, s'ha de retornar el nom d'aquesta.
No vos preocupeu de control d'errors, basta funcioni amb un codi de plaça existent.
COMPROVACIÓ: Qualsevol codi de plaça vàlid que li poseu vos hauria de retornar "Cap Direccio"
(3 punts)
*/

CREATE OR REPLACE FUNCTION get_nom_placa_supervisora_maxima(p_codi_placa IN NUMBER) RETURN VARCHAR2 IS
    v_nom_placa VARCHAR2(50);
    v_codi_supervisora NUMBER;
BEGIN
    SELECT NOM, CODI_PLACA_SUPERVISORA INTO v_nom_placa, v_codi_supervisora FROM PLACA WHERE CODI = p_codi_placa;
    WHILE v_codi_supervisora IS NOT NULL LOOP
        SELECT NOM, CODI_PLACA_SUPERVISORA INTO v_nom_placa, v_codi_supervisora FROM PLACA WHERE CODI = v_codi_supervisora;
    END LOOP;
    RETURN v_nom_placa;
END;