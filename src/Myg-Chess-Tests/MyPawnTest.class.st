Class {
	#name : 'MyPawnTest',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyPawnTest >> testCannotCaptureEnPassantAfterSingleSteps [

	| blackPawn whitePawn board |
	board := MyChessBoard empty.
	board game: MyChessGame freshGame.
	board at: 'd5' put: (whitePawn := MyPawn white).
	board at: 'c7' put: (blackPawn := MyInitPawn black).

	blackPawn moveTo: (board at: 'c6').
	blackPawn moveTo: (board at: 'c5').

	self deny: (whitePawn targetSquares includes: (board at: 'c6'))
]

{ #category : 'tests' }
MyPawnTest >> testCannotCaptureEnPassantIfNotImmediatelyAfter [

	| blackPawn otherPawn whitePawn board |
	board := MyChessBoard empty.
	board game: MyChessGame freshGame.
	board at: 'd5' put: (whitePawn := MyPawn white).
	board at: 'c7' put: (blackPawn := MyInitPawn black).
	board at: 'h7' put: (otherPawn := MyInitPawn black).

	blackPawn moveTo: (board at: 'c5').
	otherPawn moveTo: (board at: 'h6').

	self deny: (whitePawn targetSquares includes: (board at: 'c6'))
]

{ #category : 'tests' }
MyPawnTest >> testInitPawnBlockedOnFirstSquareCannotMoveTwo [

	| board pawn |
	board := MyChessBoard empty.
	board game: MyChessGame freshGame.
	board at: 'e2' put: (pawn := MyInitPawn white).
	board at: 'e3' put: MyPawn black.
	self assert: (pawn targetSquares includes: (board at: 'e4')) equals: false
]

{ #category : 'tests' }
MyPawnTest >> testInitPawnBlockedOnSecondSquareCanOnlyMoveOne [

	| board pawn |
	board := MyChessBoard empty.
	board game: MyChessGame freshGame.
	board at: 'e2' put: (pawn := MyInitPawn white).
	board at: 'e4' put: MyPawn black.
	self assert: (pawn targetSquares includes: (board at: 'e3')).
	self assert: (pawn targetSquares includes: (board at: 'e4')) equals: false
]

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
	self assert: (board at: 'c6') contents equals: whitePawn.
]

{ #category : 'tests' }
MyPawnTest >> testPawnCannotMoveDiagonalToNoPieceSquare [
	| board pawn squares |
	board := MyChessBoard empty.
	board game: MyChessGame freshGame.
	board at: 'd4' put: (pawn := MyPawn white).
	squares := pawn targetSquares.
	self assert: (squares includes: (board at: 'c5')) equals: false.
	self assert: (squares includes: (board at: 'e5')) equals: false.
]

{ #category : 'tests' }
MyPawnTest >> testReplaceMyInitPawnWithMyPawnAfterMove [

	| pawn board|
	board := MyChessBoard empty.
	board at: 'a2' put: (pawn := MyInitPawn white).
	pawn moveTo: (board at: 'a3').
	
	self assert: (board at: 'a3') contents class equals: MyPawn
]

{ #category : 'tests' }
MyPawnTest >> testWhitePawnCapturesDiagonalLeft [

	| board pawn |
	board := MyChessBoard empty.
	board game: MyChessGame freshGame.
	board at: 'd4' put: (pawn := MyPawn white).
	board at: 'c5' put: MyPawn black.
	self assert: (pawn targetSquares includes: (board at: 'c5')).

]

{ #category : 'tests' }
MyPawnTest >> testWhitePawnCapturesDiagonalRight [

	| board pawn |
	board := MyChessBoard empty.
	board game: MyChessGame freshGame.
	board at: 'd4' put: (pawn := MyPawn white).
	board at: 'e5' put: MyPawn black.
	self assert: (pawn targetSquares includes: (board at: 'e5'))
]
