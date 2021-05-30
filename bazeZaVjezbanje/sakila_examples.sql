select * from payment;
select * from rental;
select * from customer;
select * from inventory;
select * from store;
select * from staff;
select * from address;
select * from city;
select * from country;
select * from nicer_but_slower_film_list;
select * from staff_list;
select * from customer_list;
select * from film_actor;
select * from film_category;
select * from film;
select * from language;
select * from actor;
select * from category;
select * from sales_by_film_category;
select * from film_text;
select * from sales_by_store;
select * from actor_info;
select * from film_list;

#movies that starts with c
select * from film_list where title like 'c%';

#movie with Cage
select * from film_list where actors like '%cage%';

#movies with Johnny Cage
select * from actor where last_name like '%cage%';
select * from film_actor where actor_id=40;

#movies on japanese language
select * from language where name='Japanese';
select * from film where language_id=3; #upit bez rezultata

#customers that are registered in store #1
select * from customer where store_id=1;

#PG documentary movies that cost more than $1
select * from nicer_but_slower_film_list where category='Documentary';
select * from nicer_but_slower_film_list where rating like 'PG';
select * from nicer_but_slower_film_list where price>1;
#oneline
select * from nicer_but_slower_film_list where 
category='Documentary' and 
rating like 'PG' and 
price>1;

#purchase less than $5, in 7/2005 
select * from payment where amount<5 and payment_date between '2005-07-01' and '2005-08-01';
