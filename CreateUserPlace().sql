-- ================================================
-- Template generated from Template Explorer using:
-- Create Inline Function (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
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
CREATE FUNCTION UserPlace()
RETURNS TABLE 
AS
RETURN 
(
	SELECT 
    u.UserFirstName,
    u.UserLastName,
    u.PostIndex,
    c.CityName
    FROM UsersTB u
    JOIN CitiesTB c on u.PostIndex = c.CityPostIndex
)
GO
