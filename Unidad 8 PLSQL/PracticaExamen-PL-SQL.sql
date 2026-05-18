DROP TABLE NOTA;
DROP TABLE ASSIGNATURA;
DROP TABLE ALUMNE;
DROP TABLE PROFESSOR;
DROP TABLE GRAU;

CREATE TABLE ALUMNE(
    DNI VARCHAR2(9) PRIMARY KEY,
    nom varchar2(50),
    llinatge1 varchar2(50),
    llinatge2 varchar2(50),
    email varchar2(50)
);

CREATE TABLE PROFESSOR(
    DNI VARCHAR2(9) PRIMARY KEY,
    nom VARCHAR2(50),
    llinatge1 VARCHAR2(50),
    llinatge2 VARCHAR2(50),
    email VARCHAR2(50),
	salari NUMBER
);

CREATE TABLE GRAU(
    ID NUMBER GENERATED AS IDENTITY PRIMARY KEY,
    nom VARCHAR2(50),
    cursos NUMBER
);

CREATE TABLE ASSIGNATURA(
    ID NUMBER GENERATED AS IDENTITY PRIMARY KEY,
    nom VARCHAR2(50),
    id_grau NUMBER,
    pla NUMBER(4),
    dni_professor VARCHAR2(9),
    credits_ects NUMBER(2,0) DEFAULT 6,
    FOREIGN KEY (dni_professor) REFERENCES PROFESSOR(DNI),
    FOREIGN KEY (id_grau) REFERENCES GRAU(ID)
);

CREATE TABLE NOTA(
    ID NUMBER GENERATED AS IDENTITY PRIMARY KEY,
    dni_alumne VARCHAR2(9),
    ID_assignatura NUMBER,
    convocatoria NUMBER(4),
    nota NUMBER,
    FOREIGN KEY (ID_assignatura) REFERENCES ASSIGNATURA(ID),
    FOREIGN KEY (dni_alumne) REFERENCES ALUMNE(DNI),
    UNIQUE(dni_alumne, ID_assignatura, convocatoria)
);

-- Inserció d'alumnes
INSERT INTO ALUMNE (DNI, nom, llinatge1, llinatge2, email) VALUES ('12345678A', 'Laura', 'Martí', 'Soler', 'laura.marti@example.com');
INSERT INTO ALUMNE (DNI, nom, llinatge1, llinatge2, email) VALUES ('23456789B', 'Marc', 'Garcia', 'López', 'marc.garcia@example.com');
INSERT INTO ALUMNE (DNI, nom, llinatge1, llinatge2, email) VALUES ('34567890C', 'Anna', 'Puig', 'Casas', 'anna.puig@example.com');
INSERT INTO ALUMNE (DNI, nom, llinatge1, llinatge2, email) VALUES ('45678901D', 'David', 'Ferrer', 'Prat', 'david.ferrer@example.com');
INSERT INTO ALUMNE (DNI, nom, llinatge1, llinatge2, email) VALUES ('56789012E', 'Sara', 'Navarro', 'Vidal', 'sara.navarro@example.com');
INSERT INTO ALUMNE (DNI, nom, llinatge1, llinatge2, email) VALUES ('67890123F', 'Oriol', 'González', 'Moreno', 'oriol.gonzalez@example.com');
INSERT INTO ALUMNE (DNI, nom, llinatge1, llinatge2, email) VALUES ('78901234G', 'Clara', 'Sánchez', 'Molina', 'clara.sanchez@example.com');
INSERT INTO ALUMNE (DNI, nom, llinatge1, llinatge2, email) VALUES ('89012345H', 'Jordi', 'Ruiz', 'Dominguez', 'jordi.ruiz@example.com');
INSERT INTO ALUMNE (DNI, nom, llinatge1, llinatge2, email) VALUES ('90123456I', 'Mireia', 'Blanco', 'Torres', 'mireia.blanco@example.com');
INSERT INTO ALUMNE (DNI, nom, llinatge1, llinatge2, email) VALUES ('01234567J', 'Pau', 'Ortega', 'Castro', 'pau.ortega@example.com');

