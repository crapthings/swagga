ngMeteor.config ['$stateProvider', '$urlRouterProvider', '$locationProvider', ($stateProvider, $urlRouterProvider, $locationProvider) ->

	$locationProvider.html5Mode true

	$urlRouterProvider.otherwise '/menu/notes/latest'

	$stateProvider

		.state 'intro',
			url: '/intro'
			template: getTemplate 'intro'
			# controller: 'signinCtrl'
			auth: false

		.state 'signin',
			url: '/signin'
			template: getTemplate 'signin'
			controller: 'signinCtrl'
			auth: false

		.state 'signup',
			url: '/signup'
			template: getTemplate 'signup'
			controller: 'signupCtrl'
			auth: false

		.state 'menu',
			url: '/menu'
			abstract: true
			template: getTemplate 'menu'
			controller: 'menuCtrl'
			auth: true

		# posts

		.state 'menu.posts',
			url: '/posts'
			abstract: true
			template: getTemplate 'postsTabs'
			controller: 'postsCtrl'
			auth: true

		.state 'menu.posts.all',
			url: '/all'
			views:
				'all':
					template: getTemplate 'posts'
			auth: true

		.state 'menu.messages',
			url: '/messages'
			template: getTemplate 'messages'
			controller: 'messagesCtrl'
			auth: true

		# notes

		.state 'menu.notes',
			url: '/notes'
			abstract: true
			template: '<ion-nav-view></ion-nav-view><ion-nav-view name="tabs"></ion-nav-view>'
			# views:
			# 	'tabs':
			# 		template: getTemplate 'notesTabs'
			controller: 'notesCtrl'
			auth: true

		.state 'menu.notes.latest',
			url: '/latest'
			views:
				'':
					template: getTemplate 'latestNotes'
				'tabs':
					template: getTemplate 'notesTabs'
			auth: true

		.state 'menu.notes.important',
			url: '/important'
			views:
				'':
					template: getTemplate 'importantNotes'
			auth: true

		.state 'menu.notes.sticky',
			url: '/sticky'
			views:
				'':
					template: getTemplate 'stickyNotes'
			auth: true

		.state 'menu.notes.view',
			url: '/view/:_id'
			template: getTemplate 'viewNote'
			controller: 'viewNoteCtrl'
			auth: true

		# todos

		.state 'menu.todos',
			url: '/todos'
			abstract: true
			controller: 'todosCtrl'
			template: '<ion-nav-view></ion-nav-view>'
			auth: true

		.state 'menu.todos.uncompleted',
			url: '/todos/uncompleted'
			template: getTemplate 'uncompletedTodos'
			controller: 'todosCtrl'
			auth: true

		.state 'menu.profile',
			url: '/profile'
			template: getTemplate 'profile'
			controller: 'profileCtrl'
			auth: true

]

ngMeteor.run ['$rootScope', '$state', ($rootScope, $state) ->

	if Meteor.userId()
		$state.go 'menu.notes.latest'

	$rootScope.$on '$stateChangeStart', (event, toState, toParams, fromState, fromParams) ->
		unless toState.name is 'intro' or toState.name is 'signin' or toState.name is 'signup'
			unless toState.auth and Meteor.userId()
				$state.go 'intro'
				event.preventDefault()

]
