CREATE DATABASE DeliveryDB


USE DeliveryDB


CREATE TABLE UsersTB
(
UserID bigint identity(1,1) PRIMARY KEY,
UserFirstName nvarchar(20) default 'Unknown',
UserLastName nvarchar(20) default 'Unknown',
PostIndex int,
)

DROP TABLE UsersTB

CREATE TABLE GoodsTB
(
GoodID int identity(1,1) PRIMARY KEY,
GoodName nvarchar(20),
Quantity bigint default 0,
Price int default 0.00,
WareHouseID int NOT NULL,
)

ALTER TABLE GoodsTb
ADD FOREIGN KEY (WareHouseID) REFERENCES WareHouseTB(WarehouseID)

DROP TABLE GoodsTB

CREATE TABLE TransporterTB
(
TransporterID int identity(1,1) PRIMARY KEY,
TransporterName nvarchar(20),
)

ALTER TABLE TransporterTB
ALTER COLUMN TransporterName nvarchar(40)


DROP TABLE TransporterTB

/*ORDERS TABLE*/

CREATE TABLE OrdersTB
(
OrderID int identity(1,1) PRIMARY KEY,
UserID bigint NOT NULL ,
GoodID int NOT NULL,
TransporterID int NOT NULL,
OrderDate datetime,
OrderDue datetime,
FOREIGN KEY (UserID) REFERENCES UsersTB(UserID),
FOREIGN KEY (GoodID) REFERENCES GoodsTB(GoodID),
FOREIGN KEY (TransporterID) REFERENCES TransporterTB(TransporterID),
)

DROP TABLE OrdersTB

CREATE TABLE WareHouseTB
(
WarehouseID int identity(1,1) PRIMARY KEY,
WarehouseName nvarchar(20) NOT NULL Default 'NoName',
WarehouseCityID nvarchar(20) NOT NULL,
)

ALTER TABLE WareHouseTB
ALTER COLUMN WarehouseCityID int NOT NULL


ALTER TABLE WareHouseTB
ADD FOREIGN KEY (WarehouseCityID) REFERENCES CitiesTB(CityID)

DROP TABLE WareHouseTB

CREATE TABLE CitiesTB
(
CityID int identity(1,1) PRIMARY KEY,
CityName nvarchar(20) NOT NULL,
CityPostIndex int NOT NULL,
)

DROP TABLE CitiesTB

CREATE TABLE CitiesTBLogs(
   CityIndex INT,
   Status VARCHAR(30)
)
