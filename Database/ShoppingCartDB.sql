USE [master]
GO
/****** Object:  Database [ShoppingCartDB]    Script Date: 01/08/2015 20:10:42 ******/
CREATE DATABASE [ShoppingCartDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ShoppingCartDB', FILENAME = N'C:\DataBases\ShoppingCartDB.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ShoppingCartDB_log', FILENAME = N'C:\DataBases\ShoppingCartDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ShoppingCartDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShoppingCartDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShoppingCartDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShoppingCartDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShoppingCartDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShoppingCartDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShoppingCartDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShoppingCartDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ShoppingCartDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShoppingCartDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShoppingCartDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShoppingCartDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShoppingCartDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShoppingCartDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShoppingCartDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShoppingCartDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShoppingCartDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ShoppingCartDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShoppingCartDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShoppingCartDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShoppingCartDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShoppingCartDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShoppingCartDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShoppingCartDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShoppingCartDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ShoppingCartDB] SET  MULTI_USER 
GO
ALTER DATABASE [ShoppingCartDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShoppingCartDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShoppingCartDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShoppingCartDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ShoppingCartDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [ShoppingCartDB]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 01/08/2015 20:10:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CustomerDetails]    Script Date: 01/08/2015 20:10:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CustomerDetails](
	[id] [int] IDENTITY(1,2) NOT NULL,
	[Customername] [varchar](100) NULL,
	[CustomerEmailID] [varchar](100) NULL,
	[CustomerPhoneNo] [varchar](10) NULL,
	[CustomerAddress] [varchar](500) NULL,
	[TotalProducts] [int] NULL,
	[TotalPrice] [int] NULL,
	[OrderDatetime] [datetime] NULL DEFAULT (getdate()),
	[PaymentMethod] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CustomerProducts]    Script Date: 01/08/2015 20:10:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerProducts](
	[CustomerID] [int] NULL,
	[ProductID] [int] NULL,
	[TotalProduct] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[products]    Script Date: 01/08/2015 20:10:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](500) NULL,
	[Description] [varchar](1000) NULL,
	[Price] [varchar](50) NULL,
	[ImageUrl] [varchar](500) NULL,
	[CategoryID] [int] NULL,
	[ProductQuantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[SP_AddNewCategory]    Script Date: 01/08/2015 20:10:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_AddNewCategory]
(
@CategoryName varchar(200)
)
AS 
	BEGIN
		
		BEGIN TRY
			
			insert into Category
			values (@CategoryName)
		
		END TRY
		
		BEGIN CATCH
		
		PRINT( 'Error occured')
		
		END CATCH
	END



