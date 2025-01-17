'From Cuis 6.0 [latest update: #5940] on 23 July 2023 at 1:46:22 pm'!
'Description Please enter a description for this package'!
!provides: 'Neo-CSV-Core' 1 2!
SystemOrganization addCategory: 'Neo-CSV-Core'!


!classDefinition: #NeoCSVReader category: 'Neo-CSV-Core'!
Object subclass: #NeoCSVReader
	instanceVariableNames: 'readStream charBuffer separator stringStream fieldCount recordClass recordClassIsIndexable fieldAccessors emptyFieldValue'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Neo-CSV-Core'!
!classDefinition: 'NeoCSVReader class' category: 'Neo-CSV-Core'!
NeoCSVReader class
	instanceVariableNames: ''!

!classDefinition: #NeoCSVWriter category: 'Neo-CSV-Core'!
Object subclass: #NeoCSVWriter
	instanceVariableNames: 'writeStream separator fieldWriter lineEnd fieldAccessors emptyFieldValue'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Neo-CSV-Core'!
!classDefinition: 'NeoCSVWriter class' category: 'Neo-CSV-Core'!
NeoCSVWriter class
	instanceVariableNames: ''!

!classDefinition: #NeoNumberParser category: 'Neo-CSV-Core'!
Object subclass: #NeoNumberParser
	instanceVariableNames: 'stream base'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Neo-CSV-Core'!
!classDefinition: 'NeoNumberParser class' category: 'Neo-CSV-Core'!
NeoNumberParser class
	instanceVariableNames: ''!


!NeoCSVReader commentStamp: '<historical>' prior: 0!
I am NeoCSVReader.

I read a format that
- is text based (ASCII, Latin1, Unicode)
- consists of records, 1 per line (any line ending convention)
- where records consist of fields separated by a delimiter (comma, tab, semicolon)
- where every record has the same number of fields
- where fields can be quoted should they contain separators or line endings

Without further configuration, records will become Arrays of Strings.

By specifiying a recordClass and fields with optional converters most objects can be read and instanciated correctly.

MIT License.
!

!NeoCSVWriter commentStamp: '<historical>' prior: 0!
I am NeoCSVWriter.

I write a format that
- is text based (ASCII, Latin1, Unicode)
- consists of records, 1 per line (any line ending convention)
- where records consist of fields separated by a delimiter (comma, tab, semicolon)
- where every record has the same number of fields
- where fields can be quoted should they contain separators or line endings

Without further configuration, I write record objects whose fields can be enumerated using #do: such as SequenceableCollections

By specifiying fields any object can be written converting and/or quoting each field as needed.

MIT License.!

!NeoNumberParser commentStamp: '<historical>' prior: 0!
I am NeoNumberParser, an alternative number parser that needs only a minimal read stream protocol. 

I accept the following syntax:

	number
	  int
	  int frac
	  int exp
	  int frac exp
	int
	  digits
	  - digits
	frac
	  . digits
	exp
	  e digits
	digits
	  digit
	  digit digits
	e
	  e
	  e+
	  e-
	  E
	  E+
	  E-

where digit depends on the base (2 to 36), 0 .. 9, A-Z, a-z.!

!NeoCSVReader methodsFor: 'initialize-release' stamp: 'SvenVanCaekenberghe 6/21/2012 22:35'!
addField
	"Add the next indexable field with a pass through converter"
	
	self
		recordClassIsIndexable: true; 
		addFieldAccessor: [ :string | string ]! !

!NeoCSVReader methodsFor: 'initialize-release' stamp: 'SvenVanCaekenberghe 5/13/2013 13:09'!
addField: accessor
	"Add a field based on a mutator accessor accepting a field 
	String as argument to be sent to an instance of recordClass.
	Accessor can be a Symbol or a Block"
	
	self
		recordClassIsIndexable: false; 
		addFieldAccessor: [ :object :string |
			self applyAccessor: accessor on: object with: string ]! !

!NeoCSVReader methodsFor: 'initialize-release' stamp: 'SvenVanCaekenberghe 5/13/2013 13:09'!
addField: accessor converter: converter
	"Add a field based on a mutator accessor accepting the result of 
	applying the converter block on the field String read as argument 
	to be sent to an instance of recordClass.
	Accessor can be a Symbol or a Block"

	self
		recordClassIsIndexable: false; 
		addFieldAccessor: [ :object :string |
			self applyAccessor: accessor on: object with: (converter value: string) ]! !

!NeoCSVReader methodsFor: 'initialize-release' stamp: 'SvenVanCaekenberghe 6/26/2012 20:49'!
addFieldAt: key
	"Add a field that will be stored under key in recordClass as String"
	
	self
		recordClassIsIndexable: false; 
		addFieldAccessor: [ :object :string |
			object at: key put: string ]! !

!NeoCSVReader methodsFor: 'initialize-release' stamp: 'SvenVanCaekenberghe 6/26/2012 20:50'!
addFieldAt: key converter: converter
	"Add a field that will be stored under key in recordClass as the result of 
	applying the converter block on the field String read as argument"

	self
		recordClassIsIndexable: false; 
		addFieldAccessor: [ :object :string |
			object at: key put: (converter value: string) ]! !

