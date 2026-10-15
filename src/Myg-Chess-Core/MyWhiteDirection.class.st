Class {
	#name : 'MyWhiteDirection',
	#superclass : 'MyDirection',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'private - enumeration' }
MyWhiteDirection >> moveBack:  aSquare [
	^ aSquare up.
]

{ #category : 'private - enumeration' }
MyWhiteDirection >> moveForward: aSquare [
	^ aSquare up.
]
