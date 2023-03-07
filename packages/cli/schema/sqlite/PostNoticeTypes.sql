create table [PostNoticeTypes] (
	[Id] int NOT NULL,
	[ClassId] tinyint NOT NULL,
	[Name] nTEXT NULL,
	[Body] TEXT NULL,
	[IsHidden] bit NOT NULL,
	[Predefined] bit NOT NULL,
	[PostNoticeDurationId] int NOT NULL
);