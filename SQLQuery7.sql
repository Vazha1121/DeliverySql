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
CREATE PROCEDURE TransporterP
     @TransporterID int = NULL,
	 @TransporterName nvarchar(20) = NULL,
	 @TransporterTBAction tinyint

     
AS
BEGIN
	 IF @TransporterTBAction = 0 -- INSERT
	 BEGIN
	      INSERT INTO TransporterTB (TransporterName)
		  VALUES (@TransporterName);
	 END
	 ELSE IF @TransporterTBAction = 1 -- UPDATE
	 BEGIN 
	      UPDATE TransporterTB
		  SET 
		  TransporterName = ISNULL(@TransporterName, TransporterName)
		  WHERE TransporterID = @TransporterID
	 END
	 ELSE IF @TransporterTBAction = 2 -- DELETE
	 BEGIN
	      DELETE FROM TransporterTB
		  WHERE TransporterID = @TransporterID
	 END
END
GO
