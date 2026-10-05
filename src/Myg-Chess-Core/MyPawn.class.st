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
		               (self isWhite
			               ifTrue: [
				               aSquare = square up left or: [
					               aSquare = square up right ] ]
			               ifFalse: [
				               aSquare = square down left or: [
					               aSquare = square down right ] ])].

	isEnPassant ifTrue: [
						(self isWhite
			               ifTrue: [ aSquare down ]
			               ifFalse: [ aSquare up ]) contents: nil.
								].
							
	super moveTo: aSquare.
]

{ #category : 'rendering' }
MyPawn >> renderPieceOn: aSquare [ 
	
	^ aSquare renderPawn: self
]

{ #category : 'rendering' }
MyPawn >> targetSquaresLegal: aBoolean [

	| simpleMove diagonal passant opposant |

	 simpleMove := (self isWhite
		   ifTrue: [ { square up } ]
		   ifFalse: [ { square down } ]) select: [ :s |
		  s isValid and: [
			  s hasPiece not ] ].
	
	diagonal := (self isWhite
		   ifTrue: [ { square up left. square up right } ]
		   ifFalse: [ { square down left. square down right } ]) select: [ :s |
		  s isValid and: [
			  s hasPiece and: [ 
				 s contents color ~= color ] ] ].
	
	passant := (self isWhite
    ifTrue: [ { square up left. square up right } ]
    ifFalse: [ { square down left. square down right } ])
    select: [ :s |
        s isValid and: [
            s hasPiece not and: [
                opposant := self isWhite
						                    ifTrue: [ s down ]
						                    ifFalse: [ s up ].
					           opposant hasPiece and: [
						           opposant contents == square board game previousMove ] ] ] ].

	^ simpleMove, diagonal, passant.
]
