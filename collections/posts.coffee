@Posts = new Meteor.Collection 'posts'

Posts.allow
	insert: (userId, post) ->
		if userId
			return true

Posts.before.insert (userId, post) ->
	_.extend post,
		creatorId: userId
		createdAt: Date.now()
		private: post.private or false
