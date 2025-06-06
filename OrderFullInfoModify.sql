USE [DeliveryDB]
GO
/****** Object:  UserDefinedFunction [dbo].[OrderFullInfo]    Script Date: 5/18/2025 10:58:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER FUNCTION [dbo].[OrderFullInfo]()
RETURNS TABLE 
AS
RETURN 
(
	SELECT 
    u.UserFirstName,
    u.UserLastName,
    c.CityName,
    c.CityPostIndex,
    g.GoodName,
    w.WarehouseName,
    g.Quantity,
	g.Price,
    t.TransporterName,
    o.OrderDate,
    o.OrderDue
    FROM OrdersTB o
    JOIN UsersTB u ON o.UserID = u.UserID
    JOIN GoodsTB g ON o.GoodID = g.GoodID
    JOIN WareHouseTB w ON w.WarehouseID = g.WareHouseID
    JOIN CitiesTB c ON u.PostIndex = c.CityPostIndex
    JOIN TransporterTB t ON o.TransporterID = t.TransporterID
)
