'From Cuis7.0 [latest update: #6452] on 16 August 2024 at 2:34:24 pm'!
'Description '!
!provides: 'Doyen' 1 23!
SystemOrganization addCategory: #'Doyen-Classes'!
SystemOrganization addCategory: 'Doyen-Suivi'!


!classDefinition: #Classe category: #'Doyen-Classes'!
Object subclass: #Classe
	instanceVariableNames: 'nom sections effectif eleves'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Doyen-Classes'!
!classDefinition: 'Classe class' category: #'Doyen-Classes'!
Classe class
	instanceVariableNames: ''!

!classDefinition: #Eleve category: #'Doyen-Classes'!
Object subclass: #Eleve
	instanceVariableNames: 'nom prenom ancienGroupe classeAttribuee classesExclues sexe score sections dys separerDe mettreAvec mobile email'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Doyen-Classes'!
!classDefinition: 'Eleve class' category: #'Doyen-Classes'!
Eleve class
	instanceVariableNames: ''!

!classDefinition: #Volee9 category: #'Doyen-Classes'!
Object subclass: #Volee9
	instanceVariableNames: 'eleves classes sections elevesEnsemble csvClasses csvEleves voleePreferee csvInfoEleves'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Doyen-Classes'!
!classDefinition: 'Volee9 class' category: #'Doyen-Classes'!
Volee9 class
	instanceVariableNames: ''!

!classDefinition: #SuiviClasses category: 'Doyen-Suivi'!
Object subclass: #SuiviClasses
	instanceVariableNames: 'classes'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Doyen-Suivi'!
!classDefinition: 'SuiviClasses class' category: 'Doyen-Suivi'!
SuiviClasses class
	instanceVariableNames: ''!

!classDefinition: #SuiviEleve category: 'Doyen-Suivi'!
Object subclass: #SuiviEleve
	instanceVariableNames: 'nom prenom dateNaissance telephoneFixe telephoneMobile1 telephoneMobile2 emailPere emailMere emailLogeur'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Doyen-Suivi'!
!classDefinition: 'SuiviEleve class' category: 'Doyen-Suivi'!
SuiviEleve class
	instanceVariableNames: ''!


!Eleve commentStamp: 'hlsf 7/1/2024 14:06:23' prior: 0!
Je représente un élève avec les attributs nécessaire afin de m'attribuer un groupe (classe).
- nom, prénom : chaîne de caractère
- classeAttribuée : classe attribuée déterminée par le sytème (objet Classe) ou bien classe imposée, déterminée lors de l'importation des données, cette valeur peut être une chaîne de caractères, c'est alors le nom d'une classe qui sera ensuite remplacé par l'objet classe ad-hoc.
- classeExcluée : classes dans lesquelles l'élève ne peut pas être affecté. Importées comme des chaînes de caractères puis remplacés par les objets classes ad-hoc
- sexe : caractère $M ou $F
- score : moyenne des notes français, mathématiques. Le français compte double pour la détermination du score
- dys: booléen
- séparerDe, mettreAvec : collection d'élèves, importés comme chaînes de caractères (prénom nom) puis remplacé par les objets élève ad-hoc.
- sections: les sections de l'élève, peut être #MI et #R2
- ancienGroupe: l'école ou la classe l'année précédente
- mobile: un boolean l'élève peut-il être déplacé de classe : 
!

!Volee9 commentStamp: 'hlsf 8/16/2024 14:34:16' prior: 0!
Ordre d'importation des données:
1) La liste établie des classes avec le nom, la/les sections, l'effectif
2) La liste établie des élèves, extraite de SMOG avec nom, prénom, sexe, section,...
3) La liste des recommendations pour chaque élèves

Volée d'élèves à enrôler dans une collection de classes
- élèves : collections d'Elève de cette volée
- sections : collection de symbol de cette volée #R1 #R2 #R3 #MI #DR!

!SuiviClasses commentStamp: '<historical>' prior: 0!
Pour chaque élèves les informations suivantes sont fournies dans le fichier CSV:
- Nom
- Prenom
- DateNaissance
- TelephoneFixe
- TelephoneMobile1
- TelephoneMobile2
- EmailPere
- EmailMere
- EmailLogeur!

!SuiviEleve commentStamp: '<historical>' prior: 0!
Fiche information suivi eleve!

!Classe methodsFor: 'accessing' stamp: 'hlsf 6/30/2024 13:19:55'!
ajouterEleve: unEleve
" 	
	Ajouter unEleve à ma liste d'élèves. Vérifier s'il n'est pas déjà dans une autre classe
"
	unEleve classeAttribuee = self
		ifFalse: [	
			eleves add: unEleve.
			unEleve classeAttribuee estClasse ifTrue: [unEleve classeAttribuee enleverEleve: unEleve].
			unEleve classeAttribuee: self ]! !

!Classe methodsFor: 'accessing' stamp: 'hlsf 6/30/2024 15:06:27'!
ajouterEleves: unGroupe
	unGroupe do: [:unEleve | self ajouterEleve: unEleve]! !

!Classe methodsFor: 'accessing' stamp: 'hlsf 7/1/2024 14:12:57'!
anciensGroupes
	| anciensGroupes |
	anciensGroupes := Dictionary new.
	eleves do: [:unEleve |
		unEleve ancienGroupe ifNotNil: [:groupe |
			anciensGroupes 
				at: groupe
				ifPresent: [:collection | collection add: unEleve]
				ifAbsent: [anciensGroupes at: groupe put: (OrderedCollection with: unEleve)]
			]
		].
	^ anciensGroupes 
	! !

!Classe methodsFor: 'accessing' stamp: 'hlsf 6/29/2024 09:15:47'!
effectif: anObject
	"Set the value of effectif"

	effectif := anObject! !

!Classe methodsFor: 'accessing' stamp: 'hlsf 6/30/2024 10:41:42'!
eleves
	^ eleves! !

!Classe methodsFor: 'accessing' stamp: 'hlsf 7/26/2024 18:37:30'!
eleves: uneCollection
" A ne pas utiliser,  à moins de savoir ce que tu fais "
	eleves := uneCollection ! !

!Classe methodsFor: 'accessing' stamp: 'hlsf 6/30/2024 13:19:06'!
enleverEleve: unEleve
	eleves remove: unEleve.
	unEleve classeAttribuee: nil! !

!Classe methodsFor: 'accessing' stamp: 'hlsf 6/29/2024 09:15:47'!
nom
	"Answer the value of nom"

	^ nom! !

