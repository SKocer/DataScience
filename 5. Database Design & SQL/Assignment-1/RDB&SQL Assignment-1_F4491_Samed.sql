CREATE DATABASE CManufacturer;

USE CManufacturer;


---- PRODUCT TABLE

CREATE TABLE Product(
	Product_ID int,
	Product_name varchar(50),
	Quantity int,
	PRIMARY KEY (Product_ID)
)


---- COMPONENT TABLE

CREATE TABLE Component(
	Component_ID int,
	Component_name varchar(50),
	Description varchar(50),
	Quantity int,
	PRIMARY KEY (Component_ID)
)


---- SUPPLIER

CREATE TABLE SUPPLIER(
	Supplier_ID int,
	Supplier_name varchar(50),
	Supplier_location varchar(50),
	Supplier_country varchar(50),
	IsActive int,
	PRIMARY KEY (Supplier_ID)

)


----- PRODCOMP

CREATE TABLE ProdComp(
	Product_ID int,
	Component_ID int,
	FOREIGN KEY (Product_ID) REFERENCES Product (Product_ID),
	FOREIGN KEY (Component_ID) REFERENCES Component (Component_ID),
	PRIMARY KEY (Product_ID, Component_ID),
	Quantity int

)


---- SUPPCOMP

CREATE TABLE SuppComp(
	Component_ID int,
	Supplier_ID int,
	FOREIGN KEY (Supplier_ID) REFERENCES Supplier (Supplier_ID),
	FOREIGN KEY (Component_ID) REFERENCES Component (Component_ID),
	PRIMARY KEY (Supplier_ID, Component_ID),
	OrderDate date NOT NULL,
	Quantity int
)