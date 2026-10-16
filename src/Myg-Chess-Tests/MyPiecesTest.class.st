Class {
	#name : 'MyPiecesTest',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyPiecesTest >> testColorStrategyIsMyBlackColorWhenColorPiecesIsBlack [

	| pawn |
	
	pawn := MyPawn black.
	self assert: pawn colorStrategy class equals: MyBlackColor.
]
