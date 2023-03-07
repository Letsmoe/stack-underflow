create table [ReviewTasks] (
	[Id] int NOT NULL,
	[ReviewTaskTypeId] tinyint NOT NULL,
	[CreationDate] date NULL,
	[DeletionDate] date NULL,
	[ReviewTaskStateId] tinyint NOT NULL,
	[PostId] int NOT NULL,
	[SuggestedEditId] int NULL,
	[CompletedByReviewTaskId] int NULL
);