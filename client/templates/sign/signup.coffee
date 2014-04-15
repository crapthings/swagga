ngMeteor.controller 'signupCtrl', ['$scope', '$state', ($scope, $state) ->

	$scope.signup = (user) ->
		Accounts.createUser user, (err) ->
			unless err
				$state.go 'menu.notes.latest'

]
