USE [DeliveryDB]
GO
/****** Object:  StoredProcedure [dbo].[TransporterP]    Script Date: 5/17/2025 1:36:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[TransporterP]
     @TransporterID int = NULL,
	 @TransporterName nvarchar(40) = NULL,
	 @TransporterTBAction tinyint

     
AS
BEGIN
 BEGIN TRANSACTION TransporterPTransaction
 SAVE TRANSACTION TransporterPTransaction

  BEGIN TRY
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
  END TRY
  BEGIN CATCH
    ROLLBACK TRANSACTION TransporterPTransaction
  END CATCH
END
GO

