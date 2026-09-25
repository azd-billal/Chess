Class {
	#name : 'MyChessNoSquare',
	#superclass : 'MyChessSquare',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'api - configuration' }
MyChessNoSquare >> down [ 
	^ self
]

{ #category : 'testing' }
MyChessNoSquare >> hasPiece [
	^ false	
]

{ #category : 'testing' }
MyChessNoSquare >> isValid [ 
	^ false
]

{ #category : 'accessing' }
MyChessNoSquare >> left [ 
	^ self
]

{ #category : 'accessing' }
MyChessNoSquare >> right [ 
	^ self
]

{ #category : 'instance creation' }
MyChessNoSquare >> up [ 
	^ self
]