!NeoCSVReader methodsFor: 'initialize-release' stamp: 'SvenVanCaekenberghe 6/21/2012 23:00'!
addFieldConverter: converter
	"Add the next indexable field with converter block, 
	accepting a String and returning a specific object"

	self
		recordClassIsIndexable: true; 
		addFieldAccessor: converter! !

!NeoCSVReader methodsFor: 'initialize-release' stamp: 'SvenVanCaekenberghe 5/5/2013 11:06'!
addIgnoredField
	"Add a field that should be ignored, should not become part of the record"

	self addFieldAccessor: nil! !

!NeoCSVReader methodsFor: 'initialize-release' stamp: 'EstebanMaringolo 10/3/2014 12:14'!
addIgnoredFields: count
	"Add a count of consecutive ignored fields to receiver."

	count timesRepeat: [ self addIgnoredField ]! !

!NeoCSVReader methodsFor: 'initialize-release' stamp: 'SvenVanCaekenberghe 6/14/2012 12:32'!
close
	readStream ifNotNil: [
		readStream close.
		readStream := nil ]! !

!NeoCSVReader methodsFor: 'initialize-release' stamp: 'SvenVanCaekenberghe 5/13/2014 15:32'!
emptyFieldValue: object
	"Set the value to be used when reading empty or missing fields.
	The default is nil. Empty or missing fields are never set 
	when the record class is non-indexeabe."
	
	emptyFieldValue := object! !

!NeoCSVReader methodsFor: 'initialize-release' stamp: 'SvenVanCaekenberghe 6/21/2012 23:01'!
fieldCount: anObject
	"Set the field count up front.
	This will be used when reading records as Arrays.
	This instance variable will be set and used automatically based on the first record seen.
	If set, the fieldAccessors collection defines (overrides) the fieldCount."

	fieldCount := anObject! !

!NeoCSVReader methodsFor: 'initialize-release' stamp: 'SvenVanCaekenberghe 6/21/2012 22:29'!
initialize
	super initialize.
	recordClass := Array.
	recordClassIsIndexable := true.
	separator := $,! !

!NeoCSVReader methodsFor: 'initialize-release' stamp: 'SvenVanCaekenberghe 6/25/2012 21:15'!
on: aReadStream
	"Initialize on aReadStream, which should be a character stream that 
	implements #next, #atEnd and (optionally) #close."
	
	readStream := aReadStream! !

!NeoCSVReader methodsFor: 'initialize-release' stamp: 'SvenVanCaekenberghe 5/5/2013 14:26'!
recordClass: anObject
	"Set the object class to instanciate while reading records.
	Unless the objets are integer indexable, you have to specify fields as well."
	
	recordClass := anObject! !

!NeoCSVReader methodsFor: 'initialize-release' stamp: 'SvenVanCaekenberghe 5/13/2014 15:32'!
recordClassIsIndexable: boolean
	"Set whether recordClass should be treated as an indexable sequenceable collection
	class that implements #new: and #streamContents and whose instances implement #at:put: 
	If false, fields accessors have to be provided. The default is true.
	Will be set automatically when field accessors or converters are set."
	
	recordClassIsIndexable := boolean ! !

!NeoCSVReader methodsFor: 'initialize-release' stamp: 'SvenVanCaekenberghe 6/17/2012 16:24'!
separator: character
	"Set the field separator character to use, defaults to comma"
	
	self assert: character isCharacter.
	separator := character ! !

!NeoCSVReader methodsFor: 'private' stamp: 'SvenVanCaekenberghe 6/16/2012 13:33'!
addFieldAccessor: block
	fieldAccessors 
		ifNil: [
			fieldAccessors := Array with: block ]
		ifNotNil: [
			fieldAccessors := fieldAccessors copyWith: block ]! !

!NeoCSVReader methodsFor: 'private' stamp: 'SvenVanCaekenberghe 5/13/2013 10:56'!
applyAccessor: accessor on: object with: value
	"Use accessor to assign value on a property of object.
	Accessor can be a block or mutator symbol."
	
	"If Symbol implemented #value:value: this could be implemented more elegantly."
	
	accessor isBlock
		ifTrue: [ accessor value: object value: value ] 
		ifFalse: [ object perform: accessor with: value ]! !

!NeoCSVReader methodsFor: 'private' stamp: 'SvenVanCaekenberghe 6/25/2012 20:28'!
nextChar
	^ charBuffer 
		ifNil: [ 
			readStream next ]
		ifNotNil: [ | char |
			char := charBuffer.
			charBuffer := nil.
			^ char ]! !

!NeoCSVReader methodsFor: 'private' stamp: 'SvenVanCaekenberghe 6/25/2012 20:23'!
peekChar
	^ charBuffer 
		ifNil: [ 
			charBuffer := readStream next ]! !

!NeoCSVReader methodsFor: 'private' stamp: 'hlsf 7/21/2023 23:25:59'!
peekEndOfLine
	| char |
	char := self peekChar codePoint.
	^ (char == 10 "Character lf" ) or: [ char == 13 "Character cr" ]! !

