export const MappedDatabase: {
	[key: string]: {
		required: string[],
		optional: string[],
		primary_key: string
	}
} = {
	Badges: {
		required: ["Id", "UserId", "Name", "Date", "Class", "TagBased"],
		optional: [],
		primary_key: "Id",
	},
	Comments: {
		required: ["Id", "PostId", "Score", "Text", "CreationDate"],
		optional: ["UserDisplayName", "UserId"],
		primary_key: "Id",
	},
	PostHistory: {
		required: [
			"Id",
			"PostHistoryTypeId",
			"PostId",
			"RevisionGUID",
			"CreationDate",
		],
		optional: ["UserId", "UserDisplayName", "Comment", "Text"],
		primary_key: "Id",
	},
	PostLinks: {
		required: [
			"Id",
			"CreationDate",
			"PostId",
			"RelatedPostId",
			"LinkTypeId",
		],
		optional: [],
		primary_key: "Id",
	},
	Posts: {
		required: ["Id", "PostTypeId", "CreationDate", "Score"],
		optional: [
			"AcceptedAnswerId",
			"ParentId",
			"DeletionDate",
			"ViewCount",
			"Body",
			"OwnerUserId",
			"OwnerDisplayName",
			"LastEditorUserId",
			"LastEditorDisplayName",
			"LastEditDate",
			"LastActivityDate",
			"Title",
			"Tags",
			"AnswerCount",
			"CommentCount",
			"FavoriteCount",
			"ClosedDate",
			"CommunityOwnedDate",
		],
		primary_key: "Id",
	},
	Tags: {
		required: ["Id", "Count"],
		optional: ["TagName", "ExcerptPostId", "WikiPostId"],
		primary_key: "Id",
	},
	Users: {
		required: [
			"Id",
			"Reputation",
			"CreationDate",
			"LastAccessDate",
			"Views",
			"UpVotes",
			"DownVotes",
		],
		optional: [
			"DisplayName",
			"WebsiteUrl",
			"Location",
			"AboutMe",
			"ProfileImageUrl",
			"EmailHash",
			"AccountId",
		],
		primary_key: "Id",
	},
	Votes: {
		required: ["Id", "PostId", "VoteTypeId", "CreationDate"],
		optional: ["UserId", "BountyAmount"],
		primary_key: "Id",
	},
};
