CREATE DATABASE DPLAKshy
 use master
 use DPLAKshy

 create  Database dplakshya

 create table Employee(
    id int,
    Employee_Name varchar(25),
    Employee_Salary NUMERIC(18,2),

 )
alter table Employee add Qualifcation varchar(20)
ALTER TABLE Employee alter COLUMN Qualifcation VARCHAR(29)

alter TABLE Employee drop COLUMN Qualifcation

sp_rename 'Employee.Employee_Salary','EmpSal'


CREATE TABLE Student ( StudName VARCHAR(20) not NULL)

ALTER TABLE Employee alter COLUMN Employee_Name VARCHAR(25) not NULL
ALTER TABLE Employee ALTER COLUMN EmpSal NUMERIC(18,2) not NULL
alter TABLE Employee alter COLUMN id INT not NULL
 sp_help Employee
 
 alter TABLE Employee ADD CONSTRAINT un_emp UNIQUE(id, Employee_Name)

 alter TABLE Employee add City VARCHAR(40)

 ALTER table Employee DROP CONSTRAINT un_emp

 alter TABLE Employee  ADD CONSTRAINT un_city UNIQUE(City)

 alter TABLE Employee ADD CONSTRAINT pri_id PRIMARY key (id)
alter TABLE Employee drop COLUMN id
 alter TABLE Employee drop CONSTRAINT pri_id
 alter TABLE Employee add  id int PRIMARY KEY


 create table Book
 (
    id int PRIMARY key,
    bookName Varchar(30) not NULL,
    author VARCHAR(25) not null,
    price int not NULL


 )

 alter TABLE Employee add CONSTRAINT pr_id PRIMARY key(id)
CREATE table Dep(
    depId int PRIMARY KEY,
    depName VARCHAR(30) not NULL,
    id int,
    --CONSTRAINT fk_dep_emp FOREIGN key (id) REFERENCES Employee(id)
)
alter TABLE Employee add CONSTRAINT fk_dep_emp FOREIGN key (id) REFERENCES Employee(id)
 sp_help Book

use dplakshy
 select * from Employee

 SELECT * from Dep

 SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE' AND TABLE_SCHEMA = 'dbo';


create database BookShop


use BookShop

CREATE TABLE Author(
    author_id int PRIMARY KEY,
    Auth_name Varchar(30),
    city varchar(30),
    Country varchar(30)
    )

    CREATE TABLE Category(
        Category_id int PRIMARY KEY,
        DESCRIPTION VARCHAR(50)
    )
    CREATE TABLE Book(
        Book_id int PRIMARY key,
        Book_title VARCHAR(40),
        author_id int,
        CONSTRAINT fk_aId FOREIGN KEY (author_id) REFERENCES Author(author_id),
        Category_id int ,
        CONSTRAINT fk_Id FOREIGN Key (Category_id) REFERENCES Category(Category_id),
        year int,
        Price NUMERIC(18,2),
        Publisher_Rating NUMERIC(4,2)

    )

    alter table Book ADD Rating NUMERIC (4,2)
    alter TABLE Book ADD Publisher varchar(40)
    alter TABLE Book Drop COLUMN Publisher_Rating
    create TABLE OrderDetails(
        OrderNo int PRIMARY KEY,
        Book_id int,
        CONSTRAINT fk_bId FOREIGN KEY (Book_id ) REFERENCES Book (Book_id),
        Qty int
    )

    sp_help Book

    CREATE DATABASE Movies

    use Movies

    --Movie id , movie name , release year , box office collection

    CREATE TABLE Movies(
        Movie_id int PRIMARY KEY,
        Movie_Name VARCHAR(30),
        Release_Year int,
        BoxOffice_Collection NUMERIC(38,2)
    )
--roll id , roll name ( e.g. 1 producer , 2 director, 3 hero , 4 heroine, 5 villain etc)
    CREATE TABLE Role(
            Roll_Id int PRIMARY KEY,
            Roll_Name VARCHAR(40)
    )

    --celebrity id , celebrity name , birthdate , ph no , email
    CREATE TABLE Celebrity(
            Celebrity_Id int PRIMARY KEY,
            Celebrity_Name varchar(30),
            BirthDate DATE,
            Ph_No int,
            Email VARCHAR(30)
    )
        --Bollywood Data id , celebrity id , movie id , roll id

        CREATE TABLE Bollywood_Data(
            Bolly_dId int PRIMARY KEY,
            Celebrity_Id int,
            CONSTRAINT cId_fk FOREIGN KEY (Celebrity_Id) REFERENCES Celebrity(Celebrity_Id),
            Movie_Id int,
            CONSTRAINT mId_fk FOREIGN KEY(Movie_Id) REFERENCES Movies(Movie_Id),
            Roll_Id int,
            CONSTRAINT rId_fk FOREIGN KEY (Roll_Id) REFERENCES Role(Roll_Id)
        )


sp_help Bollywood_Data

CREATE DATABASE Facebook

use Facebook


--FBUSER:user id , user name , email , phone no , total posts
--post:post id , user id , postContent , postImage , PostVideo
--friendship:user id , friend id, friendship status code

--FriendshipStatus: Status code, Status ( 1 family , 2 Friend , 3 colleague , 4 classmate)

CREATE TABLE FB_Users(
    user_Id int PRIMARY KEY,
    user_name VARCHAR(30),
    email VARCHAR(30),
    Phone_no VARCHAR(20) ,
    total_photos int
)
CREATE TABLE Post(
    Post_id int PRIMARY KEY,
    user_Id int, 
    CONSTRAINT uId_fk FOREIGN key(user_Id) REFERENCES FB_Users(user_Id),
    post_Content 
)

create DATABASE DMLDEmo

use DMLDEmo

CREATE table Employee(
    id int PRIMARY KEY,
    name VARCHAR(20) not NULL,
    email VARCHAR(20) UNIQUE,
    age int CHECK(age>=18),
    Country VARCHAR(20) DEFAULT 'India'
)

--dml Qureies are insert--

INSERT into Employee VALUES(1,'fah','fah@gamil',67,'USA')
INSERT into Employee VALUES(2,'sad','sad@gmail',80,'NGA')
INSERT into Employee VALUES(3,'tam','tam@gamil',47,'UGA')
INSERT into Employee VALUES(4,'pam','pam@gamil',44,'CAN')
INSERT into Employee VALUES(5,'ham','ham@gamil',88,'UAE')
INSERT into Employee VALUES(6,'jah','jah@gamil',99,'USSR')
INSERT into Employee VALUES(7,'rah','rah@gamil',90,'KSA')
INSERT into Employee VALUES(8,'qah','qah@gamil',66,'ARM')
INSERT into Employee VALUES(9,'dah','dah@gamil',64,'IAM')
INSERT into Employee VALUES(10,'zah','zah@gamil',57,'SAF')

select *from Employee

insert into Employee (id,name, email,age) values (11,'mat','maat@gmail',34)

update Employee set email='jah@yahoo.com' where id=6

update Employee set Country='DXB', age=19 WHERE id IN(1,2)

--DELETE Query--

DELETE from Employee where id=11

DELETE from Employee where id IN(9,7)

DELETE from Employee where age>89



create DATABASE Book1

use Book1


create table Book1(
book_id int primary key,
book_name varchar(30),
author_id int ,
price numeric (6,2)
)
alter table BOOK1 add constraint authoridfk foreign key(author_id) references author(author_id)

sp_help BOOK

