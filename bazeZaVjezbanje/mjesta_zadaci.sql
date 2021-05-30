select * from mjesto;

#baza mjesta
#odaberite sva mjesta koja se nalaze u Osjecko-Baranjskoj zupaniji
select * from mjesto where postanskibroj='31000';
select * from mjesto where zupanija=14;

select * from mjesto where postanskibroj like '31%';

#odaberite sva mjesta koja u sebi imaju niz znakova guz
select * from mjesto where naziv like '%guz%';
select * from mjesto where naziv like '%guz';
select * from mjesto where naziv like 'guz%';

#odaberite sva mjesta koja ne zavrsavaju sa nizom znakova ar
select * from mjesto where naziv not like '%ar';