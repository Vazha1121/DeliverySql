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
CREATE PROCEDURE UserP 
       @UserID bigint = NULL,
	  
	   @UserFirstName nvarchar(20) = NULL,
	   @UserLastName nvarchar(20) = NULL,
	   @PostIndex int = NULL,

	   @UserTBAction tinyint
	  
AS
BEGIN
     /*User Table*/
     IF @UserTBAction = 0 -- INSERT
	 BEGIN
	      INSERT INTO UsersTB (UserFirstName,UserLastName,PostIndex)
		  VALUES (@UserFirstName,@UserLastName,@PostIndex);
	 END
	 ELSE IF @UserTBAction = 1 -- UPDATE
	 BEGIN 
	      UPDATE UsersTB
		  SET 
		  UserFirstName = ISNULL(@UserFirstName, UserFirstName),
		  UserLastName = ISNULL(@UserLastName, UserLastName),
		  PostIndex = ISNULL(@PostIndex, PostIndex)
		  WHERE UserID = @UserID
	 END
	 ELSE IF @UserTBAction = 2 -- DELETE
	 BEGIN
	      DELETE FROM UsersTB
		  WHERE UserID = @UserID
	 END


	 
END
GO
