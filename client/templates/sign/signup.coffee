ngMeteor.controller 'signupCtrl', ['$scope', '$state', ($scope, $state) ->

	$scope.notice = '新用户注册'

	$scope.signup = (user) ->
		Accounts.createUser user, (err) ->
			unless err
				$state.go 'menu.notes.latest'
			else if err.error is 403
				$scope.notice = '该用户名已存在'
			else
				$scope.notice = err
]
