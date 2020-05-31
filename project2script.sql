create table Account(
	AccountNr	serial,
	Email		varchar(20) unique,
	Username	varchar(20) unique,
	password	varchar(256),
	Birth_date	date,
	primary key(AccountNr)
);

create table Customer(
	AccountNr 	int unique,
	CustomerID 	serial,
	Surname		varchar(20),
	Lastname	varchar(20),
	Company 	varchar(20),
	primary key(CustomerID)
);

create table Truckdriver(
	AccountNr	 		int unique,
	TruckdriverID 		serial,
	Surname				varchar(20),
	Lastname			varchar(20),
	License_Hazardous 	boolean,
	Driving_license		varchar(20),
	primary key(TruckdriverID)
);

create table Employee(
	AccountNr 	int unique,
	EmployeeID	serial,
	Surname		varchar(20),
	Lastname	varchar(20),
	primary key(EmployeeID)
);

create table Orders(
	OrderNr			serial,
	CustomerID		int unique,
	Date			date,
	LineID			int unique,
	LA_ID			int,
	Status			varchar(10),
	primary key(OrderNr)
);

create table Liquid(
	LiquidNr		serial,
	Name			varchar(20),
	Type_of_liquid	varchar(20),
	Hazardous		boolean,
	Price			int,
	primary key(LiquidNr)
);

create table Order_Line(
	LineID			serial,
	LiquidNr		int,
	OrderNr			int,
	primary key(LineID, LiquidNr, OrderNr)
);

create table Locations(
	LocationID		serial,	
	Address			varchar(20),
	City			varchar(20),
	primary key(LocationID)
);

create table Location_Activity(
	LA_ID			serial,
	LocationID		int,
	OrderNr			int,
	WO_ID			int,
	pickdrop		varchar(10),
	primary key(LA_ID, LocationID, OrderNr, WO_ID)
);

create table Work_order(
	WO_ID			serial,
	TruckdriverID	int,
	OrderNr			int,
	TruckID			int,
	TrailerID		int,
	Date			date,
	primary key(WO_ID)
);

create table Truck(
	TruckID			serial,
	Brand			varchar(20),
	type			varchar(20),
	License_plate	varchar(10),
	Country			char(2),
	primary key(TruckID)
);

create table Trailer(
	TrailerID		serial,
	Brand			varchar(20),
	type			varchar(20),
	License_plate	varchar(10),
	Country			char(2),
	primary key(TrailerID)
);

create table Invoices(
	InvoiceNr		serial,
	OrderNr			int,
	CustomerID		int,
	Date			date,
	primary key(InvoiceNr)
);

create table Offer(
	OfferNr			serial,
	OrderNr			int,
	Price			int,
	primary key(OfferNr)
);


alter table Customer add foreign key (AccountNr) references Account(AccountNr);
alter table Truckdriver add foreign key (AccountNr) references Account(AccountNr);
alter table Employee add foreign key (AccountNr) references Account(AccountNr);
alter table Order_Line add foreign key (LineID) references Orders(LineID);
alter table Order_Line add foreign key (LiquidNr) references Liquid(LiquidNr);
alter table Order_Line add foreign key (OrderNr) references Orders(OrderNr);
alter table orders add foreign key (CustomerID) references Customer(CustomerID);
alter table location_activity add foreign key (OrderNr) references Orders(OrderNr);
alter table work_order add foreign key (OrderNr) references Orders(OrderNr);
alter table Work_order add foreign key (TruckdriverID) references Truckdriver(TruckdriverID);
alter table Work_Order add foreign key (TruckID) references Truck(TruckID);
alter table Work_Order add foreign key (TrailerID) references Trailer(TrailerID);
alter table Location_Activity add foreign key (LocationID) references Locations(LocationID);
alter table Invoices add foreign key (CustomerID) references Customer(CustomerID);
alter table Invoices add foreign key (OrderNr) references Orders(OrderNr);
alter table Offer add foreign key (OrderNr) references Orders(OrderNr);
alter table Location_Activity add foreign key (WO_ID) references Work_Order(WO_ID);

insert into Account (Email, Username, password, birth_date) values ('peter@shipping.com', 'peter123', 'fd82f0e95c8034cfeacd4fb4d2853d50749364f1c98f780158aa3196fed7d0d7', '04-20-1988')
																  ,('frank@shipping.com', 'frank444', 'd29ef573741cb2c2f259aa8a83343f59cddfa6c27a59eaf8fa36ad137c917184', '09-11-1990')
																  ,('sarah@shipping.com', 'sarah999', 'fa7b31c7a7d23bebe8157e8228484e2e6c5f0e48e46c2929f41380b0c13c3d9f', '01-23-1991')
																  ,('erik@shipping.com', 'erik3', '52edd1ddd170f2c3cb9bc759b4e3155201c122d62909d839ad304a766283554d', '12-06-1985');
insert into Customer (AccountNr, Surname, Lastname, Company) values ('1', 'Peter', 'Slager', 'Oils'),
																	('4', 'Erik', 'Davids', 'Milka');
-- insert into Truckdriver (AccountNr,)
																 