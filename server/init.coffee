Meteor.startup ->

	isSystemExist = System.findOne { config: true }

	unless isSystemExist

		System.insert
			config: true

	isAdminExist = Users.findOne { username : 'admin' }

	unless isAdminExist

		Accounts.createUser
			username: 'admin'
			password: 'admin'

	isDemoExist = Users.findOne { username: 'demo' }

	unless isDemoExist

		Accounts.createUser
			username: 'demo'
			password: 'demo'
