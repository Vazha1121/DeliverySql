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
CREATE PROCEDURE CitiesP

       @CityID int = NULL,

	   @CityName nvarchar(20) = NULL,
	   @CityPostIndex int = NULL,

	   @CitiesTBAction tinyint
AS
BEGIN
	/*Cities Table*/
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
END
GO
