Class {
	#name : 'MyWhiteDirection',
	#superclass : 'MyDirection',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'private - enumeration' }
MyWhiteDirection >> moveBack:  aSquare [
	^ aSquare down.
]

{ #category : 'private - enumeration' }
MyWhiteDirection >> moveForward: aSquare [
	^ aSquare up.
]
