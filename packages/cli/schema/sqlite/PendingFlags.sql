create table [PendingFlags] (
	[Id] int NOT NULL,
	[FlagTypeId] tinyint NOT NULL,
	[PostId] int NOT NULL,
	[CreationDate] date NULL,
	[CloseReasonTypeId] tinyint NULL,
	[CloseAsOffTopicReasonTypeId] smallint NULL,
	[DuplicateOfQuestionId] int NULL,
	[BelongsOnBaseHostAddress] nTEXT NULL
);