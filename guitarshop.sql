drop database if exists ponavljanjegitarajp24;
create database ponavljanjegitarajp24;
use ponavljanjegitarajp24;

create table gitara(
    sifra int not null primary key auto_increment,
    ime_proizvodjaca varchar(30),
    vrsta int not null,
    boja varchar(15) not null,
    ugradjen_stimer boolean not null,
    broj_zica int not null
);

create table vrsta(
    sifra int not null primary key auto_increment,
    tip varchar(20) not null,
    prikljucak boolean not null
);

create table bas_gitara(
    sifra int not null primary key auto_increment,
    ime_proizvodjaca varchar(30),
    vrsta int not null,
    boja varchar(15) not null,
    broj_zica int not null
);

alter table gitara add foreign key (vrsta) references vrsta(sifra);
alter table bas_gitara add foreign key (vrsta) references vrsta(sifra);

insert into vrsta (tip,prikljucak) values
('Electric',true),
('Acoustic',true),
('Acoustic',false),
('Electro-Acoustic',true);

select * from vrsta;

insert into gitara(ime_proizvodjaca,vrsta,boja,ugradjen_stimer,broj_zica) values
('Gibson',1,'Forest Green',false,6),
('Fender',1,'White and Red',false,6),
('Alhambra',3,'Natural',false,6),
('Ibanez',4,'Sunburst',true,7);

select * from gitara;

insert into bas_gitara(ime_proizvodjaca,vrsta,boja,broj_zica) values
('Michael Kelly',4,'Red',4),
('Fender',2,'Natural',4),
('Ibanez',1,'Red',5),
('Ibanez',1,'Gray',4),
('Cort',4,'Natural',6);

#select * from bas_gitara;

select a.ime_proizvodjaca as proizvodjac, b.tip, b.prikljucak, a.boja, a.broj_zica 
from bas_gitara a 
inner join vrsta b on a.vrsta = b.sifra 
where b.sifra>=1;

select b.sifra, a.ime_proizvodjaca as bas_proizvodjac, a.boja, b.tip, a.broj_zica, b.prikljucak 
from bas_gitara a 
inner join vrsta b on a.vrsta=b.sifra
#inner join gitara c on b.sifra=c.vrsta 
where b.sifra>1;

delete from gitara where sifra=3;
delete from gitara where vrsta=4;