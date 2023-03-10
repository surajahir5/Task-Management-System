USE [taskms]
GO
/****** Object:  Table [dbo].[emptask]    Script Date: 3/2/2023 3:47:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[emptask](
	[taskid] [int] IDENTITY(1,1) NOT NULL,
	[department] [varchar](50) NULL,
	[name] [varchar](50) NULL,
	[tpriority] [varchar](50) NULL,
	[title] [varchar](50) NULL,
	[tdescription] [varchar](100) NULL,
	[std] [varchar](50) NULL,
	[etd] [varchar](50) NULL,
	[status] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[regitser]    Script Date: 3/2/2023 3:47:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[regitser](
	[Empid] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[contact] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[department] [varchar](50) NULL,
	[password] [varchar](50) NULL,
	[usertype] [varchar](50) NULL,
	[image] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[taskemp]    Script Date: 3/2/2023 3:47:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[taskemp] (
@taskid int=0,
@department varchar(50)=null,
@name varchar(50)=null,
@tpriority varchar(50)=null,
@title varchar(50)=null,
@tdescription varchar(100)=null,
@std varchar(50)=null,
@etd varchar(50)=null,
@toodate varchar(50)=null,
@status varchar(50)=null,
@Action varchar(50))
as
begin if @Action='inserttask'
begin
insert into emptask values (@department,@name,@tpriority,@title,@tdescription,@std,@etd,@status)
end

begin if @Action='taskstatus'
select * from emptask
end
begin if @Action='editemptask'
select * from emptask where taskid=@taskid
end
begin  SET NOCOUNT ON;
if @Action='reportdate'
select * from emptask where @std <= std and @etd >= etd and name IS NOT NULL
end

begin if @Action='tasktotal'
select COUNT(*) from emptask
end
begin if @Action='CountStatus'
select COUNT(status) from emptask where status=@status
end
begin if @Action='fatchStatus'
select * from emptask where status=@status
end
begin if @Action='showemptask'
select * from emptask where name=@name 
end
begin if @Action='upsstask'
update emptask set status=@status where taskid=@taskid
end
begin if @Action='usertasktotal'
select COUNT(*) from emptask where name=@name
end
begin if @Action='countstatususer'
select COUNT(status) from emptask where status=@status and name=@name
end
begin if @Action='fatchusertask'
select * from emptask where status=@status and name=@name
end
begin if @Action='statusreport'
select emptask.department,emptask.name,emptask.tpriority,emptask.title,emptask.tdescription,emptask.std,emptask.etd,emptask.status,regitser.image from regitser INNER JOIN emptask on emptask.name=regitser.name where taskid=@taskid
end
begin if @Action='chart'
select COUNT(department) from regitser where department=@department
end
end
GO
/****** Object:  StoredProcedure [dbo].[userreg]    Script Date: 3/2/2023 3:47:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[userreg](
@Empid int=0,
@name varchar(50)=null,
@contact varchar(50)=null,
@email varchar(50)=null,
@department varchar(50)=null,
@password varchar(50)=null,
@usertype varchar(50)=null,
@image varchar(max)=null,
@Action varchar(50))
as
begin if @Action='Insert' 
begin
insert into regitser values(@name,@contact,@email,@department,@password,@usertype,@image)
end
begin if @Action='login'
select * from regitser where email=@email and password=@password 
end
begin if @Action='getuser'
select * from regitser where Empid!=@Empid
end
begin if @Action='pass'
update regitser set password=@password where Empid=@Empid
end
begin if @Action='admnupdate'
update regitser set name=@name,contact=@contact,email=@email,image=@image where Empid=@Empid
end
begin if @Action='show'
select name,contact,email,image from regitser where Empid=@Empid
end
begin if @Action='showdpmt'
select DISTINCT (department) from regitser
end
begin if @Action='admimnbyup'
update regitser set name=@name,contact=@contact,email=@email,department=@department,image=@image where Empid=@Empid
end
begin if @Action='Dashtotalemp'
select COUNT(*) as Empid from regitser
end
begin if @Action='chart'
select COUNT(department) from emptask where department=@department
end
end
GO
