Class {
	#name : 'MyDirectionTest',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyDirectionTest >> testBlackDirectionMoveBack [
	| board |
	board := MyChessBoard empty.
	self assert: (MyBlackDirection new moveBack: (board at: 'd5')) equals: (board at: 'd6')


]

{ #category : 'tests' }
MyDirectionTest >> testBlackDirectionMoveDiagonals [

	| board squares |
	board := MyChessBoard empty.
	squares := MyBlackDirection new moveDiagonals: (board at: 'd5').
	self assert: (squares includes: (board at: 'c4')).
	self assert: (squares includes: (board at: 'e4')).
	self assert: (squares includes: (board at: 'e6')).
	self assert: (squares includes: (board at: 'c6')).
	self assert: squares size equals: 4.


]

{ #category : 'tests' }
MyDirectionTest >> testBlackDirectionMoveDoubleForward [

	| board |
	board := MyChessBoard empty.
	self assert: (MyBlackDirection new moveDoubleForward: (board at: 'd7')) equals: (board at: 'd5')

]

{ #category : 'tests' }
MyDirectionTest >> testBlackDirectionMoveForward [

	| board |
	board := MyChessBoard empty.
	self assert: (MyBlackDirection new moveForward: (board at: 'd5')) equals: (board at: 'd4').

]

{ #category : 'tests' }
MyDirectionTest >> testWhiteDirectionMoveBack [

	| board |
	board := MyChessBoard empty.
	self assert: (MyWhiteDirection new moveBack: (board at: 'd4')) equals: (board at: 'd3')

]

{ #category : 'tests' }
MyDirectionTest >> testWhiteDirectionMoveDiagonals [

	| board squares |
	board := MyChessBoard empty.
	squares := MyWhiteDirection new moveDiagonals: (board at: 'd4').
	self assert: (squares includes: (board at: 'c5')).
	self assert: (squares includes: (board at: 'e5')).
	self assert: (squares includes: (board at: 'e3')).
	self assert: (squares includes: (board at: 'c3')).
	self assert: squares size equals: 4

]

{ #category : 'tests' }
MyDirectionTest >> testWhiteDirectionMoveDoubleForward [

	| board |
	board := MyChessBoard empty.
	self assert: (MyWhiteDirection new moveDoubleForward: (board at: 'd2')) equals: (board at: 'd4')
]

{ #category : 'tests' }
MyDirectionTest >> testWhiteDirectionMoveForward [

	| board |
	board := MyChessBoard empty.
	self assert: (MyWhiteDirection new moveForward: (board at: 'd4')) equals: (board at: 'd5')

]