!NeoCSVReader methodsFor: 'private' stamp: 'hlsf 7/23/2023 13:38:33'!
peekFor: character
	self peekChar = character
		ifTrue: [ 
			self nextChar. 
			^ true ].
	^ false! !

!NeoCSVReader methodsFor: 'private' stamp: 'hlsf 7/23/2023 13:38:28'!
peekQuote
	^ self peekChar = $"! !

!NeoCSVReader methodsFor: 'private' stamp: 'hlsf 7/23/2023 13:38:21'!
peekSeparator
	^ self peekChar = separator! !

!NeoCSVReader methodsFor: 'private' stamp: 'SvenVanCaekenberghe 1/15/2014 09:54'!
readAtEndOrEndOfLine
	^ self atEnd or: [ self readEndOfLine ]
! !

!NeoCSVReader methodsFor: 'private' stamp: 'hlsf 7/21/2023 23:26:12'!
readEndOfLine
	| char |
	char := self peekChar codePoint.
	char == 10 "Character lf"
		ifTrue: [ 
			self nextChar. 
			^ true ].
	char == 13 "Character cr"
		ifTrue: [
			self nextChar.
			(self atEnd not and: [ self peekChar codePoint == 10 "Character lf" ])
				ifTrue: [ 
					self nextChar ]. 
			^ true  ].
	^ false
! !

!NeoCSVReader methodsFor: 'private' stamp: 'SvenVanCaekenberghe 5/13/2014 11:43'!
readEndOfQuotedField	
	(self readQuote and: [ self peekQuote not ])
		ifTrue: [
			^ true ].
	"A double quote inside a quoted field is an embedded quote (escaped)"
	^ false! !

!NeoCSVReader methodsFor: 'private' stamp: 'SvenVanCaekenberghe 1/14/2014 23:47'!
readQuote
	^ self peekFor: $"! !

!NeoCSVReader methodsFor: 'private' stamp: 'SvenVanCaekenberghe 1/14/2014 23:47'!
readSeparator
	^ self peekFor: separator! !

!NeoCSVReader methodsFor: 'private' stamp: 'SvenVanCaekenberghe 6/14/2012 12:32'!
stringStreamContents: block
	"Like String streamContents: block
	but reusing the underlying buffer for improved efficiency"
	
	stringStream 
		ifNil: [ 
			stringStream := (String new: 32) writeStream ].
	stringStream reset.
	block value: stringStream.
	^ stringStream contents! !

!NeoCSVReader methodsFor: 'convenience' stamp: 'SvenVanCaekenberghe 5/5/2013 14:30'!
addFields: accessors
	"Add fields based on a collection of accessors, not doing any conversions."
	
	accessors do: [ :each |
		self addField: each ]! !

!NeoCSVReader methodsFor: 'convenience' stamp: 'SvenVanCaekenberghe 5/5/2013 14:30'!
addFieldsAt: keys
	"Add fields based on a collection of keys for #at:put: not doing any conversions"

	keys do: [ :each |
		self addFieldAt: each ]! !

!NeoCSVReader methodsFor: 'convenience' stamp: 'SvenVanCaekenberghe 5/5/2013 14:34'!
addFloatField
	"Add a field for indexable records parsed as Float"

	self addFieldConverter: [ :string | NeoNumberParser parse: string ]! !

!NeoCSVReader methodsFor: 'convenience' stamp: 'SvenVanCaekenberghe 5/5/2013 14:35'!
addFloatField: accessor
	"Add a field with accessor parsed as Float"

	self 
		addField: accessor 
		converter: [ :string | NeoNumberParser parse: string ]! !

!NeoCSVReader methodsFor: 'convenience' stamp: 'SvenVanCaekenberghe 5/5/2013 14:49'!
addFloatFieldAt: key
	"Add a field for key for #at:put: parsed as Float"

	self 
		addFieldAt: key 
		converter: [ :string | NeoNumberParser parse: string ]! !

!NeoCSVReader methodsFor: 'convenience' stamp: 'SvenVanCaekenberghe 5/5/2013 14:47'!
addIntegerField
	"Add a field for indexable records parsed as Integer"

	self addFieldConverter: [ :string | NeoNumberParser parse: string ]! !

!NeoCSVReader methodsFor: 'convenience' stamp: 'SvenVanCaekenberghe 5/5/2013 14:48'!
addIntegerField: accessor
	"Add a field with accessor parsed as Integer"

	self 
		addField: accessor 
		converter: [ :string | NeoNumberParser parse: string ]! !

!NeoCSVReader methodsFor: 'convenience' stamp: 'SvenVanCaekenberghe 5/5/2013 14:49'!
addIntegerFieldAt: key
	"Add a field for key for #at:put: parsed as Integer"

	self 
		addFieldAt: key 
		converter: [ :string | NeoNumberParser parse: string ]! !

!NeoCSVReader methodsFor: 'convenience' stamp: 'SvenVanCaekenberghe 5/5/2013 14:48'!
addSymbolField
	"Add a field for indexable records read as Symbol"

	self addFieldConverter: [ :string | string asSymbol ]! !