-- Inserció de professors
INSERT INTO PROFESSOR (DNI, nom, llinatge1, llinatge2, email, salari) VALUES ('11223344L', 'Elena', 'Gil', 'Rodríguez', 'elena.gil@example.com', 30000);
INSERT INTO PROFESSOR (DNI, nom, llinatge1, llinatge2, email, salari) VALUES ('22334455M', 'Carlos', 'López', 'Jiménez', 'carlos.lopez@example.com', 31000);
INSERT INTO PROFESSOR (DNI, nom, llinatge1, llinatge2, email, salari) VALUES ('33445566N', 'Patricia', 'Martín', 'Pérez', 'patricia.martin@example.com', 32000);
INSERT INTO PROFESSOR (DNI, nom, llinatge1, llinatge2, email, salari) VALUES ('44556677O', 'Francisco', 'García', 'Sánchez', 'francisco.garcia@example.com', 28000);
INSERT INTO PROFESSOR (DNI, nom, llinatge1, llinatge2, email, salari) VALUES ('55667788P', 'Susana', 'Fernández', 'González', 'susana.fernandez@example.com', 26000);
INSERT INTO PROFESSOR (DNI, nom, llinatge1, llinatge2, email, salari) VALUES ('66778899Q', 'Luis', 'Álvarez', 'Gómez', 'luis.alvarez@example.com', 22000);
INSERT INTO PROFESSOR (DNI, nom, llinatge1, llinatge2, email, salari) VALUES ('77889900R', 'Carmen', 'Moreno', 'Ruiz', 'carmen.moreno@example.com', 40000);
INSERT INTO PROFESSOR (DNI, nom, llinatge1, llinatge2, email, salari) VALUES ('88990011S', 'Antonio', 'Navarro', 'Lorenzo', 'antonio.navarro@example.com', 33000);
INSERT INTO PROFESSOR (DNI, nom, llinatge1, llinatge2, email, salari) VALUES ('99001122T', 'Isabel', 'Serra', 'Miralles', 'isabel.serra@example.com', 32000);
INSERT INTO PROFESSOR (DNI, nom, llinatge1, llinatge2, email, salari) VALUES ('00112233U', 'Josep', 'Torres', 'Silva', 'josep.torres@example.com', 29000);

-- Inserció de graus
INSERT INTO GRAU (nom, cursos) VALUES ('Psicologia', 4);
INSERT INTO GRAU (nom, cursos) VALUES ('Dret', 4);
INSERT INTO GRAU (nom, cursos) VALUES ('Medicina', 6);
INSERT INTO GRAU (nom, cursos) VALUES ('Arquitectura', 5);
INSERT INTO GRAU (nom, cursos) VALUES ('Filologia Anglesa', 4);
INSERT INTO GRAU (nom, cursos) VALUES ('Ciències Polítiques', 4);
INSERT INTO GRAU (nom, cursos) VALUES ('Matemàtiques', 4);
INSERT INTO GRAU (nom, cursos) VALUES ('Informàtica', 4);

-- Inserció d'assignatures
INSERT INTO ASSIGNATURA (nom, id_grau, pla, dni_professor) VALUES ('Història de la Psicologia', 1, 2019, '11223344L');
INSERT INTO ASSIGNATURA (nom, id_grau, pla, dni_professor) VALUES ('Dret Constitucional', 2, 2024, '22334455M');
INSERT INTO ASSIGNATURA (nom, id_grau, pla, dni_professor) VALUES ('Anatomia Humana', 3, 2024, '33445566N');
INSERT INTO ASSIGNATURA (nom, id_grau, pla, dni_professor) VALUES ('Disseny Arquitectònic', 4, 2023, '44556677O');
INSERT INTO ASSIGNATURA (nom, id_grau, pla, dni_professor) VALUES ('Literatura Anglesa', 5, 2018, '55667788P');
INSERT INTO ASSIGNATURA (nom, id_grau, pla, dni_professor) VALUES ('Teories Polítiques', 6, 2022, '66778899Q');
INSERT INTO ASSIGNATURA (nom, id_grau, pla, dni_professor) VALUES ('Càlcul Diferencial', 7, 2021, '77889900R');
INSERT INTO ASSIGNATURA (nom, id_grau, pla, dni_professor) VALUES ('Programació I', 8, 2020, '88990011S');
INSERT INTO ASSIGNATURA (nom, id_grau, pla, dni_professor) VALUES ('Estructura de computadors', 8, 2020, '99001122T');
INSERT INTO ASSIGNATURA (nom, id_grau, pla, dni_professor) VALUES ('Teoria de la computació', 8, 2020, '00112233U');

-- Inserció de notes
INSERT INTO NOTA (dni_alumne, ID_assignatura, convocatoria, nota) VALUES ('12345678A', 1, 2021, 7.5);
INSERT INTO NOTA (dni_alumne, ID_assignatura, convocatoria, nota) VALUES ('23456789B', 2, 2021, 6.0);
INSERT INTO NOTA (dni_alumne, ID_assignatura, convocatoria, nota) VALUES ('34567890C', 3, 2021, 4.5);
INSERT INTO NOTA (dni_alumne, ID_assignatura, convocatoria, nota) VALUES ('56789012E', 5, 2021, 5.5);
INSERT INTO NOTA (dni_alumne, ID_assignatura, convocatoria, nota) VALUES ('67890123F', 6, 2021, 7.0);
INSERT INTO NOTA (dni_alumne, ID_assignatura, convocatoria, nota) VALUES ('89012345H', 8, 2021, 6.5);
INSERT INTO NOTA (dni_alumne, ID_assignatura, convocatoria, nota) VALUES ('89012345H', 9, 2021, 7.5);
INSERT INTO NOTA (dni_alumne, ID_assignatura, convocatoria, nota) VALUES ('89012345H', 10, 2021, 4.5);
INSERT INTO NOTA (dni_alumne, ID_assignatura, convocatoria, nota) VALUES ('90123456I', 8, 2021, 4.0);
INSERT INTO NOTA (dni_alumne, ID_assignatura, convocatoria, nota) VALUES ('90123456I', 9, 2021, 5.5);
INSERT INTO NOTA (dni_alumne, ID_assignatura, convocatoria, nota) VALUES ('01234567J', 8, 2021, 8.5);
INSERT INTO NOTA (dni_alumne, ID_assignatura, convocatoria, nota) VALUES ('01234567J', 9, 2021, 9.0);
INSERT INTO NOTA (dni_alumne, ID_assignatura, convocatoria, nota) VALUES ('01234567J', 10, 2021, 9.5);

