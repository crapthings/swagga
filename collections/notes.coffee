@Notes = new Meteor.Collection 'notes',
	transform: (note) ->
		_.extend note,
			_createdAt: moment(note.createdAt).format()

Notes.allow
	insert: (userId) ->
		if userId
			return true

if Meteor.isServer

	Notes.before.insert (userId, note) ->
		_.extend note,
			creatorId: userId
			createdAt: new Date()
			important: note.important or false
			sticky: note.sticky or false

	Notes.after.insert (userId, note) ->
		Users.update userId,
			$inc:
				'stats.notes': 1

	Meteor.publish 'Notes', (selector, options, publisher) ->
		if @userId
			return Notes.find selector, options
