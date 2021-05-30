select * from city;
select * from country;
select * from countrylanguage;

#odaberite sve zemlje iz Europe
select * from country where Continent like 'Europe';

#unesite mjesto u kojem zivite
select * from city where name like 'Velika Gorica';
select * from country where name like 'Croatia';

insert into city (Name, CountryCode, District, Population) values ('Velika Gorica', 'HRV', 'Zagrebacka', 63517);

select * from city where name like 'Donji Miholjac';
select * from country where name like 'Croatia';

insert into city (Name, CountryCode, District, Population) values ('Donji Miholjac', 'HRV', 'Osijek-Baranja', 9491);

delete from city where ID=4080;

#promijenite Donji Miholjac (Velika Gorica) u Špičkovinu
update city set Name='Spickovina' where ID=4082;
select * from city where name like 'Spickovina';

#obrisite mjesto Špičkovina
select * from city where name like 'Spickovina';
delete from city where ID=4082;