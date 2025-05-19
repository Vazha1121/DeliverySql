-- ================================================
-- Template generated from Template Explorer using:
-- Create Inline Function (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the function.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION OrderFullInfo()
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
GO
