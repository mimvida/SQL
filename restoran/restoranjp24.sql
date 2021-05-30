drop database if exists restoran;
create database restoran;
use restoran;

create table vlasnik(
    sifra int not null primary key auto_increment,
    ime varchar(20) not null,
    prezime varchar(20) not null,
    vlasnikod date,
    restoran int
);
create table restoran(
    sifra int not null primary key auto_increment,
    naziv varchar(20) not null,
    oib int(11) not null,
    kuhar int,
    viselokacije boolean
);

create table kuhar(
    sifra int not null primary key auto_increment,
    ime varchar(15) not null,
    prezime varchar(15) not null,
    jelo int not null   
);

create table jelo(
    sifra int not null primary key auto_increment,
    naziv varchar(20) not null,
    sadrzilaktozu boolean not null,
    sadrzigluten boolean not null,
    cijena decimal(4,2)
);

alter table vlasnik add foreign key (restoran) references restoran(sifra);
alter table restoran add foreign key (kuhar) references kuhar(sifra);
alter table kuhar add foreign key (jelo) references jelo(sifra);

insert into jelo (naziv,sadrzilaktozu,sadrzigluten) values
('Sarma',false,false),
('Musaka', true,false);

insert into kuhar (ime,prezime,jelo) values
('Ivan','Horvat',1),
('Petar','Peric',2);

