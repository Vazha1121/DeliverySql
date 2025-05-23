USE [DeliveryDB]
GO
/****** Object:  StoredProcedure [dbo].[OrdersP]    Script Date: 5/15/2025 6:57:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[OrdersP]
     
	 @OrderDue datetime = NULL,
	 @OrderDate datetime = NULL,
	 @TransporterID int = NULL,
	 @GoodID int = NULL,
     @UserID bigint = NULL,
     @OrderID int = NULL,
	 @OrdersTBAction tinyint


AS
BEGIN
	BEGIN TRANSACTION OrdersPTransaction
    SAVE TRANSACTION OrdersPTransaction

     BEGIN TRY
	   IF @OrdersTBAction = 0 -- INSERT
	   BEGIN
	      INSERT INTO OrdersTB (UserID, GoodID, TransporterID, OrderDate, OrderDue)
		  VALUES (@UserID, @GoodID, @TransporterID, @OrderDate, @OrderDue);
	   END
	   ELSE IF @OrdersTBAction = 1 -- UPDATE
	   BEGIN 
	      UPDATE OrdersTB
		  SET 
		  UserID = ISNULL(@UserID, @UserID),
		  GoodID = ISNULL(@GoodID, GoodID),
		  TransporterID = ISNULL(@TransporterID, TransporterID),
		  OrderDate = ISNULL(@OrderDate, OrderDate),
		  OrderDue = ISNULL(@OrderDue, OrderDue)
		  WHERE OrderID = @OrderID
	   END
	   ELSE IF @OrdersTBAction = 2 -- DELETE
	   BEGIN
	      DELETE FROM OrdersTB
		  WHERE OrderID = @OrderID
	 END
	 END TRY
    BEGIN CATCH
    ROLLBACK TRANSACTION OrdersPTransaction
    END CATCH
	END
