ngMeteor.controller 'introCtrl', ['$scope', '$state', ($scope, $state) ->

	$scope.signin = (user) ->
		Meteor.loginWithPassword user.username, user.password, (err) ->
			unless err
				$state.go 'menu.tabs.circle'

]
