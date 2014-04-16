ngMeteor.controller 'circleCtrl', ['$scope', '$rootScope', '$collection', '$ionicModal', ($scope, $rootScope, $collection, $ionicModal) ->

	$collection 'Posts', $scope, { private: false },
		sort:
			createdAt: -1
		limit: 100

]
