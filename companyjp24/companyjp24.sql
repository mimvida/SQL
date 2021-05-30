drop database if exists companyjp24;
create database companyjp24;
use companyjp24;

create table project(
code int not null primary key auto_increment,
name varchar(50) not null,
price decimal(16,2)
);

create table programmer(
code int not null primary key auto_increment,
firstname varchar(50) not null,
lastname varchar(50) not null,
datebirth date,
salary int
);

create table participate(
project int,
programmer int,
startdate date,
enddate date
);

alter table participate add foreign key (project) references project(code);
alter table participate add foreign key (programmer) references programmer(code);

#test

insert into project (name,price) values
('Library',300),
('Beauty salon',250);

insert into programmer (firstname,lastname) values
('John','Smith'),
('Janes','Town');