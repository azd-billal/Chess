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

{ #category : 'rendering' }
MyPawn >> renderPieceOn: aSquare [ 
	
	^ aSquare renderPawn: self
]

{ #category : 'rendering' }
MyPawn >> targetSquaresLegal: aBoolean [

	| simpleMove diagonal |

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
	

	^ simpleMove, diagonal.
]
