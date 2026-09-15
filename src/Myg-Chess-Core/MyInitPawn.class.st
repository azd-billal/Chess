Class {
	#name : 'MyInitPawn',
	#superclass : 'MyPawn',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'rendering' }
MyInitPawn >> targetSquaresLegal: aBoolean [ 

	| oneStep twoStep |
	oneStep := super targetSquaresLegal: aBoolean.
	oneStep ifEmpty: [ ^ #() ]. 
	twoStep := (self isWhite
		   ifTrue: [ { square up up} ]
		   ifFalse: [ { square down down } ]) select: [ :s |
		  s notNil and: [
			  s hasPiece not or: [ s contents color ~= color ] ] ].
	
		
	^ oneStep , twoStep.
]
