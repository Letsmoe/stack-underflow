create table [CloseAsOffTopicReasonTypes] (
	[Id] smallint NOT NULL,
	[IsUniversal] bit NOT NULL,
	[InputTitle] nTEXT NULL,
	[MarkdownInputGuidance] nTEXT NOT NULL,
	[MarkdownPostOwnerGuidance] nTEXT NOT NULL,
	[MarkdownPublicGuidance] nTEXT NOT NULL,
	[MarkdownConcensusDescription] nTEXT NULL,
	[CreationDate] datetime NOT NULL,
	[CreationModeratorId] int NULL,
	[ApprovalDate] datetime NULL,
	[ApprovalModeratorId] int NULL,
	[DeactivationDate] datetime NULL,
	[DeactivationModeratorId] int NULL
);