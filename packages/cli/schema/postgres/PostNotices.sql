create table [PostNotices] (
	[Id] int NOT NULL,
	[PostId] int NOT NULL,
	[PostNoticeTypeId] int NULL,
	[CreationDate] datetime NOT NULL,
	[DeletionDate] datetime NULL,
	[ExpiryDate] datetime NULL,
	[Body] TEXT NULL,
	[OwnerUserId] int NULL,
	[DeletionUserId] int NULL
);