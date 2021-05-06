drop database if exists store;
create database store;
use store;

create table item (
    bill int(11) not null,
    product int(11),
    amount decimal(18,2)
);

create table product (
    code int(11) not null primary key auto_increment,
    term varchar(50) not null,
    price decimal (18,2)
);

create table bill (
    code int(11) not null primary key auto_increment,
    date datetime,
    ordinal varchar(100),
    operator int(11) not null
);

create table operator (
    code int(11) not null primary key auto_increment,
    name varchar(50) not null,
    surname varchar(50) not null,
    email varchar(50)
);

alter table item add foreign key (bill) references bill (code);
alter table item add foreign key (product) references product (code);

alter table bill add foreign key (operator) references operator (code);
