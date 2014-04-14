@Users = Meteor.users

Users.allow
	update: (userId, user) ->
		if userId is user._id
			return true

Meteor.methods

	updateProfile: (options) ->
		Users.update Meteor.userId(),
			$set:
				profile: options

	countNotes: ->
		notes = Notes.find { creatorId: Meteor.userId() }
		Users.update Meteor.userId(),
			$set:
				'stats.notes': notes.count()

	countTodos: ->
		uncompleted = Todos.find { creatorId: Meteor.userId(), completed: false }
		completed = Todos.find { creatorId: Meteor.userId(), completed: true }
		Users.update Meteor.userId(),
			$set:
				'stats.todos':
					uncompleted: uncompleted.count()
					completed: completed.count()

if Meteor.isServer

	Meteor.publish '', ->
		Users.find { _id: @userId },
			fields:
				services: false
