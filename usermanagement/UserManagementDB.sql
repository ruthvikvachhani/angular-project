USE [KamKaaj]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 17-04-2021 12:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [bigint] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](100) NULL,
	[LastName] [nvarchar](100) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[Delete_Users]    Script Date: 17-04-2021 12:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================    
-- Author:  <Author,,Name>    
-- Create date: <Create Date,,>    
-- Description: <Description,,>    
-- =============================================    
CREATE PROCEDURE [dbo].[Delete_Users]  
 -- Add the parameters for the stored procedure here    
 @UserId BIGINT,  
 @Code INT OUTPUT,     
 @Message VARCHAR(MAX) OUTPUT    
AS    
BEGIN    
 -- SET NOCOUNT ON added to prevent extra result sets from    
 -- interfering with SELECT statements.    
 SET NOCOUNT ON;    
 DECLARE @lUserId BIGINT = @UserId,  
   @FirstName NVARCHAR(100),  
   @LastName NVARCHAR(100);  
    
  SELECT @FirstName = FirstName,  
   @LastName = LastName  
  FROM Users  
  WHERE UserId = @lUserId  
  
    -- Insert statements for procedure here    
 DELETE FROM Users  
 WHERE UserId = @lUserId  
  
 SELECT @lUserId AS UserId,  
  @FirstName AS FirstName,  
  @LastName AS LastName  
    
 SET @Code = 200  
 SET @Message = 'User Deleted Successfully'  
END 
GO
/****** Object:  StoredProcedure [dbo].[Get_Users]    Script Date: 17-04-2021 12:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================  
-- Author:  <Author,,Name>  
-- Create date: <Create Date,,>  
-- Description: <Description,,>  
-- =============================================  
CREATE PROCEDURE [dbo].[Get_Users]  
 -- Add the parameters for the stored procedure here  
 @UserId BIGINT = NULL,
 @Code INT OUTPUT,   
 @Message VARCHAR(MAX) OUTPUT  
AS  
BEGIN  
 -- SET NOCOUNT ON added to prevent extra result sets from  
 -- interfering with SELECT statements.  
 SET NOCOUNT ON;  
 DECLARE @lUserId BIGINT = @UserId;
  
    -- Insert statements for procedure here  
 SELECT * FROM Users  
 WHERE UserId = ISNULL(@lUserId,UserId)
  
 SET @Code = 200  
END  
GO
/****** Object:  StoredProcedure [dbo].[Insert_Users]    Script Date: 17-04-2021 12:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================    
-- Author:  <Author,,Name>    
-- Create date: <Create Date,,>    
-- Description: <Description,,>    
-- =============================================    
CREATE PROCEDURE [dbo].[Insert_Users]    
 -- Add the parameters for the stored procedure here    
 @FirstName NVARCHAR(100) = NULL,  
 @LastName NVARCHAR(100) = NULL,  
 @Code INT OUTPUT,     
 @Message VARCHAR(MAX) OUTPUT    
AS    
BEGIN    
 -- SET NOCOUNT ON added to prevent extra result sets from    
 -- interfering with SELECT statements.    
 SET NOCOUNT ON;    
 DECLARE @lFirstName NVARCHAR(100) = @FirstName,  
   @lLastName NVARCHAR(100) = @LastName;  
    
    -- Insert statements for procedure here    
 INSERT INTO Users  
 (FirstName, LastName)  
 VALUES  
 (@lFirstName, @lLastName)  
  
 SELECT * FROM Users WHERE UserId = SCOPE_IDENTITY()  
    
 SET @Code = 201  
 SET @Message = 'User Inserted Successfully'  
END 
GO
/****** Object:  StoredProcedure [dbo].[Update_Users]    Script Date: 17-04-2021 12:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================      
-- Author:  <Author,,Name>      
-- Create date: <Create Date,,>      
-- Description: <Description,,>      
-- =============================================      
CREATE PROCEDURE [dbo].[Update_Users]      
 -- Add the parameters for the stored procedure here      
 @FirstName NVARCHAR(100) = NULL,    
 @LastName NVARCHAR(100) = NULL,    
 @UserId BIGINT,    
 @Code INT OUTPUT,       
 @Message VARCHAR(MAX) OUTPUT      
AS      
BEGIN      
 -- SET NOCOUNT ON added to prevent extra result sets from      
 -- interfering with SELECT statements.      
 SET NOCOUNT ON;      
 DECLARE @lFirstName NVARCHAR(100) = @FirstName,    
   @lLastName NVARCHAR(100) = @LastName,    
   @lUserId BIGINT = @UserId;    
      
    -- Insert statements for procedure here      
 UPDATE Users    
 SET FirstName = ISNULL(@lFirstName, FirstName),    
  LastName = ISNULL(@lLastName, LastName)    
 WHERE UserId = @lUserId    
    
 SELECT * FROM Users WHERE UserId = @UserId  
      
 SET @Code = 200    
 SET @Message = 'User Updated Successfully'    
END 
GO
