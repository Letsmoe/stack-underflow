CREATE TABLE Badges (
	Id int NOT NULL,
	UserId int NOT NULL,
	Name varchar(50) NOT NULL,
	Date timestamp NOT NULL,
	Class smallint NOT NULL,
	TagBased boolean NOT NULL,
	PRIMARY KEY ( Id )
);             


CREATE TABLE CloseAsOffTopicReasonTypes (
	Id smallint NOT NULL,
	IsUniversal boolean NOT NULL,
	MarkdownMini TEXT NOT NULL,
	CreationDate timestamp NOT NULL,
	CreationModeratorId int NULL,
	ApprovalDate timestamp NULL,
	ApprovalModeratorId int NULL,
	DeactivationDate timestamp NULL,
	DeactivationModeratorId int NULL,
	PRIMARY KEY ( Id )
);             


CREATE TABLE CloseReasonTypes (
	Id smallint NOT NULL,
	Name varchar(200) NOT NULL,
	Description TEXT NULL,
	PRIMARY KEY ( Id )
);             


CREATE TABLE Comments (
	Id int NOT NULL,
	PostId int NOT NULL,
	Score int NOT NULL,
	Text TEXT NOT NULL,
	CreationDate timestamp NOT NULL,
	UserDisplayName varchar(30) NULL,
	UserId int NULL,
	PRIMARY KEY ( Id )
);             


CREATE TABLE FlagTypes (
	Id smallint NOT NULL,
	Name varchar(50) NOT NULL,
	Description TEXT NOT NULL,
	PRIMARY KEY ( Id )
);             


CREATE TABLE PendingFlags (
	Id int NOT NULL,
	FlagTypeId smallint NOT NULL,
	PostId int NOT NULL,
	CreationDate date NULL,
	CloseReasonTypeId smallint NULL,
	CloseAsOffTopicReasonTypeId smallint NULL,
	DuplicateOfQuestionId int NULL,
	BelongsOnBaseHostAddress varchar(100) NULL,
	PRIMARY KEY ( Id )
);             


CREATE TABLE PostFeedback (
	Id int NOT NULL,
	PostId int NOT NULL,
	IsAnonymous boolean NULL,
	VoteTypeId smallint NOT NULL,
	CreationDate timestamp NOT NULL,
	PRIMARY KEY ( Id )
);             


CREATE TABLE PostHistory (
	Id int NOT NULL,
	PostHistoryTypeId smallint NOT NULL,
	PostId int NOT NULL,
	RevisionGUID char(36) NOT NULL,
	CreationDate timestamp NOT NULL,
	UserId int NULL,
	UserDisplayName varchar(40) NULL,
	Comment TEXT NULL,
	Text TEXT NULL,
	PRIMARY KEY ( Id )
);             


CREATE TABLE PostHistoryTypes (
	Id smallint NOT NULL,
	Name varchar(50) NOT NULL,
	PRIMARY KEY ( Id )
);             


CREATE TABLE PostLinks (
	Id int NOT NULL,
	CreationDate timestamp NOT NULL,
	PostId int NOT NULL,
	RelatedPostId int NOT NULL,
	LinkTypeId smallint NOT NULL,
	PRIMARY KEY ( Id )
);             


CREATE TABLE PostNoticeTypes (
	Id int NOT NULL,
	ClassId smallint NOT NULL,
	Name varchar(80) NULL,
	Body varchar(800) NULL,
	IsHidden boolean NOT NULL,
	Predefined boolean NOT NULL,
	PostNoticeDurationId int NOT NULL,
	PRIMARY KEY ( Id )
);             


CREATE TABLE PostNotices (
	Id int NOT NULL,
	PostId int NOT NULL,
	PostNoticeTypeId int NULL,
	CreationDate timestamp NOT NULL,
	DeletionDate timestamp NULL,
	ExpiryDate timestamp NULL,
	Body varchar(800) NULL,
	OwnerUserId int NULL,
	DeletionUserId int NULL,
	PRIMARY KEY ( Id )
);             


CREATE TABLE PostTags (
	PostId int NOT NULL,
	TagId int NOT NULL,
	PRIMARY KEY ( PostId )
);             


CREATE TABLE PostTypes (
	Id smallint NOT NULL,
	Name varchar(50) NOT NULL,
	PRIMARY KEY ( Id )
);             


