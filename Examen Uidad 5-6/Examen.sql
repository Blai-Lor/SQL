CREATE TABLE PROVEIDOR(
    NIF VARCHAR2(9) PRIMARY KEY,
    NOM VARCHAR2(255) NOT NULL,
    OBSERVACIONS VARCHAR2(255),
    EMAIL VARCHAR2(255),
    TELEFON VARCHAR2(255),
    IBAN VARCHAR2(24) NOT NULL UNIQUE
);

CREATE TABLE INVESTIGADOR(
    DNI VARCHAR2(9) PRIMARY KEY,
    NOM VARCHAR2(100) NOT NULL,
    LLINATGE1 VARCHAR2(100) NOT NULL,
    LLINATGE2 VARCHAR2(100),
    SALARI_MENSUAL NUMBER(38,2),
    ESPECIALITAT VARCHAR2(20) NOT NULL CHECK (ESPECIALITAT in ('Biologia', 'Física', 'Informàtica', 'Infermeria', 'Medicina'))
);

CREATE TABLE PROJECTE(
    CODI NUMBER GENERATED AS IDENTITY PRIMARY KEY,
    REFERENCIA VARCHAR2(20) UNIQUE NOT NULL,
    DESCRIPCIO VARCHAR2(255) NOT NULL,
    DNI_RESPONSABLE VARCHAR2(9) NOT NULL REFERENCES INVESTIGADOR(DNI)
);

CREATE TABLE PARTICIPACIO(
    CODI_PROJECTE NUMBER REFERENCES PROJECTE(CODI),
    DNI_INVESTIGADOR VARCHAR2(9) REFERENCES INVESTIGADOR(DNI),
    PERCENTATGE NUMBER(5,2) DEFAULT 100 NOT NULL,
    PRIMARY KEY (CODI_PROJECTE, DNI_INVESTIGADOR)
);

CREATE TABLE FACTURA(
    ID NUMBER GENERATED AS IDENTITY PRIMARY KEY,
    NIF_PROVEIDOR VARCHAR2(9) NOT NULL,
    DESCRIPCIO VARCHAR2(255) NOT NULL,
    DATA_RECEPCIO DATE NOT NULL,
    IMPORT_BASE NUMBER(38,2) NOT NULL,
    IMPORT_IVA NUMBER(38,2) DEFAULT 0 NOT NULL,
    CODI_PROJECTE NUMBER NOT NULL,
    FOREIGN KEY (NIF_PROVEIDOR) REFERENCES PROVEIDOR(NIF),
    FOREIGN KEY (CODI_PROJECTE) REFERENCES PROJECTE(CODI)
);

-- =========================
-- PROVEIDOR
-- =========================

INSERT INTO PROVEIDOR VALUES
('B11111111', 'Laboratoris Balears SL', 'Tercer amb procediment de constrenyiment obert', 'contacte@labbalears.es', NULL, 'ES9121000418450200051111');

INSERT INTO PROVEIDOR VALUES
('B22222222', 'Equipaments Científics SA', NULL, NULL, '971123456', 'ES7921000813610123452222');

INSERT INTO PROVEIDOR VALUES
('B33333333', 'Subministraments Clínics SL', NULL, 'info@subclinic.es', '971654321', 'ES6621000418401234563333');


-- =========================
-- INVESTIGADOR
-- =========================

INSERT INTO INVESTIGADOR VALUES
('11111111A', 'Anna', 'Sanchez', 'Pons', 3200, 'Biologia');

INSERT INTO INVESTIGADOR VALUES
('22222222B', 'Joana', 'Muñoz', 'Galeote', 4100, 'Física');

INSERT INTO INVESTIGADOR VALUES
('33333333C', 'Maria', 'Gomez', 'Lopez', 2800, 'Informàtica');

INSERT INTO INVESTIGADOR VALUES
('44444444D', 'Pere', 'Martinez', 'Martorell', 2500, 'Infermeria');

