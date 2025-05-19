 --================================================
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
CREATE PROCEDURE GoodsP
    
	 @GoodID int = NULL,
	 @GoodName nvarchar(20) = NULL,
	 @Quantity bigint = NULL,
	 @Price int = NULL,
	 @GoodsTBAction tinyint

AS
BEGIN
   IF @GoodsTBAction = 0 -- INSERT
	 BEGIN
	      INSERT INTO GoodsTB (GoodName, Quantity, Price)
		  VALUES (@GoodName, @Quantity, @Price);
	 END
	 ELSE IF @GoodsTBAction = 1 -- UPDATE
	 BEGIN 
	      UPDATE GoodsTB
		  SET 
		  GoodName = ISNULL(@GoodName, GoodName),
		  Quantity = ISNULL(@Quantity, Quantity),
		  Price = ISNULL(@Price, Price)
		  WHERE GoodID = @GoodID
	 END
	 ELSE IF @GoodsTBAction = 2 -- DELETE
	 BEGIN
	      DELETE FROM GoodsTB
		  WHERE GoodID = @GoodID
	 END
END
GO
