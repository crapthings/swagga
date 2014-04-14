ngMeteor.controller 'postsCtrl', ['$scope', '$collection', '$ionicModal', ($scope, $collection, $ionicModal) ->

	$collection 'Posts', $scope, { creatorId: Meteor.userId() },
		sort:
			createdAt: -1

	$scope.postModal = $ionicModal.fromTemplate getTemplate('newPost'),
		scope: $scope
		animation: 'slide-in-up'

	$scope.openModal = ->
		$scope.postModal.show()

	$scope.closeModal = ->
		$scope.postModal.hide()

	$scope.openPostModal = ->
		$scope.openModal()

	$scope.createPost = (post) ->
		$scope.Posts.add post
		$scope.closeModal()
		post.content = ''
]
