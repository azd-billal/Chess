Class {
	#name : 'MyNoPiece',
	#superclass : 'MyPiece',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'accessing' }
MyNoPiece >> color [
	^ nil
]

{ #category : 'accessing' }
MyNoPiece >> id [
	^ nil
]

{ #category : 'testing' }
MyNoPiece >> isPiece [
	^ false.
]

{ #category : 'testing' }
MyNoPiece >> isWhite [
	
	^ false.
]

{ #category : 'rendering' }
MyNoPiece >> renderPieceOn: aSquare [

	^ aSquare renderNoPiece: self
]

{ #category : 'rendering' }
MyNoPiece >> targetSquaresLegal: aBoolean [

	^ #().
]
