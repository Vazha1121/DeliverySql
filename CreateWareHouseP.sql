-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
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
CREATE PROCEDURE WareHouseP

     @WarehouseID int = NULL,
	 @WarehouseName nvarchar(20) = NULL,
	 @WarehouseCityID int = NULL,
	 @WareHouseTBAction tinyint



AS
BEGIN
	 IF @WareHouseTBAction = 0 -- INSERT
	 BEGIN
	      INSERT INTO WareHouseTB (WarehouseName, WarehouseCityID)
		  VALUES (@WarehouseName, @WarehouseCityID);
	 END
	 ELSE IF @WareHouseTBAction = 1 -- UPDATE
	 BEGIN 
	      UPDATE WareHouseTB
		  SET 
		  WarehouseName = ISNULL(@WarehouseName, WarehouseName),
		  WarehouseCityID = ISNULL(@WarehouseCityID, WarehouseCityID)
		  WHERE WarehouseID = @WarehouseID
	 END
	 ELSE IF @WareHouseTBAction = 2 -- DELETE
	 BEGIN
	      DELETE FROM WareHouseTB
		  WHERE WarehouseID = @WarehouseID
	 END
END
GO
