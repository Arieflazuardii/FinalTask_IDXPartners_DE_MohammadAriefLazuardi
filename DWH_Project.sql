---- CREATE DWH_PROJECT DATABASE ------

CREATE DATABASE DWH_Project

CREATE TABLE DimCustomer (
	CustomerID INT NOT NULL,
	CustomerName VARCHAR(50) NOT NULL,
	Age INT NOT NULL,
	Gender VARCHAR (50) NOT NULL,
	City VARCHAR (50) NOT NULL,
	NoHp VARCHAR (50) NOT NULL,
	CONSTRAINT PK_DimCustomer PRIMARY KEY (CustomerID)
)

CREATE TABLE DimProduct (
	ProductID INT NOT NULL,
	ProductName VARCHAR (255) NOT NULL,
	ProductCategory VARCHAR (255) NOT NULL,
	ProductUnitPrice INT NOT NULL,
	CONSTRAINT PK_DimProduct PRIMARY KEY (ProductID)
)

CREATE TABLE DimStatusOrder (
	StatusID INT NOT NULL,
	StatusOrder VARCHAR (50) NOT NULL,
	StatusOrderDesc VARCHAR (50) NOT NULL,
	CONSTRAINT PK_DimStatusOrder PRIMARY KEY (StatusID)
)

CREATE TABLE FactSalesOrder (
	OrderID INT NOT NULL,
	CustomerID INT NOT NULL,
	ProductID INT NOT NULL,
	StatusID INT NOT NULL,
	Quantity INT NOT NULL,
	Amount INT NOT NULL,
	OrderDate Date NOT NULL,
	CONSTRAINT PK_FactSalesOrder PRIMARY KEY (OrderID),
	CONSTRAINT FK_FactSalesOrderC FOREIGN KEY (CustomerID) REFERENCES DimCustomer (CustomerID),
	CONSTRAINT FK_FactSalesOrderP FOREIGN KEY (ProductID) REFERENCES DimProduct (ProductID),
	CONSTRAINT FK_FactSalesOrderS FOREIGN KEY (StatusID) REFERENCES DimStatusOrder (StatusID)
)

------ To Check table contents ---------
SELECT * FROM DimCustomer
SELECT * FROM DimProduct
SELECT * FROM DimStatusOrder
SELECT * FROM FactSalesOrder

------- Create Store Procedure  -------

CREATE PROCEDURE summary_order_status
(@StatusID int) AS
BEGIN
	SELECT
		f.OrderID,
		c.CustomerName,
		p.ProductName,
		f.Quantity,
		s.StatusOrder
	FROM FactSalesOrder AS f
	JOIN DimCustomer c ON f.CustomerID = c.CustomerID
	JOIN DimProduct p ON f.ProductID = p.ProductID
	JOIN DimStatusOrder s ON f.StatusID = s.StatusID
	WHERE s.StatusID = @StatusID
END

---- To Check Result of Store Procedure ----
EXEC summary_order_status @StatusID = 1