!Classe methodsFor: 'accessing' stamp: 'hlsf 6/28/2024 12:36:10'!
nom: aString 
	nom := aString! !

!Classe methodsFor: 'accessing' stamp: 'hlsf 6/30/2024 10:17:30'!
sections
	"Answer the value of section"

	^ sections! !

!Classe methodsFor: 'accessing' stamp: 'hlsf 6/30/2024 10:13:46'!
sections: anObject
	sections := anObject virguleSeparer collect: [:uneSection |  uneSection asUppercase asSymbol]! !

!Classe methodsFor: 'initialization' stamp: 'hlsf 6/29/2024 17:09:26'!
initialize
	super initialize.
	eleves := SortedCollection new.! !

!Classe methodsFor: 'metric' stamp: 'hlsf 6/30/2024 11:18:50'!
dys
	" Indique le nombre d'élèves dys "
	^ eleves count: [:each | each estDys]! !

!Classe methodsFor: 'metric' stamp: 'hlsf 6/29/2024 09:15:47'!
effectif
	"Answer the value of effectif"

	^ effectif! !

!Classe methodsFor: 'metric' stamp: 'hlsf 7/1/2024 14:33:51'!
elevesSeuls
"
	Qté d'élèves isolés dans ce groupe 
"
	^ self anciensGroupes count: [:assoc | assoc value size = 1]! !

!Classe methodsFor: 'metric' stamp: 'hlsf 6/30/2024 15:19:30'!
filles
	^ eleves count: [:each | each estFille ]! !

!Classe methodsFor: 'metric' stamp: 'hlsf 6/30/2024 15:20:38'!
garcons
	^ eleves count: [:each | each estGarcon ]! !

!Classe methodsFor: 'metric' stamp: 'hlsf 6/30/2024 16:41:03'!
score
	^ [(eleves sum: [:unEleve | unEleve score]) / eleves size] on: Error do: 0! !

!Classe methodsFor: 'printing' stamp: 'hlsf 7/26/2024 18:33:28'!
printOn: stream
	stream nextPutAll: nom.
	sections ifNotNil: [sections 
		do: [:uneSection | stream nextPutAll: uneSection]
		separatedBy: [stream nextPut: $/] ].
	stream
		nextPutAll: ' ('; 
		print: eleves size;
		nextPut: $/;
		print: effectif; 
		nextPutAll: ' t' ;
		print: self dys;
		nextPutAll: ' g';
		print: self garcons;
		nextPutAll: ' f';
		print: self filles;
		nextPutAll: ' s';
		nextPutAll: (self score printStringFractionDigits: 1);
		nextPutAll: ' i';
		print: self elevesSeuls ;
		nextPut: $)
	! !

!Classe methodsFor: 'testing' stamp: 'hlsf 6/30/2024 10:32:04'!
estClasse
	^ true! !

!Classe methodsFor: 'testing' stamp: 'hlsf 6/30/2024 15:50:53'!
estCompatible: unEleve
"
	- unEleve est-il à exclure de ma classe ?
	- unEleve est-il à séparer des élèves déjà dans ma classe ?
"
	^ (unEleve estExcluDe: self) not 
		and: [eleves noneSatisfy: [:chaqueEleve | 
			(chaqueEleve estSepareDe: unEleve) or: [unEleve estSepareDe: chaqueEleve] ] ]! !

!Classe methodsFor: 'testing' stamp: 'hlsf 6/29/2024 16:39:49'!
estPleine
	^ eleves size = effectif ! !

!Classe methodsFor: 'testing' stamp: 'hlsf 6/30/2024 10:12:43'!
estSection: uneSection
	^ sections includes: uneSection! !

!Classe methodsFor: 'testing' stamp: 'hlsf 6/30/2024 15:51:40'!
sontCompatibles: unGroupe
"
	unGroupe d'élèves est-il compatible avec ma classe :
"
	^ unGroupe allSatisfy: [:unEleve | self estCompatible: unEleve]! !

!Classe methodsFor: 'comparing' stamp: 'hlsf 7/26/2024 18:40:08'!
<= uneClasse
	^ nom size < uneClasse nom size 
	or: [nom <= uneClasse nom]! !

