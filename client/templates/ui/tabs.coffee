ngMeteor.controller 'tabsCtrl', ['$scope', '$state', '$ionicTabsDelegate', '$ionicModal', ($scope, $state, $ionicTabsDelegate, $ionicModal) ->

	$scope.postModal = $ionicModal.fromTemplate getTemplate('newPost'),
		scope: $scope
		animation: 'slide-in-up'

	$scope.openModal = ->
		$scope.postModal.show()

	$scope.closeModal = ->
		$scope.postModal.hide()

	$scope.openPostModal = ->
		$scope.openModal()

	$scope.newPost = (post) ->
		Posts.insert post, (err) ->
			unless err
				$scope.closeModal()
				post.title = undefined
				post.price = undefined
				post.content = undefined
				post.private = false


]
