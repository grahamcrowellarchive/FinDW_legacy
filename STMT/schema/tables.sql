USE FinDW
GO
SET NOCOUNT ON;

IF OBJECT_ID('dim.Date') IS NOT NULL
BEGIN
	PRINT 'drop dim.Date'
	DROP TABLE dim.Date;
END
GO

BEGIN
PRINT 'create dim.Date'
CREATE TABLE dim.Date(
	DateID int NOT NULL 
	--,Date AS CONVERT(date, CAST(DateID AS varchar(10)), 112)
	,Date date NULL
	,Year AS YEAR(Date) 
	,Month AS MONTH(Date)
	,Day AS DAY(Date)
	,mdy AS FORMAT(Date, 'M/d/yyyy')
	,isTradeDate bit NULL
	,CONSTRAINT PK_Date PRIMARY KEY CLUSTERED (DateID ASC)
	);
	INSERT INTO dim.Date (DateID) VALUES (0);
END
GO


IF OBJECT_ID('dim.Account') IS NOT NULL
BEGIN
	PRINT 'drop dim.Account'
	DROP TABLE dim.Account;
END
GO

BEGIN
PRINT 'create dim.Account'
CREATE TABLE dim.Account(
	AccountID int IDENTITY(0,1)
	,AccountName varchar(64) NOT NULL
	,CONSTRAINT PK_dimAccount PRIMARY KEY CLUSTERED (AccountID ASC)
	);
	INSERT INTO dim.Account VALUES ('Invalid');
END
GO


IF OBJECT_ID('dim.SubAccount') IS NOT NULL
BEGIN
	PRINT 'drop dim.SubAccount'
	DROP TABLE dim.SubAccount;
END
GO

BEGIN
PRINT 'create dim.SubAccount'
CREATE TABLE dim.SubAccount(
	SubAccountID int IDENTITY(0,1)
	,SubAccountName varchar(64) NOT NULL
	,CONSTRAINT PK_dimSubAccount PRIMARY KEY CLUSTERED (SubAccountID ASC)
	-- ,CONSTRAINT FK_SubAccount_SubAccount FOREIGN KEY (SubAccountID) REFERENCES dim.Account (AccountID) 
	);
	INSERT INTO dim.SubAccount VALUES ('Invalid');
END
GO


IF OBJECT_ID('dim.Statement') IS NOT NULL
BEGIN
	PRINT 'drop dim.Statement'
	DROP TABLE dim.Statement;
END
GO

BEGIN
PRINT 'create dim.Statement'
CREATE TABLE dim.Statement(
	StatementID int IDENTITY(0,1)
	,StatementName varchar(64) NOT NULL
	,CONSTRAINT PK_dimStatement PRIMARY KEY CLUSTERED (StatementID ASC)
	);
	INSERT INTO dim.Statement VALUES ('Invalid');
END
GO


IF OBJECT_ID('dim.Stock') IS NOT NULL
BEGIN
	PRINT 'drop dim.Stock'
	DROP TABLE dim.Stock;
END
GO

BEGIN
PRINT 'create dim.Stock'
CREATE TABLE dim.Stock(
	StockID int IDENTITY(0,1)
	,StockName varchar(64) NOT NULL
	,Symbol varchar(64) NOT NULL
	,CID int NULL
	,CONSTRAINT PK_dimStock PRIMARY KEY CLUSTERED (StockID ASC)
	);
	INSERT INTO dim.Stock (StockName,Symbol) VALUES ('Invalid','Invalid');
END
GO


IF OBJECT_ID('Statement') IS NOT NULL
BEGIN
	PRINT 'drop Statement'
	DROP TABLE Statement;
END
GO

BEGIN
PRINT 'create Statement'
CREATE TABLE Statement(
	FactID bigint NOT NULL
	,CID bigint NOT NULL
	,FiscalYear int NOT NULL
	,FiscalQuarter smallint NOT NULL
	,PeriodEndDateID int NOT NULL
	,StatementTypeID smallint NOT NULL
	,AccountID int NULL
	,SubAccountID int NULL
	,Value bigint NOT NULL
	,CONSTRAINT PK_Statement PRIMARY KEY CLUSTERED (FactID)
	);
END
GO


IF OBJECT_ID('staging.Statement') IS NOT NULL
BEGIN
	PRINT 'drop staging.Statement'
	DROP TABLE staging.Statement;
END
GO

BEGIN
PRINT 'create staging.Statement'
CREATE TABLE staging.Statement(
	import_path varchar(260) NOT NULL
	,import_date date NULL
	,download_date date NULL
	,CIDStr varchar(16) NULL
	,PeriodEndDateStr varchar(16) NULL
	,FiscalQuarterStr varchar(1) NULL
	,StatementIDStr varchar(1) NULL
	,AccountStr varchar(100) NULL
	,SubAccountStr varchar(100) NULL
	,ValueStr varchar(16) NULL

	,CID bigint NULL
	,PeriodEndDate date NULL
	,FiscalQuarter tinyint NULL
	,StatementID tinyint NULL
	,AccountID tinyint NULL
	,SubAccountID tinyint NULL
	,Value bigint NULL
	-- ,CONSTRAINT PK_stagingStatement PRIMARY KEY CLUSTERED (FactID)
	);
END
GO