create table author(
author_id int primary key,
author_name varchar (30),
phone_no varchar(10),
email varchar(10),
address varchar(50),
city varchar(20)
)
 create table award(
 award_id int,
 award_type int ,
 author_id int,
 book_id int ,
 constraint award_type_fk foreign key (award_type)references award_master(award_type_id),
  constraint author_id_fk foreign key (author_id)references author (author_id) ,
  constraint book_id_fk foreign key (book_id)references BOOK(book_id)
 )

 
 sp_help award

 create table award_master(
 award_type_id int primary key,
 award_name varchar(30),
 award_price numeric(6,2)
 )
 sp_help BOOK1

 select *from BOOK1

 create DATABASE EmployeeNew

 use EmployeeNew

 --create table Employee It has EmpId EmpName Salary DeptName Address Designation Gender 
 --insert Atleast 5 Records 

 create table Employee(
    EmpId int PRIMARY KEY,
    EmpName varchar(30) not NULL,
    Salary int,
    DeptName VARCHAR(30),
    Address VARCHAR(40),
    Designation VARCHAR(20),
    Gender VARCHAR(20)
)

insert into Employee VALUES(1,'fah',50000,'It','RN','Assosciate','M')
insert into Employee VALUES(2,'fat',70000,'HR','PNL','Manager','M')
insert into Employee VALUES(3,'mat',30000,'Tech','RN','Assosciate','M')
insert into Employee VALUES(4,'fai',20000,'It','RN','Assosciate','M')
insert into Employee VALUES(5,'sad',90000,'Finance','RN','Assosciate','M')
insert into Employee VALUES(6,'MAd',130000,'Finance','PUN','CEO','F')
insert into Employee VALUES(7,'tad',19000,'Sales','BANG','Assosciate','F')
insert into Employee VALUES(8,'Bad',10000,'Sales','Mum','TL','F')


SELECT did, sum(Salary) as 'Salary_sum' from EMployee
GROUP by did


update Employee set DeptName='HR' where EmpId=8
select *from Employee
--find out gender wise emp count
SELECT Gender, COUNT(*) as EmpCount from Employee GROUP by Gender


--find out designation in which more than 2 employees work

SELECT designation, count(*) as EmpDesignationC
from EMployee  GROUP by designation having COUNT(*)>2

--find out dept wise avg salary

select designation, avg(salary)  AS AvgSalary

from employee group by designation 

--find dept where max emp are working

SELECT TOP 1 designation, COUNT(*) AS EmpCount
FROM Employee
GROUP BY designation
ORDER BY EmpCount DESC

--find address and city where only 1 employee lives

SELECT address, COUNT(*) as AddressC
from Employee 
GROUP by address HAVING COUNT(*)=1


UPDATE  Employee set Gender='F' WHERE EmpId=2



update Employee set Address='MAO' where EmpId=4

DELETE Employee WHERE EmpId=5

--Dispaly EMployee NAme Salary and designation
SELECT EmpName, Salary, Designation from Employee


--update the salary by 10% of employee who is from Pune City
UPDATE Employee set Salary=Salary*1.1 where Address='PUN'


--Delete All EMp Whose salary is LEss than 20000 And city is Pune
DELETE Employee where Salary<2000000 and Address='PUN'


--Update The Address of Employee Whose designation is Manager
update Employee set Address='Delh' where Designation='Manager'


--Display all the Female Employee
SELECT  *from Employee where Gender='F'


--display all the employee from BAnglore Location
SELECT *from Employee WHERE Address='BANG'


--display all Employee from HR Dept where Location is Mumbai
SELECT *from Employee where DeptName='HR' and Address='Mum'


--Delete Empl from Sales Dept Where Salary >25000
DELETE Employee where Salary<25000 and DeptName='Sales'

alter table Employee add Salary INT

sp_help Employee

SELECT *from Employee

UPDATE Employee set Salary=40000 where id=10

--BETWEEN operator for range
select*from Employee WHERE Salary BETWEEN 25000 and 30000



SELECT * from Employee where name LIKE 'f%'
SELECT * FROM Employee WHERE name LIKE '%a%'
SELECT * from Employee where name like '%h'
SELECT * from Employee where name LIKE '%[f-j]%'
SELECT * from Employee where name like '[abcdeefj]%'
SELECT * from Employee where name LIKE '%[abcdefg]'



SELECT * from Employee where name not LIKE 'f%'
SELECT * FROM Employee WHERE name  not LIKE '%a%'
SELECT * from Employee where name  not like '%h'
SELECT * from Employee where name not LIKE '%[f-j]%'
SELECT * from Employee where name not like '[abcdeefj]%'
SELECT * from Employee where name not LIKE '%[abcdefg]'


SELECT * from Employee Where id in(1,2,3,5,6)

SELECT * from Employee WHERE Country in('DXB','USA')

SELECT * from Employee where age in(19,47,44)

select* from Employee where  age>20 and Salary>30000

SELECT * from EMployee WHERE country='DXB' or country ='SAF'

SELECT * from EMployee WHERE not country='DXB'

SELECT * from EMployee where not salary>=30000

SELECT* from Employee ORDER by NAME

SELECT* from Employee ORDER by NAME DESC

SELECT* from Employee ORDER by Salary 

SELECT* from Employee ORDER by Salary DESC

SELECT * from EMployee ORDER by Age ASC

SELECT* from employee where age<50 ORDER by age ASC

SELECT* from Employee ORDER by name DESC


SELECT * from Employee where Country is not null

SELECT * from EMployee where Country is NULL

--SELECT * from Employee where country= is not null

SELECT name as 'Emp Name',  age as 'AG' from Employee

SELECT MAX(Salary) as 'max_sal' from Employee

SELECT min(Salary) as 'mai_sal' from Employee

SELECT sum(Salary) as 'total_sal' from Employee

SELECT avg(salary) as 'Avg_sal' from Employee

SELECT min(age) as'min_age' from Employee

SELECT MAX(age) as'max_age' from Employee

SELECT COUNT(distinct Country) as 'c_count' from EMployee

SELECT COUNT(distinct id) from EMployee

SELECT* from EMployee

--


 use EmployeeNew

 SELECT* from Employee

 --write query to find the employee whose salary is more than 30k and less than 80k

 SELECT* from employee where salary BETWEEN 30000 and 80000

 --write query to find the max salary

 SELECT max(Salary) as MAX_Salary from Employee

 --write query to find the total number of employee 

 SELECT count(distinct Empid) as EM_COUNt from Employee

 --or

 SELECT COUNT(*) from Employee

 --write query to find the employee whose salary is less 50k and he is working in admin Dept

 SELECT* from Employee where salary<50000 and DeptName='Hr'

 --write query to arrange all the employees in descending order of salary

 SELECT* from Employee ORDER BY SAlary DESC

 ---write query to display employee whose salary is not in range 20k to 30k

 SELECT * from Employee where salary not between 20000 and 30000

 --SELECT* from Employee WHERE 

 --write query to display name and designation of employee who is from Pune and mum locaton

SELECT Empname, designation  from Employee where address in('PUN','MUM')

 --write query to display all the employee whose designation contains E character 

 SELECT * from Employee where Designation LIKE '%e%'

select* from EMployee

SELECT top (3)* from EMployee 

SELECT top(3) * from Employee order by Salary DESC

SELECT top 1 * from Employee order by Salary DESC


SELECT  top 2 PERCENT * from EMployee ORDER by salary DESC

SELECT top 3 with ties * from Employee order by Salary

SELECT * from Employee order by salary desc offset 3 rows FETCH NEXT 5 rows ONLY

