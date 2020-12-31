create database ecole
use ecole
-- 1. Cr�er la base de donn�es avec un jeu de test

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

--1.Cr�er une vue V1 qui affiche la liste des stagiaires pour un groupe donn