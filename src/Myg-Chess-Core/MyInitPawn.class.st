Class {
	#name : 'MyInitPawn',
	#superclass : 'MyPawn',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'path commands' }
MyInitPawn >> moveTo: aSquare [
	
	| newPawn doubleStep game|

	game := square board game.
	doubleStep := { square up up. square down down }.
	
	super moveTo: aSquare.
	newPawn := MyPawn new.
	newPawn square: aSquare.
	newPawn color: color.
	
	(doubleStep includes: aSquare) 
				ifTrue: [
						game ifNotNil: [ 
							game previousMove: newPawn ] 
						].
	
	aSquare contents: newPawn.
	
	
]

{ #category : 'rendering' }
MyInitPawn >> targetSquaresLegal: aBoolean [ 

	| oneStep twoStep |
	oneStep := super targetSquaresLegal: aBoolean.
	twoStep := (self isWhite
		   ifTrue: [ { square up up} ]
		   ifFalse: [ { square down down } ]) select: [ :s |
		  s isValid and: [
			  s hasPiece not ] ].
	
		
	^ oneStep , twoStep.
]
