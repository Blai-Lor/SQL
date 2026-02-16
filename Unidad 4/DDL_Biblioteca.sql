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
    ID_sequela number,
    foreign key (ID_editorial) references EDITORIAL(ID),
    foreign key (ID_sequela) references LLIBRE(ID)
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

INSERT INTO EDITORIAL (nom) VALUES ('ANDRESPUTERO');
INSERT INTO EDITORIAL (nom) VALUES ('XISCOPUTERO');

INSERT INTO LLIBRE (titol, an, exemplars, ID_editorial, ID_sequela) VALUES ('La Bella Litrona y El Putero Del Alcalde', 3256, 150, 1, 2);
INSERT INTO LLIBRE (titol, an, exemplars, ID_editorial, ID_sequela) VALUES ('La Gran Deportacion De Daniel Alejandro', 5047, 150, 1, 2);

INSERT INTO AUTOR (nom, cognoms, data_naix, nacionalitat) VALUES ('Alex ', 'Sanchez', 'ESP');
INSERT INTO AUTOR (nom, cognoms, data_naix, nacionalitat) VALUES ('Hugo ', 'Correoso', 'ESP');
INSERT INTO AUTOR (nom, cognoms, data_naix, nacionalitat) VALUES ('Ivan ', 'Hidalgo', 'ESP');

INSERT INTO AUTOR_LLIBRE VALUES (1,2);
INSERT INTO AUTOR_LLIBRE VALUES (2,1);
INSERT INTO AUTOR_LLIBRE VALUES (2,2);
