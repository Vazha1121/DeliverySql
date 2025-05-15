USE DeliveryDB

EXEC UserP @UserTBACtion = 0, @UserFirstName = 'Giorgi ', @UserLastName = 'Chikhladze', @PostIndex = 0167
SELECT * FROM UsersTB

EXEC UserP @UserTBACtion = 2, @UserID = 1

EXEC CitiesP @CitiesTBAction = 0,@CityName = 'Gori', @CityPostIndex = 0171
SELECT * FROM CitiesTB

EXEC CitiesP @CitiesTBAction = 1, @CityName = 'Kobuleti', @CityPostIndex = 0170, @CityID = 8


EXEC GoodsP @GoodsTBAction = 1, @Price = 65, @GoodID = 12
SELECT * FROM GoodsTB

EXEC GoodsP @GoodsTBAction = 0, @GoodName = 'Chair', @Quantity = 1, @Price = 4000, @WareHouseID = 10
SELECT * FROM GoodsTB

EXEC OrdersP @OrdersTBAction = 0, @UserID = 4, @GoodID = 16, @TransporterID = 6, @OrderDate = '2025-06-11', @OrderDue = '2025-04-15'
SELECT * FROM OrdersTB
SELECT * FROM TransporterTB
SELECT * FROM UsersTB
SELECT * FROM GoodsTB

EXEC TransporterP @TransporterTBAction = 0,  @TransporterName = 'HorizonHaul Logistics'
SELECT * FROM TransporterTB

EXEC WareHouseP @WareHouseTBAction = 2 , @WareHouseID = 13
EXEC WareHouseP @WareHouseTBAction = 0 , @WarehouseName = 'Gori Trucking', @WarehouseCityID = 10
SELECT * FROM WareHouseTB

SELECT * FROM CitiesTB

SELECT 
w.WarehouseName,
c.CityName,
c.CityPostIndex
FROM WareHouseTB w
JOIN CitiesTB c ON w.WarehouseCityID = c.CityID

SELECT 
g.GoodName,
g.Quantity,
w.WarehouseName,
c.CityPostIndex
FROM GoodsTB g
JOIN WareHouseTB w on g.WareHouseID = w.WarehouseCityID
JOIN CitiesTB c ON w.WarehouseCityID = c.CityID

SELECT 
u.UserFirstName,
u.UserLastName,
u.PostIndex,
c.CityName
FROM UsersTB u
JOIN CitiesTB c on u.PostIndex = c.CityPostIndex


SELECT 
u.UserFirstName,
u.UserLastName,
c.CityName,
c.CityPostIndex,
g.GoodName,
w.WarehouseName,
g.Quantity,
t.TransporterName,
o.OrderDate,
o.OrderDue
FROM OrdersTB o
JOIN UsersTB u ON o.UserID = u.UserID
JOIN GoodsTB g ON o.GoodID = g.GoodID
JOIN WareHouseTB w ON w.WarehouseID = g.WareHouseID
JOIN CitiesTB c ON u.PostIndex = c.CityPostIndex
JOIN TransporterTB t ON o.TransporterID = t.TransporterID

SELECT 
*
FROM GetAllWarehouse()


SELECT 
*
FROM InfoAboutGood()

SELECT
*
FROM UserPlace()

SELECT 
* 
FROM OrderFullInfo()