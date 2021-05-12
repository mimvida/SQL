drop database if exists hairsalon;
create database hairsalon;
use hairsalon;

create table salon (
    code int not null primary key auto_increment,
    worker int not null,
    service int not null
);

CREATE TABLE worker (
    code int not null primary key auto_increment,
    name varchar(50) not null,
    iban varchar(32),
    user int not null
);

CREATE TABLE user (
    code int not null primary key auto_increment,
    name varchar(50) not null,
    email varchar(20),
    service int
);

CREATE TABLE service (
    code int not null primary key auto_increment,
    name varchar(50) not null,
    price decimal(18,2)
);

alter table salon add foreign key (service) references service (code);
alter table salon add foreign key (worker) references worker (code);

alter table user add foreign key (service) references service (code);

alter table worker add foreign key (user) references user (code);
