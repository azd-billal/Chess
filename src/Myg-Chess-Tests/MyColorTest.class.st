Class {
	#name : 'MyColorTest',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyColorTest >> testBlackColorHasBlackDirection [
	self assert: MyBlackColor new direction class equals: MyBlackDirection.
]

{ #category : 'tests' }
MyColorTest >> testBlackColorRendersBlackPawn [

	| square |
	square := MyChessBoard empty at: 'a1'.
	self assert: (MyBlackColor new renderPawnOn: square) equals: square renderBlackPawn.


]

{ #category : 'tests' }
MyColorTest >> testWhiteAndBlackPawnRenderDifferently [

	| square |
	square := MyChessBoard empty at: 'a1'.
	self deny: (MyWhiteColor new renderPawnOn: square) = (MyBlackColor new renderPawnOn: square)

]

{ #category : 'tests' }
MyColorTest >> testWhiteColorHasWhiteDirection [
	self assert: MyWhiteColor new direction class equals: MyWhiteDirection
]

{ #category : 'tests' }
MyColorTest >> testWhiteColorRendersWhitePawn [

	| square |
	square := MyChessBoard empty at: 'a1'.
	self assert: (MyWhiteColor new renderPawnOn: square) equals: square renderWhitePawn

]
