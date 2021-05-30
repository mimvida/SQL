drop database if exists drzava;
create database drzava;
use drzava;

#kreiranje tablica
create table zupanija(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    zupan int
);

create table opcina (
    sifra int not null primary key auto_increment,
    zupanija int not null,
    naziv varchar(50) not null
);

create table mjesto (
    sifra int not null primary key auto_increment,
    opcina int,
    naziv varchar(40)
);

create table zupan(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null
);

#povezivanje tablica
alter table opcina add foreign key (zupanija) references zupanija(sifra);
alter table mjesto add foreign key (opcina) references opcina(sifra);
alter table zupanija add foreign key (zupan) references zupan(sifra);

#popunjavanje tablica
insert into zupan (ime,prezime) values
('Ivan','Anuši?'),
('Stjepan','Koži?'),
('Fabrizio','Radin');

insert into zupanija (naziv,zupan) values 
('Osjecko-Baranjska',1),
('Zagrebacka',2),
('Istarska',3);

insert into opcina (zupanija,naziv) values
(1,'Petrijevci'),
(1,'Ernestinovo'),
(2,'Bistra'),
(2,'Farkaševac'),
(3,'Fažana'),
(3,'Vodnjan');

insert into mjesto (opcina,naziv) values
('1','Petrijevci'),
('1','Satnica'),
('2','Ernestinovo'),
('2','Laslovo'),
('3','Gornja Bistra'),
('3','Donja Bistra'),
('4','Bol?'),
('4','Zvonik'),
('5','Fažana'),
('5','Valbandon'),
('6','Vodnjan'),
('6','Peroj');

#primjeri za update
update mjesto set naziv='Bi Village'
where sifra=9;
update mjesto set naziv='Oborovo Bistransko'
where sifra=6;
update mjesto set naziv='Ma?ki'
where sifra=7;
update mjesto set naziv='Novo'
where sifra=2;
update zupan set ime='Pero',prezime='Peri?'
where sifra=1;

#primjeri za delete
delete from mjesto where sifra=2;
delete from mjesto where sifra=5;

#select * from zupanija;
#select * from opcina;
#select * from zupan;
#select * from mjesto;


