Class {
	#name : 'MyPawnTest',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyPawnTest >> testMoves [

	| pawn squares board |
	board := MyChessBoard empty.
	board at: 'e4' put: (pawn := MyPawn white).

	squares := pawn targetSquares.
	self
		assertCollection: squares
		includesAll:
			(#( e5 ) collect: [ :name |
				 board at: name ])
]

{ #category : 'tests' }
MyPawnTest >> testMovesTwoSquares [

	| pawn squares board|
	board := MyChessBoard empty.
	board at: 'a2' put: (pawn := MyInitPawn white).

	squares := pawn targetSquares.
	self
		assertCollection: squares
		includesAll:
			(#( a3 a4) collect: [ :name |
				 board at: name ])
]

{ #category : 'tests' }
MyPawnTest >> testPawnCanCaptureEnPassant [

	| blackPawn whitePawn squares board |
	board := MyChessBoard empty.
	board game: MyChessGame freshGame.
	board at: 'd5' put: (whitePawn := MyPawn white).
	board at: 'c7' put: (blackPawn := MyInitPawn black).
	
	blackPawn moveTo: (board at: 'c5').
	
	squares := whitePawn targetSquares.
	self
		assertCollection: squares
		includesAll:
			(#( c6 d6 ) collect: [ :name |
				 board at: name ]).
			
	whitePawn moveTo: (board at: 'c6').
			
	self assert: (board at: 'c5') contents class equals: MyNoPiece .
]

{ #category : 'tests' }
MyPawnTest >> testReplaceMyInitPawnWithMyPawnAfterMove [

	| pawn board|
	board := MyChessBoard empty.
	board at: 'a2' put: (pawn := MyInitPawn white).
	pawn moveTo: (board at: 'a3').
	
	self assert: (board at: 'a3') contents class equals: MyPawn
]
