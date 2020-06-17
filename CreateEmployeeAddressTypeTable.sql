USE [Pits]
GO

/****** Object:  Table [dbo].[EmployeeAddressType]    Script Date: 17-06-2020 15:18:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[EmployeeAddressType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AddressTypeId] [int] NOT NULL,
	[AddressType] [varchar](50) NOT NULL,
 CONSTRAINT [PK_EmployeeAddressType] PRIMARY KEY CLUSTERED 
(
	[AddressTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

