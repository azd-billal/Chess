Class {
	#name : 'MyBlackDirection',
	#superclass : 'MyDirection',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'private - enumeration' }
MyBlackDirection >> moveBack:  aSquare [
	^ aSquare up.
]

{ #category : 'private - enumeration' }
MyBlackDirection >> moveForward:  aSquare [
	^ aSquare down.
]
