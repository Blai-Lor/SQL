DROP TABLE AUTOR_LLIBRE;
DROP TABLE LLIBRE_GENERE;
DROP TABLE LLIBRE;
DROP TABLE EDITORIAL;
DROP TABLE AUTOR;
DROP TABLE GENERE;

CREATE TABLE EDITORIAL(
    ID number generated as identity primary key,
    nom varchar2(50)
);

CREATE TABLE LLIBRE (
    ID number generated as identity primary key,
    titol varchar2(50),
    an number,
    exemplars number,
    ID_editorial number NOT NULL,
    ID_sequela_de number,
    foreign key (ID_editorial) references EDITORIAL(ID),
    foreign key (ID_sequela_de) references LLIBRE(ID)
);

CREATE TABLE AUTOR (
    ID number generated as identity primary key,
    nom varchar2(50),
    cognoms varchar2(50),
    data_naix date,
    nacionalitat varchar2(3)
);

CREATE TABLE AUTOR_LLIBRE(
    ID_autor number,
    ID_llibre number,
    primary key(ID_autor, ID_llibre),
    foreign key (ID_autor) references AUTOR(ID),
    foreign key (ID_llibre) references LLIBRE(ID)
);

CREATE TABLE GENERE(
    nom varchar2(50) primary key
);

CREATE TABLE LLIBRE_GENERE(
    ID_llibre number,
    nom_genere varchar2(50),
    foreign key (ID_llibre) references LLIBRE(ID),
    foreign key (nom_genere) references GENERE(nom),
    primary key (ID_llibre, nom_genere)
);

INSERT INTO EDITORIAL (nom) VALUES ('LaButxaca');
INSERT INTO EDITORIAL (nom) VALUES ('Letras hispánicas');
INSERT INTO EDITORIAL (nom) VALUES ('Planeta');
INSERT INTO EDITORIAL (nom) VALUES ('Anaya');

INSERT INTO GENERE VALUES ('Misteri');
INSERT INTO GENERE VALUES ('Poesia');
INSERT INTO GENERE VALUES ('Fantasia');
INSERT INTO GENERE VALUES ('Aventura');
INSERT INTO GENERE VALUES ('Filosofia');

INSERT INTO AUTOR(nom, cognoms, data_naix, nacionalitat) VALUES ('Federico', 'García Lorca', DATE'1898-06-05', 'ESP');
INSERT INTO AUTOR(nom, cognoms, data_naix, nacionalitat) VALUES ('Manuel', 'de Pedrolo i Molina', DATE'1918-04-01', 'ESP');
INSERT INTO AUTOR(nom, cognoms, data_naix, nacionalitat) VALUES ('Joanne', 'Rowling', DATE'1965-07-31', 'GBR');
INSERT INTO AUTOR(nom, cognoms, data_naix, nacionalitat) VALUES ('Stephen', 'King', DATE'1947-09-21', 'USA');
INSERT INTO AUTOR(nom, cognoms, data_naix, nacionalitat) VALUES ('Owen', 'King', DATE'1977-02-21', 'USA');
INSERT INTO AUTOR(nom, cognoms, data_naix, nacionalitat) VALUES ('Shigeru', 'Miyamoto', DATE'1952-09-16', 'JPN');
INSERT INTO AUTOR(nom, cognoms, data_naix, nacionalitat) VALUES ('Hidetaka', 'Miyazaki', DATE'1974-09-19', 'JPN');

--INSERT INTO LLIBRE(titol, an, exemplars, id_editorial) VALUES (nomLlibre, any, nombreExemplars, (SELECT ID FROM EDITORIAL WHERE NOM = 'Letras hispánicas'));
INSERT INTO LLIBRE(titol, an, exemplars, id_editorial) VALUES ('Bodas de sangre', 1933, 10, (SELECT ID FROM EDITORIAL WHERE NOM = 'Letras hispánicas'));
INSERT INTO LLIBRE(titol, an, exemplars, id_editorial) VALUES ('Yerma', 1934, 0, (SELECT ID FROM EDITORIAL WHERE NOM = 'Letras hispánicas'));
INSERT INTO LLIBRE(titol, an, exemplars, id_editorial) VALUES ('La casa de Bernarda Alba', 1936, 12, (SELECT ID FROM EDITORIAL WHERE NOM = 'Letras hispánicas'));
INSERT INTO LLIBRE(titol, an, exemplars, id_editorial) VALUES ('Poeta en Nueva York', 1940, 5, (SELECT ID FROM EDITORIAL WHERE NOM = 'Letras hispánicas'));
INSERT INTO LLIBRE(titol, an, exemplars, id_editorial) VALUES ('Romancero gitano', 1928, 1, (SELECT ID FROM EDITORIAL WHERE NOM = 'Letras hispánicas'));
INSERT INTO LLIBRE(titol, an, exemplars, id_editorial) VALUES ('El Lazarillo de Tormes', 1554, 2, (SELECT ID FROM EDITORIAL WHERE NOM = 'Letras hispánicas'));

