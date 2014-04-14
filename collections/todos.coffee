@Todos = new Meteor.Collection 'todos'

Todos.allow
	insert: (userId) ->
		if userId
			return true

if Meteor.isServer

	Todos.before.insert (userId, todo) ->
		_.extend todo,
			creatorId: userId
			createdAt: Date.now()
			completed: false
			urgency: todo.urgency or false

	Todos.after.insert (userId, todo) ->
		Users.update userId,
			$inc:
				'stats.todos.uncompleted': 1

	Meteor.publish 'Todos', (selector, options, publisher) ->
		if @userId
			return Todos.find selector, options