CREATE TABLE Posts (
	Id int NOT NULL,
	PostTypeId smallint NOT NULL,
	AcceptedAnswerId int NULL,
	ParentId int NULL,
	CreationDate timestamp NOT NULL,
	DeletionDate timestamp NULL,
	Score int NOT NULL,
	ViewCount int NULL,
	Body TEXT NULL,
	OwnerUserId int NULL,
	OwnerDisplayName varchar(40) NULL,
	LastEditorUserId int NULL,
	LastEditorDisplayName varchar(40) NULL,
	LastEditDate timestamp NULL,
	LastActivityDate timestamp NULL,
	Title TEXT NULL,
	Tags TEXT NULL,
	AnswerCount int NULL,
	CommentCount int NULL,
	FavoriteCount int NULL,
	ClosedDate timestamp NULL,
	CommunityOwnedDate timestamp NULL,
	PRIMARY KEY ( Id )
);             


CREATE TABLE PostsWithDeleted (
	Id int NOT NULL,
	PostTypeId smallint NOT NULL,
	AcceptedAnswerId int NULL,
	ParentId int NULL,
	CreationDate timestamp NOT NULL,
	DeletionDate timestamp NULL,
	Score int NOT NULL,
	ViewCount int NULL,
	Body varchar(800) NULL,
	OwnerUserId int NULL,
	OwnerDisplayName varchar(40) NULL,
	LastEditorUserId int NULL,
	LastEditorDisplayName varchar(40) NULL,
	LastEditDate timestamp NULL,
	LastActivityDate timestamp NULL,
	Title varchar(250) NULL,
	Tags varchar(250) NULL,
	AnswerCount int NULL,
	CommentCount int NULL,
	FavoriteCount int NULL,
	ClosedDate timestamp NULL,
	CommunityOwnedDate timestamp NULL,
	PRIMARY KEY ( Id )
);             


CREATE TABLE ReviewRejectionReasons (
	Id smallint NOT NULL,
	Name varchar(100) NOT NULL,
	Description varchar(300) NOT NULL,
	PostTypeId smallint NULL,
	PRIMARY KEY ( Id )
);             


CREATE TABLE ReviewTaskResultTypes (
	Id smallint NOT NULL,
	Name varchar(100) NOT NULL,
	Description varchar(300) NOT NULL,
	PRIMARY KEY ( Id )
);             


CREATE TABLE ReviewTaskResults (
	Id int NOT NULL,
	ReviewTaskId int NOT NULL,
	ReviewTaskResultTypeId smallint NOT NULL,
	CreationDate date NULL,
	RejectionReasonId smallint NULL,
	Comment varchar(150) NULL,
	PRIMARY KEY ( Id )
);             


CREATE TABLE ReviewTaskStates (
	Id smallint NOT NULL,
	Name varchar(50) NOT NULL,
	Description varchar(300) NOT NULL,
	PRIMARY KEY ( Id )
);             


CREATE TABLE ReviewTaskTypes (
	Id smallint NOT NULL,
	Name varchar(50) NOT NULL,
	Description varchar(300) NOT NULL,
	PRIMARY KEY ( Id )
);             


CREATE TABLE ReviewTasks (
	Id int NOT NULL,
	ReviewTaskTypeId smallint NOT NULL,
	CreationDate date NULL,
	DeletionDate date NULL,
	ReviewTaskStateId smallint NOT NULL,
	PostId int NOT NULL,
	SuggestedEditId int NULL,
	CompletedByReviewTaskId int NULL,
	PRIMARY KEY ( Id )
);             


CREATE TABLE SuggestedEditVotes (
	Id int NOT NULL,
	SuggestedEditId int NOT NULL,
	UserId int NOT NULL,
	VoteTypeId smallint NOT NULL,
	CreationDate timestamp NOT NULL,
	TargetUserId int NULL,
	TargetRepChange int NOT NULL,
	PRIMARY KEY ( Id )
);             


CREATE TABLE SuggestedEdits (
	Id int NOT NULL,
	PostId int NOT NULL,
	CreationDate timestamp NULL,
	ApprovalDate timestamp NULL,
	RejectionDate timestamp NULL,
	OwnerUserId int NULL,
	Comment varchar(800) NULL,
	Text varchar(800) NULL,
	Title varchar(250) NULL,
	Tags varchar(250) NULL,
	RevisionGUID char(36) NULL,
	PRIMARY KEY ( Id )
);             


CREATE TABLE TagSynonyms (
	Id int NOT NULL,
	SourceTagName varchar(35) NULL,
	TargetTagName varchar(35) NULL,
	CreationDate timestamp NOT NULL,
	OwnerUserId int NOT NULL,
	AutoRenameCount int NOT NULL,
	LastAutoRename timestamp NULL,
	Score int NOT NULL,
	ApprovedByUserId int NULL,
	ApprovalDate timestamp NULL,
	PRIMARY KEY ( Id )
);             


