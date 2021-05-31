drop database if exists restoran;
create database restoran;
use restoran;

create table vlasnik(
    sifra int not null primary key auto_increment,
    ime varchar(20) not null,
    prezime varchar(20) not null,
    vlasnikod date
);
create table restoran(
    sifra int not null primary key auto_increment,
    naziv varchar(20) not null,
    oib int(11) not null,
    adresa varchar(50) NOT NULL, 
    vlasnik int
);

create table kuhar(
    sifra int not null primary key auto_increment,
    ime varchar(15) not null,
    prezime varchar(15) not null,
    restoran int NOT NULL   
);

create table jelo(
    sifra int not null primary key auto_increment,
    naziv varchar(20) not null,
    sadrzilaktozu boolean not null,
    sadrzigluten boolean not null,
    kuhar int NOT null,
    cijena decimal(4,2)
);

CREATE TABLE sastojak_jelo(
    jelo int NOT NULL,
    sastojak int NOT null
);

CREATE TABLE sastojak( 
    sifra int NOT NULL PRIMARY KEY auto_increment, 
    naziv varchar(30) NOT null, 
    lokalnodostupan boolean NOT null, 
    vrsta varchar(30) not null
    #povrce, voce, mlijecni proizvodi, meso, zacini, zitarice, mahunarke 
);

alter table restoran add foreign key (vlasnik) references vlasnik(sifra);
alter table kuhar add foreign key (restoran) references restoran(sifra);
alter table jelo add foreign key (kuhar) references kuhar(sifra);
alter table sastojak_jelo add foreign key (sastojak) references sastojak(sifra);
alter table sastojak_jelo add foreign key (jelo) references jelo(sifra);

insert into jelo (naziv,sadrzilaktozu,sadrzigluten) values
('Sarma',false,false),
('Musaka', true,false);

insert into kuhar (ime,prezime,jelo) values
('Ivan','Horvat',1),
('Petar','Peric',2);