SELECT      * from Employee order by Salary desc offset 1 ROWS fetch next 2 rows ONLY
 

SELECT * from Dept
SELECT* from EMployee


CREATE TABLE Dept(
    did int PRIMARY key,
    dName VARCHAR(30),
)

insert into Dept values (1,'HR')
insert into Dept values (2,'IT')
insert into Dept values (3,'Accounts')
insert into Dept values (4,'Sales')
insert into Dept values (5,'HR')
insert into Dept values (6,'Development')
insert into Dept values (7,'IT')
insert into Dept values (8,'Admin')
insert into Dept values (9,'Trainee')
insert into Dept values (10,'Sales')

Delete Dept WHERE did in(5,7,10)

UPDATE dept  set dname='Tech' where did=6

SELECT e1.*, d1.dname
from Employee e1
inner JOIN dept d1 on d1.did=e1.did

--OR

select Employee.*,Dept.dname from Employee inner JOIN Dept on Dept.did=Employee.did


ALTER TABLE Employee
DROP COLUMN DeptName

alter TABLE EMployee add did INT

update Employee set did=6 where Empid in(6)

UPDATE employee
SET did = 1
WHERE did IS NULL

create database Customer_Order_Status


use Customer_Order_Status


CREATE TABLE Customers   
(
customerid int primary key,
customername varchar(30),
age int,
city varchar(20),
state varchar(20),
dob date
)
SELECT * from customers
insert into Customers values(1,'Pratik',22,'Pune','Maharashtra','1998-1-1')
insert into Customers values(2,'Pankaj',21,'Pune','Maharashtra','1998-1-1')
insert into Customers values(3,'Anjali',23,'Nashik','Maharashtra','1998-1-1')
insert into Customers values(4,'Kishor',21,'Surat','Gaujrat','1998-1-1')
insert into Customers values(5,'Parth',30,'Noida','UP','1998-1-1')
insert into Customers values(6,'Sarth',50,'Birmingham','UK','1993-1-1','London')
insert into Customers values(7,'samarth',31,'Berlin','Nottingham','1998-1-1','Germany')
insert into Customers values(8,'marth',41,'Perth','Nottingham','1978-5-1','Norway',12110)
insert into Customers values(9,'josh',45,'ankara','Istanbul','1978-4-1','Turkey',13110)


create table Orderstatus(
statusid int primary key,
statusname varchar(20)
)


insert into Orderstatus values(1,'Order')
insert into Orderstatus values(2,'Shipped')
insert into Orderstatus values(3,'Delivered')
insert into Orderstatus values (4,'Shipped')
insert into Orderstatus VALUES(5,'Delivered')

create table Orders
(
orderid int primary key,
customerid int,
statusid int,
orderdate date,
shippeddate date,
deliverydate date
)

SELECT * from Customers
SELECT* from Orderstatus
select* from Orders

select c1.*, o1.*
from Customers c1
inner join Orders o1 on o1.customerid=c1.customerid

--Write a statement that will select the City column from the Customers table

SELECT City from Customers

--Select all the different values from the Country column in the Customers table.
SELECT DISTINCT country from Customers

--Select all records where the City column has the value "London

SELECT* from customers where city='London'
update Customers set city='London' where customerid=6

--Use the NOT keyword to select all records where City is NOT "Berlin".

SELECT* from customers where not city='berlin'


--Select all records where the CustomerID column has the value 23.

select* from customers where customerid=3

--Select all records where the City column has the value 'Berlin' and the PostalCode column has the value 121110.
SELECT* from customers where city='berlin' and postalcode=121110


--Select all records where the City column has the value 'Berlin' or 'London'.

SELECT* from customers where city='berlin' OR city='london'

--Select all records from the Customers table, sort the result alphabetically by the column City.


SELECT* from customers order by city 

--Select all records from the Customers table, sort the result reversed alphabetically by the column City.

SELECT *from customers ORDER BY city DESC

--Select all records from the Customers table, sort the result alphabetically, first by the column Country, then, by the column City

SELECT * from customers ORDER by country, city

--Select all records from the Customers where the PostalCode column is empty.

select * from customers where postalcode is NULL

--Select all records from the Customers where the PostalCode column is NOT empty.

select * from customers where postalcode is not NULL

--Set the value of the City columns to 'Oslo', but only the ones where the Country column has the value "Norway".

update customers set city='oslo' where country='Norway'

--Delete all the records from the Customers table where the Country value is 'Norway'.
DELETE from customers where country='norway'

--Use the MIN function to select the record with the smallest value of the Price column.
SELECT MIN(pprice) as minPrice from products

--Use an SQL function to select the record with the highest value of the Price column.
SELECT max(pprice) as max_price from products

--Use the correct function to return the number of records that have the Price value set to 20
SELECT COUNT(*) from products where pprice=20


--Use an SQL function to calculate the average price of all products.
SELECT AVG(pprice) as avg_products from products


--Use an SQL function to calculate the sum of all the Price column values in the Products table

SELECT sum(pprice) as sum_pprice from products

--Select all records where the value of the City column starts with the letter "a".

SELECT* from customers where city LIKE 'a%'

--Select all records where the value of the City column ends with the letter "a".

SELECT* from customers where city like '%a'


--Select all records where the value of the City column contains the letter "a".

select* from customers where city like '%a%'

--Select all records where the value of the City column starts with letter "a" and ends with the letter "b".
SELECT * from customers where city like 'a%b'


--Select all records where the value of the City column does NOT start with the letter "a".
SELECT * from customers where city not like 'a%'


--Select all records where the second letter of the City is an "a".
select * from customers where city like '_a%'

--Select all records where the first letter of the City is an "a" or a "c" or an "s".
SELECT* from customers where city like '[a,s,c]%'

--Select all records where the first letter of the City starts with anything from an "a" to an "f".

SELECT* from customers where city like '[a-f]%'

--Select all records where the first letter of the City is NOT an "a" or a "c" or an "f".

SELECT * from customers where city not like '[a,c,f]%'
SELECT * FROM customers WHERE City NOT LIKE 'a%' AND City NOT LIKE 'c%' AND City NOT LIKE 'f%'

--Use the IN operator to select all the records where the Country is either "Norway" or "France".

SELECT *FROM customers WHERE Country IN ('Norway', 'France')

--Use the IN operator to select all the records where Country is NOT "Norway" and NOT "France".
SELECT * FROM customers WHERE Country NOT IN ('Norway', 'France')

--Use the BETWEEN operator to select all the records where the value of the Price column is between 10 and 20

SELECT * FROM products WHERE pPrice BETWEEN 10 AND 20

--Use the BETWEEN operator to select all the records where the value of the Price column is NOT between 10 and 20.
SELECT * FROM products WHERE pPrice NOT BETWEEN 10 AND 20

--Use the BETWEEN operator to select all the records where the value of the ProductName column is alphabetically between 'Geitost' and 'Pavlova'.

SELECT * FROM products WHERE pName BETWEEN 'Geitost' AND 'Pavlova'

--When displaying the Customers table, make an ALIAS of the PostalCode column, the column should be called Pno instead.
SELECT PostalCode AS Pno FROM Customers


--When displaying the Customers table, refer to the table as Consumers instead of Customers.
SELECT * FROM Customers AS Consumers

--List the number of customers in each country.
SELECT Country, COUNT(*) AS NumberOfCustomers FROM Customers GROUP BY Country

--List the number of customers in each country, ordered by the country with the most customers first.
SELECT Country AS Consumers, COUNT(*) AS NumberOfCustomers FROM Customers GROUP BY Country ORDER BY NumberOfCustomers DESC


