drop database if exists edunovajp24;
create database edunovajp24;
use edunovajp24;

create table course(
    code int, 
    name varchar(50),
    duration int,
    price decimal(18,2),
    certif boolean
);

create table grp(
    code int,
    name varchar(20),
    course int,
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
    grp int,
    user int
);

create table lecturer(
    code int,
    person int,
    iban varchar(32)
);

create table user(
    code int,
    person int,
    contractnumber varchar(20)
);

create table person(
    code int,
    name varchar(20),
    surname varchar(20),
    oib int,
    email varchar(20)
);
