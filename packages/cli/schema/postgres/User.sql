create table [Users] (
	[Id] int NOT NULL,
	[Reputation] int NOT NULL,
	[CreationDate] datetime NOT NULL,
	[DisplayName] nTEXT NULL,
	[LastAccessDate] datetime NOT NULL,
	[WebsiteUrl] nTEXT NULL,
	[Location] nTEXT NULL,
	[AboutMe] TEXT NULL,
	[Views] int NOT NULL,
	[UpVotes] int NOT NULL,
	[DownVotes] int NOT NULL,
	[ProfileImageUrl] nTEXT NULL,
	[EmailHash] TEXT NULL,
	[AccountId] int NULL
);