--Write the correct SQL statement to create a new database called testDB.
 create DATABASE testDB

 --Write the correct SQL statement to delete a database named testDB
DROP DATABASE testDB


--Add a column of type DATE called Birthday in Persons table
ALTER TABLE Persons ADD Birthday DATE

--Delete the column Birthday from the Persons table
ALTER TABLE Persons DROP COLUMN Birthday



update products set pprice=20 where pid in(1,3,5)
alter TABLE Customers add  Country VARCHAR(30)

alter table customers add PostalCode VARCHAR(30)

update customers set postalcode=121110 where customerid in(7)

update Customers set country='USA' where customerid in(2,5)
SELECT * from Customers
SELECT* from Orderstatus
select* from Orders
SELECT* from products

create table products(
    pID INT PRIMARY key,
    pName VARCHAR(30),
    pPrice int
)

insert into products values(1,'Key',500)
insert into products values(2,'Pen',900)
insert into products values(3,'Mouse',560)
insert into products values(4,'Keyboard',600)
insert into products values(5,'lock',540)
insert into products values(6,'Cloth',300)
insert into products values(7,'paper',290)
insert into products values(8,'rubber',654)
insert into products values(9,'cup',340)
insert into products values(10,'kettle',840)


--create function which accepts the pricz and discount  calculate 
--and retuns the price of each product and discounted price SQL Server funtion



CREATE FUNCTION dbo.CalculateDiscountedPricee
(
    @pPrice INT,
    @discount INT
)
RETURNS INT
AS
BEGIN
    DECLARE @discountedPrice INT;
    SET @discountedPrice = @pPrice - (@pPrice * (@discount / 100));
    RETURN @discountedPrice;
END


create function dbo.CalDP12(
    @pprice int,
    @discount INT
)
returns int 
as 
BEGIN
DECLARE @discountePrice int;
 SET @discountePrice = @pPrice - ((@pPrice * @discount / 100));
RETURN @discountePrice;
end;




SELECT dbo.CalDP12(pprice,20)
as discountedPrice , pprice, pname from products

SELECT* from products


















CREATE FUNCTION dbo.CalculateDiscountedPrice
(
    @price DECIMAL(10, 2),
    @discount DECIMAL(10, 2)
)
RETURNS DECIMAL(10, 2)
AS
BEGIN
    DECLARE @discountedPrice DECIMAL(10, 2);
    SET @discountedPrice = @price - (@price * (@discount / 100));
    RETURN @discountedPrice;
END;



create database Company_assigments

use Company_assigments

CREATE table students(
    sid int PRIMARY KEY,
    name VARCHAR(30),
    city varchar(30)
)

insert into students values(1,'ram','pune')
insert into students values(2,'sham','mumbai')
insert into students values(3,'gita','pune')
insert into students values(4,'babita','nashik')


CREATE table subjects(
    subid int PRIMARY KEY,
    subname varchar(30),
    maxmarks varchar(30),
    passing VARCHAR(30)
)

INSERT into subjects VALUES (1,'maths',100,40)
INSERT into subjects VALUES (2,'english',100,40)
INSERT into subjects VALUES (3,'marathi',50,15)
INSERT into subjects VALUES (4,'hindi',50,15)


create table Exam(
    sid int,
    --CONSTRAINTS fk_sid(sid) FOREIGN KEY REFERENCES students(sid), 
    subid int, --constraints fk_subid(subid)FOREIGN key REFERENCES subjects(subid),
    marks INT,
)
alter table exam add CONSTRAINT fk_sid FOREIGN key(sid) REFERENCES students(sid)
alter table exam add CONSTRAINT fk_subid foreign key(subid) REFERENCES subjects(subid)

INSERT into exam VALUES(1,1,100)
INSERT into exam VALUES(1,2,85)
INSERT into exam VALUES(1,3,40)
INSERT into exam VALUES(1,4,45)
INSERT into exam VALUES(2,1,35)
INSERT into exam VALUES(2,2,55)
INSERT into exam VALUES(2,3,25)
INSERT into exam VALUES(3,1,95)
INSERT into exam VALUES(3,2,87)
INSERT into exam VALUES(3,3,45)
INSERT into exam VALUES(3,4,42)

--a. a. Insert a new student (Sid=5, Name = Ramesh, City = Hyderabad) into the Students table

INSERT INTO Students (Sid, Name, City) VALUES (5, 'Ramesh', 'Hyderabad')

--b. b. Change City of SID = 4 (Gita) to Sangli

UPDATE Students SET City = 'Sangli' WHERE Sid = 4

--c. Return list of all Students with columns Sid, Name and city
SELECT Sid, Name, City FROM Students

--d. Return list containing columns SID, Name, SubName, Marks, MaxMarks, Percentage

SELECT S.SubID, S.Name, Sub.SubName, S.Marks, Sub.MaxMarks, (S.Marks * 100.0) / Sub.MaxMarks AS Percentage
FROM Students S
JOIN Subjects Sub ON S.SubName = Sub.SubName


--Return list containing columns SID, Name, SubName of students who were absent for the exam

SELECT S.SID, S.Name, S.SubName
FROM Students S
LEFT JOIN Subjects Sub ON S.SubName = Sub.SubName
WHERE Sub.SubName IS NULL


---


use Company_assigments

SELECT * from subjects
SELECT* from students
SELECT* from Exam



create DATABASE JOBS_Portal

use JOBS_Portal

create table regions(
    region_id int primary key,
    region_name varchar(20),
)


create table Countries(
    CountryId int primary KEY,
    Countryname varchar(20),
    region_id int,
    
)



alter TABLE Countries add CONSTRAINT fk_rid FOREIGN key(region_id) REFERENCES regions(region_id)


create table Locations(
    LOCATIONI int primary key,
    streetAddress VARCHAR(20),
    postakCode  VARCHAR(20),
    city VARCHAR(20),
    stateProvince VARCHAR(20),
    countryId int 

)
sp_help Locations
EXEC sp_rename 'LOCATIONI', 'LocationId'


--EXEC sp_rename 'TableName.OldColumnName', 'NewColumnName', 'COLUMN';

EXEC sp_rename 'Locations.LOCATIONI', 'LocationId','column'


alter table LOCATIONs add CONSTRAINT fk_cid FOREIGN key(countryId) REFERENCES Countries(countryId)

CREATE table Departments(
    DepartmentId int PRIMARY KEY,
    DepartmentName VARCHAR(30),
    ManagerId int,
    locationId int CONSTRAINT fk_lid FOREIGN key (locationId) REFERENCES locations(locationId)
)

create Table Employee(
    EmployeeId int Primary Key,
    FirstName VARCHAR(20),
    Lastname VARCHAR(20),
    email VARCHAR(20),
    phoneNumber VARCHAR(20),
    hireDate DATE,
    jobId VARCHAR(20),
    salary int,
    commisionPct    int,
    ManagerId int, --CONSTRAINT fk_mid FOREIGN key (managerId) REFERENCES departments(managerId),
    DepartmentId int CONSTRAINT fk_did foreign KEY(DepartmentId) REFERENCES departments (DepartmentId),

)
alter table Employee add CONSTRAINT fk_jid FOREIGN key (jobId) REFERENCES jobs(jobId)

SELECT* from jobs

create table jobs(
    jobId VARCHAR(20) primary key,
    jobTitle VARCHAR(30),
    minSalary int,
    maxSalary int,
)
sp_rename 'jobs.JobTitle', 'jbTitle'

drop table jobs

