create table [PostFeedback] (
	[Id] int NOT NULL,
	[PostId] int NOT NULL,
	[IsAnonymous] bit NULL,
	[VoteTypeId] tinyint NOT NULL,
	[CreationDate] datetime NOT NULL
);