#

select * from katalog;
select * from autor;
select * from izdavac;
select * from mjesto;

#odaberite sve autore za koje ne znamo datum rodjenja
select * from autor where datumrodenja is null;

#odaberite autore koji su rodjenji na vas datum rodjenja, ukljucujuci i godinu
select * from autor where datumrodenja='1985-05-22'; #upit bez rezultata

#odaberite autoer koje se zovu kao vi
select * from autor where ime='Mirjam';

#odaberite sve iz izdavace koji su drustva s ogranicenom odgovornoscu
select * from izdavac where naziv like '%d.o.o.' or naziv like '%d.o.o%';