USE [DeliveryDB]
GO
/****** Object:  StoredProcedure [dbo].[WareHouseP]    Script Date: 5/18/2025 10:31:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[WareHouseP]

     @WarehouseID int = NULL,
	 @WarehouseName nvarchar(20) = NULL,
	 @WarehouseCityID int = NULL,
	 @WareHouseTBAction tinyint



AS
BEGIN
BEGIN TRANSACTION WareHousePTransaction
    SAVE TRANSACTION WareHousePTransaction

     BEGIN TRY
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
	 END TRY
    BEGIN CATCH
    ROLLBACK TRANSACTION WareHousePTransaction
    END CATCH
END
