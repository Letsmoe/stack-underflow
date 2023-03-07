create table [Comments] (
	[Id] int NOT NULL,
	[PostId] int NOT NULL,
	[Score] int NOT NULL,
	[Text] nTEXT NOT NULL,
	[CreationDate] datetime NOT NULL,
	[UserDisplayName] nTEXT NULL,
	[UserId] int NULL,
	[ContentLicense] TEXT NOT NULL
);