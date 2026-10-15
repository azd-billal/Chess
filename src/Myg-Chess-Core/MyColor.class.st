Class {
	#name : 'MyColor',
	#superclass : 'Object',
	#instVars : [
		'direction'
	],
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'accessing' }
MyColor >> direction [
	^ direction
]

{ #category : 'accessing' }
MyColor >> direction: anObject [

	direction := anObject
]
