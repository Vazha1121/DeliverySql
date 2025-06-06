USE [DeliveryDB]
GO
/****** Object:  StoredProcedure [dbo].[GoodsP]    Script Date: 5/18/2025 10:25:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[GoodsP]
    
	 @GoodID int = NULL,
	 @GoodName nvarchar(20) = NULL,
	 @Quantity bigint = NULL,
	 @Price int = NULL,
	 @WareHouseID int = NULL,
	 @GoodsTBAction tinyint

AS
BEGIN
   BEGIN TRANSACTION GoodsPTransaction
   SAVE TRANSACTION GoodsPTransaction

     BEGIN TRY
       IF @GoodsTBAction = 0 -- INSERT
	   BEGIN
	      INSERT INTO GoodsTB (GoodName, Quantity, Price, WareHouseID)
		  VALUES (@GoodName, @Quantity, @Price, @WareHouseID);
	   END
	   ELSE IF @GoodsTBAction = 1 -- UPDATE
	   BEGIN 
	      UPDATE GoodsTB
		  SET 
		  GoodName = ISNULL(@GoodName, GoodName),
		  Quantity = ISNULL(@Quantity, Quantity),
		  Price = ISNULL(@Price, Price),
		  WareHouseID = ISNULL(@WareHouseID, WareHouseID)
		  WHERE GoodID = @GoodID
	   END
	   ELSE IF @GoodsTBAction = 2 -- DELETE
	   BEGIN
	      DELETE FROM GoodsTB
		  WHERE GoodID = @GoodID
	   END
	   END TRY
    BEGIN CATCH
    ROLLBACK TRANSACTION GoodsPTransaction
    END CATCH
END
