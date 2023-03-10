create table [Posts] (
	[Id] int NOT NULL,
	[PostTypeId] tinyint NOT NULL,
	[AcceptedAnswerId] int NULL,
	[ParentId] int NULL,
	[CreationDate] datetime NOT NULL,
	[DeletionDate] datetime NULL,
	[Score] int NOT NULL,
	[ViewCount] int NULL,
	[Body] nvarchar NULL,
	[OwnerUserId] int NULL,
	[OwnerDisplayName] nvarchar NULL,
	[LastEditorUserId] int NULL,
	[LastEditorDisplayName] nvarchar NULL,
	[LastEditDate] datetime NULL,
	[LastActivityDate] datetime NULL,
	[Title] nvarchar NULL,
	[Tags] nvarchar NULL,
	[AnswerCount] int NULL,
	[CommentCount] int NULL,
	[FavoriteCount] int NULL,
	[ClosedDate] datetime NULL,
	[CommunityOwnedDate] datetime NULL,
	[ContentLicense] varchar NOT NULL
);