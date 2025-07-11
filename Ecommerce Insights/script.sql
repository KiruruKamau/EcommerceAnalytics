USE [master]
GO
/****** Object:  Database [EcommerceAnalytics]    Script Date: 7/8/2025 9:11:07 PM ******/
CREATE DATABASE [EcommerceAnalytics]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EcommerceAnalytics', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\EcommerceAnalytics.mdf' , SIZE = 532480KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EcommerceAnalytics_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\EcommerceAnalytics_log.ldf' , SIZE = 466944KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [EcommerceAnalytics] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EcommerceAnalytics].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EcommerceAnalytics] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EcommerceAnalytics] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EcommerceAnalytics] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EcommerceAnalytics] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EcommerceAnalytics] SET ARITHABORT OFF 
GO
ALTER DATABASE [EcommerceAnalytics] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EcommerceAnalytics] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EcommerceAnalytics] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EcommerceAnalytics] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EcommerceAnalytics] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EcommerceAnalytics] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EcommerceAnalytics] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EcommerceAnalytics] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EcommerceAnalytics] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EcommerceAnalytics] SET  ENABLE_BROKER 
GO
ALTER DATABASE [EcommerceAnalytics] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EcommerceAnalytics] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EcommerceAnalytics] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EcommerceAnalytics] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EcommerceAnalytics] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EcommerceAnalytics] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EcommerceAnalytics] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EcommerceAnalytics] SET RECOVERY FULL 
GO
ALTER DATABASE [EcommerceAnalytics] SET  MULTI_USER 
GO
ALTER DATABASE [EcommerceAnalytics] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EcommerceAnalytics] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EcommerceAnalytics] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EcommerceAnalytics] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EcommerceAnalytics] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EcommerceAnalytics] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'EcommerceAnalytics', N'ON'
GO
ALTER DATABASE [EcommerceAnalytics] SET QUERY_STORE = ON
GO
ALTER DATABASE [EcommerceAnalytics] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [EcommerceAnalytics]
GO
/****** Object:  Table [dbo].[clean_customers]    Script Date: 7/8/2025 9:11:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clean_customers](
	[customer_id] [nvarchar](50) NOT NULL,
	[customer_unique_id] [nvarchar](50) NOT NULL,
	[customer_zip_code_prefix] [int] NOT NULL,
	[customer_city] [nvarchar](50) NOT NULL,
	[customer_state] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[clean_geolocation]    Script Date: 7/8/2025 9:11:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clean_geolocation](
	[geolocation_zip_code_prefix] [int] NOT NULL,
	[geolocation_lat] [float] NULL,
	[geolocation_lng] [float] NULL,
	[geolocation_city] [nvarchar](50) NOT NULL,
	[geolocation_state] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[clean_order_items]    Script Date: 7/8/2025 9:11:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clean_order_items](
	[order_id] [nvarchar](50) NOT NULL,
	[order_item_id] [tinyint] NOT NULL,
	[product_id] [nvarchar](50) NOT NULL,
	[seller_id] [nvarchar](50) NOT NULL,
	[shipping_limit_date] [datetime2](7) NOT NULL,
	[price] [float] NOT NULL,
	[freight_value] [float] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[clean_orders]    Script Date: 7/8/2025 9:11:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clean_orders](
	[order_id] [nvarchar](50) NOT NULL,
	[customer_id] [nvarchar](50) NOT NULL,
	[order_status] [nvarchar](50) NOT NULL,
	[order_purchase_timestamp] [datetime2](7) NOT NULL,
	[order_approved_at] [datetime2](7) NULL,
	[order_delivered_carrier_date] [datetime2](7) NULL,
	[order_delivered_customer_date] [datetime2](7) NULL,
	[order_estimated_delivery_date] [datetime2](7) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[clean_payments]    Script Date: 7/8/2025 9:11:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clean_payments](
	[order_id] [nvarchar](50) NOT NULL,
	[payment_sequential] [tinyint] NOT NULL,
	[payment_type] [nvarchar](50) NOT NULL,
	[payment_installments] [tinyint] NOT NULL,
	[payment_value] [float] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[clean_product_category]    Script Date: 7/8/2025 9:11:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clean_product_category](
	[product_category_name] [nvarchar](50) NOT NULL,
	[product_category_name_english] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[clean_products]    Script Date: 7/8/2025 9:11:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clean_products](
	[product_id] [nvarchar](50) NOT NULL,
	[product_category_name] [nvarchar](50) NULL,
	[product_name_lenght] [tinyint] NULL,
	[product_description_lenght] [smallint] NULL,
	[product_photos_qty] [tinyint] NULL,
	[product_weight_g] [int] NULL,
	[product_length_cm] [tinyint] NULL,
	[product_height_cm] [tinyint] NULL,
	[product_width_cm] [tinyint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[clean_reviews]    Script Date: 7/8/2025 9:11:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clean_reviews](
	[review_id] [nvarchar](50) NOT NULL,
	[order_id] [nvarchar](50) NOT NULL,
	[review_score] [tinyint] NOT NULL,
	[review_comment_title] [nvarchar](50) NULL,
	[review_comment_message] [nvarchar](250) NULL,
	[review_creation_date] [datetime2](7) NOT NULL,
	[review_answer_timestamp] [datetime2](7) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[clean_sellers]    Script Date: 7/8/2025 9:11:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clean_sellers](
	[seller_id] [nvarchar](50) NOT NULL,
	[seller_zip_code_prefix] [int] NOT NULL,
	[seller_city] [nvarchar](50) NOT NULL,
	[seller_state] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customer_order_full_summary]    Script Date: 7/8/2025 9:11:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer_order_full_summary](
	[order_id] [nvarchar](50) NOT NULL,
	[customer_id] [nvarchar](50) NOT NULL,
	[customer_unique_id] [nvarchar](50) NULL,
	[customer_city] [nvarchar](50) NULL,
	[customer_state] [nvarchar](50) NULL,
	[order_status] [nvarchar](50) NOT NULL,
	[order_purchase_timestamp] [datetime2](7) NOT NULL,
	[order_delivered_customer_date] [datetime2](7) NULL,
	[delivery_days] [int] NULL,
	[delivery_late_by_days] [int] NULL,
	[product_id] [nvarchar](50) NOT NULL,
	[product_category_name] [nvarchar](50) NULL,
	[product_category_name_english] [nvarchar](50) NULL,
	[price] [float] NOT NULL,
	[freight_value] [float] NOT NULL,
	[seller_id] [nvarchar](50) NULL,
	[seller_city] [nvarchar](50) NULL,
	[seller_state] [nvarchar](50) NULL,
	[payment_type] [nvarchar](50) NULL,
	[payment_installments] [tinyint] NULL,
	[payment_value] [float] NULL,
	[review_score] [tinyint] NULL,
	[review_comment_title] [nvarchar](50) NULL,
	[review_comment_message] [nvarchar](250) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customer_order_summary]    Script Date: 7/8/2025 9:11:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer_order_summary](
	[order_id] [nvarchar](50) NOT NULL,
	[customer_id] [nvarchar](50) NOT NULL,
	[order_status] [nvarchar](50) NOT NULL,
	[order_purchase_timestamp] [datetime2](7) NOT NULL,
	[order_delivered_customer_date] [datetime2](7) NULL,
	[delivery_days] [int] NULL,
	[product_id] [nvarchar](50) NOT NULL,
	[product_category_name] [nvarchar](50) NULL,
	[product_category_name_english] [nvarchar](50) NULL,
	[price] [float] NOT NULL,
	[freight_value] [float] NOT NULL,
	[payment_type] [nvarchar](50) NULL,
	[payment_installments] [tinyint] NULL,
	[payment_value] [float] NULL,
	[review_score] [tinyint] NULL,
	[review_comment_title] [nvarchar](50) NULL,
	[review_comment_message] [nvarchar](250) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customers]    Script Date: 7/8/2025 9:11:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customers](
	[customer_id] [nvarchar](50) NOT NULL,
	[customer_unique_id] [nvarchar](50) NOT NULL,
	[customer_zip_code_prefix] [int] NOT NULL,
	[customer_city] [nvarchar](50) NOT NULL,
	[customer_state] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[geolocation]    Script Date: 7/8/2025 9:11:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[geolocation](
	[geolocation_zip_code_prefix] [int] NOT NULL,
	[geolocation_lat] [float] NULL,
	[geolocation_lng] [float] NULL,
	[geolocation_city] [nvarchar](50) NOT NULL,
	[geolocation_state] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order items]    Script Date: 7/8/2025 9:11:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order items](
	[order_id] [nvarchar](50) NOT NULL,
	[order_item_id] [tinyint] NOT NULL,
	[product_id] [nvarchar](50) NOT NULL,
	[seller_id] [nvarchar](50) NOT NULL,
	[shipping_limit_date] [datetime2](7) NOT NULL,
	[price] [float] NOT NULL,
	[freight_value] [float] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 7/8/2025 9:11:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[order_id] [nvarchar](50) NOT NULL,
	[customer_id] [nvarchar](50) NOT NULL,
	[order_status] [nvarchar](50) NOT NULL,
	[order_purchase_timestamp] [datetime2](7) NOT NULL,
	[order_approved_at] [datetime2](7) NULL,
	[order_delivered_carrier_date] [datetime2](7) NULL,
	[order_delivered_customer_date] [datetime2](7) NULL,
	[order_estimated_delivery_date] [datetime2](7) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[payments]    Script Date: 7/8/2025 9:11:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payments](
	[order_id] [nvarchar](50) NOT NULL,
	[payment_sequential] [tinyint] NOT NULL,
	[payment_type] [nvarchar](50) NOT NULL,
	[payment_installments] [tinyint] NOT NULL,
	[payment_value] [float] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product category]    Script Date: 7/8/2025 9:11:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product category](
	[product_category_name] [nvarchar](50) NOT NULL,
	[product_category_name_english] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 7/8/2025 9:11:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[product_id] [nvarchar](50) NOT NULL,
	[product_category_name] [nvarchar](50) NULL,
	[product_name_lenght] [tinyint] NULL,
	[product_description_lenght] [smallint] NULL,
	[product_photos_qty] [tinyint] NULL,
	[product_weight_g] [int] NULL,
	[product_length_cm] [tinyint] NULL,
	[product_height_cm] [tinyint] NULL,
	[product_width_cm] [tinyint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[reviews]    Script Date: 7/8/2025 9:11:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reviews](
	[review_id] [nvarchar](50) NOT NULL,
	[order_id] [nvarchar](50) NOT NULL,
	[review_score] [tinyint] NOT NULL,
	[review_comment_title] [nvarchar](50) NULL,
	[review_comment_message] [nvarchar](250) NULL,
	[review_creation_date] [datetime2](7) NOT NULL,
	[review_answer_timestamp] [datetime2](7) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sellers]    Script Date: 7/8/2025 9:11:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sellers](
	[seller_id] [nvarchar](50) NOT NULL,
	[seller_zip_code_prefix] [int] NOT NULL,
	[seller_city] [nvarchar](50) NOT NULL,
	[seller_state] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [EcommerceAnalytics] SET  READ_WRITE 
GO
