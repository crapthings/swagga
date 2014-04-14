ngMeteor.controller 'viewNoteCtrl', ['$scope', '$state', '$collection', ($scope, $state, $collection) ->

	$collection 'Notes', $scope, { _id: $state.params._id }

	$scope.Notes.ready ->
		$scope.note = Notes.findOne { _id: $state.params._id }

]
