ngMeteor.controller 'notesCtrl', ['$scope', '$rootScope', '$collection', '$ionicModal', ($scope, $rootScope, $collection, $ionicModal) ->

	$collection 'Notes', $scope, { creatorId: Meteor.userId() },
		sort:
			createdAt: -1
		limit: 100

	$rootScope.$on '$stateChangeStart', (event, toState, toParams, fromState, fromParams) ->

		if toState.name is 'menu.notes.latest'
			$collection 'Notes', $scope, { creatorId: Meteor.userId() },
				sort:
					createdAt: -1
				limit: 100

		if toState.name is 'menu.notes.important'
			$collection 'Notes', $scope, { creatorId: Meteor.userId(), important: true },
				sort:
					createdAt: -1
				limit: 100

		if toState.name is 'menu.notes.sticky'
			$collection 'Notes', $scope, { creatorId: Meteor.userId(), sticky: true },
				sort:
					createdAt: -1
				limit: 100

			$collection 'Notes', $scope, { creatorId: Meteor.userId() },
				sort:
					createdAt: -1
				limit: 100

	$scope.noteModal = $ionicModal.fromTemplate getTemplate('newNote'),
		scope: $scope
		animation: 'slide-in-up'

	$scope.openModal = ->
		$scope.noteModal.show()

	$scope.closeModal = ->
		$scope.noteModal.hide()

	$scope.openNoteModal = ->
		$scope.openModal()

	$scope.createNote = (note) ->
		$scope.Notes.add note
		$scope.closeModal()
		note.title = ''
		note.content = ''
		note.sticky = false
		note.important = false

]
