drop database if exists edunovajp24;
create database edunovajp24;
use edunovajp24;

create table course(
    code int not null primary key auto_increment, 
    name varchar(50) not null,
    duration int not null,
    price decimal(18,2),
    certif boolean
);

create table grp(
    code int not null primary key auto_increment,
    name varchar(20) not null,
    course int not null,
    lecturer int,
    startdate datetime
);
#create table group(
#    code int,
#    names varchar(20),
#    course int, 
#    lecturer int, 
#    startdate datetime 
#);

create table member(
    grp int not null,
    user int not null
);

create table lecturer(
    code int not null primary key auto_increment,
    person int not null,
    iban varchar(32)
);

create table user(
    code int not null primary key auto_increment,
    person int not null,
    contractnumber varchar(20)
);

create table person(
    code int not null primary key auto_increment,
    name varchar(20) not null,
    surname varchar(20) not null,
    oib int,
    email varchar(20)
);

alter table grp add foreign key (course) references course (code);
alter table grp add foreign key (lecturer) references lecturer (code);

alter table member add foreign key (grp) references grp (code);
alter table member add foreign key (user) references user (code);

alter table user add foreign key (person) references person (code);

alter table lecturer add foreign key (person) references person (code);
