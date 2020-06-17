USE [Pits]
GO

/****** Object:  Table [dbo].[Employee]    Script Date: 17-06-2020 15:16:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Employee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[EmployeeName] [varchar](100) NOT NULL,
	[EmployeeDesignationId] [int] NOT NULL,
	[EmployeeSalary] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_EmployeeDesignation] FOREIGN KEY([EmployeeDesignationId])
REFERENCES [dbo].[EmployeeDesignation] ([DesignationId])
GO

ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_EmployeeDesignation]
GO