alter table Jobs alter COLUMN jobId VARCHAR(20)

insert into regions VALUES(1,'South')
insert into regions VALUES(2,'north')
insert into regions VALUES(3,'east')
insert into regions VALUES(4,'west')

insert into Countries VALUES (1,'India',1)
insert into Countries VALUES (2,'USA',2)
insert into Countries VALUES (3,'UAE',3)
insert into Countries VALUES (4,'USSR',4)
insert into Countries VALUES (5,'AJB',2)
insert into Countries VALUES (6,'AUS',4)
insert into Countries VALUES (7,'CAN',2)
insert into Countries VALUES (8,'PAK',1)
insert into Countries VALUES (9,'WB',3)
insert into Countries VALUES (10,'MAL',4)


insert into Locations VALUES(1,'LocalSt',114,'alba','A',2)
insert into Locations VALUES(2,'walSt',514,'fujairia','B',4)
insert into Locations VALUES(3,'JournoSt',345,'Belarus','C',3)
insert into Locations VALUES(4,'FastSt',456,'Delhi','D',1)
insert into Locations VALUES(5,'slowSt',098,'Azerbaian','E',6)
insert into Locations VALUES(6,'hireSt',123,'Kangaroo','F',6)
insert into Locations VALUES(7,'animalSt',342,'Torronto','G',7)
insert into Locations VALUES(8,'builsSt',745,'Hyd','H',1)
insert into Locations VALUES(9,'hierSt',147,'Malayasia','I',3)
insert into Locations VALUES(10,'armanSt',049,'Kolkata','J',4)


alter table locations alter column postalcode INT

delete Countries where countryid in(5,7,9,10)

update employee set managerId=5 where empid in(6,7,8)
update locations set Locationid=2 where Locationid in(2,3,5,8)
update countries set CountryId=7 where countryid =8


insert into departments values(1,'HR',90,1)
insert into departments values(2,'Admin',20,2)
insert into departments values(3,'DEV',30,7)
insert into departments values(4,'Accounts',40,6)
insert into departments values(5,'Sales',50,4)
sp_rename 'Locations.postakcode','postalCode'

insert into Employee values(1,'Fah','MA','ad@','9011','09-10-98','89',89000,890,20,5)
insert into Employee values(2,'sad','AA','aw@','9012','09-10-95','89',89000,890,20,5)
insert into Employee values(3,'mat','DA','ar@','9013','09-10-96','89',89000,890,20,5)
insert into Employee values(4,'sat','FA','at@','9014','09-10-97','89',89000,890,20,5)
insert into Employee values(5,'get','A','ay@','90113','09-10-98','89',89000,890,20,5)
insert into Employee values(6,'hat','GMA','au@','90151','09-10-99','89',89000,890,20,5)
insert into Employee values(7,'Fat','HA','ai@','90116','09-10-91','89',89000,890,20,5)
insert into Employee values(8,'Fai','MBA','ao@','90161','09-10-92','89',89000,890,20,5)
insert into Employee values(9,'sai','MNA','am@','90117','09-10-93','89',89000,890,20,5)
insert into Employee values(10,'reh','MAM','av@','90118','09-10-94','89',89000,890,20,5)
insert into Employee values(11,'gur','MAT','ac@','901112','09-10-95','89',89000,890,20,5)
insert into Employee values(12,'sank','MAQ','axd@','901231','09-11-98','89',89000,890,20,5)
insert into Employee values(13,'rah','MAE','adz@','901145','09-12-98','89',89000,890,20,5)


alter table employee add CONSTRAINT fk_jobid foreign key(jobId) REFERENCES jobs(jobId)
SELECT* from regions
SELECT* from Countries
select* from Locations
SELECT* from departments
SELECT* from employee
SELECT* from jobs

insert into jobs values('AD','Administrator',8900,89000)
insert into jobs values('SS','SalePEr',81900,819000)
insert into jobs values('HRO','AssistancHR',82900,829000)
insert into jobs values('TECH','TL',83900,839000)
insert into jobs values('DEVP','SoftwareDEv',84900,849000)

sp_help Employee
sp_help jobs

alter table EMployee drop CONSTRAINT fk_jid

alter table Employee drop column jobid

alter table EMployee add managerId int
UPDATE Employee set managerId=1 where Empid in(2,3,4)
update employee set managerId=5 where empid in(6,7,8)

SELECT emp.EmpName as 'Employee Name', man.EmpName as 'ManagerName'
from Employee emp, Employee man 
where man.empid=man.managerId


SELECT Address, COUNT(Empid) as 'Count' from Employee
GROUP by Address   
SELECT* from EMployee

SELECT Designation, COUNT(Empid) as COUNT from EMployee
GROUP by designation
order by  designation  asc

SELECT did, sum(Salary) as 'Salary_sum' from EMployee
GROUP by did



--display emp details from HR dept:

SELECT* from  EMployee where did=(select did from dept where dname='HR')
SELECT * from Dept
SELECT* from EMployee


SELECT* from EMployee where salary<(SELECT avg(salary ) as 'AvgSal' from EMployee)
USE EmployeeNew 


SELECT* from EMployee where Salary=(select Max(salary ) as 'MaxSal' from Employee)
SELECT avg(Salary) from EMployee



select * from employee where salary in(SELECT max(Salary) from EMployee GROUP by designation)5y


sp_help jobs

create database EMPInfosys
 use EMPinfosys
CREATE TABLE EmployeeInfo
(
Empid INT PRIMARY KEY,
First_Name VARCHAR(30),
Last_Name VARCHAR(30),
Department VARCHAR(30),
Project VARCHAR(30),
ADDRESS VARCHAR(30),
DOB DATE,
Gender VARCHAR(30)
)
sp_help EmployeeInfo

INSERT INTO EmployeeInfo VALUES(1,'Rohit','Gupta','Admin','P1','Delhi','1992/09/02','Male')
INSERT INTO EmployeeInfo VALUES(2,'Rahul','Mahajan','Admin','P2','Mumabi','1986/10/10','Male')
INSERT INTO EmployeeInfo VALUES(3,'Sonia','Banerjee','HR','P3','Pune','1983/06/05','Female')
INSERT INTO EmployeeInfo VALUES(4,'Ankita','Kapoor','HR','P4','Chennai','1983/11/28','Female')
INSERT INTO EmployeeInfo VALUES(5,'Swati','Garg','HR','P5','Delhi','1991/04/06','Female')

CREATE TABLE EmployeePosition
(
Empid INT FOREIGN KEY (Empid)REFERENCES EmployeeInfo(Empid),
EmpPosition VARCHAR(30),
DateOfJoining DATE,
Salary INT
)
sp_help EmployeePosition

INSERT INTO EmployeePosition VALUES (1,'Executive','2020-04-01',75000)
INSERT INTO EmployeePosition VALUES (2,'Manager','2020-04-03',500000)
INSERT INTO EmployeePosition VALUES (3,'Manager','2020-04-02',1500000)
INSERT INTO EmployeePosition VALUES (2,'Officer','2020-04-02',90000)
INSERT INTO EmployeePosition VALUES (1,'Manager','2020-04-03',300000)

---------------------------------------------------------------------------------------------------------------------------------------

--1. Create a query to generate the first records from the EmployeeInfo table.
SELECT * FROM EmployeeInfo WHERE Empid=1

SELECT* from Employeeinfo where empid=1
------------------------------------------------------------------------------------------------------------------------------------------

--2. Create a query to generate the last records from the EmployeeInfo table.


SELECT top 1 *
from EmployeeInfo
ORDER BY EmpId DESC


