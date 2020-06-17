USE [Pits]
GO

/****** Object:  Table [dbo].[EmployeeAddress]    Script Date: 17-06-2020 15:17:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[EmployeeAddress](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[EmployeeAddress] [varchar](200) NOT NULL,
	[AddressTypeId] [int] NOT NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[EmployeeAddress]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeAddress_Employee] FOREIGN KEY([AddressTypeId])
REFERENCES [dbo].[EmployeeAddressType] ([AddressTypeId])
GO

ALTER TABLE [dbo].[EmployeeAddress] CHECK CONSTRAINT [FK_EmployeeAddress_Employee]
GO