CREATE TABLE Tags (
	Id int NOT NULL,
	TagName varchar(35) NULL,
	Count int NOT NULL,
	ExcerptPostId int NULL,
	WikiPostId int NULL,
	PRIMARY KEY ( Id )
);             


CREATE TABLE Users (
	Id int NOT NULL,
	Reputation int NOT NULL,
	CreationDate timestamp NOT NULL,
	DisplayName varchar(40) NULL,
	LastAccessDate timestamp NOT NULL,
	WebsiteUrl varchar(200) NULL,
	Location varchar(100) NULL,
	AboutMe TEXT NULL,
	Views int NOT NULL,
	UpVotes int NOT NULL,
	DownVotes int NOT NULL,
	ProfileImageUrl varchar(200) NULL,
	EmailHash varchar(32) NULL,
	AccountId int NULL,
	PRIMARY KEY ( Id )
);             


CREATE TABLE VoteTypes (
	Id smallint NOT NULL,
	Name varchar(50) NOT NULL,
	PRIMARY KEY ( Id )
);             


CREATE TABLE Votes (
	Id int NOT NULL,
	PostId int NOT NULL,
	VoteTypeId smallint NOT NULL,
	UserId int NULL,
	CreationDate timestamp NULL,
	BountyAmount int NULL,
	PRIMARY KEY ( Id )
);             

ALTER TABLE Tags
ADD CONSTRAINT Tag_Name_Unique UNIQUE (TagName);

ALTER TABLE PostsWithDeleted 
ADD CONSTRAINT Fk_PostsWithDeleted_PostTypes FOREIGN KEY ( PostTypeId ) 
REFERENCES PostTypes( Id ) ;

ALTER TABLE PostHistory 
ADD CONSTRAINT Fk_PostHistory_PostHistoryTypes FOREIGN KEY ( PostHistoryTypeId ) 
REFERENCES PostHistoryTypes( Id ) ;

ALTER TABLE PostHistory 
ADD CONSTRAINT Fk_PostHistory_Posts FOREIGN KEY ( PostId ) 
REFERENCES Posts( Id ) ;

ALTER TABLE PostHistory 
ADD CONSTRAINT Fk_PostHistory_Users FOREIGN KEY ( UserId ) 
REFERENCES Users( Id ) ;

ALTER TABLE Votes 
ADD CONSTRAINT Fk_Votes_Posts FOREIGN KEY ( PostId ) 
REFERENCES Posts( Id ) ;

ALTER TABLE Votes 
ADD CONSTRAINT Fk_Votes_VoteTypes FOREIGN KEY ( VoteTypeId ) 
REFERENCES VoteTypes( Id ) ;

ALTER TABLE Votes 
ADD CONSTRAINT Fk_Votes_Users FOREIGN KEY ( UserId ) 
REFERENCES Users( Id ) ;

ALTER TABLE Badges 
ADD CONSTRAINT Fk_Badges_Users FOREIGN KEY ( UserId ) 
REFERENCES Users( Id ) ;

ALTER TABLE Comments 
ADD CONSTRAINT Fk_Comments_Posts FOREIGN KEY ( PostId ) 
REFERENCES Posts( Id ) ;

ALTER TABLE Comments 
ADD CONSTRAINT Fk_Comments_Users FOREIGN KEY ( UserId ) 
REFERENCES Users( Id ) ;

ALTER TABLE PostFeedback 
ADD CONSTRAINT Fk_PostFeedback_Posts FOREIGN KEY ( PostId ) 
REFERENCES Posts( Id ) ;

ALTER TABLE PostFeedback 
ADD CONSTRAINT Fk_PostFeedback_VoteTypes FOREIGN KEY ( VoteTypeId ) 
REFERENCES VoteTypes( Id ) ;

ALTER TABLE SuggestedEdits 
ADD CONSTRAINT Fk_SuggestedEdits_Posts FOREIGN KEY ( PostId ) 
REFERENCES Posts( Id ) ;

ALTER TABLE SuggestedEditVotes 
ADD CONSTRAINT Fk_SuggestedEditVotes_SuggestedEdits FOREIGN KEY ( SuggestedEditId ) 
REFERENCES SuggestedEdits( Id ) ;

ALTER TABLE SuggestedEditVotes 
ADD CONSTRAINT Fk_SuggestedEditVotes_Users FOREIGN KEY ( UserId ) 
REFERENCES Users( Id ) ;

ALTER TABLE SuggestedEditVotes 
ADD CONSTRAINT Fk_SuggestedEditVotes_VoteTypes FOREIGN KEY ( VoteTypeId ) 
REFERENCES VoteTypes( Id ) ;