-----------------------------------------------------------------------------------------------------------------------

--3. Create a query to fetch the third-highest salary from the EmpPosition table.

SELECT distinct salary from EmployeePosition order by salary desc offset 2 ROWS FETCH NEXT 1 ROW ONLY

SELECT TOP 1 salary FROM (
SELECT TOP 3 salary FROM EmployeePosition ORDER BY salary DESC) AS subquery ORDER BY salary
---OR
SELECT * FROM EmployeePosition ORDER BY Salary DESC offset 2 ROWS FETCH NEXT 1 ROWS only
-------------------------------------------------------------------------------------------------------------------------

--4. Write a query to find duplicate records from a table.
SELECT empid, count(*) as 'duplicate record' from Employeeinfo group by empid having count(*)>1

SELECT Empid ,count(*) AS 'DUPLICATE RECORD' FROM EmployeeInfo GROUP BY Empid HAVING count(*)>1
----------------------------------------------------------------------------------------------------------------------------------------

--5. Create an SQL query to fetch EmpPostion and the total salary paid for each employee position.
SELECT EmpPosition,sum(salary) AS 'TOTAL SALARY' FROM EmployeePosition GROUP BY EmpPosition
---------------------------------------------------------------------------------------------------------------------------------

--6. Create a query to obtain display employees having salaries equal to or greater than 150000.
SELECT * FROM EmployeePosition WHERE salary>=150000



SELECT * from EmployeePosition where salary>= 150000
----------------------------------------------------------------------------------------------------------------------------

--7. Create a query to fetch the list of employees of the same department
SELECT  count (Department) AS 'SAME DEPT' FROM EmployeeInfo GROUP BY department HAVING count (Department)>1
-------------------------------------------------------------------------------------------------------------------------------


SELECT e1.empid, e1.first_name,e1.last_name
from Employeeinfo e1
self join Employeeinfo e2 on e1.Department=e2.department
where e2.Empid<>e2.empid


SELECT distinct e1.EmpID, e1.First_Name, e1.Department
FROM EmployeeInfo e1
JOIN Employeeinfo e2 ON e1.Department = e2.Department AND e1.EmpID <> e2.EmpID


select* from EmployeeInfo
SELECT * from EmployeePosition
create database BookData


DELETE  Bookdata
use bookdata

CREATE TABLE Book (
    BookID INT PRIMARY KEY,
    BookName VARCHAR(100),
    AuthorID INT,
    Price DECIMAL(10, 2)
)

INSERT INTO Book (BookID, BookName, AuthorID, Price)
VALUES
    (1, 'Book 1', 101, 19.99),
    (2, 'Book 2', 102, 29.99),
    (3, 'Book 3', 103, 15.99),
    (4, 'Book 4', 104, 24.99),
    (5, 'Book 5', 105, 12.99),
    (6, 'Book 6', 106, 21.99),
    (7, 'Book 7', 107, 9.99),
    (8, 'Book 8', 108, 18.99),
    (9, 'Book 9', 109, 27.99),
    (10, 'Book 10', 110, 14.99)


    -- Create the "Author" table
CREATE TABLE Author (
    AuthorID INT PRIMARY KEY,
    AuthorName VARCHAR(100),
    PhNo VARCHAR(15),
    Email VARCHAR(100),
    Address VARCHAR(200),
    City VARCHAR(50)
);

-- Insert records into the "Author" table based on the "Book" table data
INSERT INTO Author (AuthorID, AuthorName, PhNo, Email, Address, City)
VALUES
    (101, 'Author 1', '123-456-7890', 'author1@example.com', 'Address 1', 'City 1'),
    (102, 'Author 2', '987-654-3210', 'author2@example.com', 'Address 2', 'City 2'),
    (103, 'Author 3', '555-555-5555', 'author3@example.com', 'Address 3', 'City 3'),
    (104, 'Author 4', '111-222-3333', 'author4@example.com', 'Address 4', 'City 4'),
    (105, 'Author 5', '444-444-4444', 'author5@example.com', 'Address 5', 'City 5'),
    (106, 'Author 6', '777-777-7777', 'author6@example.com', 'Address 6', 'City 6'),
    (107, 'Author 7', '999-999-9999', 'author7@example.com', 'Address 7', 'City 7'),
    (108, 'Author 8', '333-333-3333', 'author8@example.com', 'Address 8', 'City 8'),
    (109, 'Author 9', '888-888-8888', 'author9@example.com', 'Address 9', 'City 9'),
    (110, 'Author 10', '222-222-2222', 'author10@example.com', 'Address 10', 'City 10');


-- Create the "Awards" table
CREATE TABLE Awards (
    AwardID INT PRIMARY KEY,
    AwardTypeID INT,
    AuthorID INT,
    BookID INT,
    Year INT,
    FOREIGN KEY (AuthorID) REFERENCES Author(AuthorID),
    FOREIGN KEY (BookID) REFERENCES Book(BookID)
);


INSERT INTO Awards (AwardID, AwardTypeID, AuthorID, BookID, Year)
VALUES
    (1, 101, 101, 1, 2023),
    (2, 102, 103, 3, 2022),
    (3, 103, 105, 5, 2021),
    (4, 101, 107, 4, 2023),
    (5, 104, 109, 2, 2022);
    -- Add more records as needed
    
drop table awards

drop table awardMAster


CREATE TABLE AwardMaster (
    AwardTypeID INT PRIMARY KEY,
    AwardName VARCHAR(100),
    AwardPrice DECIMAL(10, 2)
);



INSERT INTO AwardMaster (AwardTypeID, AwardName, AwardPrice)
VALUES
    (101, 'Best Fiction Book', 1000.00),
    (102, 'Best Non-Fiction Book', 1200.50),
    (103, 'Best Young Adult Book', 900.75),
    (104, 'Best Mystery Book', 850.25),
    (105, 'Best Science Fiction Book', 1100.00);



 
DELETE FROM Book
WHERE BookID IN (
    SELECT TOP 5 BookID
    FROM Book
    ORDER BY BookID DESC
)




--find the book name which is written by author 5

SELECT BookName
FROM Book
WHERE AuthorID = 105



SELECT bookname from Book 



CREATE TABLE Author (
    AuthorID INT PRIMARY KEY,
    AuthorName VARCHAR(100),
    PhNo VARCHAR(15),
    Email VARCHAR(100),
    Address VARCHAR(200),
    City VARCHAR(50)
);

INSERT INTO Author (AuthorID, AuthorName, PhNo, Email, Address, City)
VALUES
    (101, 'John Smith', '123-456-7890', 'john.smith@example.com', '123 Main St', 'New York'),
    (102, 'Jane Doe', '987-654-3210', 'jane.doe@example.com', '456 Elm St', 'Los Angeles'),
    (103, 'Michael Johnson', '555-555-5555', 'michael.johnson@example.com', '789 Oak St', 'Chicago'),
    (104, 'Emily Brown', '111-222-3333', 'emily.brown@example.com', '321 Pine St', 'Houston'),
    (105, 'Daniel Wilson', '444-444-4444', 'daniel.wilson@example.com', '654 Birch St', 'Dallas');



CREATE TABLE Book (
    BookID INT PRIMARY KEY,
    BookName VARCHAR(200),
    AuthorID INT,
    Price DECIMAL(10, 2),
    FOREIGN KEY (AuthorID) REFERENCES Author(AuthorID)
);

