create table [TagSynonyms] (
	[Id] int NOT NULL,
	[SourceTagName] nTEXT NULL,
	[TargetTagName] nTEXT NULL,
	[CreationDate] datetime NOT NULL,
	[OwnerUserId] int NOT NULL,
	[AutoRenameCount] int NOT NULL,
	[LastAutoRename] datetime NULL,
	[Score] int NOT NULL,
	[ApprovedByUserId] int NULL,
	[ApprovalDate] datetime NULL
);