!NeoCSVReader methodsFor: 'convenience' stamp: 'SvenVanCaekenberghe 5/5/2013 14:48'!
addSymbolField: accessor
	"Add a field with accessor read as Symbol"

	self 
		addField: accessor 
		converter: [ :string | string asSymbol ]! !

!NeoCSVReader methodsFor: 'convenience' stamp: 'SvenVanCaekenberghe 5/5/2013 14:49'!
addSymbolFieldAt: key
	"Add a field for key for #at:put: read as Symbol"

	self 
		addFieldAt: key 
		converter: [ :string | string asSymbol ]! !

!NeoCSVReader methodsFor: 'convenience' stamp: 'SvenVanCaekenberghe 5/10/2015 21:59'!
namedColumnsConfiguration
	"Assuming there is a header row that has not yet been read,
	configure the receiver to read each row as a Dictionary where
	each field is stored under a column name.
	Note that each field is read as a string."
	
	self recordClass: Dictionary.
	self addFieldsAt: (self readHeader collect: [ :each | each asSymbol ])! !

!NeoCSVReader methodsFor: 'convenience' stamp: 'SvenVanCaekenberghe 5/13/2014 11:44'!
skipHeader
	"Read a record, presumably a header, with the intention of skipping it.
	This should normally be called only at the beginning and only once.
	This sets the fieldCount (but fieldAccessors overrides fieldCount)."

	self readHeader! !

!NeoCSVReader methodsFor: 'testing' stamp: 'SvenVanCaekenberghe 6/25/2012 20:47'!
atEnd
	^ charBuffer == nil and: [ readStream atEnd ]! !

!NeoCSVReader methodsFor: 'accessing' stamp: 'SvenVanCaekenberghe 6/25/2012 14:45'!
do: block
	"Execute block for each record until I am at end."
	
	[ self atEnd ]
		whileFalse: [ 
			block value: self next ]! !

!NeoCSVReader methodsFor: 'accessing' stamp: 'SvenVanCaekenberghe 6/21/2012 22:30'!
next
	"Read the next record.
	I will return an instance of recordClass."
	
	^ recordClassIsIndexable
		ifTrue: [ self readNextRecordAsArray ] 
		ifFalse: [ self readNextRecordAsObject ]! !

!NeoCSVReader methodsFor: 'accessing' stamp: 'SvenVanCaekenberghe 5/13/2014 15:34'!
readHeader
	"Read a record, presumably a header and return the header field names.
	This should normally be called only at the beginning and only once.
	This sets the fieldCount (but fieldAccessors overrides fieldCount)."

	| names |
	names := Array streamContents: [ :out |
		 [ self atEnd or: [ self readEndOfLine ] ]
			whileFalse: [ 
				out nextPut: self readField.
				(self readSeparator and: [ self atEnd or: [ self peekEndOfLine ] ])
					ifTrue: [ out nextPut: emptyFieldValue ] ] ].
	fieldCount := names size.
	^ names! !

!NeoCSVReader methodsFor: 'accessing' stamp: 'SvenVanCaekenberghe 10/6/2014 17:34'!
select: filter
	"Read and collect records that satisfy filter into an Array until there are none left.
	Return the array."

	^ Array streamContents: [ :stream | 
		self 
			select: filter 
			thenDo: [ :each | stream nextPut: each ] ]! !

!NeoCSVReader methodsFor: 'accessing' stamp: 'SvenVanCaekenberghe 10/6/2014 17:33'!
select: filter thenDo: block
	"Execute block for each record that satisfies filter until I am at end."

	[ self atEnd ]
		whileFalse: [ 
			| record |
			record := self next.
			(filter value: record)
				ifTrue: [ block value: record ] ]! !

!NeoCSVReader methodsFor: 'accessing' stamp: 'SvenVanCaekenberghe 6/25/2012 14:45'!
upToEnd 
	"Read and collect records into an Array until there are none left.
	Return the array."
	
	^ Array streamContents: [ :stream |
		self do: [ :each | stream nextPut: each ] ]! !

!NeoCSVReader methodsFor: 'private - reading' stamp: 'SvenVanCaekenberghe 6/14/2012 17:24'!
readField
	^ self peekQuote
		ifTrue: [
			self readQuotedField ]
		ifFalse: [
			self readUnquotedField ]! !

!NeoCSVReader methodsFor: 'private - reading' stamp: 'SvenVanCaekenberghe 1/15/2014 10:11'!
readFieldAndSeparator
	| field |
	field := self readField.
	self readSeparator.
	^ field! !

!NeoCSVReader methodsFor: 'private - reading' stamp: 'SvenVanCaekenberghe 5/13/2014 15:34'!
readFirstRecord 
	"This is only used for array based records when there are no field accessors or 
	when there is no field count, to obtain a field count based on the first record"
	
	^ recordClass streamContents: [ :stream |
		[ self atEnd or: [ self readEndOfLine ] ]
			whileFalse: [ 
				stream nextPut: self readField.
				(self readSeparator and: [ self atEnd or: [ self peekEndOfLine ] ])
					ifTrue: [ stream nextPut: emptyFieldValue ] ] ]! !