INSERT INTO Book (BookID, BookName, AuthorID, Price)
VALUES
    (1, 'Book 1', 101, 19.99),
    (2, 'Book 2', 102, 29.99),
    (3, 'Book 3', 103, 15.99),
    (4, 'Book 4', 104, 24.99),
    (5, 'Book 5', 105, 12.99);



CREATE TABLE AwardMaster (
    AwardTypeID INT PRIMARY KEY,
    AwardName VARCHAR(100),
    AwardPrice DECIMAL(10, 2)
);

INSERT INTO AwardMaster (AwardTypeID, AwardName, AwardPrice)
VALUES
    (101, 'Best Fiction Book', 1000.00),
    (102, 'Best Non-Fiction Book', 1200.50),
    (103, 'Best Young Adult Book', 900.75),
    (104, 'Best Mystery Book', 850.25),
    (105, 'Best Science Fiction Book', 1100.00);




CREATE TABLE Awards (
    AwardID INT PRIMARY KEY,
    AwardTypeID INT,
    AuthorID INT,
    BookID INT,
    Year INT,
    FOREIGN KEY (AwardTypeID) REFERENCES AwardMaster(AwardTypeID),
    FOREIGN KEY (AuthorID) REFERENCES Author(AuthorID),
    FOREIGN KEY (BookID) REFERENCES Book(BookID)
);

INSERT INTO Awards (AwardID, AwardTypeID, AuthorID, BookID, Year)
VALUES
    (1, 101, 101, 1, 2023),
    (2, 102, 103, 3, 2022),
    (3, 103, 105, 5, 2021),
    (4, 101, 101, 4, 2023),
    (5, 104, 102, 2, 2022);




----find the book name which is written by author emily brown
SELECT BookName
FROM Book
WHERE AuthorID = (
    SELECT AuthorID
    FROM Author
    WHERE AuthorName = 'Emily Brown'
)

--OR--

select bookname from book b join author a on a.authorid=b.authorid where  a.authorname ='emily brown'





--find the number of award for each author
SELECT authorname, count(*) from author a join awards d on a.authorid=d.authorid GROUP by a.authorname

--find the award name for the book xyz
select awardname from awardmaster where awardtypeid in (select AwardTypeID from awards where bookid=(SELECT bookid from book where bookname='book 3'))

--or--

SELECT m.awardname,b.bookname from book b join awards a on b.bookid=a.bookid join awardmaster  m on a.awardtypeid=m.AwardTypeID where b.bookname='book 3'

--find the author who got award
select authorname  from author where authorid in (select authorid from awards)

--or--

select a.authorname from author a join awards d on a.authorid=d.authorid

--find the year wise author count
--find the author name who wrote only one book
SELECT a.authorname, count(* ) from book b join author a on a.authorid=b.authorid
GROUP by authorname having COUNT(*)=1

--find the book name which has maximum price 


--delete the book which is written by johnsmith
DELETE b from book b, author a where b.authorid=a.authorid and a.AuthorName='John Smith'

ALTER TABLE Awards
ADD CONSTRAINT FK_Awards_BookID FOREIGN KEY (BookID)
REFERENCES Book(BookID) ON DELETE CASCADE;

insert into Book values(1,'Book 1', 101, 49)

alter table awards add CONSTRAINT FK_Awards_BookID foreign key (bookid) REFERENCES bookid(bookid) on DELETE CASCADE




SELECT* from Book
select * from Author 
SELECT* from Awardmaster
SELECT* from awards


create database AsignmenetsHomework

create table table1
(
id int,
name varchar(20),
city varchar(20)
)


insert into table1 values(1,'Sara','Pune')

create table table2
(
id_2 int,
name varchar(20),
L_name varchar(20)
)

insert into table2 values(1,'John','Nagpur')
UPDATE table2 set name ='raghu' where id_2=1

INSERT INTO table1
SELECT * FROM  table2
WHERE name='Raghu'


select * from table1
SELECT * from table2

drop table Doctors

create database Doctors

-- Create the Doctor table
CREATE TABLE Doctor (
    DoctorID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Speciality VARCHAR(100)
)
drop table doctor
-- Insert 10 sample records
INSERT INTO Doctor (DoctorID, FirstName, LastName, Speciality)
VALUES
    (1, 'John', 'Smith', 'Cardiologist'),
    (2, 'Emily', 'Johnson', 'Pediatrician'),
    (3, 'Michael', 'Brown', 'Orthopedic Surgeon'),
    (4, 'Sophia', 'Davis', 'Dermatologist'),
    (5, 'Daniel', 'Wilson', 'Neurologist'),
    (6, 'Olivia', 'Martinez', 'Gynecologist'),
    (7, 'William', 'Garcia', 'Ophthalmologist'),
    (8, 'Ava', 'Taylor', 'ENT Specialist'),
    (9, 'James', 'Robinson', 'Psychiatrist'),
    (10, 'Isabella', 'Hernandez', 'Endocrinologist');


create table provience
(
provience_id int primary key,
provience_names varchar(30)
)
insert into provience values(1,'Madras')
insert into provience values(2,'Bengal')
insert into provience values(3,'Madras')
insert into provience values(4,'Kolkatta')
insert into provience values(5,'Madras')
select * from provience


create table patients(
patient_id int primary key,
First_Name  varchar(20),
Last_Name varchar(20),
Gender varchar(10),
BirthDate varchar(20),
City varchar(20),
provience_id int foreign key(provience_id) references Provience(provience_id),
Allergies varchar(30),
Height decimal(3,0),
Weights Decimal(4,0)
)

insert into patients values(101,'pratik','Gomane','M','29/01/1997','Nashik',2,'High Fever',5.6,55)
insert into patients values(102,'Nikhil','Patil','M','15/06/1998','Surat',1,'Pet Allergy',5.4,45)

insert into patients values(103,'Paswan','Borse','M','09/12/1997','Mumbai',3,'Dust Allergy',5.7,57)
insert into patients values(104,'Ameya','Gangarde','F','28/10/1998','Nagar',4,'Food Allergy',5.5,50)
insert into patients values(105,'Mayuri','Yeole','F','02/02/1998','Pune',1,'Pollean Allergy',6,65)
insert into patients values(106,'Shradha','Bhor','F','07/06/1998','Banglore',5,Null,7,55)

create table doctors2(
doc_id int,
first_name varchar(10),
last_name varchar(10),
speciality varchar(25)
)

select * from doctors2
insert into doctors2 values(11,'Pankaj',' Bi','General Medicene')
insert into doctors2 values(12,'Rakya','Patil','Family Physicians')
insert into doctors2 values(13,'DevD','Chafekar','Nephrologists')
insert into doctors2 values(14,'Tomar','sankalecha','Gastroenterologists')
insert into doctors2 values(15,'Param','Kulkarni','Neurologist')

create table admissions(
 patient_id int constraint pid_fk foreign key(patient_id) references patients(patient_id),
 ad_date varchar(20),
 dis_date varchar(25),
 diagnosis varchar(30),
 attending_doc_id int
 )
 insert into admissions values(101,'01/02/2023','12/02/2023','Fever',11)
 insert into admissions values(102,'11/03/2023','18/03/2023','Cough',12)
 insert into admissions values(103,'15/05/2023','26/05/2023','Migrane',15)
 insert into admissions values(104,'12/08/2023','18/08/2023','Chest Pain',14)
 insert into admissions values(105,'05/07/2023','15/07/2023','Low WBC',13)



--1.	Show the first name, last name and gender of patients who’s gender is ‘M’
select First_Name,Last_Name,Gender from Patients where Gender='M'

--2.	Show the first name & last name of patients who does not have any allergies
select First_Name,Last_Name from Patients where Allergies is null

