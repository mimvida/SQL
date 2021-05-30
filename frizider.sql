drop database if exists ponavljanjefriziderjp24;
create database ponavljanjefriziderjp24;
use ponavljanjefriziderjp24;

create table frizider(
    sifra int not null primary key auto_increment,
    naziv varchar(30),
    boja varchar(10) not null
);

create table proizvod(
    sifra int not null primary key auto_increment,
    naziv varchar(30),
    rok_trajanja date,
    frizider int
);

alter table proizvod add foreign key (frizider) references frizider(sifra);

#unijeti 2 frizidera
insert into frizider(naziv,boja) values
('Koncar','Red'),
('LG','Silver');

select * from frizider;

#unijeti 1 proizvod u 1. frizider

insert into proizvod(naziv,rok_trajanja,frizider) values
('Mlijeko','2021-06-21',1);

select * from proizvod;


#unijeti 2 proizvoda u 2. frizider

insert into proizvod(naziv,rok_trajanja,frizider) values
('Ajvar','2021-10-29',2),
('Putar','2021-08-15',2);

select * from proizvod where frizider=2;

#unijeti 1 prozvod bez frizidera

insert into proizvod(naziv,rok_trajanja) values
('Pasirana rajcica','2023-04-30');

# drugi nacin unosa bez frizidera
insert into proizvod(naziv,rok_trajanja,frizider) values
('Koncentrat rajcice','2024-01-31',null);

select * from proizvod where frizider is null;

#delete

insert into proizvod(naziv,rok_trajanja,frizider) values
('Mlijeko','2021-05-21',1),
('Mlijeko','2021-06-21',1),
('Mlijeko','2021-06-21',1),
('Mlijeko','2021-07-21',1);

delete from proizvod where rok_trajanja='2021-05-21';
delete from proizvod where rok_trajanja='2021-07-21';
delete from proizvod where sifra=3;

select * from proizvod;

#promijeni boju LG frizidera u bijelu

update frizider set boja='White' where sifra=2;

select * from frizider;

#promijeni ajvar u pastetu 

update proizvod set naziv='Pasteta' where naziv='Ajvar';

select * from proizvod;

#promijeni pocetno slovo proizvoda u mala

update proizvod set naziv=
concat (lower(left(naziv,1)),substring(naziv,3));

#vrati prvo slovo veliko
update proizvod set naziv=
concat (upper(left(naziv,1)),substring(naziv,2));

#ispisi naziv i frizider iz proizvoda
select naziv, frizider from proizvod;

#u proizvodu prikazi naziv iz stupca frizider (uslazno i silazno)

select a.naziv as Proizvod, b.naziv as Frizider
from proizvod a 
left join frizider b on b.sifra=a.frizider
order by a.naziv asc;

#umjesto a.naziv, buduci da je naziv prvi redak u tablici, mozemo staviti i 1
select a.naziv as Proizvod, b.naziv as Frizider
from proizvod a 
left join frizider b on b.sifra=a.frizider
order by 1 desc;