ALTER TABLE PostLinks 
ADD CONSTRAINT Fk_PostLinks_Posts FOREIGN KEY ( PostId ) 
REFERENCES Posts( Id ) ;

ALTER TABLE PendingFlags 
ADD CONSTRAINT Fk_PendingFlags_FlagTypes FOREIGN KEY ( FlagTypeId ) 
REFERENCES FlagTypes( Id ) ;

ALTER TABLE PendingFlags 
ADD CONSTRAINT Fk_PendingFlags_Posts FOREIGN KEY ( PostId ) 
REFERENCES Posts( Id ) ;

ALTER TABLE PendingFlags 
ADD CONSTRAINT Fk_PendingFlags_CloseReasonTypes FOREIGN KEY ( CloseReasonTypeId ) 
REFERENCES CloseReasonTypes( Id ) ;

ALTER TABLE PendingFlags 
ADD CONSTRAINT Fk_PendingFlags_CloseAsOffTopicReasonTypes FOREIGN KEY ( CloseAsOffTopicReasonTypeId ) 
REFERENCES CloseAsOffTopicReasonTypes( Id ) ;

ALTER TABLE ReviewTasks 
ADD CONSTRAINT Fk_ReviewTasks_ReviewTaskTypes FOREIGN KEY ( ReviewTaskTypeId ) 
REFERENCES ReviewTaskTypes( Id ) ;

ALTER TABLE ReviewTasks 
ADD CONSTRAINT Fk_ReviewTasks_ReviewTaskStates FOREIGN KEY ( ReviewTaskStateId ) 
REFERENCES ReviewTaskStates( Id ) ;

ALTER TABLE ReviewTasks 
ADD CONSTRAINT Fk_ReviewTasks_Posts FOREIGN KEY ( PostId ) 
REFERENCES Posts( Id ) ;

ALTER TABLE ReviewTasks 
ADD CONSTRAINT Fk_ReviewTasks_SuggestedEdits FOREIGN KEY ( SuggestedEditId ) 
REFERENCES SuggestedEdits( Id ) ;

ALTER TABLE ReviewTaskResults 
ADD CONSTRAINT Fk_ReviewTaskResults_ReviewTasks FOREIGN KEY ( ReviewTaskId ) 
REFERENCES ReviewTasks( Id ) ;

ALTER TABLE ReviewTaskResults 
ADD CONSTRAINT Fk_ReviewTaskResults_ReviewTaskResultTypes FOREIGN KEY ( ReviewTaskResultTypeId ) 
REFERENCES ReviewTaskResultTypes( Id ) ;

ALTER TABLE ReviewRejectionReasons 
ADD CONSTRAINT Fk_ReviewRejectionReasons_PostTypes FOREIGN KEY ( PostTypeId ) 
REFERENCES PostTypes( Id ) ;

ALTER TABLE PostNotices 
ADD CONSTRAINT Fk_PostNotices_Posts FOREIGN KEY ( PostId ) 
REFERENCES Posts( Id ) ;

ALTER TABLE PostNotices 
ADD CONSTRAINT Fk_PostNotices_PostNoticeTypes FOREIGN KEY ( PostNoticeTypeId ) 
REFERENCES PostNoticeTypes( Id ) ;

ALTER TABLE PostTags 
ADD CONSTRAINT Fk_PostTags_Posts FOREIGN KEY ( PostId ) 
REFERENCES Posts( Id ) ;

ALTER TABLE PostTags 
ADD CONSTRAINT Fk_PostTags_Tags FOREIGN KEY ( TagId ) 
REFERENCES Tags( Id ) ;

ALTER TABLE Posts 
ADD CONSTRAINT Fk_Posts_PostTypes FOREIGN KEY ( PostTypeId ) 
REFERENCES PostTypes( Id ) ;

ALTER TABLE PostsWithDeleted 
ADD CONSTRAINT Fk_PostsWithDeleted_Users FOREIGN KEY ( OwnerUserId ) 
REFERENCES Users( Id ) ;

ALTER TABLE PostsWithDeleted 
ADD CONSTRAINT Fk_PostsWithDeleted_Users_2 FOREIGN KEY ( LastEditorUserId ) 
REFERENCES Users( Id ) ;

ALTER TABLE TagSynonyms 
ADD CONSTRAINT Fk_TagSynonyms_Users FOREIGN KEY ( OwnerUserId ) 
REFERENCES Users( Id ) ;

ALTER TABLE TagSynonyms 
ADD CONSTRAINT Fk_TagSynonyms_Users_2 FOREIGN KEY ( ApprovedByUserId ) 
REFERENCES Users( Id ) ;

