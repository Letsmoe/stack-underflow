create table [Badges] (
	[Id] int NOT NULL,
	[UserId] int NOT NULL,
	[Name] nTEXT NOT NULL,
	[Date] datetime NOT NULL,
	[Class] tinyint NOT NULL,
	[TagBased] bit NOT NULL
);