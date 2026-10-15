Class {
	#name : 'MyDirection',
	#superclass : 'Object',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'private - enumeration' }
MyDirection >> moveBack: aSquare [
	^ self subclassResponsibility 
]

{ #category : 'private - enumeration' }
MyDirection >> moveBackLeft: aSquare [
		^ (self moveBack: aSquare) left
]

{ #category : 'private - enumeration' }
MyDirection >> moveBackRight: aSquare [
		^ (self moveBack: aSquare) right.
]

{ #category : 'private - enumeration' }
MyDirection >> moveDiagonals: aSquare [
		^ { self moveForwardLeft: aSquare. self moveForwardRigth: aSquare. self moveBackLeft: aSquare. self moveBackRight: aSquare}.
]

{ #category : 'private - enumeration' }
MyDirection >> moveDoubleForward: aSquare [
		^ self moveForward: (self moveForward: aSquare).
]

{ #category : 'private - enumeration' }
MyDirection >> moveForward: aSquare [
	^ self subclassResponsibility 
]

{ #category : 'private - enumeration' }
MyDirection >> moveForwardLeft: aSquare [
		^ (self moveForward: aSquare) left
]

{ #category : 'private - enumeration' }
MyDirection >> moveForwardRigth: aSquare [
		^ (self moveForward: aSquare) right
]
