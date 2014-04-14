@Posts = new Meteor.Collection 'posts'

Posts.before.insert (userId, post) ->
	_.extend post,
		creatorId: userId
		createdAt: Date.now()
