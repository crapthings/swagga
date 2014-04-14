ngMeteor.controller 'profileCtrl', ['$scope', '$state', '$collection', ($scope, $state, $collection) ->

	$scope.user = $scope.currentUser

	$scope.updateProfile = (user) ->
		Meteor.call 'updateProfile', user.profile, (err) ->
			unless err
				$state.go 'menu.profile'

]
