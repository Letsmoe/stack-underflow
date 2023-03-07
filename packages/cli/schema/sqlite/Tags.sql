create table [Tags] (
	[Id] int NOT NULL,
	[TagName] nTEXT NULL,
	[Count] int NOT NULL,
	[ExcerptPostId] int NULL,
	[WikiPostId] int NULL,
	[IsModeratorOnly] bit NULL,
	[IsRequired] bit NULL
);