INSERT INTO INVESTIGADOR VALUES
('55555555E', 'Laura', 'Diaz', 'Ferrer', 5200, 'Medicina');


-- =========================
-- PROJECTE
-- =========================

INSERT INTO PROJECTE (REFERENCIA, DESCRIPCIO, DNI_RESPONSABLE) VALUES
('BIO-001', 'Estudi microbiològic avançat', '11111111A');

INSERT INTO PROJECTE (REFERENCIA, DESCRIPCIO, DNI_RESPONSABLE) VALUES
('FIS-002', 'Simulació quàntica', '22222222B');

INSERT INTO PROJECTE (REFERENCIA, DESCRIPCIO, DNI_RESPONSABLE) VALUES
('MED-003', 'Nova teràpia experimental', '55555555E');

INSERT INTO PROJECTE (REFERENCIA, DESCRIPCIO, DNI_RESPONSABLE) VALUES
('INF-004', 'Plataforma IA hospitalària', '33333333C');


-- =========================
-- PARTICIPACIO
-- =========================

-- Projecte 1
INSERT INTO PARTICIPACIO VALUES (1, '11111111A', 100);
INSERT INTO PARTICIPACIO VALUES (1, '44444444D', 20);

-- Projecte 2
INSERT INTO PARTICIPACIO VALUES (2, '22222222B', 70);
INSERT INTO PARTICIPACIO VALUES (2, '44444444D', 30);

-- Projecte 3
INSERT INTO PARTICIPACIO VALUES (3, '55555555E', 50);
INSERT INTO PARTICIPACIO VALUES (3, '44444444D', 50);

-- Projecte 4
INSERT INTO PARTICIPACIO VALUES (4, '33333333C', 100);


-- =========================
-- FACTURA
-- =========================

-- Projecte 1
INSERT INTO FACTURA (NIF_PROVEIDOR, DESCRIPCIO, DATA_RECEPCIO, IMPORT_BASE, IMPORT_IVA, CODI_PROJECTE)
VALUES ('B11111111', 'Reactius especials', DATE '2026-01-15', 600, 126, 1);

INSERT INTO FACTURA (NIF_PROVEIDOR, DESCRIPCIO, DATA_RECEPCIO, IMPORT_BASE, IMPORT_IVA, CODI_PROJECTE)
VALUES ('B22222222', 'Microscopi digital', DATE '2026-02-20', 1500, 315, 1);

-- Projecte 2
INSERT INTO FACTURA (NIF_PROVEIDOR, DESCRIPCIO, DATA_RECEPCIO, IMPORT_BASE, IMPORT_IVA, CODI_PROJECTE)
VALUES ('B11111111', 'Sensors físics', DATE '2026-03-01', 800, 189, 2);

-- Projecte 3
INSERT INTO FACTURA (NIF_PROVEIDOR, DESCRIPCIO, DATA_RECEPCIO, IMPORT_BASE, IMPORT_IVA, CODI_PROJECTE)
VALUES ('B33333333', 'Material mèdic', DATE '2026-03-18', 400, 84, 3);

COMMIT;

--1. Obtén les dades de l'investigador que cobra més.
--Columnes: totes les d'investigador
SELECT * FROM INVESTIGADOR
WHERE SALARI_MENSUAL = (SELECT MAX(SALARI_MENSUAL) FROM INVESTIGADOR);

--2.Obtén el nom complet i el salari dels investigadors amb nom acabat per "a" i primer llinatge acabat per "z". Ordena els resultats per salari, de més a menys.
--Columnes: nom complet, salari
--Ordenació: salari, de més a menys
SELECT (NOM || ' ' || LLINATGE1 || ' ' || LLINATGE2) AS NOM_COMPLET, SALARI_MENSUAL
FROM INVESTIGADOR 
WHERE NOM LIKE '%a' AND LLINATGE1 LIKE '%z'
ORDER BY SALARI_MENSUAL DESC;

