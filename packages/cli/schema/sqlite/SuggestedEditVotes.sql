create table [SuggestedEditVotes] (
	[Id] int NOT NULL,
	[SuggestedEditId] int NOT NULL,
	[UserId] int NOT NULL,
	[VoteTypeId] tinyint NOT NULL,
	[CreationDate] datetime NOT NULL,
	[TargetUserId] int NULL,
	[TargetRepChange] int NOT NULL
);