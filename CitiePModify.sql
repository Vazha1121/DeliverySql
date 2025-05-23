USE [DeliveryDB]
GO
/****** Object:  StoredProcedure [dbo].[CitiesP]    Script Date: 5/18/2025 10:27:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[CitiesP]

       @CityID int = NULL,

	   @CityName nvarchar(20) = NULL,
	   @CityPostIndex int = NULL,

	   @CitiesTBAction tinyint
AS
BEGIN
	BEGIN TRANSACTION CitiesPTransaction
    SAVE TRANSACTION CitiesPTransaction

     BEGIN TRY
	 IF @CitiesTBAction = 0 -- INSERT
	 BEGIN
	      INSERT INTO CitiesTB (CityName,CityPostIndex)
		  VALUES (@CityName,@CityPostIndex);
	 END
	 ELSE IF @CitiesTBAction = 1 -- UPDATE
	 BEGIN 
	      UPDATE CitiesTB
		  SET 
		  CityName = ISNULL(@CityName, CityName),
		  CityPostIndex = ISNULL(@CityPostIndex, CityPostIndex)
		  WHERE CityID = @CityID
	 END
	 ELSE IF @CitiesTBAction = 2 -- DELETE
	 BEGIN
	      DELETE FROM CitiesTB
		  WHERE CityID = @CityID
	 END
	 END TRY
    BEGIN CATCH
    ROLLBACK TRANSACTION CitiesPTransaction
    END CATCH
END
