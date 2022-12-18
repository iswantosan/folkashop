create database FolkaShop
go
use FolkaShop;
go
create table Category
(
	CategoryId int identity primary key,
	CategoryName varchar(50),
	Status bit not null,
	CreatedAt datetime default getdate(),
	UpdatedAt datetime default getdate()
);

go
insert into Category (CategoryName, Status) values ('Home', 1);
insert into Category (CategoryName, Status) values ('Garden', 1);
insert into Category (CategoryName, Status) values ('Electronics', 1);
insert into Category (CategoryName, Status) values ('Fitness', 1);
insert into Category (CategoryName, Status) values ('Toys', 1);
go


create table Product
(
	ProductId int identity primary key,
	CategoryId int not null references Category(CategoryId),
	SKU varchar(20),
	ProductName varchar(50),
	Description text,
	Price int,
	Featured bit not null,
	CreatedAt datetime default getdate(),
	UpdatedAt datetime default getdate()
);
go

insert into Product (CategoryId, SKU, ProductName, Description, Price, Featured) values (1, 1000, 'Product 1', 'Description 1', 10000, 1);
insert into Product (CategoryId, SKU, ProductName, Description, Price, Featured) values (1, 1000, 'Product 2', 'Description 2', 10000, 1);
insert into Product (CategoryId, SKU, ProductName, Description, Price, Featured) values (1, 1000, 'Product 3', 'Description 3', 10000, 1);
insert into Product (CategoryId, SKU, ProductName, Description, Price, Featured) values (2, 1000, 'Product 4', 'Description 4', 10000, 1);
insert into Product (CategoryId, SKU, ProductName, Description, Price, Featured) values (2, 1000, 'Product 5', 'Description 5', 10000, 1);
insert into Product (CategoryId, SKU, ProductName, Description, Price, Featured) values (2, 1000, 'Product 6', 'Description 6', 10000, 1);
insert into Product (CategoryId, SKU, ProductName, Description, Price, Featured) values (3, 1000, 'Product 7', 'Description 7', 10000, 1);
insert into Product (CategoryId, SKU, ProductName, Description, Price, Featured) values (3, 1000, 'Product 8', 'Description 8', 10000, 1);
insert into Product (CategoryId, SKU, ProductName, Description, Price, Featured) values (3, 1000, 'Product 9', 'Description 9', 10000, 1);
insert into Product (CategoryId, SKU, ProductName, Description, Price, Featured) values (3, 1000, 'Product 10', 'Description 10', 10000, 1);
insert into Product (CategoryId, SKU, ProductName, Description, Price, Featured) values (4, 1000, 'Product 11', 'Description 11', 10000, 0);
insert into Product (CategoryId, SKU, ProductName, Description, Price, Featured) values (4, 1000, 'Product 12', 'Description 12', 10000, 0);
insert into Product (CategoryId, SKU, ProductName, Description, Price, Featured) values (5, 1000, 'Product 13', 'Description 13', 10000, 0);
insert into Product (CategoryId, SKU, ProductName, Description, Price, Featured) values (5, 1000, 'Product 14', 'Description 14', 10000, 0);
insert into Product (CategoryId, SKU, ProductName, Description, Price, Featured) values (5, 1000, 'Product 15', 'Description 15', 10000, 0);
insert into Product (CategoryId, SKU, ProductName, Description, Price, Featured) values (5, 1000, 'Product 16', 'Description 16', 10000, 0);
insert into Product (CategoryId, SKU, ProductName, Description, Price, Featured) values (5, 1000, 'Product 17', 'Description 17', 10000, 0);
insert into Product (CategoryId, SKU, ProductName, Description, Price, Featured) values (5, 1000, 'Product 18', 'Description 18', 10000, 0);

go

create procedure prc_featured_products
as
begin
	set nocount on;

	select p.*
	from Product p join Category c 
		on p.CategoryId = c.CategoryId
	where p.Featured = 1
	order by p.ProductName

	set nocount off;
end

go

create procedure prc_all_categories
as
begin
	set nocount on;

	select * from Category where Status = 1 order by CategoryName;

	set nocount off;
end

go

create procedure prc_product_by_category @categoryId int
as
begin
	set nocount on;

	select p.*
	from Product p 
	where p.CategoryId = @categoryId
	order by p.ProductName

	set nocount off;
end

