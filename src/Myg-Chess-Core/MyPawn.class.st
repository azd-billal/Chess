Class {
	#name : 'MyPawn',
	#superclass : 'MyPiece',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'rendering' }
MyPawn >> diagonalMove [
	^ (self direction moveDiagonals: square) select: [ :s |
		s isValid and: [ s hasPiece and: [ s contents color ~= color ] ] ].
]

{ #category : 'accessing' }
MyPawn >> id [

	^ 'P'
]

{ #category : 'path commands' }
MyPawn >> moveTo: aSquare [
	
	
	(self passantMove includes: aSquare) ifTrue: [
		(self direction moveBack: aSquare) emptyContents ].

	super moveTo: aSquare
]

{ #category : 'rendering' }
MyPawn >> passantMove [
	| opposant |
	^ (self direction moveDiagonals: square) select: [ :s |
		s isValid and: [
			s hasPiece not and: [
				opposant := self direction moveBack: s.
				opposant hasPiece and: [
					square board isPreviousMove: opposant contents ] ] ] ].
]

{ #category : 'rendering' }
MyPawn >> renderPieceOn: aSquare [ 
	
	^ self colorStrategy renderPawnOn: aSquare
]

{ #category : 'path commands' }
MyPawn >> simpleMove [ 
	^ { self direction moveForward: square } select: [ :s |
		s isValid and: [ s hasPiece not ] ].
]

{ #category : 'rendering' }
MyPawn >> targetSquaresLegal: aBoolean [

	^ self simpleMove, self diagonalMove, self passantMove.
]