!NeoCSVReader methodsFor: 'private - reading' stamp: 'SvenVanCaekenberghe 1/15/2014 09:55'!
readNextRecord
	| record |
	record := recordClass new: fieldCount.
	fieldAccessors
		ifNil: [ self readNextRecordWithoutFieldAccessors: record ]
		ifNotNil: [ self readNextRecordWithFieldAccessors: record ].
	self readAtEndOrEndOfLine.
	^ record! !

!NeoCSVReader methodsFor: 'private - reading' stamp: 'SvenVanCaekenberghe 5/5/2013 13:17'!
readNextRecordAsArray
	fieldAccessors ifNotNil: [ 
		fieldCount := fieldAccessors count: [ :each | each notNil ] ].
	^ fieldCount 
		ifNil: [ | record |
			record := self readFirstRecord.
			fieldCount := record size.
			record ] 
		ifNotNil: [
			self readNextRecord ]! !

!NeoCSVReader methodsFor: 'private - reading' stamp: 'SvenVanCaekenberghe 5/13/2014 15:35'!
readNextRecordAsObject
	| object |
	object := recordClass new.
	fieldAccessors do: [ :each | | rawValue |
		rawValue := self readFieldAndSeparator.
		"Note that empty/missing fields are not set"
		(rawValue = emptyFieldValue or: [ each isNil ])
			ifFalse: [ each value: object value: rawValue ] ].
	self readAtEndOrEndOfLine.
	^ object! !

!NeoCSVReader methodsFor: 'private - reading' stamp: 'SvenVanCaekenberghe 9/18/2014 09:50'!
readNextRecordWithFieldAccessors: record
	| fieldIndex |
	fieldIndex := 1.
	fieldAccessors do: [ :each | | rawValue |
		rawValue := self readFieldAndSeparator.
		"nil field accessors are used to ignore fields"
		each
			ifNotNil: [ 
				rawValue = emptyFieldValue
					ifTrue: [ record at: fieldIndex put: emptyFieldValue ]
					ifFalse: [ record at: fieldIndex put: (each value: rawValue) ].
				fieldIndex := fieldIndex + 1 ] ]! !

!NeoCSVReader methodsFor: 'private - reading' stamp: 'SvenVanCaekenberghe 9/18/2014 09:42'!
readNextRecordWithoutFieldAccessors: record
	1 to: fieldCount do: [ :each |
		record at: each put: self readFieldAndSeparator ]! !

!NeoCSVReader methodsFor: 'private - reading' stamp: 'SvenVanCaekenberghe 5/13/2014 15:36'!
readQuotedField
	| field |
	self readQuote.
	field := self stringStreamContents: [ :stream |
		[ self atEnd or: [ self readEndOfQuotedField ] ]
			whileFalse: [
				stream nextPut: self nextChar ] ].
	^ field isEmpty
		ifTrue: [ emptyFieldValue ]
		ifFalse: [ field ]! !

!NeoCSVReader methodsFor: 'private - reading' stamp: 'SvenVanCaekenberghe 5/13/2014 15:36'!
readUnquotedField
	(self atEnd or: [ self peekSeparator or: [ self peekEndOfLine ] ])
		ifTrue: [ ^ emptyFieldValue ].
	^ self stringStreamContents: [ :stream |
		[ self atEnd or: [ self peekSeparator or: [ self peekEndOfLine ] ] ]
			whileFalse: [ 
				stream nextPut: self nextChar ] ]! !

!NeoCSVReader class methodsFor: 'instance creation' stamp: 'SvenVanCaekenberghe 6/25/2012 21:15'!
on: readStream
	"Initialize on readStream, which should be a character stream that 
	implements #next, #atEnd and (optionally) #close."

	^ self new
		on: readStream;
		yourself! !

!NeoCSVWriter methodsFor: 'initialize-release' stamp: 'SvenVanCaekenberghe 5/13/2013 11:09'!
addConstantField: string
	"Add a constant field to be written using fieldWriter"

	self addFieldAccessor: [ :object |
		self writeField: string ]! !

!NeoCSVWriter methodsFor: 'initialize-release' stamp: 'SvenVanCaekenberghe 5/13/2013 11:09'!
addEmptyField
	"Add an empty field to be written using fieldWriter"

	self addFieldAccessor: [ :object |
		self writeField: '' ]! !

!NeoCSVWriter methodsFor: 'initialize-release' stamp: 'SvenVanCaekenberghe 5/13/2013 13:10'!
addField: accessor
	"Add a field based on an accessor to be written using fieldWriter.
	Accessor can be a Symbol or a Block"

	self addFieldAccessor: [ :object |
		self writeField: (accessor value: object) ]! !

!NeoCSVWriter methodsFor: 'initialize-release' stamp: 'SvenVanCaekenberghe 6/23/2014 11:19'!
addFieldAt: key
	"Add a field based on a key to be written using fieldWriter"

	self addFieldAccessor: [ :object |
		self writeField: (object at: key ifAbsent: [ '' ]) ]! !

!NeoCSVWriter methodsFor: 'initialize-release' stamp: 'SvenVanCaekenberghe 5/13/2013 13:10'!
addObjectField: accessor
	"Add a field based on an accessor to be written as an #object field.
	Accessor can be a Symbol or a Block"

	self addFieldAccessor: [ :object |
		self writeObjectField: (accessor value: object) ]! !

