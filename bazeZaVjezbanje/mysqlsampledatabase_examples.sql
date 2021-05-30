select * from orderdetails;
select * from orders;
select * from payments;
select * from products;
select * from customers;
select * from productlines;
select * from employees;
select * from offices;

#display cancelled orders with comments
select * from orders where comments is not null and status='Cancelled';

#diplay custoemrs from USA with credit limit above 100k
select * from customers where country='USA' and creditLimit>100000;

#diplay custoemrs from California and New York that lives in a house
select * from customers where (state='CA' or state='NY') and addressLine2 is null;