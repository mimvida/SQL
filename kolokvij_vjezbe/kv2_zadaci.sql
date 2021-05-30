#U tablice neprijatelj, cura i decko_zarucnica unesite po 3 retka.
select * from neprijatelj;
insert into neprijatelj (haljina,modelnaocala,kuna) values
('kratka','jesen2020',200.45),
('plava','crne',13.18),
('crna','bijele',30);
select * from neprijatelj;

select * from cura;
insert into cura (haljina,drugiputa,majica) values
('crvena','2012-03-09','crvena'),
('plava','2016-12-25','žuta'),
('ljubičast','1999-06-21','roza');
select * from cura;

select * from decko;
insert into decko (asocijalno) values
(3),
(7),
(4);
select * from decko;

select * from zarucnica;
insert into zarucnica (bojakose,lipa,indiferentno) values
('crna',1234567.89,7),
('plava',99999.99,9),
('roza',456000,5);
select * from zarucnica;

select * from decko_zarucnica;
insert into decko_zarucnica (decko,zarucnica) values
(1,1),
(1,2),
(3,1);
select * from decko_zarucnica;

#U tablici prijatelj postavite svim zapisima kolonu treciputa na vrijednost 30. travnja 2020.
insert into svekar (ogrlica,asocijalno) values
(12,1),
(2,9),
(33,99);
select * from svekar;

select * from prijatelj;
insert into prijatelj (treciputa,ekstroventno,svekar) values
('2012-11-23',1,1),
('2012-12-07',2,1),
('2009-08-08',3,2);
update prijatelj set treciputa='2020-04-30' where sifra>=1;
select * from prijatelj;

#U tablici brat obrišite sve zapise čija je vrijednost kolone ogrlica različito od 14.
insert into brat (ogrlica,asocijalno,neprijatelj) values
(1,1,1),
(88,3,1),
(14,4,3);
select * from brat;
delete from brat where ogrlica<>14;
select * from brat;

#Izlistajte suknja iz tablice cura uz uvjet da vrijednost kolone drugiputa nepoznate.
select suknja from cura where drugiputa is null;

#Prikažite novcica iz tablice zarucnica, neprijatelj iz tablice brat te haljina iz tablice neprijatelj uz uvjet da su vrijednosti kolone 
#drugiputa iz tablice cura poznate te da su vrijednosti kolone vesta iz tablice decko sadrže niz znakova ba. 
#Podatke posložite po haljina iz tablice neprijatelj silazno.
select a.novcica as zarucnica, f.neprijatelj as brat, e.haljina as neprijatelj
from zarucnica a 
inner join decko_zarucnica b on a.sifra=b.zarucnica,
inner join decko c on b.decko=c.sifra,
inner join cura d on c.sifra=d.decko,
inner join neprijatelj e on d.sifra=e.cura,
inner join brat f on e.sifra=f.neprijatelj 
where d.drugiputa is not null and c.vesta like '%ba%';