INSERT INTO LLIBRE(titol, an, exemplars, id_editorial) VALUES ('Mecanoscrit del segon origen', 1974, 1, (SELECT ID FROM EDITORIAL WHERE NOM = 'LaButxaca'));
INSERT INTO LLIBRE(titol, an, exemplars, id_editorial) VALUES ('Totes les bèsties de càrrega', 1965, 5, (SELECT ID FROM EDITORIAL WHERE NOM = 'LaButxaca'));
INSERT INTO LLIBRE(titol, an, exemplars, id_editorial) VALUES ('Joc brut', 1965, 2, (SELECT ID FROM EDITORIAL WHERE NOM = 'LaButxaca'));
INSERT INTO LLIBRE(titol, an, exemplars, id_editorial) VALUES ('Trajecte final', 1981, 6, (SELECT ID FROM EDITORIAL WHERE NOM = 'LaButxaca'));
INSERT INTO LLIBRE(titol, an, exemplars, id_editorial) VALUES ('Es vessa una sang fàcil', 1954, 5, (SELECT ID FROM EDITORIAL WHERE NOM = 'LaButxaca'));

INSERT INTO LLIBRE(titol, an, exemplars, id_editorial) VALUES ('Harry Potter i la pedra filosofal', 1997, 0, (SELECT ID FROM EDITORIAL WHERE NOM = 'Planeta'));
INSERT INTO LLIBRE(titol, an, exemplars, id_editorial, id_sequela_de) VALUES ('Harry Potter i la cambra secreta', 1998, 7, (SELECT ID FROM EDITORIAL WHERE NOM = 'Planeta'), (SELECT ID FROM LLIBRE WHERE TITOL = 'Harry Potter i la pedra filosofal'));
INSERT INTO LLIBRE(titol, an, exemplars, id_editorial, id_sequela_de) VALUES ('Harry Potter i el pres d''Azkaban', 1999, 6, (SELECT ID FROM EDITORIAL WHERE NOM = 'Planeta'), (SELECT ID FROM LLIBRE WHERE TITOL = 'Harry Potter i la cambra secreta'));
INSERT INTO LLIBRE(titol, an, exemplars, id_editorial, id_sequela_de) VALUES ('Harry Potter i el calze de foc', 2000, 5, (SELECT ID FROM EDITORIAL WHERE NOM = 'Planeta'), (SELECT ID FROM LLIBRE WHERE TITOL = 'Harry Potter i el pres d''Azkaban'));
INSERT INTO LLIBRE(titol, an, exemplars, id_editorial, id_sequela_de) VALUES ('Harry Potter i l''orde del Fènix', 2003, 4, (SELECT ID FROM EDITORIAL WHERE NOM = 'Planeta'), (SELECT ID FROM LLIBRE WHERE TITOL = 'Harry Potter i el calze de foc'));
INSERT INTO LLIBRE(titol, an, exemplars, id_editorial) VALUES ('Bellas durmientes', 2017, 3, (SELECT ID FROM EDITORIAL WHERE NOM = 'Planeta'));

INSERT INTO AUTOR_LLIBRE SELECT (SELECT id FROM AUTOR WHERE nom = 'Federico'), id FROM LLIBRE WHERE id_editorial = (SELECT id from EDITORIAL WHERE nom = 'Letras hispánicas') and titol != 'El Lazarillo de Tormes';
INSERT INTO AUTOR_LLIBRE SELECT (SELECT id FROM AUTOR WHERE nom = 'Manuel'), id FROM LLIBRE WHERE id_editorial = (SELECT id from EDITORIAL WHERE nom = 'LaButxaca');
INSERT INTO AUTOR_LLIBRE SELECT (SELECT id FROM AUTOR WHERE nom = 'Joanne'), id FROM LLIBRE WHERE id_editorial = (SELECT id from EDITORIAL WHERE nom = 'Planeta') and titol LIKE 'Harry%';
INSERT INTO AUTOR_LLIBRE SELECT (SELECT id FROM AUTOR WHERE nom = 'Stephen'), id FROM LLIBRE WHERE id_editorial = (SELECT id from EDITORIAL WHERE nom = 'Planeta') and titol NOT LIKE 'Harry%';
INSERT INTO AUTOR_LLIBRE SELECT (SELECT id FROM AUTOR WHERE nom = 'Owen'), id FROM LLIBRE WHERE id_editorial = (SELECT id from EDITORIAL WHERE nom = 'Planeta') and titol NOT LIKE 'Harry%';

INSERT INTO LLIBRE_GENERE SELECT id_llibre, 'Poesia' FROM AUTOR_LLIBRE WHERE id_autor = (SELECT id FROM AUTOR WHERE NOM = 'Federico');
INSERT INTO LLIBRE_GENERE SELECT id_llibre, 'Fantasia' FROM AUTOR_LLIBRE WHERE id_autor = (SELECT id FROM AUTOR WHERE NOM = 'Joanne');
INSERT INTO LLIBRE_GENERE SELECT id_llibre, 'Aventura' FROM AUTOR_LLIBRE WHERE id_autor = (SELECT id FROM AUTOR WHERE NOM = 'Manuel') AND rownum < 3;
INSERT INTO LLIBRE_GENERE SELECT id_llibre, 'Misteri' FROM AUTOR_LLIBRE WHERE id_autor = (SELECT id FROM AUTOR WHERE NOM = 'Manuel') AND id_llibre not in (SELECT id_llibre FROM LLIBRE_GENERE);

