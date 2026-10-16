Class {
	#name : 'MyColorTests',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyColorTests >> testBlackColorHasBlackDirection [
	self assert: MyBlackColor new direction class equals: MyBlackDirection.
]

{ #category : 'tests' }
MyColorTests >> testBlackColorRendersBlackPawn [

	| square |
	square := MyChessBoard empty at: 'a1'.
	self assert: (MyBlackColor new renderPawnOn: square) equals: square renderBlackPawn.


]

{ #category : 'tests' }
MyColorTests >> testWhiteAndBlackPawnRenderDifferently [

	| square |
	square := MyChessBoard empty at: 'a1'.
	self deny: (MyWhiteColor new renderPawnOn: square) = (MyBlackColor new renderPawnOn: square)

]

{ #category : 'tests' }
MyColorTests >> testWhiteColorHasWhiteDirection [
	self assert: MyWhiteColor new direction class equals: MyWhiteDirection
]

{ #category : 'tests' }
MyColorTests >> testWhiteColorRendersWhitePawn [

	| square |
	square := MyChessBoard empty at: 'a1'.
	self assert: (MyWhiteColor new renderPawnOn: square) equals: square renderWhitePawn

]
