ngMeteor.controller 'messagesCtrl', ['$scope', '$collection', '$ionicModal', ($scope, $collection, $ionicModal) ->

	$collection 'Messages', $scope, { creatorId: Meteor.userId() },
		sort:
			createdAt: -1
		limit: 100

	$scope.messageModal = $ionicModal.fromTemplate getTemplate('newMessage'),
		scope: $scope
		animation: 'slide-in-up'

	$scope.openModal = ->
		$scope.messageModal.show()

	$scope.closeModal = ->
		$scope.messageModal.hide()

	$scope.openMessageModal = ->
		$scope.openModal()

	$scope.createMessage = (message) ->
		$scope.Messages.add message
		$scope.closeModal()
		message.title = ''
		message.content = ''
		message.sticky = false
]
