create table [PostHistory] (
	[Id] int NOT NULL,
	[PostHistoryTypeId] tinyint NOT NULL,
	[PostId] int NOT NULL,
	[RevisionGUID] uniqueidentifier NOT NULL,
	[CreationDate] datetime NOT NULL,
	[UserId] int NULL,
	[UserDisplayName] nTEXT NULL,
	[Comment] nTEXT NULL,
	[Text] TEXT NULL,
	[ContentLicense] TEXT NULL
);