!Classe class methodsFor: 'instance creation' stamp: 'hlsf 7/1/2024 08:19:44'!
importer: fichierCSV
	^ (NeoCSVReader on: (DirectoryEntry projectBaseDirectory / 'import' // fichierCSV) readStream)
		separator: $; ;
		skipHeader ;
		recordClass: self ;
		addFields: #( #nom: #sections: );
		addIntegerField: #effectif: ;
		upToEnd! !

!Eleve methodsFor: 'accessing' stamp: 'hlsf 7/1/2024 14:17:18'!
ancienGroupe
	^ ancienGroupe! !

!Eleve methodsFor: 'accessing' stamp: 'hlsf 7/1/2024 14:06:55'!
ancienGroupe: anObject
	"Set the value of école"

	ancienGroupe := anObject! !

!Eleve methodsFor: 'accessing' stamp: 'hlsf 7/1/2024 14:54:55'!
ancienGroupeSmog: anObject
"
	pour les élèves venant de l'école primaire, 
	l'ancien groupe 	est codé 8P.Ecole.Maitre
"
	(anObject notNil and: [anObject beginsWith: '8P.']) ifTrue: [
		ancienGroupe := (anObject substringsSeparatedBy: $.) second]! !

!Eleve methodsFor: 'accessing' stamp: 'hlsf 6/29/2024 09:42:24'!
classeAttribuee
	"Answer the value of classeAttribuée"

	^ classeAttribuee! !

!Eleve methodsFor: 'accessing' stamp: 'hlsf 7/1/2024 11:45:12'!
classeAttribuee: uneClasse
	" M'attribuer une classe, si j'étais déjà dans une classe, me supprimer de cette classe "
	(uneClasse notNil and: [classeAttribuee =  uneClasse]) ifTrue: [
		Transcript show: self; show: ' est déjà dans '; show: classeAttribuee ; cr.
		^ self	].
	classeAttribuee := uneClasse.
	classeAttribuee isString 
		ifTrue: [" C'est une chaîne de caractère lors de l'importation, 
			cela signifie que l'élève se voit préattribu			é une classe, il n'est donc pas mobile "
			mobile := false 			]! !

!Eleve methodsFor: 'accessing' stamp: 'hlsf 6/28/2024 17:33:16'!
classesExclues
	"Answer the value of classeExclues"

	^ classesExclues! !

!Eleve methodsFor: 'accessing' stamp: 'hlsf 6/28/2024 17:33:21'!
classesExclues: anObject
	"Set the value of classeExclues"

	classesExclues := anObject! !

!Eleve methodsFor: 'accessing' stamp: 'hlsf 7/26/2024 23:17:01'!
dys
	"Answer the value of dys"

	^ dys! !

!Eleve methodsFor: 'accessing' stamp: 'hlsf 6/28/2024 17:15:44'!
dys: anObject
	"Set the value of dys"

	dys := anObject! !

!Eleve methodsFor: 'accessing' stamp: 'hlsf 7/26/2024 23:17:01'!
email
	"Answer the value of email"

	^ email! !

!Eleve methodsFor: 'accessing' stamp: 'hlsf 7/26/2024 23:17:01'!
email: anObject
	"Set the value of email"

	email := anObject! !

!Eleve methodsFor: 'accessing' stamp: 'hlsf 6/28/2024 17:15:44'!
mettreAvec
	"Answer the value of mettreAvec"

	^ mettreAvec! !

!Eleve methodsFor: 'accessing' stamp: 'hlsf 6/28/2024 17:15:44'!
mettreAvec: anObject
	"Set the value of mettreAvec"

	mettreAvec := anObject! !

!Eleve methodsFor: 'accessing' stamp: 'hlsf 7/26/2024 23:17:01'!
mobile
	"Answer the value of mobile"

	^ mobile! !

!Eleve methodsFor: 'accessing' stamp: 'hlsf 7/26/2024 23:17:01'!
mobile: anObject
	"Set the value of mobile"

	mobile := anObject! !

!Eleve methodsFor: 'accessing' stamp: 'hlsf 6/28/2024 17:15:44'!
nom
	"Answer the value of nom"

	^ nom! !

!Eleve methodsFor: 'accessing' stamp: 'hlsf 6/29/2024 09:38:03'!
nom: anObject
	"Set the value of nom"

	nom := anObject asLowercase asUnaccented asUppercase ! !

!Eleve methodsFor: 'accessing' stamp: 'hlsf 7/1/2024 11:32:29'!
patronyme
	^ String streamContents: [:str |
		str nextPutAll: nom ;
			nextPut: Character space;
			nextPutAll: prenom]! !

!Eleve methodsFor: 'accessing' stamp: 'hlsf 6/29/2024 09:43:14'!
prenom
	"Answer the value of prénom"

	^ prenom! !

!Eleve methodsFor: 'accessing' stamp: 'hlsf 6/29/2024 09:43:28'!
prenom: anObject
	"Set the value of prénom"

	prenom := anObject  asLowercase asUnaccented asUppercase ! !

!Eleve methodsFor: 'accessing' stamp: 'hlsf 6/28/2024 17:24:20'!
score
	^ score! !

!Eleve methodsFor: 'accessing' stamp: 'hlsf 7/1/2024 16:43:55'!
score: aStringOrNumber
	aStringOrNumber ifNil: [^ self].
	score := aStringOrNumber isNumber 
		ifTrue: [aStringOrNumber ]
		ifFalse: [ [aStringOrNumber asNumber] on: Error  do: nil ]	! !

!Eleve methodsFor: 'accessing' stamp: 'hlsf 6/30/2024 10:18:00'!
sections
	"Answer the value of section"

	^ sections! !

!Eleve methodsFor: 'accessing' stamp: 'hlsf 6/30/2024 10:18:00'!
sections: anObject
	"Set the value of section, a collection of symbol"
	
	sections := anObject virguleSeparer collect: [:uneSection |  uneSection asUppercase asSymbol]! !

!Eleve methodsFor: 'accessing' stamp: 'hlsf 6/29/2024 09:43:33'!
separerDe
	"Answer the value of séparerDe"

	^ separerDe! !

!Eleve methodsFor: 'accessing' stamp: 'hlsf 6/29/2024 09:43:42'!
separerDe: anObject
	"Set the value of séparerDe"

	separerDe := anObject! !

!Eleve methodsFor: 'accessing' stamp: 'hlsf 6/28/2024 17:15:44'!
sexe
	"Answer the value of sexe"

	^ sexe! !

!Eleve methodsFor: 'accessing' stamp: 'hlsf 6/28/2024 17:15:44'!
sexe: anObject
	"Set the value of sexe"

	sexe := anObject! !

!Eleve methodsFor: 'printing' stamp: 'hlsf 6/29/2024 17:07:44'!
printOn: aStream
	aStream nextPutAll: (nom ifNil: ['XXX']);
		nextPut: $.;
		nextPutAll: (prenom ifNil: ['YYY'])! !

!Eleve methodsFor: 'testing' stamp: 'hlsf 6/30/2024 11:15:49'!
estDys
	^ dys = true! !

!Eleve methodsFor: 'testing' stamp: 'hlsf 6/30/2024 14:10:34'!
estExcluDe: uneClasse
"
	Suis-je exclu de uneClasse ?
"
	^ classesExclues 
		ifNil: [ " suis-je affecté à une autre classe auquel cas, je suis exclu "
			classeAttribuee notNil			]
		ifNotNil: [ classesExclues includes: uneClasse ]! !

!Eleve methodsFor: 'testing' stamp: 'hlsf 6/30/2024 15:19:00'!
estFille
	^ sexe = $F! !

!Eleve methodsFor: 'testing' stamp: 'hlsf 6/30/2024 15:18:55'!
estGarcon
	^ sexe = $M! !

!Eleve methodsFor: 'testing' stamp: 'hlsf 6/30/2024 10:58:59'!
estMobile
	^ mobile! !

!Eleve methodsFor: 'testing' stamp: 'hlsf 6/30/2024 10:18:14'!
estSection: uneSection
	^ sections includes: uneSection! !

!Eleve methodsFor: 'testing' stamp: 'hlsf 6/30/2024 13:42:57'!
estSepareDe: unEleve
	^ separerDe 
		ifNil: [ false ]
		ifNotNil: [ separerDe includes: unEleve ]! !

!Eleve methodsFor: 'testing' stamp: 'hlsf 6/29/2024 14:59:23'!
estValide
	^ (prenom isNil or: [nom isNil]) not! !

!Eleve methodsFor: 'testing' stamp: 'hlsf 7/1/2024 11:38:43'!
match: unNom
	| patronyme patronymeCherche|
	patronyme := self patronyme.
	patronyme := patronyme substringsSeparatedBy: Character space.
	patronymeCherche := unNom asLowercase asUnaccented asUppercase 
		substringsSeparatedBy: Character space.
	^ patronyme includesAllOf: patronymeCherche ! !

!Eleve methodsFor: 'comparing' stamp: 'hlsf 6/30/2024 15:59:14'!
<= anEleve 
	^ nom <= anEleve nom! !

!Eleve methodsFor: 'comparing' stamp: 'hlsf 6/29/2024 10:25:13'!
= unEleve
	self == 	unEleve ifTrue: [^true].
	self class == unEleve class ifFalse: [^ false].
	^ nom = unEleve nom and: [prenom = unEleve prenom]! !

!Eleve methodsFor: 'comparing' stamp: 'hlsf 6/29/2024 10:23:13'!
hash
	^ nom hash bitXor: prenom hash! !

!Eleve methodsFor: 'initialization' stamp: 'hlsf 7/1/2024 12:02:05'!
initialize
	super initialize .
	score := 14.
	mobile := true.! !

!Eleve class methodsFor: 'instance creation' stamp: 'hlsf 7/1/2024 14:06:56'!
importerInfo: fichierCSV
"
	Importation des données issues du relevé d'information en école primaire et autres

"
	^ (NeoCSVReader on: (DirectoryEntry projectBaseDirectory / 'import' // fichierCSV) readStream)
		separator: $; ;
		skipHeader ;
		recordClass: self ;
		addFields:  #(#ancienGroupe: #nom: #prenom:);
		addField: #sexe: converter: [:sexe | sexe first];
		addIgnoredFields: 2 ;
		addFields: #( #score: #sections: );
		addIgnoredField ;
		addField: #dys: converter: [:dys | dys ifNil: [false] ifNotNil: [				dys = '1'] 				];
		addFields: #(#classeAttribuee: #classesExclues: #separerDe: #mettreAvec:);
		upToEnd! !

!Eleve class methodsFor: 'instance creation' stamp: 'hlsf 7/1/2024 16:44:59'!
importerSmog: fichierCSV
"
	Importer données extraites de SMOG avec les champs Nom, Prénom, Sexe, Statut, AncienGroupe
"
	^ (NeoCSVReader on: (DirectoryEntry projectBaseDirectory / 'import' // fichierCSV) readStream)
		separator: $; ;
		skipHeader ;
		recordClass: self ;
		addFields:  #(nom: prenom: );
		addField: #sexe: converter: [:sexe | sexe first];
		addFields: #(sections: ancienGroupeSmog: score:);
		addIgnoredFields: 2;
		upToEnd! !

!Volee9 methodsFor: 'accessing' stamp: 'hlsf 6/30/2024 23:02:00'!
classes
	^ classes! !

!Volee9 methodsFor: 'accessing' stamp: 'hlsf 6/30/2024 10:16:21'!
filtrerSections: filtreSections
" Retirer les classes et les élèves qui ne sont pas dans la collection filtreSections "
	classes := classes select: [:uneClasse |  filtreSections includesAnyOf: uneClasse sections].
	eleves := eleves select: [:unEleve | filtreSections includesAnyOf: unEleve sections]! !

!Volee9 methodsFor: 'accessing' stamp: 'hlsf 6/30/2024 12:54:53'!
groupeDe: unEleve
"
	unEleve doit-il est groupé avec d'autres élèves ?
	Si oui retourner ce groupe d'élève sinon le groupe avec ce seul élève
"
	^ elevesEnsemble 
		detect: [:unGroupe | unGroupe includes: unEleve ] 
		ifNone: [Array with: unEleve ]! !

!Volee9 methodsFor: 'accessing-classes' stamp: 'hlsf 6/29/2024 16:46:13'!
classesAuHasard
	^ self classesAvecPlace atRandom! !

!Volee9 methodsFor: 'accessing-classes' stamp: 'hlsf 6/29/2024 16:39:56'!
classesAvecPlace
	^ classes select: [:each | each estPleine not]! !

!Volee9 methodsFor: 'accessing-classes' stamp: 'hlsf 6/29/2024 12:42:26'!
trouverClasse: nom
	^ classes detect: [:uneClasse | uneClasse nom includesSubString: nom ]! !

!Volee9 methodsFor: 'accessing-eleves' stamp: 'hlsf 6/29/2024 17:04:49'!
effectifClasses
	^ classes inject: 0 into: [:effectif :uneClasse | effectif + uneClasse effectif]! !

!Volee9 methodsFor: 'accessing-eleves' stamp: 'hlsf 6/30/2024 10:48:59'!
elevesDansClasses

	^ classes 
		inject: OrderedCollection new 
		into: [:elevesDansClasses :eleveDansClasse | 
			elevesDansClasses addAll: eleveDansClasse eleves; yourself]! !

!Volee9 methodsFor: 'accessing-eleves' stamp: 'hlsf 6/30/2024 11:16:00'!
elevesDys
	^ self elevesSansClasse select: [:each | each estDys]! !

!Volee9 methodsFor: 'accessing-eleves' stamp: 'hlsf 6/30/2024 16:00:19'!
elevesSansClasse
	^ eleves difference: self elevesDansClasses! !

!Volee9 methodsFor: 'accessing-eleves' stamp: 'hlsf 7/1/2024 11:30:22'!
trouverEleve: unPatronyme
	^ self trouverEleve: unPatronyme dans: eleves! !

!Volee9 methodsFor: 'accessing-eleves' stamp: 'hlsf 7/1/2024 11:30:41'!
trouverEleve: unPatronyme dans: listeEleves
" 
	Trouver l'élève par son patronyme dans listeEleves
"
	^ listeEleves detect: [:unEleve | unEleve match:  unPatronyme ] ifNone: [nil]! !

!Volee9 methodsFor: 'affectations' stamp: 'hlsf 6/30/2024 13:10:33'!
ventilerAuHasard: desEleves
	desEleves do: [:unEleve | 		self classesAuHasard ajouterEleve: unEleve].
	eleves removeAll: desEleves 
		
		! !

!Volee9 methodsFor: 'affectations' stamp: 'hlsf 7/2/2024 11:16:46'!
ventilerElevesDys
"
	Ventiler les élèves dyslexiques non encore affectés dans les classes avec place.
	Trier les classes selon le nombre d'élève dys, vérifier les incompatibilités entre élèves
"
	self elevesDys shuffled do: [:unEleve | | sonGroupe |
		sonGroupe := self groupeDe: unEleve.
		(self classesAvecPlace shuffled sort: [:cl1 :cl2 | cl1 dys < cl2 dys]) 
			detect: [:uneClasse | uneClasse sontCompatibles: sonGroupe				]
			ifFound: [:saClasse | 
				saClasse ajouterEleves: sonGroupe.
				sonGroupe size > 1 ifTrue: [elevesEnsemble remove: sonGroupe 				]]
			ifNone: [Transcript show: unEleve; show: ' pas de classe compatible. Groupe: '; 
				show: sonGroupe; cr]
			]
		! !

!Volee9 methodsFor: 'affectations' stamp: 'hlsf 6/30/2024 16:02:55'!
ventilerGroupes
"
	Ventiler les groupes d'élèves ensemble dans les classes avec place.
"
	elevesEnsemble copy do: [:unGroupe |
		self classesAvecPlace shuffled
			detect: [:uneClasse | uneClasse sontCompatibles: unGroupe				]
			ifFound: [:saClasse | 
				saClasse ajouterEleves: unGroupe.
				elevesEnsemble remove: unGroupe 				]
			ifNone: [Transcript show: unGroupe ; show: ' pas de place pour ce groupe'; cr]
			]! !

!Volee9 methodsFor: 'affectations' stamp: 'hlsf 7/2/2024 11:17:13'!
ventilerSelonSexe
"
	Ventiler tous les élèves restant en tenant compte du sexe
"
	self elevesSansClasse shuffled do: [:unEleve | | sonSexe |
		sonSexe := unEleve estFille ifTrue: [#filles] ifFalse: [#garcons].
		(self classesAvecPlace shuffled sort: [:cl1 :cl2 | (cl1 perform: sonSexe) < (cl2 perform: sonSexe) ]) 
			detect: [:uneClasse | uneClasse estCompatible: unEleve				]
			ifFound: [:saClasse | 
				saClasse ajouterEleve: unEleve				]
			ifNone: [Transcript show: unEleve; show: ' pas de classe compatible pour '; show: sonSexe ; cr]
			]
		! !

!Volee9 methodsFor: 'import/export' stamp: 'hlsf 6/30/2024 16:46:09'!
csvClasses: unFichier
	csvClasses = unFichier ifFalse: [csvClasses := unFichier]! !

!Volee9 methodsFor: 'import/export' stamp: 'hlsf 6/30/2024 16:46:29'!
csvEleves: unFichier
	csvEleves = unFichier ifFalse: [csvEleves := unFichier]! !

!Volee9 methodsFor: 'import/export' stamp: 'hlsf 7/1/2024 09:39:31'!
csvInfoEleves: unFichier
	csvInfoEleves = unFichier ifFalse: [csvInfoEleves := unFichier]! !

!Volee9 methodsFor: 'import/export' stamp: 'hlsf 7/2/2024 12:02:09'!
exporterClasses
	voleePreferee classes do: [:uneClasse | 	| stream writer fichier |
		fichier := DirectoryEntry projectBaseDirectory / 'export' // (uneClasse nom, '.csv').
		fichier delete.
		stream := fichier writeStream.
		writer := NeoCSVWriter on: stream.
		writer 
			fieldWriter: #raw;
			nextPut: #(NOM PRENOM SEXE).
		uneClasse eleves do: [:unEleve | 			writer nextPut: {unEleve nom . unEleve prenom . unEleve sexe}		].
		stream close]! !

!Volee9 methodsFor: 'import/export' stamp: 'hlsf 6/30/2024 16:46:47'!
importerClasses: fichierCSV
	self csvClasses: fichierCSV.
	classes := Classe importer: fichierCSV! !

!Volee9 methodsFor: 'import/export' stamp: 'hlsf 7/1/2024 14:55:59'!
importerInfoEleves: fichierCSV
	| infoEleves |
	self assert: classes notNil description: 'Importer classes avant élèves'.
	self assert: eleves notNil description: 'Importer eleves-smog avant données élèves'.
	self csvInfoEleves: fichierCSV.
	infoEleves := ((Eleve importerInfo: fichierCSV) select: [:record | record estValide ]) asOrderedCollection.
	" Fusionner les données des élèves "
	eleves do: [:unEleve | | uneInfo |
		uneInfo := self trouverEleve: unEleve patronyme dans: infoEleves.
		uneInfo 
			ifNotNil:  [
				unEleve 
					classeAttribuee: uneInfo classeAttribuee ;
					classesExclues: uneInfo classesExclues ;
					dys: uneInfo estDys;
					ancienGroupe: uneInfo ancienGroupe ;
					mettreAvec: uneInfo mettreAvec ;
					separerDe: uneInfo separerDe ;
					score: uneInfo score 				]
			ifNil: [Transcript show: unEleve; show: ' données NON trouvées'; cr		]
		]! !

!Volee9 methodsFor: 'import/export' stamp: 'hlsf 7/1/2024 09:37:56'!
importerSmogEleves: fichierCSV
	self csvEleves: fichierCSV.
	eleves := ((Eleve importerSmog: fichierCSV) select: [:record | record estValide ]) asOrderedCollection! !

!Volee9 methodsFor: 'initialization' stamp: 'hlsf 6/29/2024 16:25:21'!
collecterElevesEnsemble
" Collection d'élève à mettre ensemble "
	elevesEnsemble := (	eleves 
		select: [:each | each mettreAvec notNil] 
		thenCollect:[:unEleve | 		unEleve mettreAvec asSet add: unEleve; yourself			 ]	) asSet.
	elevesEnsemble do: [:unGroupe | 
		elevesEnsemble do: [:anotherGroup |
			unGroupe == anotherGroup ifFalse: [
				(unGroupe includesAnyOf: anotherGroup) ifTrue: [unGroupe addAll: anotherGroup] ]			 ] 		].
	elevesEnsemble := elevesEnsemble collect: [:each | each asSet]
		
	! !

!Volee9 methodsFor: 'initialization' stamp: 'hlsf 6/30/2024 11:37:44'!
initElevesEnsemble
" 
	Certains élèves sont placés ensemble 
	Trouver et remplacer le nom de chaque eleve par l'objet ad-hoc 
"
	eleves 
		select: [:each | each mettreAvec notNil] 
		thenDo: [:unEleve | | autresEleves |
			autresEleves := unEleve mettreAvec virguleSeparer collect: [:unNom | 
				(self trouverEleve: unNom) 				ifNil: [
					Transcript show: unNom; show: ' non trouvé';cr.
					nil] ].
			autresEleves removeAllSuchThat: [:each | each isNil].
			autresEleves 			 ifEmpty: [autresEleves := nil].
			unEleve mettreAvec: autresEleves.
			Transcript show: unEleve ; show: ' est à mettre avec '; show: autresEleves ;cr 		]! !

!Volee9 methodsFor: 'initialization' stamp: 'hlsf 6/30/2024 11:35:29'!
initElevesSepares
"
	Certains élèves ne doivent pas être ensemble
	Remplacer le nom de chaque eleve par l'objet ad-hoc 
"
	eleves 
		select: [:each | each separerDe notNil] 
		thenDo: [:unEleve | | autresEleves |
			autresEleves := unEleve separerDe virguleSeparer collect: [:unNom | 
				(self trouverEleve: unNom) 				ifNil: [
					Transcript show: unNom; show: ' non trouvé';cr.
					nil] ].
			autresEleves removeAllSuchThat: [:each | 				each isNil].
			autresEleves 			 ifEmpty: [autresEleves := nil].
			unEleve separerDe: autresEleves.
			Transcript show: unEleve ; show: ' est à séparer de '; show: autresEleves ;cr 		]! !

!Volee9 methodsFor: 'initialization' stamp: 'hlsf 6/30/2024 13:10:03'!
initPreattribuerClasses
"
	Des élèves se voient préattribués des classes
	Remplacer chaque nom de classe par leur objet ad-hoc et attribuer la classe à l'élève 
	
"
	eleves 
		select: [:each | each classeAttribuee notNil] 
		thenDo: [:unEleve | | classe |
			classe := self trouverClasse: unEleve classeAttribuee.
			classe ajouterEleve: unEleve.
			Transcript show: unEleve; show: 					' à placer en classe '; show: 				classe; cr]! !

!Volee9 methodsFor: 'initialization' stamp: 'hlsf 6/30/2024 11:07:11'!
initPreexclureClasses
"
	Des élèves se voient préexcluent de certaines classes
	Remplacer chaque nom de classe par leur objet ad-hoc.
	
"
	eleves 
		select: [:each | each classesExclues notNil] 
		thenDo: [:unEleve | | sesClassesExclues |
			sesClassesExclues := unEleve classesExclues virguleSeparer 				collect: [:unNom | 									self trouverClasse: unNom ].
			unEleve classesExclues: sesClassesExclues.
			Transcript show: unEleve; show: ' est à exclure des classes '; show: sesClassesExclues; cr 				]! !

!Volee9 methodsFor: 'initialization' stamp: 'hlsf 7/1/2024 11:41:49'!
initialize
	super initialize.
	sections := Set new.
	classes do: [:chaque | sections addAll: chaque sections].
	self	filtrerSections: #(R3 SAE);
		initPreattribuerClasses;
		initPreexclureClasses;
		initElevesEnsemble ;
		initElevesSepares;
		collecterElevesEnsemble ! !

!Volee9 methodsFor: 'initialization' stamp: 'hlsf 7/1/2024 15:06:53'!
restart
	" Se souvenir de la classe avec le meilleur arrangement "
	(voleePreferee isNil 
	or: [voleePreferee notNil 		and: [ voleePreferee scoring > self scoring 			]])
		ifTrue: [voleePreferee := self veryDeepCopy 		].
	classes := eleves := elevesEnsemble := sections := nil.
	self importerClasses: csvClasses.
	self importerSmogEleves: csvEleves.
	self importerInfoEleves: csvInfoEleves .
	self initialize.
	self ventilerElevesDys ;
		ventilerGroupes ;
		ventilerSelonSexe
! !

!Volee9 methodsFor: 'metric' stamp: 'hlsf 6/30/2024 16:53:19'!
ecartType
	| scoreVolee |
	scoreVolee := self score.
	^ [((classes sum: [:uneClasse | (scoreVolee - uneClasse score) squared]) / self nbClasses ) sqrt] 
		on: Error 
		do: 0! !

!Volee9 methodsFor: 'metric' stamp: 'hlsf 7/1/2024 14:33:01'!
elevesSeuls
	^ classes sum: [:uneClasse | uneClasse elevesSeuls ]! !

!Volee9 methodsFor: 'metric' stamp: 'hlsf 6/30/2024 16:52:00'!
nbClasses
	^ classes 
		ifNotNil:  [classes size]
		ifNil: [0]! !

!Volee9 methodsFor: 'metric' stamp: 'hlsf 6/30/2024 16:51:50'!
nbEleves
	^ eleves 
		ifNotNil:  [eleves size]
		ifNil: [0]! !

!Volee9 methodsFor: 'metric' stamp: 'hlsf 6/30/2024 16:52:10'!
score
	^ [(classes sum: [:uneClasse | uneClasse score]) / self nbClasses ] on: Error do: 0! !

!Volee9 methodsFor: 'metric' stamp: 'hlsf 7/2/2024 11:25:00'!
scoring
"
	Métrique de [0 ; 1] pour comparer deux volées entre elles
"
	| c1 c2 |
	c1 := self ecartType .
	c2 := self elevesSeuls / 50.0 .
	^ (0.1 * c1) + (0.9 * c2) ! !

!Volee9 methodsFor: 'testing' stamp: 'hlsf 7/2/2024 08:20:33'!
checkElevesEnsemble
"
	Vérifie si les élèves devant être ensemble sont bien ensemble

"
	| elevesNonAccompagnes |
	" Trouver les élèves non accompagnés et devant l'être "
	elevesNonAccompagnes := eleves select: [:unEleve |
		unEleve mettreAvec
			ifNil: [false] 
			ifNotNil: [:avec |
		(avec allSatisfy: [:autreEleve | 
			unEleve classeAttribuee = autreEleve classeAttribuee ]) not		]	 	].
	^ elevesNonAccompagnes isEmpty! !

!Volee9 methodsFor: 'testing' stamp: 'hlsf 7/2/2024 08:24:09'!
checkElevesSepares
"
	Vérifie si les élèves devant être séparés le sont bien

"
	| elevesNonSepares |
	" Trouver les élèves non séparés et devant l'être "
	elevesNonSepares := eleves select: [:unEleve |
		unEleve separerDe 
			ifNil: [false] 
			ifNotNil: [:separe |
		separe anySatisfy: [:autreEleve | 
			unEleve classeAttribuee = autreEleve classeAttribuee ] 	]	 	].
	^ elevesNonSepares isEmpty! !

!Volee9 methodsFor: 'testing' stamp: 'hlsf 7/2/2024 08:29:43'!
checks
	^ self checkElevesEnsemble and: [self checkElevesSepares ]! !

!Volee9 methodsFor: 'printing' stamp: 'hlsf 7/2/2024 08:29:53'!
printOn: stream
	stream nextPutAll: 'Élèves : '; 		print: self nbEleves ;
		nextPut: Character lf;
	nextPutAll: 'Élèves isolés : '; 		print: self elevesSeuls ;
		nextPut: Character lf;		
		nextPutAll: 'Classes : '; 		print: self nbClasses;
		nextPut: Character lf;
		nextPutAll: 'Élèves sans classe: '; 		print: self elevesSansClasse size;
		nextPut: Character lf;
		nextPutAll: 'Score : '; print: (self score printStringFractionDigits: 1);
		nextPut: Character lf;
		nextPutAll: 'Ecart type : '; print: (self ecartType printStringFractionDigits: 2);
		nextPut: Character lf;		
		nextPutAll: 'Vérification: '; 		print: self checks;
		nextPut: Character lf! !

!Volee9 class methodsFor: 'instance creation' stamp: 'hlsf 7/1/2024 11:40:51'!
classes: fichierClasses eleves:  fichierSmog infoEleves: fichierEleves
	^ self basicNew
		importerClasses: fichierClasses;
		importerSmogEleves: fichierSmog ;
		importerInfoEleves: fichierEleves;
		initialize ! !

!SuiviClasses methodsFor: 'initialization' stamp: 'hlsf 7/26/2024 17:01:02'!
initialize
	super initialize.
	classes := SortedCollection new! !

!SuiviClasses methodsFor: 'import/export' stamp: 'hlsf 7/28/2024 00:05:19'!
exportVisiteClassesVers: stream
	stream nextPutAll: '** TODO [/] Visites Classes'; lf.
	classes 
		do: [:uneClasse |
			stream nextPutAll: ' - [ ] ';
				nextPutAll: uneClasse nom; lf]! !

!SuiviClasses methodsFor: 'import/export' stamp: 'hlsf 7/27/2024 23:26:53'!
exporterClasse: uneClasse vers: stream			
"
	Exporter les élèves d'une classe sous forme d'arbre org-mode
"
	stream nextPutAll: '** ';
		nextPutAll: uneClasse nom; lf.
	uneClasse eleves 
		do: [:unEleve |
			self exporterEleve: unEleve vers: stream]
		separatedBy: [stream lf]
! !

!SuiviClasses methodsFor: 'import/export' stamp: 'hlsf 8/12/2024 12:35:33'!
exporterEleve: unEleve vers: stream
	stream nextPutAll: '*** ';
		nextPutAll: unEleve nom asCapitalizedNames ;
		nextPutAll: ', ';
		nextPutAll: unEleve prenom asCapitalizedNames; lf.
	stream nextPutAll: ':info:'; lf.
	stream nextPutAll: 'Date de naissance : '; nextPutAll: unEleve dateNaissance; lf.
	stream nextPutAll: 'TelFixe : '; nextPutAll: unEleve telephoneFixe; lf.
	stream nextPutAll: 'Mobile 1 : '; nextPutAll: unEleve telephoneMobile1; lf.
	stream nextPutAll: 'Mobile 2 : '; nextPutAll: unEleve telephoneMobile2; lf.		
	stream nextPutAll: '@ père : '; nextPutAll: unEleve emailPere; lf.
	stream nextPutAll: '@ mère : '; nextPutAll: unEleve emailMere; lf.
	stream nextPutAll: '@ logeur : '; nextPutAll: unEleve emailLogeur; lf.
	stream 	nextPutAll: ':END:'; lf.
	stream nextPutAll: '**** Bilatérales'; lf;
		nextPutAll: '**** Conseils'; lf.
	self tableVers: stream.
	stream
		nextPutAll: '**** Mesures disciplinaires'; lf;
		nextPutAll: '**** Autres'! !

!SuiviClasses methodsFor: 'import/export' stamp: 'hlsf 7/28/2024 00:03:15'!
exporterVers: fichierExport
	| fichier |
	fichier := DirectoryEntry projectBaseDirectory / 'export' // fichierExport.
	fichier delete.
	fichier writeStreamDo: [:stream |
		stream nextPutAll: '#+STARTUP: overview'; lf; lf;
			nextPutAll: '* Suivi élèves'; lf.
		classes do: [:uneClasse | 
			self exporterClasse: uneClasse vers: stream			]
		separatedBy: [stream lf].
		stream lf; lf;lf.
		stream nextPutAll: '* Conseils'; lf;
			nextPutAll: '** Conseil de Direction'; lf;
			nextPutAll: '** CDEPS'; lf; lf;lf.
		stream nextPutAll: '* Dossiers Suivis'; lf;
			nextPutAll: '** Cours Facultatifs'; lf;
			nextPutAll: '** EEDP'; lf;	
			nextPutAll: '** RaPC'; lf.
		self exportVisiteClassesVers: stream.
		stream 	nextPutAll: '** Visites Enseignants'; lf
	]
	! !

!SuiviClasses methodsFor: 'import/export' stamp: 'hlsf 7/26/2024 17:00:33'!
importerClasses: list
	list substrings do: [:each |
		classes add: (self importerUneClasse: each, '.csv') 		] ! !

!SuiviClasses methodsFor: 'import/export' stamp: 'hlsf 8/12/2024 12:31:26'!
importerUneClasse: fichierCSV
" fichierCSV doit être du type 1121.csv, sans chemin !! "
	| eleves |
	eleves := (NeoCSVReader on: (DirectoryEntry projectBaseDirectory / 'import' // fichierCSV) readStream )
		separator: $; ;
		skipHeader;
		recordClass: SuiviEleve;
		addFields: #(nom: prenom: dateNaissance: telephoneFixe: telephoneMobile1:
		telephoneMobile2: emailPere: emailMere: emailLogeur:);
		upToEnd.
	^ Classe new
		nom: (fichierCSV subStrings: '.') first;
		eleves: eleves asSortedCollection;
		yourself! !

!SuiviClasses methodsFor: 'import/export' stamp: 'hlsf 7/27/2024 23:36:52'!
tableVers: stream
	stream 	nextPutAll: '| TRIMESTRE | PROMOTION | COMMENTAIRES | CHOIX ORIENTATION |'; lf;
	nextPutAll: '|-'; lf;
	nextPutAll: '|Préconseil' ;lf;
	nextPutAll: '|-'; lf;
	nextPutAll: '|T1' ;lf;
	nextPutAll: '|-'; lf;
	nextPutAll: '|T2' ;lf;
	nextPutAll: '|-'; lf;
	nextPutAll: '|T3' ;lf	! !

!SuiviClasses class methodsFor: 'instance creation' stamp: 'hlsf 7/26/2024 16:57:55'!
importerClasses: classes
" 
	SuiviEleve importerClasses: '1121 1122 1123'
"
	^ self new
		importerClasses: classes;
		yourself! !

!SuiviEleve methodsFor: 'accessing' stamp: 'hlsf 8/12/2024 12:36:19'!
dateNaissance
	"Answer the value of dateNaissance"

	^ dateNaissance ifNil: ['']! !

!SuiviEleve methodsFor: 'accessing' stamp: 'hlsf 8/12/2024 12:29:21'!
dateNaissance: anObject
	"Set the value of dateNaissance"

	dateNaissance := anObject! !

!SuiviEleve methodsFor: 'accessing' stamp: 'hlsf 8/12/2024 12:36:23'!
emailLogeur
	"Answer the value of emailLogeur"

	^ emailLogeur ifNil: ['']! !

!SuiviEleve methodsFor: 'accessing' stamp: 'hlsf 8/12/2024 12:08:43'!
emailLogeur: anObject
	"Set the value of emailLogeur"

	emailLogeur := anObject! !

!SuiviEleve methodsFor: 'accessing' stamp: 'hlsf 8/12/2024 12:36:26'!
emailMere
	"Answer the value of emailMere"

	^ emailMere ifNil: ['']! !

!SuiviEleve methodsFor: 'accessing' stamp: 'hlsf 8/12/2024 12:08:43'!
emailMere: anObject
	"Set the value of emailMere"

	emailMere := anObject! !

!SuiviEleve methodsFor: 'accessing' stamp: 'hlsf 8/12/2024 12:36:29'!
emailPere
	"Answer the value of emailPere"

	^ emailPere ifNil: ['']! !

!SuiviEleve methodsFor: 'accessing' stamp: 'hlsf 8/12/2024 12:08:42'!
emailPere: anObject
	"Set the value of emailPere"

	emailPere := anObject! !

!SuiviEleve methodsFor: 'accessing' stamp: 'hlsf 8/12/2024 12:36:33'!
nom
	"Answer the value of nom"

	^ nom ifNil: ['']! !

!SuiviEleve methodsFor: 'accessing' stamp: 'hlsf 8/12/2024 12:08:42'!
nom: anObject
	"Set the value of nom"

	nom := anObject! !

!SuiviEleve methodsFor: 'accessing' stamp: 'hlsf 8/12/2024 12:36:36'!
prenom
	"Answer the value of prenom"

	^ prenom ifNil: ['']! !

!SuiviEleve methodsFor: 'accessing' stamp: 'hlsf 8/12/2024 12:08:42'!
prenom: anObject
	"Set the value of prenom"

	prenom := anObject! !

!SuiviEleve methodsFor: 'accessing' stamp: 'hlsf 8/12/2024 12:36:40'!
telephoneFixe
	"Answer the value of telephoneFixe"

	^ telephoneFixe ifNil: ['']! !

!SuiviEleve methodsFor: 'accessing' stamp: 'hlsf 8/12/2024 12:08:42'!
telephoneFixe: anObject
	"Set the value of telephoneFixe"

	telephoneFixe := anObject! !

!SuiviEleve methodsFor: 'accessing' stamp: 'hlsf 8/12/2024 12:36:44'!
telephoneMobile1
	"Answer the value of telephoneMobile1"

	^ telephoneMobile1 ifNil: ['']! !

!SuiviEleve methodsFor: 'accessing' stamp: 'hlsf 8/12/2024 12:08:42'!
telephoneMobile1: anObject
	"Set the value of telephoneMobile1"

	telephoneMobile1 := anObject! !

!SuiviEleve methodsFor: 'accessing' stamp: 'hlsf 8/12/2024 12:36:48'!
telephoneMobile2
	"Answer the value of telephoneMobile2"

	^ telephoneMobile2 ifNil: ['']! !

!SuiviEleve methodsFor: 'accessing' stamp: 'hlsf 8/12/2024 12:08:42'!
telephoneMobile2: anObject
	"Set the value of telephoneMobile2"

	telephoneMobile2 := anObject! !

!SuiviEleve methodsFor: 'comparing' stamp: 'hlsf 8/12/2024 12:11:06'!
<= anEleve 
	^ nom <= anEleve nom! !

!SuiviEleve methodsFor: 'comparing' stamp: 'hlsf 8/12/2024 12:11:22'!
= unEleve
	self == 	unEleve ifTrue: [^true].
	self class == unEleve class ifFalse: [^ false].
	^ nom = unEleve nom and: [prenom = unEleve prenom]! !

!SuiviEleve methodsFor: 'printing' stamp: 'hlsf 8/12/2024 12:33:08'!
printOn: aStream
	aStream nextPutAll: (nom ifNil: ['XXX']);
		nextPut: $.;
		nextPutAll: (prenom ifNil: ['YYY'])! !

!Object methodsFor: '*Doyen' stamp: 'hlsf 6/30/2024 10:31:56'!
estClasse
	^ false! !

!String methodsFor: '*Doyen' stamp: 'hlsf 7/26/2024 21:06:22'!
asCapitalizedNames
" 'Toto dupont figue' -> 'Toto Dupont Figue' "
	^ self substrings collect: [:each | each asLowercase capitalized] andFold: [:a :b | a, ' ', b] ! !

!String methodsFor: '*Doyen' stamp: 'hlsf 7/26/2024 21:05:07'!
virguleSeparer
" séparer aux virgules et placer dans une collection "
	^ (self findBetweenSubStrs: ',') 						collect: [:uneChaine | 				uneChaine withBlanksTrimmed]! !

!UnicodeString methodsFor: '*Doyen' stamp: 'hlsf 7/26/2024 21:06:22'!
asCapitalizedNames
" 'Toto dupont figue' -> 'Toto Dupont Figue' "
	^ self substrings collect: [:each | each asLowercase capitalized] andFold: [:a :b | a, ' ', b] ! !

!UnicodeString methodsFor: '*Doyen' stamp: 'hlsf 7/26/2024 21:05:07'!
virguleSeparer
" séparer aux virgules et placer dans une collection "
	^ (self findBetweenSubStrs: ',') 						collect: [:uneChaine | 				uneChaine withBlanksTrimmed]! !
