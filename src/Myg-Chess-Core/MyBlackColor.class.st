Class {
	#name : 'MyBlackColor',
	#superclass : 'MyColor',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'initialization' }
MyBlackColor >> initialize [ 
	direction := MyBlackDirection new.
]

{ #category : 'rendering' }
MyBlackColor >> renderBishopOn: aSquare [
	^ aSquare renderBlackBishop
]

{ #category : 'rendering' }
MyBlackColor >> renderKingOn: aSquare [
	^ aSquare renderBlackKing.
]

{ #category : 'rendering' }
MyBlackColor >> renderKnightOn: aSquare [
	^ aSquare renderBlackKnight
]

{ #category : 'rendering' }
MyBlackColor >> renderPawnOn: aSquare [
	^ aSquare renderBlackPawn
]

{ #category : 'rendering' }
MyBlackColor >> renderQueenOn: aSquare [
	^ aSquare renderBlackQueen.
]

{ #category : 'rendering' }
MyBlackColor >> renderRookOn: aSquare [
	^ aSquare renderBlackRook
]
