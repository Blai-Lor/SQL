create table llibres(
    codi number generated as identity,
    titol varchar(60) not null,
    autor varchar(30),
    editorial varchar(15),
    preu number(5,2),
    primary key (codi)
);

insert into llibres (titol, autor, editorial, preu) values('El principito','Antonine de Saint','Planeta',15);
insert into llibres (titol, autor, editorial, preu) values('La Cocinera de Castamar','Fernando J. Múñez','Planeta',40);
insert into llibres (titol, autor, editorial, preu) values('Yerma','Federico García Lorca','Planeta',40);
insert into llibres (titol, autor, editorial, preu) values('Cómo hacer que te pasen cosas buenas','Marián Rojas','Espasa',18.20);
insert into llibres (titol, autor, editorial, preu) values('Mecanoscrit del segon origen','Manuel de Pedrolo','Espasa',15);
insert into llibres (titol, autor, editorial, preu) values('Magia y enigma','Henry Kamen','Espasa',22.20);
insert into llibres (titol, autor, editorial, preu) values('Matilda','Roald Dahl','Alfaguara',36.40);
insert into llibres (titol, autor, editorial, preu) values('Momo', 'Michael Ende', 'Alfaguara',30.80);
insert into llibres (titol, autor, editorial, preu) values('Mujercitas','Louisa May Alcott','Alfaguara',45.00);
insert into llibres (titol, autor, editorial, preu) values('La historia interminable','Michael Ende','Alfaguara',46.00);
insert into llibres (titol, autor, editorial, preu) values('Peter Pan','J.M. Barrie','Alfaguara',null);

select * from llibres;

-- 1. Llistar la quantitat de llibres agrupats per editorial:
-- Columnes: Editorial, recompte llibres
SELECT editorial, COUNT(*) AS recompte FROM llibres GROUP BY editorial;

-- 2. Llistar la quantitat de llibres agrupats per editorial, però només els grups editorials que tenen més de quatre llibres:
-- Columnes: Editorial, recompte llibres
SELECT editorial, COUNT(*) AS recompte FROM llibres GROUP BY editorial HAVING COUNT(*) > 4;

-- 3. Llistar la mitjana dels preus dels llibres agrupats per editorial i ordenats per preu descendent:
-- Columnes: editorial, preu mitjà
SELECT editorial, AVG(preu) AS preuMig FROM llibres GROUP BY editorial ORDER BY AVG(preu) DESC;

-- 4. Llistar la mitjana dels preus dels llibres agrupats per editorial, però només aquells la mitjana dels quals superi els 25 euros:
-- Columnes: editorial, preu mitjà
SELECT editorial, AVG(preu) AS preuMig FROM llibres GROUP BY editorial HAVING AVG(preu) > 25;

-- 5. Llistar nombre de llibres agrupats per editorial sense tenir en compte l'editorial "Planeta":
-- Columnes: editorial, recompte llibres
SELECT editorial, COUNT(*) AS recompte FROM llibres WHERE editorial != 'Planeta' GROUP BY editorial;

-- 6. Llistar nombre de llibres agrupats per editorial sense tenir en compte l'editorial "Planeta" ni els llibres amb preu nul:
-- Columnes: editorial, recompte llibres
SELECT editorial, COUNT(*) AS recompte FROM llibres WHERE editorial != 'Planeta' AND preu IS NOT NULL GROUP BY editorial;

-- 7. Llistar mitjana dels preus agrupats per editorial d'aquelles editorials que tenen més de 2 llibres:
-- Columnes: editorial, preu mitjà
SELECT editorial, AVG(preu) AS preuMig FROM llibres GROUP BY editorial HAVING COUNT(*) > 2;

-- 8. Llistar el preu més gran d'un llibre per editorial i ordenat per preu descendent:
-- Columnes: editorial, preu més car
SELECT editorial, MAX(preu) AS preuMaxim FROM llibres GROUP BY editorial ORDER BY MAX(preu) DESC;
-- 9. Llistar el preu més gran d'un llibre per editorial d'aquelles que tinguin, almenys, un llibre que superi els 30 euros:
-- Columnes: editorial, preu més car
SELECT editorial, MAX(preu) AS preuMaxim FROM llibres GROUP BY editorial HAVING MAX(preu) > 30;

-- 10. Llistar el títol i l'autor dels llibres amb títol que comenci per la lletra "M" i l'autor dels quals contingui la lletra "H", independent de majúscula/minúscula:
-- Columnes: títol, autor
SELECT titol, autor FROM llibres WHERE UPPER(titol) LIKE 'M%' AND UPPER(autor) LIKE '%H%';

-- 11. Llistar la quantitat de llibres agrupats per autor, ordenat per quantitat descendent:
-- Columnes: autor, quantitat llibres
SELECT autor, COUNT(*) AS quantitatLlibres FROM llibres GROUP BY autor ORDER BY COUNT(*) DESC;

-- 12. Llista les diferents lletres inicials dels titols dels llibres i el preu promig dels llibres amb un títol que comenci per aquesta lletra. Ordena per preu ascendent:
-- Columnes: Lletra inicial títol, preu mitjà
SELECT SUBSTR(titol, 1, 1) AS lletraInicial, AVG(preu) AS preuMig FROM llibres GROUP BY SUBSTR(titol, 1, 1) ORDER BY AVG(preu) ASC;