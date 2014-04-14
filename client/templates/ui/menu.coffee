ngMeteor.controller 'menuCtrl', ['$scope', '$state', ($scope, $state) ->

	Deps.autorun ->
		$scope.currentUser = Meteor.user()

	$scope.signout = ->
		Meteor.logout (err) ->
			unless err
				$state.go 'signin'
]
