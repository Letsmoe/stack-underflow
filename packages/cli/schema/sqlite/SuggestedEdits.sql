create table [SuggestedEdits] (
	[Id] int NOT NULL,
	[PostId] int NOT NULL,
	[CreationDate] datetime NULL,
	[ApprovalDate] datetime NULL,
	[RejectionDate] datetime NULL,
	[OwnerUserId] int NULL,
	[Comment] nTEXT NULL,
	[Text] TEXT NULL,
	[Title] nTEXT NULL,
	[Tags] nTEXT NULL,
	[RevisionGUID] uniqueidentifier NULL
);