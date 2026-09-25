Class {
	#name : 'MyInitPawn',
	#superclass : 'MyPawn',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'path commands' }
MyInitPawn >> moveTo: aSquare [
	
	| newPawn |
	
	super moveTo: aSquare.
	square = aSquare ifFalse: [ ^ self ].
	newPawn := MyPawn new.
	newPawn square: aSquare.
	newPawn color: self color.
	
	self becomeForward: newPawn.
	
]

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
