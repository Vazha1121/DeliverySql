USE [DeliveryDB]
GO
/****** Object:  StoredProcedure [dbo].[UserP]    Script Date: 5/18/2025 10:30:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[UserP] 
       @UserID bigint = NULL,
	   @UserFirstName nvarchar(20) = NULL,
	   @UserLastName nvarchar(20) = NULL,
	   @PostIndex int = NULL,
	   @UserTBAction tinyint
AS
BEGIN
   BEGIN TRANSACTION UserPTransaction
    SAVE TRANSACTION UserPTransaction

     BEGIN TRY
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
	 END TRY
    BEGIN CATCH
    ROLLBACK TRANSACTION UserPTransaction
    END CATCH
END
