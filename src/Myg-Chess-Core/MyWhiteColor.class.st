Class {
	#name : 'MyWhiteColor',
	#superclass : 'MyColor',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'initialization' }
MyWhiteColor >> initialize [ 
	direction := MyWhiteDirection new.
]

{ #category : 'initialization' }
MyWhiteColor >> renderBishopOn: aSquare [
	^ aSquare renderWhiteBishop
]

{ #category : 'initialization' }
MyWhiteColor >> renderKingOn: aSquare [
	^ aSquare renderWhiteKing.
]

{ #category : 'initialization' }
MyWhiteColor >> renderKnightOn: aSquare [
	^ aSquare renderWhiteKnight
]

{ #category : 'initialization' }
MyWhiteColor >> renderPawnOn: aSquare [
	^ aSquare renderWhitePawn
]

{ #category : 'initialization' }
MyWhiteColor >> renderQueenOn: aSquare [
	^ aSquare renderWhiteQueen.
]

{ #category : 'initialization' }
MyWhiteColor >> renderRookOn: aSquare [
	^ aSquare renderWhiteRook
]
