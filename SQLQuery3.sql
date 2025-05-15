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
CREATE PROCEDURE OrdersP
     
	 @OrderDue datetime = NULL,
	 @OrderDate datetime = NULL,
	 @TransporterID int = NULL,
	 @GoodID int = NULL,
     @RecieverID bigint = NULL,
     @OrderID int = NULL,
	 @OrdersTBAction tinyint


AS
BEGIN
	/*Cities Table*/
	 IF @OrdersTBAction = 0 -- INSERT
	 BEGIN
	      INSERT INTO OrdersTB (RecieverID, GoodID, TransporterID)
		  VALUES (@RecieverID, @GoodID, @TransporterID);
	 END
	 ELSE IF @OrdersTBAction = 1 -- UPDATE
	 BEGIN 
	      UPDATE OrdersTB
		  SET 
		  RecieverID = ISNULL(@RecieverID, RecieverID),
		  GoodID = ISNULL(@GoodID, GoodID),
		  TransporterID = ISNULL(@TransporterID, TransporterID)
		  WHERE OrderID = @OrderID
	 END
	 ELSE IF @OrdersTBAction = 2 -- DELETE
	 BEGIN
	      DELETE FROM OrdersTB
		  WHERE OrderID = @OrderID
	 END
END
GO