ALTER TABLE SuggestedEdits 
ADD CONSTRAINT Fk_SuggestedEdits_Users FOREIGN KEY ( OwnerUserId ) 
REFERENCES Users( Id ) ;

ALTER TABLE SuggestedEditVotes 
ADD CONSTRAINT Fk_SuggestedEditVotes_Users_2 FOREIGN KEY ( TargetUserId ) 
REFERENCES Users( Id ) ;

ALTER TABLE CloseAsOffTopicReasonTypes 
ADD CONSTRAINT Fk_CloseAsOffTopicReasonTypes_Users FOREIGN KEY ( CreationModeratorId ) 
REFERENCES Users( Id ) ;

ALTER TABLE CloseAsOffTopicReasonTypes 
ADD CONSTRAINT Fk_CloseAsOffTopicReasonTypes_Users_2 FOREIGN KEY ( ApprovalModeratorId ) 
REFERENCES Users( Id ) ;

ALTER TABLE CloseAsOffTopicReasonTypes 
ADD CONSTRAINT Fk_CloseAsOffTopicReasonTypes_Users_3 FOREIGN KEY ( DeactivationModeratorId ) 
REFERENCES Users( Id ) ;

ALTER TABLE PostNotices 
ADD CONSTRAINT Fk_PostNotices_Users FOREIGN KEY ( OwnerUserId ) 
REFERENCES Users( Id ) ;

ALTER TABLE PostNotices 
ADD CONSTRAINT Fk_PostNotices_Users_2 FOREIGN KEY ( DeletionUserId ) 
REFERENCES Users( Id ) ;

ALTER TABLE Posts 
ADD CONSTRAINT Fk_Posts_Users FOREIGN KEY ( OwnerUserId ) 
REFERENCES Users( Id ) ;

ALTER TABLE Posts 
ADD CONSTRAINT Fk_Posts_Users_2 FOREIGN KEY ( LastEditorUserId ) 
REFERENCES Users( Id ) ;

ALTER TABLE PostsWithDeleted 
ADD CONSTRAINT Fk_PostsWithDeleted_Posts FOREIGN KEY ( AcceptedAnswerId ) 
REFERENCES Posts( Id ) ;

ALTER TABLE PostsWithDeleted 
ADD CONSTRAINT Fk_PostsWithDeleted_Posts_2 FOREIGN KEY ( ParentId ) 
REFERENCES Posts( Id ) ;

ALTER TABLE PostLinks 
ADD CONSTRAINT Fk_PostLinks_Posts_2 FOREIGN KEY ( RelatedPostId ) 
REFERENCES Posts( Id ) ;

ALTER TABLE PendingFlags 
ADD CONSTRAINT Fk_PendingFlags_Posts_2 FOREIGN KEY ( DuplicateOfQuestionId ) 
REFERENCES Posts( Id ) ;

ALTER TABLE Tags 
ADD CONSTRAINT Fk_Tags_Posts FOREIGN KEY ( ExcerptPostId ) 
REFERENCES Posts( Id ) ;

ALTER TABLE Tags 
ADD CONSTRAINT Fk_Tags_Posts_2 FOREIGN KEY ( WikiPostId ) 
REFERENCES Posts( Id ) ;

ALTER TABLE Posts 
ADD CONSTRAINT Fk_Posts_Posts FOREIGN KEY ( AcceptedAnswerId ) 
REFERENCES Posts( Id ) ;

ALTER TABLE Posts 
ADD CONSTRAINT Fk_Posts_Posts_2 FOREIGN KEY ( ParentId ) 
REFERENCES Posts( Id ) ;

ALTER TABLE ReviewTaskResults 
ADD CONSTRAINT Fk_ReviewTaskResults_ReviewRejectionReasons FOREIGN KEY ( RejectionReasonId ) 
REFERENCES ReviewRejectionReasons( Id ) ;

ALTER TABLE ReviewTasks 
ADD CONSTRAINT Fk_ReviewTasks_CompletedByReviewTaskId FOREIGN KEY ( CompletedByReviewTaskId ) 
REFERENCES ReviewTaskResults( Id ) ;

ALTER TABLE TagSynonyms 
ADD CONSTRAINT Fk_TagSynonymsSourceTagName_Tags FOREIGN KEY ( SourceTagName ) 
REFERENCES Tags( TagName ) ;
ALTER TABLE TagSynonyms 
ADD CONSTRAINT Fk_TagSynonymsTargetTagName_Tags_2 FOREIGN KEY ( TargetTagName ) 
REFERENCES Tags( TagName ) ;