DELETE FROM LLIBRE_GENERE WHERE id_llibre = (SELECT ID FROM LLIBRE WHERE TITOL = 'Totes les bèsties de càrrega');
DELETE FROM LLIBRE_GENERE WHERE id_llibre = (SELECT ID FROM LLIBRE WHERE TITOL = 'Harry Potter i el calze de foc');
DELETE FROM LLIBRE_GENERE WHERE id_llibre = (SELECT ID FROM LLIBRE WHERE TITOL = 'Bellas durmientes');

/*1. Crea una funció GET_LLIBRES_BY_AUTOR_ID que, donat un ID d'autor, retorni una NESTED
TABLE amb records dels llibres d'aquest autor.
Crida aquesta funció des d'un bloc anonim passant-li com a parametre un ID d'autor que tengui
llibres i mostra (DBMS_OUTPUT) els seus títols utilitzant alguna estructura iterativa.
(4 punts)
*/

DECLARE
    TYPE REC_LLIBRES IS RECORD (
        ID_LLIBRE LLIBRE.id%type,
        TITOL LLIBRE.titol%type,
        AN LLIBRE.an%type,
        EXEMPLARS LLIBRE.exemplars%type
        );
    
    TYPE T_LLIBRES IS TABLE OF REC_LLIBRES;
        V_RESFUNCION T_LLIBRES;
    FUNCTION GET_LLIBRES_BY_AUTOR_ID(p_autor_id number) return T_LLIBRES IS
        V_LLIBRES T_LLIBRES := T_LLIBRES();
        
    BEGIN
        SELECT LLIBRE.ID, LLIBRE.TITOL, LLIBRE.AN, LLIBRE.EXEMPLARS
        BULK COLLECT INTO V_LLIBRES
        FROM LLIBRE
        JOIN autor_llibre ON LLIBRE.ID = autor_llibre.id_llibre
        WHERE p_autor_id = autor_llibre.id_autor;
        
        RETURN V_LLIBRES;
    END;
BEGIN
    V_RESFUNCION := GET_LLIBRES_BY_AUTOR_ID(2);
        FOR I IN 1..V_RESFUNCION.COUNT LOOP
            DBMS_OUTPUT.PUT_LINE(V_RESFUNCION(I).titol);
        END LOOP;
END;

/*2. Crea un procedure nested ACTUALITZA_LLIBRE_TITOL que, donat l'ID d'un llibre i un VARCHAR2, 
actualitzi el títol del llibre que té l'ID indicat al varchar2 passat com a paràmetre.
Si el llibre no existeix, el procediment ha de mostrar al DBMS_OUTPUT un missatge indicant que no hi
ha cap llibre amb l'ID passat.
(4 punts)
*/

CREATE OR REPLACE PROCEDURE ACTUALITZA_LLIBRE_TITOL(p_id_llibre number, p_nou_titol varchar2) IS
    V_EXISTEIX_LLIBRE number;
BEGIN
    SELECT COUNT(*)
        INTO V_EXISTEIX_LLIBRE
        FROM LLIBRE
        WHERE ID = p_id_llibre;
            IF V_EXISTEIX_LLIBRE > 0 THEN
                UPDATE LLIBRE
                SET TITOL = p_nou_titol
                WHERE ID = p_id_llibre;
            ELSE
                DBMS_OUTPUT.PUT_LINE('No hi ha cap llibre amb l''ID ' || p_id_llibre);
            END IF;
END;

/*3. Defineix una excepció nova LLIBRE_ID_DESCONEGUT i modifica el procedure anterior perquè, en lloc de
mostrar un missatge al DBMS_OUTPUT quan el llibre no existeix, aixequi l'excepció LLIBRE_ID_DESCONEGUT.
Crida la funció des del bloc anònim utilitzant l'ID d'un llibre inexistent i mostra un missatge al
DBMS_OUTPUT quan ocorri l'excepció que has declarat anteriorment.
(2 punts)
.*/

CREATE OR REPLACE PROCEDURE ACTUALITZA_LLIBRE_TITOL(p_id_llibre number, p_nou_titol varchar2) IS
    V_EXISTEIX_LLIBRE number;
    LLIBRE_ID_DESCONEGUT EXCEPTION;
BEGIN
    SELECT COUNT(*)
        INTO V_EXISTEIX_LLIBRE
        FROM LLIBRE
        WHERE ID = p_id_llibre; 
            IF V_EXISTEIX_LLIBRE > 0 THEN
                UPDATE LLIBRE
                SET TITOL = p_nou_titol
                WHERE ID = p_id_llibre;
            ELSE
                RAISE LLIBRE_ID_DESCONEGUT;
            END IF;
EXCEPTION
    WHEN LLIBRE_ID_DESCONEGUT THEN
        DBMS_OUTPUT.PUT_LINE('No hi ha cap llibre amb aquest ID ' || p_id_llibre);
END;