--3.	Show the patients details that start with letter ‘P’
select * from patients where First_Name like 'P%'

--4.	Show the patients details that height range 5.5 to 6
select * from patients where Height between 5.5 and 6

--5.	Update the patient table for the allergies column. Replace ‘NKA’ where allergies is null
update patients set Allergies='NKA' where Allergies is null

--6.	Show how many patients have birth year is 2022
select count(*) from patients where BirthDate between '01/01/1999' and '31/01/2000'

--7.	Show the patients details who have greatest height
select * from patients where Height=(select MAx(Height) as 'Max Height' from patients)
select top 1 * from patients order by Height desc

--8.Show the total amount of male patients and the total amount of female patients in the patients table.
select Gender,COUNT(*) from patients group by Gender

--9.Show first and last name, allergies from patients which have allergies to either 'Penicillin' or 'Morphine'. Show results ordered ascending by allergies then by first_name then by last_name.
select First_Name,Last_Name,Allergies from patients
where Allergies='Pollean Allergy' or Allergies='Dust Allergy' 
order by First_Name,Last_Name

--10.Show first_name, last_name, and the total number of admissions attended for each doctor.


--Every admission has been attended by a doctor.
--11.	For every admission, display the patient's full name, their admission diagnosis, and their doctor's full name who diagnosed their problem.




SELECT * from Provience
SELECT * from patients
SELECT * from doctors2
SELECT * from admissions



-- Create the Course table
CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName NVARCHAR(100),
    DurationInMonths INT,
    TrainerID INT,
    TotalFees DECIMAL(10, 2),
    FOREIGN KEY (TrainerID) REFERENCES Trainer (TrainerID)
)

-- Insert 10 sample records into the Course table
INSERT INTO Course (CourseID, CourseName, DurationInMonths, TrainerID, TotalFees)
VALUES
    (101, 'Introduction to Programming', 3, 101, 1500.00),
    (102, 'Web Development Fundamentals', 6, 102, 2500.00),
    (103, 'Database Management', 4, 103, 1800.00),
    (104, 'Data Science Basics', 5, 101, 2200.00),
    (105, 'Mobile App Development', 6, 104, 2800.00),
    (106, 'Network Security Essentials', 3, 105, 1600.00),
    (107, 'Artificial Intelligence Concepts', 7, 106, 3000.00),
    (108, 'Cloud Computing Fundamentals', 5, 107, 2400.00),
    (109, 'Software Testing Techniques', 4, 102, 2000.00),
    (110, 'Project Management Essentials', 4, 108, 2200.00)


-- Create the Trainer table
CREATE TABLE Trainer (
    TrainerID INT PRIMARY KEY,
    TrainerName NVARCHAR(100),
    JoinDate DATE,
    Email NVARCHAR(100),
    ExperienceInYears INT
)

-- Insert 10 sample records into the Trainer table
INSERT INTO Trainer (TrainerID, TrainerName, JoinDate, Email, ExperienceInYears)
VALUES
    (101, 'John Smith', '2020-02-15', 'john.smith@example.com', 5),
    (102, 'Emily Johnson', '2019-07-10', 'emily.johnson@example.com', 3),
    (103, 'Michael Brown', '2021-01-25', 'michael.brown@example.com', 7),
    (104, 'Sophia Davis', '2018-11-30', 'sophia.davis@example.com', 4),
    (105, 'Daniel Wilson', '2017-06-05', 'daniel.wilson@example.com', 6),
    (106, 'Olivia Martinez', '2016-03-20', 'olivia.martinez@example.com', 8),
    (107, 'William Garcia', '2019-12-12', 'william.garcia@example.com', 2),
    (108, 'Ava Taylor', '2022-04-18', 'ava.taylor@example.com', 4),
    (109, 'James Robinson', '2020-09-05', 'james.robinson@example.com', 6),
    (110, 'Isabella Hernandez', '2015-08-22', 'isabella.hernandez@example.com', 9)


-- Create the Student table
CREATE TABLE Student (
    RollNo INT PRIMARY KEY,
    SName NVARCHAR(100),
    Degree NVARCHAR(50),
    BirthDate DATE,
    CourseID INT,
    BatchID INT,
    FeesPaid DECIMAL(10, 2),
    Remark NVARCHAR(200),
    IsPlaced BIT,
    FOREIGN KEY (CourseID) REFERENCES Course (CourseID)
)

-- Insert 10 sample records into the Student table
INSERT INTO Student (RollNo, SName, Degree, BirthDate, CourseID, BatchID, FeesPaid, Remark, IsPlaced)
VALUES
    (1001, 'John Doe', 'BSc Computer Science', '2000-05-12', 101, 2022, 1200.00, 'Good progress in studies', 0),
    (1002, 'Emma Watson', 'BEng Electrical Engineering', '2001-08-20', 102, 2021, 2000.00, 'Excellent academic record', 1),
    (1003, 'Michael Johnson', 'BA Economics', '2000-02-08', 103, 2023, 1500.00, 'Active participant in extracurricular activities', 0),
    (1004, 'Sophia Lee', 'BCom Accounting', '2002-11-03', 104, 2022, 1800.00, 'Aspires to become a financial analyst', 1),
    (1005, 'William Smith', 'BSc Mathematics', '2001-04-25', 105, 2023, 1400.00, 'Enjoys problem-solving', 0),
    (1006, 'Olivia Garcia', 'BSc Chemistry', '2002-10-15', 106, 2021, 2200.00, 'Topper in the previous semester', 1),
    (1007, 'Daniel Brown', 'BBA Marketing', '2000-06-30', 107, 2023, 1600.00, 'Interested in sales and advertising', 1),
    (1008, 'Ava Miller', 'BA English Literature', '2001-03-19', 108, 2022, 1900.00, 'Avid reader and writer', 0),
    (1009, 'James Wilson', 'BSc Physics', '2002-09-10', 109, 2021, 1300.00, 'Aspiring physicist', 0),
    (1010, 'Isabella Anderson', 'BSc Biology', '2000-07-02', 110, 2023, 2500.00, 'Passionate about environmental conservation', 1)





--1.Show list of students. List contains roll no , student name , course name , trainer name in order of course name and student name.

SELECT
    S.RollNo,
    S.SName AS StudentName,
    C.CourseName,
    T.TrainerName
FROM
    Student S
INNER JOIN Course C ON S.CourseID = C.CourseID
INNER JOIN Trainer T ON C.TrainerID = T.TrainerID
ORDER BY
    C.CourseName,
    S.SName


-- Show list of students who have pending fees more than 1000rs . List should have student name , course name , balance fees . Show this list in descending order of balance fees.
SELECT
    S.SName AS StudentName,
    C.CourseName,
    (C.TotalFees - S.FeesPaid) AS BalanceFees
FROM
    Student S
INNER JOIN Course C ON S.CourseID = C.CourseID
WHERE
    (C.TotalFees - S.FeesPaid) > 1000
ORDER BY
    BalanceFees DESC


--3. Append letter ‘_spl’ to all batch ids of trainer ‘Deepa’.
UPDATE Course
SET BatchID = CONCAT(BatchID, '_spl')
WHERE TrainerID IN (SELECT TrainerID FROM Trainer WHERE TrainerName = 'John Smith');




--4. Update table student. Update ‘remark’ field. Remark should be ‘Eligible for exam’ if fees paid
--by student is more than 60%.
--5. Create a index to make retrieval faster based on course name.



SELECT* from student
SELECT* from trainer    
SELECT* from course