GO
/****** Object:  StoredProcedure [dbo].[SP_AddNewProduct]    Script Date: 01/08/2015 20:10:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_AddNewProduct]
(
@ProductName varchar(300),
@ProductPrice int,
@ProductImage varchar(500),
@ProductDescription varchar(1000),
@CategoryID int,
@ProductQuantity int
)
AS 
	BEGIN
		
		BEGIN TRY
			
			insert into products
			values 
			(@ProductName,
			@ProductDescription,
			@ProductPrice,
			@ProductImage,
			@CategoryID,
			@ProductQuantity
			)
		
		END TRY
		
		BEGIN CATCH
		
		PRINT( 'Error occured')
		
		END CATCH
	END



GO
/****** Object:  StoredProcedure [dbo].[SP_GetAllCategories]    Script Date: 01/08/2015 20:10:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_GetAllCategories]

AS 
	BEGIN
		
		BEGIN TRY
			
			select * from Category
		
		END TRY
		
		BEGIN CATCH
		
		PRINT( 'Error occured')
		
		END CATCH
	END



GO
/****** Object:  StoredProcedure [dbo].[SP_GetAllProducts]    Script Date: 01/08/2015 20:10:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[SP_GetAllProducts] (@CategoryID int)

AS 
	BEGIN
		
	 
	  
		BEGIN TRY
		   if(@CategoryID <>0)
				BEGIN
							select *
								  from(select p.CategoryId,
											  p.ProductID,
											  p.Name,
											  p.Price,
											  p.ImageUrl,
											  c.CategoryName,
											  p.ProductQuantity,
											  ISNULL(sum(cp.TotalProduct),0) as ProductSold,
											  ( p.ProductQuantity - ISNULL(sum(cp.TotalProduct),0)) as AvailableStock
										from products p
											  inner join Category c
													on c.CategoryID=p.CategoryID
											  left join CustomerProducts cp
													on cp.ProductID=p.ProductID
										group by p.ProductID,
												 p.Name,
												 p.Price,
												 p.ImageUrl,
												 c.CategoryName,
												 p.ProductQuantity,
												 p.CategoryID)	 StockTable
							where AvailableStock>0 
								  and CategoryID=@CategoryID			
				END
		   ELSE
				BEGIN
							select *
								  from(select p.CategoryId,
											  p.ProductID,
											  p.Name,
											  p.Price,
											  p.ImageUrl,
											  c.CategoryName,
											  p.ProductQuantity,
											  ISNULL(sum(cp.TotalProduct),0) as ProductSold,
											  ( p.ProductQuantity - ISNULL(sum(cp.TotalProduct),0)) as AvailableStock
										from products p
											  inner join Category c
													on c.CategoryID=p.CategoryID
											  left join CustomerProducts cp
													on cp.ProductID=p.ProductID
										group by p.ProductID,
												 p.Name,
												 p.Price,
												 p.ImageUrl,
												 c.CategoryName,
												 p.ProductQuantity,
												 p.CategoryID)	 StockTable
							where AvailableStock>0
				END
		END TRY
		
		BEGIN CATCH
		
		PRINT( 'Error occured')
		
		END CATCH
	END



GO
/****** Object:  StoredProcedure [dbo].[SP_GetAvailableStock]    Script Date: 01/08/2015 20:10:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[SP_GetAvailableStock]
(
@StockType int,
@CategoryID int
)
AS 
	BEGIN
		
		BEGIN TRY
			
			DECLARE @StartRange int
			DECLARE @EndRange int

			IF(@StockType = 0)
			begin
				SET @StartRange=0
				SET @EndRange=0
			end

			IF(@StockType = 1)
			begin
				SET @StartRange=1
				SET @EndRange=10
			end

			IF(@StockType = 2)
			begin
				SET @StartRange=11
				SET @EndRange=10000
			end

			IF(@CategoryID = 0)
			begin
				select * 
				from (select  P.Name,
							  P.Price,
							  P.ImageUrl,
							  C.CategoryName,
							  ISNULL(sum(CP.TotalProduct),0) as ProductSold,
							  (P.ProductQuantity - ISNULL(sum(CP.TotalProduct),0) ) AS AvailableStock
					 from products P
						INNER JOIN Category C
							ON C.CategoryID=P.CategoryID
						LEFT JOIN CustomerProducts CP
							ON CP.ProductID=P.ProductID
					group by CP.ProductID,
							 p.Name,
							 p.Price,
							 p.ImageUrl,
							 c.CategoryName,
							 p.ProductQuantity) StockTable
				where AvailableStock between @StartRange and @EndRange
			end
		  else
			begin
				select * 
				from (select  P.Name,
							  P.Price,
							  P.ImageUrl,
							  C.CategoryName,
							  ISNULL(sum(CP.TotalProduct),0) as ProductSold,
							  (P.ProductQuantity - ISNULL(sum(CP.TotalProduct),0) ) AS AvailableStock
					 from products P
						INNER JOIN Category C
							ON C.CategoryID=P.CategoryID
						LEFT JOIN CustomerProducts CP
							ON CP.ProductID=P.ProductID
					where C.CategoryID=@CategoryID
					group by cP.ProductID,
							 P.Name,
							 P.Price,
							 P.ImageUrl,
							 C.CategoryName,
							 P.ProductQuantity) StockTable
				where AvailableStock between @StartRange and @EndRange
								
			end



		
		END TRY
		
		BEGIN CATCH
		
		PRINT( 'Error occured')
		
		END CATCH
	END



GO
/****** Object:  StoredProcedure [dbo].[SP_GetIncomeReport]    Script Date: 01/08/2015 20:10:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[SP_GetIncomeReport]
(
@ReportType int
)
AS 
	BEGIN
		
		BEGIN TRY
		Declare @Month int
		Declare @Today int
		Declare @Year int

		Select @Today =DAY(GETDATE()),@Month=MONTH(GETDATE()),@Year=YEAR(GETDATE())
			
		if(@ReportType=1)
		begin
			select * from (select *,DAY(OrderDatetime) as TodayDay, MONTH(OrderDatetime) as ThisMonth, YEAR(OrderDatetime) as ThisYear
			from CustomerDetails) IncomeTable where TodayDay=@Today and ThisMonth=@Month and ThisYear=@Year
		end
		
		if(@ReportType=2)
		begin
			select * from (select *,DAY(OrderDatetime) as TodayDay, MONTH(OrderDatetime) as ThisMonth, YEAR(OrderDatetime) as ThisYear
			from CustomerDetails) IncomeTable where ThisMonth=@Month and ThisYear=@Year
		end

		if(@ReportType=3)
		begin
			select * from (select *,DAY(OrderDatetime) as TodayDay, MONTH(OrderDatetime) as ThisMonth, YEAR(OrderDatetime) as ThisYear
			from CustomerDetails) IncomeTable where ThisYear=@Year
		end
		
		END TRY
		
		BEGIN CATCH
		
		PRINT( 'Error occured')
		
		END CATCH
	END



GO
/****** Object:  StoredProcedure [dbo].[SP_GetOrderList]    Script Date: 01/08/2015 20:10:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[SP_GetOrderList]
(
@Flag int
)
AS 
	BEGIN
		
		BEGIN TRY
			
			if(@Flag<>0)
			begin
				select * 
				from CustomerDetails where id=@Flag
			end
			else
			begin
				select * 
				from CustomerDetails
			end
			select * from Category
		
		END TRY
		
		BEGIN CATCH
		
		PRINT( 'Error occured')
		
		END CATCH
	END



GO
/****** Object:  StoredProcedure [dbo].[SP_SaveCustomerDetails]    Script Date: 01/08/2015 20:10:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_SaveCustomerDetails]
(
@CustomerName varchar(100),
@CustomerEmailID varchar(100),
@CustomerPhoneNo varchar(10),
@CustomerAddress varchar(500),
@TotalProduct int,
@TotalPrice int,
@PaymentMethod varchar(100))
AS 
	BEGIN
		
		BEGIN TRY
			
			insert into CustomerDetails(Customername,CustomerEmailID,CustomerPhoneNo,CustomerAddress,TotalProducts,TotalPrice,PaymentMethod)
								 values(@CustomerName,@CustomerEmailID,@CustomerPhoneNo,@CustomerAddress,@TotalProduct,@TotalPrice,@PaymentMethod)
	
			select @@IDENTITY as CustomerID
		
		END TRY
		
		BEGIN CATCH
		
		PRINT( 'Error occured')
		
		END CATCH
	END



GO
/****** Object:  StoredProcedure [dbo].[SP_SaveCustomerProducts]    Script Date: 01/08/2015 20:10:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[SP_SaveCustomerProducts]
(
@CustomerID int,
@ProductID int,
@TotalProduct int)
AS 
	BEGIN
		
		BEGIN TRY
			
			insert into CustomerProducts(CustomerID,ProductID,TotalProduct)
			values(@CustomerID,@ProductID,@TotalProduct)
	
			select @@IDENTITY as CustomerID
		
		END TRY
		
		BEGIN CATCH
		
		PRINT( 'Error occured')
		
		END CATCH
	END



GO
USE [master]
GO
ALTER DATABASE [ShoppingCartDB] SET  READ_WRITE 
GO
