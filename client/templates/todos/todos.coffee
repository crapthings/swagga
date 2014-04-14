ngMeteor.controller 'todosCtrl', ['$scope', '$collection', '$ionicModal', ($scope, $collection, $ionicModal) ->

	$collection 'Todos', $scope, { creatorId: Meteor.userId() },
		sort:
			createdAt: -1

	$scope.todoModal = $ionicModal.fromTemplate getTemplate('newTodo'),
		scope: $scope
		animation: 'slide-in-up'

	$scope.openModal = ->
		$scope.todoModal.show()

	$scope.closeModal = ->
		$scope.todoModal.hide()

	$scope.openTodoModal = ->
		$scope.openModal()

	$scope.createTodo = (todo) ->
		$scope.Todos.add todo
		$scope.closeModal()
		todo.content = ''
]
