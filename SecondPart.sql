-------create database first--------
CREATE DATABASE EMPLOYEE;
USE EMPLOYEE;

--------////----CURD OPERATION----////-------
-----------now create table--------
CREATE TABLE employee (eid int, name varchar(15), address varchar(15), city varchar(15));

select * from employee;
----------------insert new record-------------------

insert into employee (eid, name, address, city) values(1, 'jhon', 'rohni', 'delhi');

--------------------------------use Transact-sql---------to add column--------------
ALTER TABLE dbo.EMPLOYEE
ADD column_salary varchar(20);

insert into employee (column_salary) values(50000);
insert into employee (eid, name, address, city, column_salary) values(2, 'james', 'khushipura', 'bhopal', 48000),
(3, 'shiv', 'palam', 'delhi',45000),(4, 'aditi', 'chowk', 'bhopal', 47000),(5, 'julee', 'juhu', 'mumbai', 49000);

------------------------update-----------------------------------------------------
update employee set column_salary = 60000 where eid =1;

-----------------------Delete-----------------------------------------------------
delete from employee where column_salary=50000;

--------------------------CURD OPERATION COMPLETE--------------------------------

---------------------AGGREGATE FUNCTION---MAX()--MIN()--AVG()--SUM()--COUNT()-----------

select min(column_salary) from employee;

select max(column_salary) from employee;

select count(column_salary) as COUNT from employee; 

select count(distinct column_salary) as COUNT from employee; -----similar salary count----
select count(*) as COUNT from employee; -----------count null salary-------

select sum(column_salary) as TOTAL from employee;
select avg(column_salary) as AVERAGE from employee;
ALTER TABLE employee ALTER COLUMN column_salary int;-----modify datatype of column-----
select * from employee;
--------------complete aggregate function---------------------------------------

---------------------ORDERD KEYWORD--------------ASC---DESC-----------
select * from employee order by eid;
select * from employee order by name,city;
-----------------------------------VIEW-------------------
CREATE VIEW V4 as select * from employee where eid<5;
select * from V4;
CREATE VIEW V6 as select eid, name from employee;
select * from V6;



