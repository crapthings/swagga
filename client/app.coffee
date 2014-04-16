ngMeteor.config ['$stateProvider', '$urlRouterProvider', '$locationProvider', ($stateProvider, $urlRouterProvider, $locationProvider) ->

	$locationProvider.html5Mode true

	$urlRouterProvider.otherwise '/menu/tabs/circle'

	$stateProvider

		.state 'intro',
			url: '/intro'
			template: getTemplate 'intro'
			controller: 'introCtrl'
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
			auth: undefined

		.state 'menu.tabs',
			url: '/tabs'
			abstract: true
			template: getTemplate 'tabs'
			controller: 'tabsCtrl'
			auth: undefined

		.state 'menu.tabs.circle',
			url: '/circle'
			views:
				'circle':
					template: getTemplate 'circle'
					controller: 'circleCtrl'
			auth: true

		.state 'menu.tabs.explore',
			url: '/explore'
			views:
				'explore':
					template: getTemplate 'explore'
			auth: true

		.state 'menu.tabs.heart',
			url: '/heart'
			views:
				'heart':
					template: getTemplate 'heart'
			auth: true

		.state 'menu.tabs.my',
			url: '/my'
			views:
				'my':
					template: getTemplate 'my'
			auth: true

]

ngMeteor.run ['$rootScope', '$state', ($rootScope, $state) ->

	if Meteor.userId()
		$state.go 'menu.tabs.circle'

	$rootScope.$on '$stateChangeStart', (event, toState, toParams, fromState, fromParams) ->
		unless toState.name is 'intro' or toState.name is 'signin' or toState.name is 'signup'
			unless toState.auth and Meteor.userId()
				$state.go 'intro'
				event.preventDefault()

]