--3. Obtén el NIF de proveïdor, la descripció i la data de recepció de les 3 factures rebudes més recentment.
--Columnes: NIF proveïdor, descripció factura.
SELECT NIF_PROVEIDOR, DESCRIPCIO, DATA_RECEPCIO
FROM FACTURA
ORDER BY DATA_RECEPCIO DESC FETCH FIRST 3 ROWS ONLY;

--4. Calcula el salari promig dels investigadors segons la seva especialitat, ordenant per salari promig de menys a més.
--Columnes: especialitat, salari promig
--Ordenació: salari promig, de menys a més
SELECT ESPECIALITAT, 
    CASE 
        WHEN SALARI_MENSUAL = 2500 THEN '2500'
        WHEN SALARI_MENSUAL = 2800 THEN '2800'
        WHEN SALARI_MENSUAL = 3200 THEN '3200'
        WHEN SALARI_MENSUAL = 4100 THEN '4100'
        WHEN SALARI_MENSUAL = 5200 THEN '5200'
    END AS SALARI_MENSUAL
FROM INVESTIGADOR;

--5. Obtén el DNI, nom i llinatges d'aquells investigadors que NO són responsables de cap projecte.
--Columnes: DNI, nom, llinatges
SELECT DNI, NOM, LLINATGE1, LLINATGE2
FROM INVESTIGADOR
WHERE DNI NOT IN (SELECT DNI_RESPONSABLE FROM PROJECTE);


--6. Obtén els ingressos obtinguts (imports base de les seves factures) per cada proveidor (nom), però només si el proveïdor ha ingressat 500 euros o més.
--Columnes: nom proveïdor, total ingressos
--Ordenació: total ingressos, de més a menys
SELECT P.NOM, SUM(F.IMPORT_BASE) AS TOTAL_INGRESSOS
FROM PROVEIDOR P
JOIN FACTURA F ON P.NIF = F.NIF_PROVEIDOR
GROUP BY P.NOM
HAVING SUM(F.IMPORT_BASE) >= 500
ORDER BY TOTAL_INGRESSOS DESC;

--7. Obtén el total d'IVA pagat per cada projecte (referència). Si algun projecte no té factures, ha d'aparèixer un 0. 
--Columnes: referència del projecte, IVA pagat. 
SELECT P.REFERENCIA, NVL(SUM(F.IMPORT_IVA), 0) AS IVA_PAGAT
FROM PROJECTE P
LEFT JOIN FACTURA F ON P.CODI = F.CODI_PROJECTE
GROUP BY P.REFERENCIA;

--8. Obtén una llista d'investigadors (dni i nom complet) amb els projectes en que participen (referència i descripció) i la proporció de participació entre projecte i investigador. Ordena per proporció descendent i, en cas d'haver-n'hi d'iguals, per nom complet de manera alfabètica.
--Només hi han de sortir els investigadors que participen en algun projecte. 
--La proporció de participació és el percentatge de participació però expressat entre 0 (0%) i 1 (100%)
--Ordenació: proporció descendent, nom complet alfabèticament

--9.Obtén el nom, llinatges i àrea d'especialització dels investigadors que participen en qualsevol projecte que tengui factures. NO PODEN SORTIR INVESTIGADORS REPETITS.
--L'àrea d'especialització es calcula segons l'especialitat i pot ser: Ciències (Física i Biologia), Salut (Medicina i Infermeria) i Tecnologia (Informàtica).
--Columnes: nom investigador, llinatges investigador, àrea d'especialització


--10.Obtén un llistat amb el cost de cada projecte (suma dels imports base i iva de les factures) que tengui factures i de cada investigador (cost anual en base al salari mensual) que participi a algun projecte.
--Columnes: tipus (Investigador o Projecte), identificador (DNI investigador o referència projecte) i cost (sou mensual extrapolat a tot l'any o import total factures).
--Ordenació: cost descendent.