!NeoCSVWriter methodsFor: 'initialize-release' stamp: 'SvenVanCaekenberghe 6/26/2012 20:30'!
addObjectFieldAt: key
	"Add a field based on a key to be written as an #object field"

	self addFieldAccessor: [ :object |
		self writeObjectField: (object at: key) ]! !

!NeoCSVWriter methodsFor: 'initialize-release' stamp: 'SvenVanCaekenberghe 5/13/2013 13:10'!
addQuotedField: accessor
	"Add a field based on an accessor to be written as a #quoted field.
	Accessor can be a Symbol or a Block"

	self addFieldAccessor: [ :object |
		self writeQuotedField: (accessor value: object) ]! !

!NeoCSVWriter methodsFor: 'initialize-release' stamp: 'SvenVanCaekenberghe 6/26/2012 20:30'!
addQuotedFieldAt: key
	"Add a field based on a key to be written as a #quoted field"

	self addFieldAccessor: [ :object |
		self writeQuotedField: (object at: key) ]! !

!NeoCSVWriter methodsFor: 'initialize-release' stamp: 'SvenVanCaekenberghe 5/13/2013 13:10'!
addRawField: accessor
	"Add a field based on an accessor to be written as a #raw field.
	Accessor can be a Symbol or a Block"

	self addFieldAccessor: [ :object |
		self writeRawField: (accessor value: object) ]! !

!NeoCSVWriter methodsFor: 'initialize-release' stamp: 'SvenVanCaekenberghe 6/26/2012 20:31'!
addRawFieldAt: key
	"Add a field based on a key to be written as a #raw field"

	self addFieldAccessor: [ :object |
		self writeRawField: (object at: key) ]! !

!NeoCSVWriter methodsFor: 'initialize-release' stamp: 'SvenVanCaekenberghe 6/14/2012 10:10'!
close
	writeStream ifNotNil: [
		writeStream close.
		writeStream := nil ]! !

!NeoCSVWriter methodsFor: 'initialize-release' stamp: 'SvenVanCaekenberghe 9/18/2014 09:21'!
emptyFieldValue: object
	"Set the empty field value to object.
	When reading fields from records to be written out, 
	if the field value equals the emptyFieldValue,
	it will be considered an empty field and written as such."
	
	emptyFieldValue := object! !

