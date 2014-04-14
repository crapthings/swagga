ngMeteor.controller 'signinCtrl', ['$scope', '$state', ($scope, $state) ->

	$scope.notice = '球果通信'

	$scope.signin = (user) ->
		Meteor.loginWithPassword user.username, user.password, (err) ->
			unless err
				$state.go 'menu.notes.latest'
			else if err.error is 403
				$scope.notice = '该用户不存在或密码错误'
			else
				$scope.notice = err
]
