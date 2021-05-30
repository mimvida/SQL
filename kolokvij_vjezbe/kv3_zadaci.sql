#U tablice snasa, ostavljena i prijatelj_brat unesite po 3 retka.
insert into ostavljena (modelnaocala) values
('okrugle'),
('ovalne'),
('sarene');

insert into prijatelj (indiferentno) values
(23),
(21),
(99);

insert into snasa (kuna,eura,ostavljena) values
(100,20,1),
(200,30,1),
(150,44,2);

select * from snasa;

#U tablici svekar postavite svim zapisima kolonu suknja na vrijednost Osijek.
insert into cura (ogrlica) values
(600),
(400),
(1000);
insert into svekar (novcica,suknja,narukvica,cura) values
(200.99,'crvena',2,2),
(100,'plava',3,1),
(500,'crna',3,2);

update svekar set suknja='Osijek' where sifra>=1;

select * from svekar;

#U tablici punica obrišite sve zapise čija je vrijednost kolone kratkamajica jednako AB.
insert into punica (kratkamajica,kuna,vesta) values
('DADA',200,'Split'),
('AB',3000,'Pula'),
('ab',500,'Zagreb');

delete from punica where kratkamajica like 'AB';
select * from punica;

#Izlistajte majica iz tablice ostavljena uz uvjet da vrijednost kolone lipa nije 9,10,20,30 ili 35.
select majica from ostavljena where lipa!=(9 or 10 or 20 or 30 or 35);

#Prikažite ekstroventno iz tablice brat, vesta iz tablice punica te kuna iz tablice snasa uz uvjet da su vrijednosti kolone lipa iz tablice ostavljena različito od 91 
#te da su vrijednosti kolone haljina iz tablice prijatelj sadrže niz znakova ba. Podatke posložite po kuna iz tablice snasa silazno.
select a.ekstroventno, f.vesta, e.kuna 
from brat a 
inner join prijatelj_brat b on a.sifra=b.brat,
inner join prijatelj c on b.prijatelj=c.sifra,
inner join ostavljena d on c.sifra=d.prijatelj,
inner join snasa e on d.sifra=e.ostavljena,
inner join punica f on e.sifra=f.snasa 
where d.lipa<>91 and c.haljina like '%ba%';