create table [ReviewTaskResults] (
	[Id] int NOT NULL,
	[ReviewTaskId] int NOT NULL,
	[ReviewTaskResultTypeId] tinyint NOT NULL,
	[CreationDate] date NULL,
	[RejectionReasonId] tinyint NULL,
	[Comment] nTEXT NULL
);