/*1. Crea una funció nested (dins un bloc anònim) total_credits que, donat un varray de IDs d'assignatura 
(taula ASSIGNATURA) amb un màxim de 10 elements, retorni el nombre total de crèdits ECTS d'aquestes. Per exemple, 
si es crida la funció amb un varray que contengui 8, 9 i 10, la funció ha de retornar 6+6+6 = 18. Tot i que totes les 
assignatures de la taula tenguin 6 crèdits, no té perquè ser així. S'han de sumar  assignatura per assignatura. 
Declara els tipus i excepcions necessaris dins el bloc anònim. (3 punts) 1.1. Crea una excepció ASSIGNATURA_INVÀLIDA 
que es dispari si algun dels IDs d'assignatura indicats no existeix. (0,5 punts) 1.2. Crida la funció amb un varray de IDs 
declarat al bloc anònim i mostra el resultat. (0,5 punts) NOTA:   També es pot fer amb una nested table, però en aquest 
cas la puntuació màxima del primer punt serà de 2,5 Si es fa sense funció, la puntuació màxima de tota l'activitat 
serà de 3*/

DECLARE
    TYPE t_id_assignatura IS VARRAY(10) OF NUMBER;
    v_ids t_id_assignatura := t_id_assignatura(8, 9, 10);
    v_total_credits NUMBER := 0;
    ex_assignatura_invalida EXCEPTION;
    
    FUNCTION total_credits(p_ids t_id_assignatura) RETURN NUMBER IS
        v_credits NUMBER;
    BEGIN
        FOR i IN 1..p_ids.COUNT LOOP
            SELECT credits_ects INTO v_credits FROM ASSIGNATURA WHERE ID = p_ids(i);
            v_total_credits := v_total_credits + v_credits;
        END LOOP;
        RETURN v_total_credits;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE ex_assignatura_invalida;
    END;
BEGIN
    v_total_credits := total_credits(v_ids);
    DBMS_OUTPUT.PUT_LINE('Total de crèdits ECTS: ' || v_total_credits);
EXCEPTION
    WHEN ex_assignatura_invalida THEN
        DBMS_OUTPUT.PUT_LINE('Assignatura invàlida');
END;

/*2. Crea una funció nested (dins un bloc anònim) get_assignatures_by_grau que, donat un ID de grau 
(veure ID_GRAU d'ASSIGNATURA), retorni una nested table amb records de les assignatures d'aquest grau. 
Aquests records han de tenir tota la informació dels registres de la taula ASSIGNATURA ()
Per exemple, si es crida la funció amb un ID de grau 8, la funció ha de retornar una nested table amb 
tota la informació (records) de les assignatures amb id 8, 9 i 10.  Declara els tipus necessaris dins el bloc 
anònim. (3 punts) 2.1. Crida la funció amb un ID de grau existent i imprimeix el nom de totes les assignatures retornades 
per la funció. (1 punt) NOTA:   Si es fa sense funció, la puntuació màxima de tota l'activitat serà de 3*/

DECLARE
    TYPE t_assignatura IS TABLE OF ASSIGNATURA%ROWTYPE;
    V_assignatura T_assignatura;
    FUNCTION get_assignatures_by_grau(p_id_grau NUMBER)
    RETURN t_assignatura IS v_llista_assignatura t_assignatura;
    BEGIN
        SELECT*BULK COLLECT INTO v_llista_assignatura FROM ASSIGNATURA WHERE ID_GRAU = p_id_grau;
        RETURN v_llista_assignatura;
    END;
BEGIN
    v_llista_assignatura := GET_ASS_BY_GRAU(8);
    FOR i IN 1..v_llista_assignatura.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE(v_llista_assignatura(i).NOM);
    END LOOP;
END;

/*3. Crea un procediment standalone (s'ha de guardar dins base de dades) update_assignatura_nom que, donat un ID 
d'assignatura i un nom, actualitzi el nom de l'assignatura a l'indicat. (Taula ASSIGNATURA) Si el nou nom de l'assignatura 
té menys de 5 lletres, no s'ha de dur a terme l'actualització i s'ha de  mostrar un missatge "Nom invàlid". (2 punts)*/

CREATE OR REPLACE PROCEDURE UPDATE_ASSIGNATURA_NOM(p_id_assignatura number, p_nom VARCHAR2)
IS
    BEGIN
        IF LENGTH(p_nom) <5 THEN
        DBMS_OUTPUT.PUT_LINE ('Nom invàlid');
        ELSE UPDATE ASSIGNTURA SET NOM=p_NOM WHERE ID = p_id_assignatura;
    END IF;
END;