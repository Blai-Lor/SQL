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

--INSERT INTO LLIBRE(titol, an, exemplars, id_editorial) VALUES (nomLlibre, any, exemplarNom, (SELECT ID FROM EDITORIAL WHERE NOM = 'Letras hispánicas'));
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

/*
1. Crea un paquet LLIBRES_API que contengui (6 punts):
• Un procediment “alta_llibre” per donar d’alta un llibre, donat, com a mínim, el seu
títol, any, número d’exemplars i ID d’editorial. L’ID del llibre del que és seqüela
també s’ha de poder indicar, però ha de ser un paràmetre opcional (amb valor per
defecte NULL) i, si s’indica, el procediment ha de comprovar que hi ha un llibre amb
aquell ID i aixecar una excepció si no és així. A més, si s’indica un número
d’exemplars negatiu o una editorial que no existeix, també s’ha d’aixecar una
excepció (diferent en cada cas).
• Una funció “get_llibre_by_id” per obtenir la informació d’un llibre (record), donat el
seu ID.
• Una funció “get_llibres_by_genere” per obtenir tots els llibres (records) d’un gènere,
donat l’ID del gènere. Els llibres han d’estar ordenats per títol.
• Una funció “search_by_titol” per obtenir tots els llibres (records) que al títol tinguin
el text indicat per paràmetre.
Les funcions, procediments, tipus i excepcions necessaris han de formar part del mateix
paquet.
*/

CREATE OR REPLACE PACKAGE LLIBRES_API AS
    TYPE llibre_record IS RECORD (
        id NUMBER,
        titol VARCHAR2(50),
        an NUMBER,
        exemplars NUMBER,
        id_editorial NUMBER,
        id_sequela_de NUMBER
    );

    PROCEDURE alta_llibre(
        nomLlibre IN VARCHAR2,
        any IN NUMBER,
        exemplarNom IN NUMBER,
        editorialID IN NUMBER,
        sequelaID IN NUMBER DEFAULT NULL
    );

    FUNCTION get_llibre_by_id(idLlibre IN NUMBER) RETURN llibre_record;
    FUNCTION get_llibres_by_genere(nomGenere IN VARCHAR2) RETURN SYS_REFCURSOR;
    FUNCTION search_by_titol(text IN VARCHAR2) RETURN SYS_REFCURSOR;
    editorialInexistent EXCEPTION;
    exemplarNegatiu EXCEPTION;
    sequelaInexistent EXCEPTION;
END LLIBRES_API;

CREATE OR REPLACE PACKAGE BODY LLIBRES_API AS
    PROCEDURE alta_llibre(
        nomLlibre IN VARCHAR2,
        any IN NUMBER,
        exemplarNom IN NUMBER,
        editorialID IN NUMBER,
        sequelaID IN NUMBER DEFAULT NULL
    )
    IS
        v_count NUMBER;
    BEGIN

        IF exemplarNom < 0 THEN RAISE exemplarNegatiu;
        END IF;

        SELECT COUNT(*) INTO v_count FROM EDITORIAL WHERE ID = editorialID;

        IF v_count = 0 THEN RAISE editorialInexistent;
        END IF;

        IF sequelaID IS NOT NULL THEN SELECT COUNT(*) INTO v_count FROM LLIBRE WHERE ID = sequelaID;
            IF v_count = 0 THEN RAISE sequelaInexistent;
            END IF;
        END IF;

        INSERT INTO LLIBRE(titol, an, exemplars, id_editorial, id_sequela_de)
        VALUES(nomLlibre, any, exemplarNom, editorialID, sequelaID);
    END alta_llibre;

    FUNCTION get_llibre_by_id(idLlibre IN NUMBER)RETURN llibre_record
    IS
        v_llibre llibre_record;
    BEGIN

        SELECT
            id, titol, an, exemplars, id_editorial, id_sequela_de
        INTO
            v_llibre.id, v_llibre.titol, v_llibre.an, v_llibre.exemplars, v_llibre.id_editorial, v_llibre.id_sequela_de
        FROM LLIBRE WHERE ID = idLlibre;
        RETURN v_llibre;
    END get_llibre_by_id;

    FUNCTION get_llibres_by_genere(nomGenere IN VARCHAR2)RETURN SYS_REFCURSOR
    IS
        v_cursor SYS_REFCURSOR;
    BEGIN

        OPEN v_cursor FOR SELECT l.* FROM LLIBRE l JOIN LLIBRE_GENERE lg ON l.ID = lg.ID_llibre
            WHERE lg.nom_genere = nomGenere ORDER BY l.titol;
        RETURN v_cursor;

    END get_llibres_by_genere;

    FUNCTION search_by_titol(text IN VARCHAR2) RETURN SYS_REFCURSOR
    IS
        v_cursor SYS_REFCURSOR;
    BEGIN

        OPEN v_cursor FOR SELECT * FROM LLIBRE WHERE LOWER(titol) LIKE LOWER('%' || text || '%') ORDER BY titol;
        RETURN v_cursor;
    END search_by_titol;
END LLIBRES_API;

/*
2. Crea un trigger que guardi, a una taula LLIBRES_LOG, l’històric d’exemplars d’un llibre.
Quan un llibre canvia de nombre d’exemplars, s’ha de guardar el nombre d’exemplars
que tenia abans del canvi, dins aquesta nova taula, amb la data del moment en què es
fa el canvi (és a dir, quan el llibre deixa de tenir aquell nombre d’exemplars) i l’ID del
llibre.
*/

CREATE TABLE LLIBRES_LOG (
    id NUMBER GENERATED AS IDENTITY PRIMARY KEY,
    id_llibre NUMBER,
    exemplars_anterior NUMBER,
    data_canvi DATE,

    FOREIGN KEY (id_llibre)
        REFERENCES LLIBRE(id)
);

CREATE OR REPLACE TRIGGER LLIBRES_EXEMPLARS_LOG
BEFORE UPDATE OF exemplars ON LLIBRE FOR EACH ROW

BEGIN
    IF :OLD.exemplars <> :NEW.exemplars THEN
        INSERT INTO LLIBRES_LOG(id_llibre, exemplars_anterior, data_canvi)
        VALUES(:OLD.id, :OLD.exemplars, SYSDATE);
    END IF;
END;