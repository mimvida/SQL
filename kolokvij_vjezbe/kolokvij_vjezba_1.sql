drop database if exists kv1;
create database kv1;
use kv1;

#table create
create table sestra(
    sifra int not null primary key auto_increment,
    introvertno boolean,
    haljina varchar(31) not null,
    maraka decimal(16,6),
    hlace varchar(46) not null,
    narukvica int not null
);

create table punac(
    sifra int not null primary key auto_increment,
    ogrlica int,
    gustoca decimal(14,9),
    hlace varchar(41) not null
);

create table zena(
    sifra int not null primary key auto_increment,
    treciputa datetime,
    hlace varchar(46),
    kratkamajica varchar(31) not null,
    jmbag char(11) not null,
    bojaociju varchar(39) not null,
    haljina varchar(44),
    sestra int not null
);

create table cura(
    sifra int not null primary key auto_increment,
    novcica decimal(16,5) not null,
    gustoca decimal(18,6) not null,
    lipa decimal(13,10),
    ogrlica int not null,
    bojakose varchar(38),
    suknja varchar(36),
    punac int
);

create table sestra_svekar(
    sifra int not null primary key auto_increment,
    sestra int not null,
    svekar int not null
);

create table svekar(
    sifra int not null primary key auto_increment,
    bojaociju varchar(40) not null,
    prstena int,
    dukserica varchar(41),
    lipa decimal(13,8),
    eura decimal(12,7),
    majica varchar(35)
);

create table muskarac(
    sifra int not null primary key auto_increment,
    bojaociju varchar(50) not null,
    hlace varchar(30),
    modelnaocala varchar(43),
    maraka decimal(14,5) not null,
    zena int not null
);

create table mladic(
    sifra int not null primary key auto_increment,
    suknja varchar(50) not null,
    kuna decimal(16,8) not null,
    drugiput datetime,
    asocijalno boolean,
    ekstroventno boolean not null,
    dukserica varchar(48) not null,
    muskarac int
);

#table connect
alter table cura add foreign key (punac) references punac(sifra);
alter table zena add foreign key (sestra) references sestra(sifra);
alter table muskarac add foreign key (zena) references zena(sifra);
alter table mladic add foreign key (muskarac) references muskarac(sifra);
alter table sestra_svekar add foreign key (sestra) references sestra(sifra);
alter table sestra_svekar add foreign key (svekar) references svekar(sifra);

/*# First complete the above commands
#U tablice muskarac, zena i sestra_svekar unesite po 3 retka.
insert into svekar (bojaociju) values
('smedja'),
('plava'),
('crna');
select * from svekar;

insert into sestra (haljina,hlace,narukvica) values
('banalna','plava','1'),
('crvena','kratke','1'),
('kratka','crne','2');
select * from sestra;

insert into zena (kratkamajica,jmbag,bojaociju,sestra) values
('roza',12341234123,'zelena',1),
('crvena',23456234561,'smeda',1),
('ljubicasta',09876543210,'crna',3);
select * from zena;

insert into muskarac (bojaociju,maraka,zena) values 
('plava',1300,4),
('smeda',2000,4),
('crna',1000.50,5);
select * from muskarac;

insert into sestra_svekar (sestra,svekar) values
(1,1),
(2,2),
(3,3);
select * from sestra_svekar;


#U tablici cura postavite svim zapisima kolonu gustoca na vrijednost 15,77.
insert into cura (novcica,gustoca,ogrlica) values
(10,2,7),
(11,3,7),
(12,6,7);
select * from cura;
update cura set gustoca=15.77 where sifra>=1;
select * from cura;

#U tablici mladic obrišite sve zapise čija je vrijednost kolone kuna veće od 15,78.
insert into mladic (suknja,kuna,ekstroventno,dukserica) values
('ne',12.50,false,'plava'),
('ne',19.50,true,'zelena'),
('ne',62.80,false,'bijela');
select * from mladic;
delete from mladic where kuna>15.78;
select * from mladic;

#Izlistajte kratkamajica iz tablice zena uz uvjet da vrijednost kolone hlace sadrže slova ana.
select * from zena;
update zena set hlace='tanana' where sifra=4;
select * from zena;
select kratkamajica from zena where hlace like '%ana%';

#Prikažite dukserica iz tablice svekar, asocijalno iz tablice mladic te hlace iz tablice muskarac uz uvjet da su vrijednosti kolone hlace iz tablice zena počinju slovom a 
#te da su vrijednosti kolone haljina iz tablice sestra sadrže niz znakova ba. Podatke posložite po hlace iz tablice muskarac silazno.
select a.dukserica as duksa, f.asocijalno as mladic, e.hlace as hlace 
from svekar a 
inner join sestra_svekar b on a.sifra=b.svekar 
inner join sestra c on b.sestra=c.sifra 
inner join zena d on c.sifra=d.sestra 
inner join muskarac e on d.sifra=e.zena
inner join mladic f on e.sifra=f.muskarac
where d.hlace like 'a%' and c.haljina like '%ba%';
*/