ngMeteor.controller 'menuCtrl', ['$scope', '$state', ($scope, $state) ->

	Deps.autorun ->

		$scope.currentUser = Meteor.user()

		if Meteor.user()

			$scope.days = moment(new Date()).diff(Meteor.user().createdAt, 'days')

			Meteor.setTimeout ->
				$scope.days = moment(new Date()).diff(Meteor.user().createdAt, 'days')
			, 1000 * 60

	$scope.signout = ->
		Meteor.logout (err) ->
			unless err
				$state.go 'signin'
]