!NeoCSVWriter methodsFor: 'initialize-release' stamp: 'SvenVanCaekenberghe 6/17/2012 16:31'!
fieldWriter: symbol
	"Set the field write to be used, either #quoted (the default), #raw or #object.
	This determines how field values will be written in the general case.
	#quoted will wrap fields #asString in double quotes and escape embedded double quotes
	#raw will write fields #asString as such (no separator, double quote or end of line chars allowed)
	#object will #print: fields (no separator, double quote or end of line chars allowed)"
	
	self assert: (#(quoted raw object) includes: symbol).
	fieldWriter := ('write', symbol capitalized, 'Field:') asSymbol
	! !

!NeoCSVWriter methodsFor: 'initialize-release' stamp: 'SvenVanCaekenberghe 6/15/2012 19:16'!
initialize 
	super initialize.
	lineEnd := String crlfString.
	separator := $, .
	fieldWriter := #writeQuotedField: 
! !

!NeoCSVWriter methodsFor: 'initialize-release' stamp: 'SvenVanCaekenberghe 6/17/2012 16:25'!
lineEndConvention: symbol
	"Set the end of line convention to be used.
	Either #cr, #lf or #crlf (the default)."
	
	self assert: (#(cr lf crlf) includes: symbol).
	lineEnd := String perform: symbol! !

!NeoCSVWriter methodsFor: 'initialize-release' stamp: 'SvenVanCaekenberghe 6/14/2012 09:48'!
on: aWriteStream
	"Initialize on aWriteStream, which should be a character stream that 
	implements #nextPut:, #nextPutAll:, #space and (optionally) #close."

	writeStream := aWriteStream
! !

!NeoCSVWriter methodsFor: 'initialize-release' stamp: 'SvenVanCaekenberghe 6/17/2012 16:24'!
separator: character
	"Set character to be used as separator"
	
	self assert: character isCharacter.
	separator := character ! !

!NeoCSVWriter methodsFor: 'private' stamp: 'SvenVanCaekenberghe 6/15/2012 23:03'!
addFieldAccessor: block
	fieldAccessors 
		ifNil: [
			fieldAccessors := Array with: block ]
		ifNotNil: [
			fieldAccessors := fieldAccessors copyWith: block ]! !

!NeoCSVWriter methodsFor: 'private' stamp: 'SvenVanCaekenberghe 6/15/2012 19:16'!
writeEndOfLine
	writeStream nextPutAll: lineEnd ! !

!NeoCSVWriter methodsFor: 'private' stamp: 'SvenVanCaekenberghe 6/15/2012 12:47'!
writeField: object
	self perform: fieldWriter with: object! !

!NeoCSVWriter methodsFor: 'private' stamp: 'SvenVanCaekenberghe 6/15/2012 22:37'!
writeFieldsUsingAccessors: anObject
	| first |
	first := true.
	fieldAccessors do: [ :each | | fieldValue | 
		first ifTrue: [ first := false ] ifFalse: [ self writeSeparator ].
		fieldValue := each value: anObject ]! !

!NeoCSVWriter methodsFor: 'private' stamp: 'SvenVanCaekenberghe 6/15/2012 19:45'!
writeFieldsUsingDo: anObject
	| first |
	first := true.
	anObject do: [ :each |
		first ifTrue: [ first := false ] ifFalse: [ self writeSeparator ].
		self writeField: each ]! !

!NeoCSVWriter methodsFor: 'private' stamp: 'SvenVanCaekenberghe 5/13/2014 15:51'!
writeObjectField: object
	object = emptyFieldValue
		ifFalse: [ object printOn: writeStream ]! !

!NeoCSVWriter methodsFor: 'private' stamp: 'SvenVanCaekenberghe 5/13/2014 15:53'!
writeQuotedField: object
	object = emptyFieldValue
		ifTrue: [ writeStream nextPut: $" ; nextPut: $" ]
		ifFalse: [ | string |
			string := object asString.
			writeStream nextPut: $".
			string do: [ :each |
				each == $" 
					ifTrue: [ writeStream nextPut: $"; nextPut: $" ]
					ifFalse: [ writeStream nextPut: each ] ].
			writeStream nextPut: $" ]! !

!NeoCSVWriter methodsFor: 'private' stamp: 'SvenVanCaekenberghe 9/18/2014 09:20'!
writeRawField: object
	object = emptyFieldValue 
		ifFalse: [ writeStream nextPutAll: object asString ]! !

!NeoCSVWriter methodsFor: 'private' stamp: 'SvenVanCaekenberghe 6/14/2012 10:03'!
writeSeparator
	writeStream nextPut: separator ! !

!NeoCSVWriter methodsFor: 'convenience' stamp: 'SvenVanCaekenberghe 6/16/2012 13:34'!
addFields: accessors
	accessors do: [ :each |
		self addField: each ]! !

!NeoCSVWriter methodsFor: 'convenience' stamp: 'SvenVanCaekenberghe 6/26/2012 20:31'!
addFieldsAt: keys
	keys do: [ :each |
		self addFieldAt: each ]! !

!NeoCSVWriter methodsFor: 'convenience' stamp: 'SvenVanCaekenberghe 6/15/2012 22:38'!
addObjectFields: accessors
	accessors do: [ :each |
		self addObjectField: each ]! !

!NeoCSVWriter methodsFor: 'convenience' stamp: 'SvenVanCaekenberghe 6/26/2012 20:31'!
addObjectFieldsAt: keys
	keys do: [ :each |
		self addObjectFieldAt: each ]! !

!NeoCSVWriter methodsFor: 'convenience' stamp: 'SvenVanCaekenberghe 6/15/2012 22:39'!
addQuotedFields: accessors
	accessors do: [ :each |
		self addQuotedField: each ]! !

!NeoCSVWriter methodsFor: 'convenience' stamp: 'SvenVanCaekenberghe 6/26/2012 20:32'!
addQuotedFieldsAt: keys
	keys do: [ :each |
		self addQuotedFieldAt: each ]! !

!NeoCSVWriter methodsFor: 'convenience' stamp: 'SvenVanCaekenberghe 6/15/2012 22:38'!
addRawFields: accessors
	accessors do: [ :each |
		self addRawField: each ]! !

!NeoCSVWriter methodsFor: 'convenience' stamp: 'SvenVanCaekenberghe 6/26/2012 20:32'!
addRawFieldsAt: keys
	keys do: [ :each |
		self addRawFieldAt: each ]! !

!NeoCSVWriter methodsFor: 'convenience' stamp: 'SvenVanCaekenberghe 5/10/2015 21:51'!
namedColumnsConfiguration: columns
	"Configure the receiver to output the named columns as keyed properties.
	The objects to be written should respond to #at: like a Dictionary.
	Writes a header first. Uses the configured field writer."
	
	self writeHeader: columns.
	self addFieldsAt: columns! !

!NeoCSVWriter methodsFor: 'accessing' stamp: 'SvenVanCaekenberghe 6/17/2012 19:39'!
flush
	writeStream flush! !

!NeoCSVWriter methodsFor: 'accessing' stamp: 'SvenVanCaekenberghe 6/17/2012 16:23'!
nextPut: anObject
	"Write anObject as single record.
	Depending on configuration fieldAccessors or a #do: enumeration will be used."
	
	fieldAccessors 
		ifNil: [
			self writeFieldsUsingDo: anObject ]
		ifNotNil: [
			self writeFieldsUsingAccessors: anObject ].
	self writeEndOfLine ! !

!NeoCSVWriter methodsFor: 'accessing' stamp: 'SvenVanCaekenberghe 6/17/2012 16:23'!
nextPutAll: collection
	"Write a collection of objects as records"
	
	collection do: [ :each | 
		self nextPut: each ]! !

!NeoCSVWriter methodsFor: 'accessing' stamp: 'SvenVanCaekenberghe 12/11/2013 21:47'!
writeHeader: fieldNames
	"Write the header, a collection of field names.
	This should normally be called only at the beginning and only once."
	
	fieldNames 
		do: [ :each | self writeQuotedField: each ]
		separatedBy: [ self writeSeparator ].
	self writeEndOfLine! !

!NeoCSVWriter class methodsFor: 'instance creation' stamp: 'SvenVanCaekenberghe 6/14/2012 09:47'!
on: writeStream
	"Initialize on writeStream, which should be a character stream that 
	implements #nextPut:, #nextPutAll:, #space and (optionally) #close."

	^ self new
		on: writeStream;
		yourself! !

!NeoNumberParser methodsFor: 'initialize-release' stamp: 'SvenVanCaekenberghe 12/2/2012 13:44'!
base: integer
	self assert: (integer between: 2 and: 36) description: 'Number base must be between 2 and 36'.
	base := integer! !

!NeoNumberParser methodsFor: 'initialize-release' stamp: 'SvenVanCaekenberghe 12/2/2012 13:49'!
initialize
	super initialize.
	self base: 10! !

!NeoNumberParser methodsFor: 'initialize-release' stamp: 'SvenVanCaekenberghe 12/2/2012 13:43'!
on: readStream
	stream := readStream ! !

!NeoNumberParser methodsFor: 'parsing' stamp: 'SvenVanCaekenberghe 12/2/2012 17:30'!
consumeWhitespace
	"Strip whitespaces from the input stream."

	[ stream atEnd not and: [ stream peek isSeparator ] ] 
		whileTrue: [ stream next ]
! !

!NeoNumberParser methodsFor: 'parsing' stamp: 'SvenVanCaekenberghe 12/3/2012 11:00'!
parseNumber
	| negated number |
	negated := stream peekFor: $-.
	number := self parseNumberInteger.
	(stream peekFor: $.)
		ifTrue: [ number := number + self parseNumberFraction ].
	((stream peekFor: $e) or: [ stream peekFor: $E ])
		ifTrue: [ number := number * self parseNumberExponent ].
	negated
		ifTrue: [ number := number negated ].
	^ number! !

!NeoNumberParser methodsFor: 'parsing' stamp: 'SvenVanCaekenberghe 12/2/2012 20:06'!
parseNumberExponent
	| number negated |
	number := 0.
	(negated := stream peekFor: $-)
		ifFalse: [ stream peekFor: $+ ].
	[ stream atEnd not and: [ stream peek digitValue between: 0 and: base - 1 ] ]
		whileTrue: [ number := base * number + stream next digitValue ].
	negated
		ifTrue: [ number := number negated ].
	^ base raisedTo: number! !

!NeoNumberParser methodsFor: 'parsing' stamp: 'SvenVanCaekenberghe 12/2/2012 20:06'!
parseNumberFraction
	| number power |
	number := 0.
	power := 1.0.
	[ stream atEnd not and: [ stream peek digitValue between: 0 and: base - 1 ] ]
		whileTrue: [ 
			number := base * number + stream next digitValue.
			power := power * base ].
	^ number / power! !

!NeoNumberParser methodsFor: 'parsing' stamp: 'SvenVanCaekenberghe 12/2/2012 20:06'!
parseNumberInteger
	| number |
	number := nil.
	[ stream atEnd not and: [ stream peek digitValue between: 0 and: base - 1 ] ]
		whileTrue: [ number := base * (number ifNil: [ 0 ]) + stream next digitValue ].
	number ifNil: [ self error: 'Integer digit expected' ].
	^ number! !

!NeoNumberParser methodsFor: 'accessing' stamp: 'SvenVanCaekenberghe 12/2/2012 13:31'!
next
	^ self parseNumber! !

!NeoNumberParser class methodsFor: 'instance creation' stamp: 'SvenVanCaekenberghe 12/2/2012 13:31'!
on: readStream
	^ self new
		on: readStream;
		yourself! !

!NeoNumberParser class methodsFor: 'queries' stamp: 'SvenVanCaekenberghe 12/2/2012 13:35'!
parse: stringOrStream
	| stream |
	stream := stringOrStream isString
		ifTrue: [ stringOrStream readStream ]
		ifFalse: [ stringOrStream ].
	^ (self on: stream) next! !

!NeoNumberParser class methodsFor: 'queries' stamp: 'SvenVanCaekenberghe 12/2/2012 13:51'!
parse: stringOrStream base: base
	| stream |
	stream := stringOrStream isString
		ifTrue: [ stringOrStream readStream ]
		ifFalse: [ stringOrStream ].
	^ (self on: stream)
		base: base;
		next! !

!NeoNumberParser class methodsFor: 'queries' stamp: 'SvenVanCaekenberghe 12/2/2012 17:43'!
parse: stringOrStream base: base ifFail: block
	^ [ self parse: stringOrStream base: base ]
		on: Error
		do: block! !

!NeoNumberParser class methodsFor: 'queries' stamp: 'SvenVanCaekenberghe 12/2/2012 17:43'!
parse: stringOrStream ifFail: block
	^ [ self parse: stringOrStream ]
		on: Error
		do: block! !
