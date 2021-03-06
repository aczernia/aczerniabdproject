CREATE TABLE dbo.Address(
	WorkshopId int NOT NULL PRIMARY KEY,
	CityId int NOT NULL,
	AddressLine1 nvarchar(50) NOT NULL,
	AddressLine2 nvarchar(50) NOT NULL,
	Latitude float NULL,
	Longitude float NULL,
)

CREATE TABLE dbo.City(
	Id int NOT NULL PRIMARY KEY IDENTITY(1,1),
	Name nvarchar(300) NULL,
)

CREATE TABLE dbo.[Role](
	Id int NOT NULL PRIMARY KEY IDENTITY(1,1),
	Name nvarchar(200) NOT NULL,
)

CREATE TABLE dbo.ServiceType(
	Id int NOT NULL PRIMARY KEY IDENTITY(1,1),
	Name nvarchar(200) NOT NULL,
)

CREATE TABLE dbo.[User](
	Id int NOT NULL PRIMARY KEY IDENTITY(1,1),
	Username nvarchar(200) NOT NULL,
	FirstName nvarchar(50) NULL,
	LastName nvarchar(50) NULL,
	PhoneNumber nvarchar(20) NOT NULL,
	EmailAddress nvarchar(40) NOT NULL,
	PasswordHash nvarchar(200) NOT NULL,
	RoleId int NOT NULL,
	DateAdded nchar(10) NOT NULL,
	IsActive bit NOT NULL,
)


CREATE TABLE dbo.Visit(
	Id int NOT NULL PRIMARY KEY IDENTITY(1,1),
	ServiceTypeId int NOT NULL,
	WorkshopId int NOT NULL,
	UserId int NOT NULL,
	Price float NULL,
	VisitDate datetime NOT NULL,
)


CREATE TABLE dbo.VisitStatus(
	Id int NOT NULL PRIMARY KEY IDENTITY(1,1),
	VisitStatusTypeId int NOT NULL,
	VisitId int NOT NULL,
	DateAdded datetime NOT NULL,
)



CREATE TABLE dbo.VisitStatusType(
	Id int NOT NULL PRIMARY KEY IDENTITY(1,1),
	Name nvarchar(200) NOT NULL,
)


CREATE TABLE dbo.Workshop(
	Id int NOT NULL PRIMARY KEY IDENTITY(1,1),
	PhoneNumber nvarchar(20) NOT NULL,
	Name nvarchar(300) NOT NULL,
	UserId int NULL,
	IsActive bit NOT NULL,
	DateAdded datetime NOT NULL,
)


CREATE TABLE dbo.WorkshopServiceType(
	ServiceTypeId int NOT NULL,
	WorkshopId int NOT NULL
)

ALTER TABLE dbo.Address  WITH CHECK ADD  CONSTRAINT FK_Address_City FOREIGN KEY(CityId) REFERENCES dbo.City (Id)

ALTER TABLE dbo.Address CHECK CONSTRAINT FK_Address_City

ALTER TABLE dbo.Address  WITH CHECK ADD  CONSTRAINT FK_Address_Workshop FOREIGN KEY(WorkshopId) REFERENCES dbo.Workshop (Id)

ALTER TABLE dbo.Address CHECK CONSTRAINT FK_Address_Workshop

ALTER TABLE dbo."User"  WITH CHECK ADD  CONSTRAINT FK_User_Role FOREIGN KEY(RoleId) REFERENCES dbo."Role" (Id)

ALTER TABLE dbo."User" CHECK CONSTRAINT FK_User_Role

ALTER TABLE dbo.Visit  WITH CHECK ADD  CONSTRAINT FK_Visit_ServiceType FOREIGN KEY(ServiceTypeId) REFERENCES dbo.ServiceType (Id)

ALTER TABLE dbo.Visit CHECK CONSTRAINT FK_Visit_ServiceType

ALTER TABLE dbo.Visit  WITH CHECK ADD  CONSTRAINT FK_Visit_User FOREIGN KEY(UserId) REFERENCES dbo."User" (Id)

ALTER TABLE dbo.Visit CHECK CONSTRAINT FK_Visit_User

ALTER TABLE dbo.Visit  WITH CHECK ADD  CONSTRAINT FK_Visit_Workshop FOREIGN KEY(WorkshopId) REFERENCES dbo.Workshop (Id)

ALTER TABLE dbo.Visit CHECK CONSTRAINT FK_Visit_Workshop

ALTER TABLE dbo.VisitStatus  WITH CHECK ADD  CONSTRAINT FK_VisitStatus_Visit FOREIGN KEY(VisitId) REFERENCES dbo.Visit (Id)

ALTER TABLE dbo.VisitStatus CHECK CONSTRAINT FK_VisitStatus_Visit

ALTER TABLE dbo.VisitStatus  WITH CHECK ADD  CONSTRAINT FK_VisitStatus_VisitStatusType FOREIGN KEY(VisitStatusTypeId) REFERENCES dbo.VisitStatusType (Id)

ALTER TABLE dbo.VisitStatus CHECK CONSTRAINT FK_VisitStatus_VisitStatusType

ALTER TABLE dbo.Workshop  WITH CHECK ADD  CONSTRAINT FK_Workshop_User FOREIGN KEY(UserId) REFERENCES dbo."User" (Id)

ALTER TABLE dbo.Workshop CHECK CONSTRAINT FK_Workshop_User

ALTER TABLE dbo.WorkshopServiceType  WITH CHECK ADD  CONSTRAINT FK_WorkshopServiceType_ServiceType FOREIGN KEY(ServiceTypeId) REFERENCES dbo.ServiceType (Id)

ALTER TABLE dbo.WorkshopServiceType CHECK CONSTRAINT FK_WorkshopServiceType_ServiceType

ALTER TABLE dbo.WorkshopServiceType  WITH CHECK ADD  CONSTRAINT FK_WorkshopServiceType_Workshop FOREIGN KEY(WorkshopId) REFERENCES dbo.Workshop (Id)

ALTER TABLE dbo.WorkshopServiceType CHECK CONSTRAINT FK_WorkshopServiceType_Workshop

INSERT INTO dbo.Role VALUES ('Admin')
INSERT INTO dbo.Role VALUES ('Workshop')
INSERT INTO dbo.Role VALUES ('Client')

INSERT INTO dbo.City VALUES ('Rzeszów');
INSERT INTO dbo.City VALUES ('Lublin');
INSERT INTO dbo.City VALUES ('Białystok');

INSERT INTO dbo.VisitStatusType VALUES ('Zaplanowa')
INSERT INTO dbo.VisitStatusType VALUES ('Rozpoczęta')
INSERT INTO dbo.VisitStatusType VALUES ('Zakończona')
INSERT INTO dbo.VisitStatusType VALUES ('Anulowana')

INSERT INTO dbo.ServiceType(Name) VALUES ('Wymiana wału')
INSERT INTO dbo.ServiceType(Name) VALUES ('Wymiana klocków hamulcowych')
INSERT INTO dbo.ServiceType(Name) VALUES ('Wymiana chłodnicy')