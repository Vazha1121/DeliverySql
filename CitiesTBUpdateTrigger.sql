-- =================================== =============
-- Template generated from Template Explorer using:
-- Create Trigger (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- See additional Create Trigger templates for more
-- examples of different Trigger statements.
--
-- This block of comments will not be included in
-- the definition of the function.
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
CREATE TRIGGER CitiesTB_UPDATE ON CitiesTB
  AFTER UPDATE
   
AS 
BEGIN
	 SET NOCOUNT ON;

	 DECLARE @CityIndex int
	 DECLARE @Action varchar(30)

	 SELECT @CityIndex = INSERTED.CityPostIndex
	 FROM INSERTED

	 IF UPDATE(CityPostIndex)
	    SET @Action = 'Updated City Index'

	 IF UPDATE(CityName)
	    SET @Action = 'Updated City Name'

	 INSERT INTO CitiesTBLogs
	 VALUES(@CityIndex,'Deleted')
END
GO
