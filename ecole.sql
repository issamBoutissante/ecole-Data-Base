create database ecole
use ecole
-- 1. Créer la base de données avec un jeu de test

-- la creation du table stagiaire
create table stagiaire(
idStg int primary key,
nom varchar(20),
prenom varchar(20),
groupe varchar(10)
)

--la creation du table matiere

create table matiere(
idMat int primary key,
libelle varchar(20),
Coef int
)

--la creation du table note

create table note(
idStg int,
idMat int,
note float not null,
constraint pk_note primary key(idStg,idMat),
constraint fk_idStg_stagiaire foreign key(idStg) references stagiaire(idStg),
constraint fk_idMat_matiere foreign key(idMat) references matiere(idMat)
)

--remplissage du table stagiaire

insert into stagiaire values(1,'taha','hassan','TDI205')
insert into stagiaire values(2,'addi','khadija','TDI205')
insert into stagiaire values(3,'abbo','brahim','TDI207')
insert into stagiaire values(4,'addi','siham','TDI205')
insert into stagiaire values(5,'mrabt','oussama','TDI207')
insert into stagiaire values(6,'Mrabt','imad','TDI207')


--remplissage du table matiere

insert into matiere values(1,'base de donnes',3)
insert into matiere values(2,'web cote client',3)
insert into matiere values(3,'client serveur',3)
insert into matiere values(4,'asp.net',3)

--la remplissage du table note

insert into note values(1,2,16)
insert into note values(1,1,16)
insert into note values(1,4,16)
insert into note values(1,3,16)

insert into note values(2,2,15)
insert into note values(2,1,12)
insert into note values(2,4,17)
insert into note values(2,3,16)

insert into note values(3,4,1)
insert into note values(3,3,9)
insert into note values(3,2,1)
insert into note values(3,1,6)

--1.Créer une vue V1 qui affiche la liste des stagiaires pour un groupe donnécreate view V1 as select * from stagiaire where groupe='TDI205'--3. Créer une vue V2 qui affiche la moyenne des notes par idstg et idmatcreate view V2as select idStg,note.idMat,note*coef as moyenne from note join matiereon note.idMat=matiere.idMat--4. Afficher la moyenne générale par stagiaire (en utilisant la vue V2)select idStg,sum(moyenne)/SUM(coef) as moyenne_general from V2 join matiere mon v2.idMat=m.idMatgroup by idStg--5. Créer la vue V4 qui affiche la liste stagiaire du Groupe A, avec test.create view V4as select * from stagiaire where groupe='TDI205'--test select * from V4--6. Modifier les noms en majuscule dans la vue V4update V4 set nom=upper(nom)--7. Ajouter un stagiaire du groupe B dans la vue V4alter view  V4as select * from stagiaire where groupe='TDI205' or idStg=7--8. Modifier la vue V4 avec l’option with chek option (et refaire Q6)alter view V4 as select * from stagiaire where groupe='TDI205' or idStg=7with check option