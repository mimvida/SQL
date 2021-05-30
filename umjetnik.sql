drop database if exists ponavljanjeumjetnikjp24;
create database ponavljanjeumjetnikjp24;
use ponavljanjeumjetnikjp24;

create table umjetnik(
    sifra int not null primary key auto_increment,
    ime varchar(30),
    prezime varchar(30) not null
);

create table djelo(
    sifra int not null primary key auto_increment,
    naziv varchar(30) not null,
    rok date not null
);

create table umjetnik_djelo(
    umjetnik int,
    djelo int 
);

alter table umjetnik_djelo add foreign key (djelo) references djelo(sifra);
alter table umjetnik_djelo add foreign key (umjetnik) references umjetnik(sifra);

#jedan umjetnik - Ziggy O'Hara radi na dva djela - Zima i Ljeto
insert into umjetnik (ime,prezime) values
('Ziggy','O''Hara');

select * from umjetnik;

insert into djelo (naziv,rok) values
('Zima', '2021-07-15'),
('Ljeto', '2021-02-15');

select * from djelo;

#O'Hara radi na oba djela
insert into umjetnik_djelo (umjetnik, djelo) values
(1, 1), 
(1, 2);

select * from umjetnik_djelo;

#prave vrijednosti
select a.ime, a.prezime, c.naziv
from umjetnik a 
inner join umjetnik_djelo b  on a.sifra=b.umjetnik 
inner join djelo c on b.djelo=c.sifra;
