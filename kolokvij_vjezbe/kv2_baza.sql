drop database if exists kv2;
create database kv2;
use kv2;

#table create
create table brat(
    sifra int not null primary key auto_increment,
    suknja varchar(47),
    ogrlica int not null,
    asocijalno boolean not null,
    neprijatelj int not null
);

CREATE TABLE neprijatelj(
    sifra int NOT NULL PRIMARY KEY auto_increment,
    majica varchar(32),
    haljina varchar(43) NOT NULL,
    lipa decimal(16,8),
    modelnaocala varchar(49) NOT NULL,
    kuna decimal(12,6) NOT NULL,
    jmbag char(11),
    cura int
);

CREATE TABLE cura(
    sifra int NOT NULL PRIMARY KEY auto_increment,
    haljina varchar (33) NOT NULL,
    drugiputa datetime NOT NULL,
    suknja varchar(38),
    narukvica int,
    introvertno boolean,
    majica varchar(40) NOT NULL,
    decko int
);

CREATE TABLE decko(
    sifra int NOT NULL PRIMARY KEY auto_increment,
    indiferentno boolean,
    vesta varchar(34),
    asocijalno boolean NOT NULL
);

CREATE TABLE decko_zarucnica(
    sifra int NOT NULL PRIMARY KEY auto_increment,
    decko int NOT NULL,
    zarucnica int NOT NULL
);

CREATE TABLE zarucnica(
    sifra int NOT NULL PRIMARY KEY auto_increment,
    narukvica int,
    bojakose varchar(37) NOT NULL,
    novcica decimal(15,9),
    lipa decimal(15,8) NOT null,
    indiferentno boolean NOT NULL
);

CREATE TABLE prijatelj(
    sifra int NOT NULL PRIMARY KEY auto_increment,
    modelnaocala varchar(37),
    treciputa datetime NOT NULL,
    ekstroventno boolean NOT NULL,
    prviputa datetime,
    svekar int NOT NULL
);

CREATE TABLE svekar(
    sifra int NOT NULL PRIMARY KEY auto_increment,
    stilfrizura varchar(48),
    ogrlica int NOT NULL,
    asocijalno boolean NOT NULL
);


#table connections
alter table prijatelj add foreign key (svekar) references svekar(sifra);
ALTER TABLE brat ADD foreign KEY (neprijatelj) REFERENCES neprijatelj(sifra);
ALTER TABLE neprijatelj ADD FOREIGN KEY (cura) REFERENCES cura(sifra);
ALTER TABLE cura ADD FOREIGN KEY (decko) REFERENCES decko(sifra);
ALTER TABLE decko_zarucnica ADD FOREIGN KEY (decko) REFERENCES decko(sifra);
ALTER TABLE decko_zarucnica ADD FOREIGN KEY (zarucnica) REFERENCES zarucnica(sifra);