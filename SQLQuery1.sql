CREATE DATABASE DeliveryDB


USE DeliveryDB


CREATE TABLE UsersTB
(
UserID bigint identity(1,1) PRIMARY KEY,
UserFirstName nvarchar(20) default 'Unknown',
UserLastName nvarchar(20) default 'Unknown',
PostIndex int,
)


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

CREATE TABLE TransporterTB
(
TransporterID int identity(1,1) PRIMARY KEY,
TransporterName nvarchar(20),
)
 
/*ORDERS TABLE*/

CREATE TABLE OrdersTB
(
OrderID int identity(1,1) PRIMARY KEY,
RecieverID bigint NOT NULL ,
GoodID int NOT NULL,
TransporterID int NOT NULL,
OrderDate datetime,
OrderDue datetime,
FOREIGN KEY (RecieverID) REFERENCES UsersTB(UserID),
FOREIGN KEY (GoodID) REFERENCES GoodsTB(GoodID),
FOREIGN KEY (TransporterID) REFERENCES TransporterTB(TransporterID),
)

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


CREATE TABLE CitiesTB
(
CityID int identity(1,1) PRIMARY KEY,
CityName nvarchar(20) NOT NULL,
CityPostIndex int NOT NULL,
)