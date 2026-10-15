Class {
	#name : 'MyPawn',
	#superclass : 'MyPiece',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'accessing' }
MyPawn >> id [

	^ 'P'
]

{ #category : 'path commands' }
MyPawn >> moveTo: aSquare [
	
	
	| isEnPassant |
	
	isEnPassant := aSquare hasPiece not and: [
		               (self direction moveDiagonals: square) includes: aSquare ].

	isEnPassant ifTrue: [
						(self direction moveBack: aSquare) emptyContents ].
							
	super moveTo: aSquare.
]

{ #category : 'rendering' }
MyPawn >> renderPieceOn: aSquare [ 
	
	^ aSquare renderPawn: self
]

{ #category : 'rendering' }
MyPawn >> targetSquaresLegal: aBoolean [

	| simpleMove diagonal passant opposant |

	 simpleMove := { self direction moveForward: square } select: [ :s |
		s isValid and: [ s hasPiece not ] ].
	
	diagonal := (self direction moveDiagonals: square) select: [ :s |
		s isValid and: [ s hasPiece and: [ s contents color ~= color ] ] ].
	
	passant := (self direction moveDiagonals: square) select: [ :s |
		s isValid and: [
			s hasPiece not and: [
				opposant := self direction moveBack: s.
				opposant hasPiece and: [
					square board game notNil and: [
						opposant contents == square board game previousMove ] ] ] ] ].
	
	^ simpleMove, diagonal, passant.
	
]
