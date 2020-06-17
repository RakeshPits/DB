
-- Select All
select *
from 
[dbo].[Employee] E 
Inner Join [dbo].[EmployeeAddress] A ON E.EmployeeId = A.EmployeeId
Inner Join [dbo].[EmployeeAddressType] AdT ON A.AddressTypeId = AdT.AddressTypeId
Inner Join [dbo].[EmployeeDesignation] Ed ON E.EmployeeDesignationId = Ed.DesignationId

-- Select Particular

select E.Id,E.EmployeeName,A.EmployeeAddress,AdT.AddressType,Ed.Designation,E.EmployeeSalary 
from 
[dbo].[Employee] E 
Inner Join [dbo].[EmployeeAddress] A ON E.EmployeeId = A.EmployeeId
Inner Join [dbo].[EmployeeAddressType] AdT ON A.AddressTypeId = AdT.AddressTypeId
Inner Join [dbo].[EmployeeDesignation] Ed ON E.EmployeeDesignationId = Ed.DesignationId

-- create view
CREATE VIEW EmployeeView AS

select E.Id,E.EmployeeName,A.EmployeeAddress,AdT.AddressType,Ed.Designation,E.EmployeeSalary 
from 
[dbo].[Employee] E 
Inner Join [dbo].[EmployeeAddress] A ON E.EmployeeId = A.EmployeeId
Inner Join [dbo].[EmployeeAddressType] AdT ON A.AddressTypeId = AdT.AddressTypeId
Inner Join [dbo].[EmployeeDesignation] Ed ON E.EmployeeDesignationId = Ed.DesignationId

-- select view
select * from EmployeeView

-- Update view
UPDATE EmployeeView SET EmployeeSalary = 60000 where Id = 1

-- subquery
select EmployeeName,Designation,EmployeeSalary from(
select E.Id,E.EmployeeName,Ed.Designation,E.EmployeeSalary 
from 
[dbo].[Employee] E 
Inner Join [dbo].[EmployeeDesignation] Ed ON E.EmployeeDesignationId = Ed.DesignationId
) as E where EmployeeSalary > 30000

-- CTE
with CteEmployeeSalary(EmployeeName,Designation,EmployeeSalary) As
(
select E.EmployeeName,Ed.Designation,E.EmployeeSalary 
from 
[dbo].[Employee] E 
Inner Join [dbo].[EmployeeDesignation] Ed ON E.EmployeeDesignationId = Ed.DesignationId
)
select * from CteEmployeeSalary where EmployeeSalary > 30000

-- Table Variable
Declare @EmployeeSalary Table
(
	SNo INT IDENTITY(1,1),
	EmployeeName varchar(100),
	Designation varchar(100),
	EmployeeSalary decimal(18,2)
)

insert into @EmployeeSalary
select E.EmployeeName,Ed.Designation,E.EmployeeSalary 
from 
[dbo].[Employee] E 
Inner Join [dbo].[EmployeeDesignation] Ed ON E.EmployeeDesignationId = Ed.DesignationId

select * from @EmployeeSalary

-- Local Temp Table
create Table #TempEmployeeSalry
(
	SNo INT IDENTITY(1,1),
	EmployeeName varchar(100),
	Designation varchar(100),
	EmployeeSalary decimal(18,2)
)

insert into #TempEmployeeSalry
select E.EmployeeName,Ed.Designation,E.EmployeeSalary 
from 
[dbo].[Employee] E 
Inner Join [dbo].[EmployeeDesignation] Ed ON E.EmployeeDesignationId = Ed.DesignationId

select * from #TempEmployeeSalry
insert into #TempEmployeeSalry values ('Employee4', 'JSE', 20000)
update #TempEmployeeSalry set EmployeeSalary = 22000 where SNo = 4
delete from #TempEmployeeSalry where SNo = 4
drop table #TempEmployeeSalry

-- global temp table

create Table ##TempEmployeeSalry
(
	SNo INT IDENTITY(1,1),
	EmployeeName varchar(100),
	Designation varchar(100),
	EmployeeSalary decimal(18,2)
)

insert into ##TempEmployeeSalry
select E.EmployeeName,Ed.Designation,E.EmployeeSalary 
from 
[dbo].[Employee] E 
Inner Join [dbo].[EmployeeDesignation] Ed ON E.EmployeeDesignationId = Ed.DesignationId

select * from ##TempEmployeeSalry
insert into ##TempEmployeeSalry values ('Employee4', 'JSE', 20000)
update ##TempEmployeeSalry set EmployeeSalary = 22000 where SNo = 4
delete from ##TempEmployeeSalry where SNo = 4
drop table ##TempEmployeeSalry