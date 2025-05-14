'From Cuis7.3 [latest update: #7099] on 14 May 2025 at 9:59:21 am'!
'Description '!
!provides: 'Doyen' 1 43!
!requires: 'Goodies' 1 11 nil!
!requires: 'Neo-CSV-Core' 1 2 nil!
!requires: 'UI-Panel' 1 123 nil!
!requires: 'UI-Entry' 1 56 nil!
SystemOrganization addCategory: #'Doyen-Classes'!
SystemOrganization addCategory: #'Doyen-Org'!


!classDefinition: #Classe category: #'Doyen-Classes'!
Object subclass: #Classe
	instanceVariableNames: 'nom sections groupes effectif eleves'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Doyen-Classes'!
!classDefinition: 'Classe class' category: #'Doyen-Classes'!
Classe class
	instanceVariableNames: ''!

!classDefinition: #Eleve category: #'Doyen-Classes'!
Object subclass: #Eleve
	instanceVariableNames: 'nom prenom ancienneClasse classeAttribuee classesExclues sexe note sections option trouble separerDe mettreAvec mobile email'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Doyen-Classes'!
!classDefinition: 'Eleve class' category: #'Doyen-Classes'!
Eleve class
	instanceVariableNames: ''!

!classDefinition: #GroupeOption category: #'Doyen-Classes'!
Object subclass: #GroupeOption
	instanceVariableNames: 'classe option groupe effectif'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Doyen-Classes'!
!classDefinition: 'GroupeOption class' category: #'Doyen-Classes'!
GroupeOption class
	instanceVariableNames: ''!

!classDefinition: #Volee9 category: #'Doyen-Classes'!
Object subclass: #Volee9
	instanceVariableNames: 'eleves classes elevesEnsemble voleePreferee csvEleves csvClasses csvContraintes'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Doyen-Classes'!
!classDefinition: 'Volee9 class' category: #'Doyen-Classes'!
Volee9 class
	instanceVariableNames: ''!

!classDefinition: #Volee10 category: #'Doyen-Classes'!
Volee9 subclass: #Volee10
	instanceVariableNames: 'csvGroupes'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Doyen-Classes'!
!classDefinition: 'Volee10 class' category: #'Doyen-Classes'!
Volee10 class
	instanceVariableNames: ''!

!classDefinition: #Volee11 category: #'Doyen-Classes'!
Volee10 subclass: #Volee11
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Doyen-Classes'!
!classDefinition: 'Volee11 class' category: #'Doyen-Classes'!
Volee11 class
	instanceVariableNames: ''!

!classDefinition: #SuiviEleve category: #'Doyen-Org'!
Object subclass: #SuiviEleve
	instanceVariableNames: 'classes'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Doyen-Org'!
!classDefinition: 'SuiviEleve class' category: #'Doyen-Org'!
SuiviEleve class
	instanceVariableNames: ''!

!classDefinition: #ClasseView category: #'Doyen-Classes'!
LayoutMorph subclass: #ClasseView
	instanceVariableNames: 'model'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Doyen-Classes'!
!classDefinition: 'ClasseView class' category: #'Doyen-Classes'!
ClasseView class
	instanceVariableNames: ''!

!classDefinition: #VoleeWindow category: #'Doyen-Classes'!
SystemWindow subclass: #VoleeWindow
	instanceVariableNames: 'scoreLabel qtyEntry classesView filesToolbar elevesBtn contraintesBtn classesBtn groupesBtn'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Doyen-Classes'!
!classDefinition: 'VoleeWindow class' category: #'Doyen-Classes'!
VoleeWindow class
	instanceVariableNames: ''!

!classDefinition: #EleveView category: #'Doyen-Classes'!
TextParagraphMorph subclass: #EleveView
	instanceVariableNames: 'model'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Doyen-Classes'!
!classDefinition: 'EleveView class' category: #'Doyen-Classes'!
EleveView class
	instanceVariableNames: ''!


!Classe commentStamp: '<historical>' prior: 0!
Je représente une classe:
- nom. 921, 931, 1011, 1071, 1131, 1121
- sections. Une ou deux sections que je comprends, #R1, #R2, #R3, #MI, #LC, #CT, #LS
- groupes. Collection de GroupeOption de la classe
- effectif. Mon effectif total qui doit être égal à la somme des effectifs de mes options, si elles existent
- eleves. Elèves affectés à la classe !

!Eleve commentStamp: '<historical>' prior: 0!
Je représente un élève avec les attributs nécessaires pour m'attribuer une classe.

- nom, prénom : chaîne de caractère
- classeAttribuée : classe attribuée déterminée par le sytème (objet Classe) ou bien classe imposée, déterminée lors de l'importation des données, cette valeur peut être une chaîne de caractères, c'est alors le nom d'une classe qui sera ensuite remplacé par l'objet classe ad-hoc.
- classeExcluée : classes dans lesquelles l'élève ne peut pas être affecté. Importées comme des chaînes de caractères puis remplacés par les objets classes ad-hoc
- sexe : caractère $M ou $F
- score : moyenne des notes français, mathématiques. Le français compte double pour la détermination du score
- trouble: booléen indiquant un PAI ou un aménagement
- séparerDe, mettreAvec : collection d'élèves, importés comme chaînes de caractères (prénom nom) puis remplacé par les objets élève ad-hoc.
- sections: les sections de l'élève, peut être #MI et #R2, ou #MI #CT pour les options SAE
- option: #SAE, #L #S #LV #SA #AA. Dans les 9e, seul les SAE on cette option
- ancienGroupe: l'école ou la classe l'année précédente
- mobile: un boolean l'élève peut-il être déplacé de classe : 
!

!GroupeOption commentStamp: '<historical>' prior: 0!
Je représente un groupe d'une option en 10e ou 11e
- classe : classe à laquelle je suis associée
- option : L, S, LV, SAE (10/11LS/MI), AA, SA (10/11LC)
- groupe : mon numéro de groupe
- effectif : nombre d'élèves dans couple (classe, groupe)

Un même groupe peut-être réparti sur plusieurs classes. 

Exemple 1:
les deux objets options (1131, S, 1, 8) et (1132, S, 1, 6) donnent une répartition 
du groupe 1 option S sur les classes 1131 et 1132, pour un effectif total de 14 élèves.

Exemple 2:
(1071, LV, 3, 14) et (1071, SAE, 1, 9) sont les deux options de la classes 1071, pour un
effectif total de 23 élèves!

!Volee9 commentStamp: '<historical>' prior: 0!
J'organiser une volée d'élèves à enroler dans des classes en respectant certains critères:
- des contraintes préalables fournies sous forme d'un tableau
- les regroupements et les éventuelles options des élèves
- les éventuels groupes d'options des classes

Les données sont importées et ventillées dans 
- eleves : issus de SMOG (csvEleves), voir méthode Eleve class>>importerSmog:
- classes : issues d'une table csvClasses, 'classe9e.csv', 'classes10e.csv'. Lors de l'import des classes des groupes d'options sont eventuellement importés et fusionnés dans les classes
- sections : collection de symbole de cette volée ussue des classes importées #R1 #R2 #R3 #MI
- csvInfoEleves : table de données de contraintes pour certains élèves, fusionnéss avec les instances d'eleve correspondant
- elevesEnsembles : cela concerne des groupes d'élèves devant à placer ensemble dans une classe, informations issues de la table csvInfoEleves

Pour les 9e, les données sont importées de SMOG et du tableau de recueil recommandations issues
de l'école primaire.!

!Volee10 commentStamp: 'hlsf 4/25/2025 10:38:28' prior: 0!
Je suis spécialisé pour les volées de 10e avec la gestion des groupes en plus. 
Ma différence notoire : 
 - Le fichier de csvGroupes, il doit être dans 'import/groupes10e.csv'

Exemple de fichier groupes10e.csv :
classe;	option;	groupe;	effectif
1031;	L;		1;		11
1031;	S;		1;		12
1032;	L;		1;		11
1032;	S;		2;		12
1033;	S;		3;		11
1033;	S;		4;		11
1034;	S;		5;		14
1034;	LV;		1;		8
1035;	S;		6;		14
1035;	LV;		1;		8
1036;	S;		7;		13
1036;	LV;		2;		8
1037;	S;		8;		14
1037;	LV;		2;		8
1038;	S;		9;		11
1038;	S;		10;		11
1071;	LV;		14;		3
1071;	SAE;	1;		9
1021;	SA;		1;		17
1022;	AA;		1;		11
1022;	SA;		2;		6
1023;	SA;		2;		5
1023;	AA;		2;		12
1011;	CT;		1;		14
!

!Volee11 commentStamp: '<historical>' prior: 0!
Lire les commentaires de ma classe parent!

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

!Classe methodsFor: 'accessing' stamp: 'hlsf 4/18/2025 17:36:12'!
ajouterGroupe: unGroupe
" 	
	Ajouter unGroupe d'option à mes groupes 
"
	unGroupe classe == self
		ifFalse: [	
			groupes add: unGroupe.
			unGroupe classe: self			]! !

!Classe methodsFor: 'accessing' stamp: 'hlsf 4/23/2025 11:46:19'!
anciennesClasses
	| ancClasses |
	ancClasses := Dictionary new.
	eleves do: [:eleve |
		eleve ancienneClasse ifNotNil: [:groupe |
			ancClasses 
				at: groupe
				ifPresent: [:collection | collection add: eleve]
				ifAbsent: [ancClasses at: groupe put: (OrderedCollection with: eleve)] ] ].
	^ ancClasses 
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

!Classe methodsFor: 'initialization' stamp: 'hlsf 4/18/2025 17:32:48'!
initialize
	super initialize.
	eleves := SortedCollection new.
	groupes := OrderedCollection new! !

!Classe methodsFor: 'metric' stamp: 'hlsf 6/29/2024 09:15:47'!
effectif
	"Answer the value of effectif"

	^ effectif! !

!Classe methodsFor: 'metric' stamp: 'hlsf 4/18/2025 17:49:11'!
effectifGroupes
	" Total des effectifs dans les groupes "

	^ groupes inject: 0 into: [:sum :unGroupe | sum + unGroupe effectif]! !

!Classe methodsFor: 'metric' stamp: 'hlsf 4/18/2025 15:18:35'!
elevesSeuls
"
	Qté d'élèves isolés dans ce groupe 
"
	^ self anciennesClasses count: [:assoc | assoc value size = 1]! !

!Classe methodsFor: 'metric' stamp: 'hlsf 6/30/2024 15:19:30'!
filles
	^ eleves count: [:each | each estFille ]! !

!Classe methodsFor: 'metric' stamp: 'hlsf 6/30/2024 15:20:38'!
garcons
	^ eleves count: [:each | each estGarcon ]! !

!Classe methodsFor: 'metric' stamp: 'hlsf 4/19/2025 13:12:55'!
note
	^ [(eleves sum: [:unEleve | unEleve note]) / eleves size] on: Error do: 0! !

!Classe methodsFor: 'metric' stamp: 'hlsf 5/14/2025 08:24:39'!
trouble
	" Indique le nombre d'élèves dys "
	^ eleves count: [:each | each avecTrouble]! !

!Classe methodsFor: 'printing' stamp: 'hlsf 5/14/2025 08:21:01'!
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
		print: self trouble;
		nextPutAll: ' g';
		print: self garcons;
		nextPutAll: ' f';
		print: self filles;
		nextPutAll: ' s';
		nextPutAll: (self note printStringFractionDigits: 1);
		nextPutAll: ' i';
		print: self elevesSeuls ;
		nextPut: $)
	! !

!Classe methodsFor: 'testing' stamp: 'hlsf 6/30/2024 10:32:04'!
estClasse
	^ true! !

!Classe methodsFor: 'testing' stamp: 'hlsf 4/19/2025 00:10:59'!
estCompatible: unEleve
	^ (unEleve estExcluDe: self) not 
		and: [(self estCursusCompatible: unEleve)
		and:	 [eleves noneSatisfy: [:chaqueEleve | 
			(chaqueEleve estSepareDe: unEleve) or: [unEleve estSepareDe: chaqueEleve] ] ] ]! !

!Classe methodsFor: 'testing' stamp: 'hlsf 4/19/2025 12:24:11'!
estCursusCompatible: unEleve
" vérifions qu'unEleve partage les mêmes section et option que la classe"
	^ (sections includesAnyOf: unEleve sections) 
	and: [self estOption: unEleve option]! !

!Classe methodsFor: 'testing' stamp: 'hlsf 4/19/2025 12:23:49'!
estOption: uneOption
" uneOption : #L, #S, #LV, #AA, #SA ou #SAE "
	(groupes isEmpty and: [uneOption isNil]) ifTrue: [^ true " requete non pertinente "].
	^ groupes anySatisfy: [:groupe | groupe option == uneOption ]! !

!Classe methodsFor: 'testing' stamp: 'hlsf 6/29/2024 16:39:49'!
estPleine
	^ eleves size = effectif ! !

!Classe methodsFor: 'testing' stamp: 'hlsf 4/18/2025 23:39:10'!
sontCompatibles: unEnsemble
"
	unEnsemble d'élèves est-il compatible avec ma classe :
"
	^ unEnsemble allSatisfy: [:unEleve | self estCompatible: unEleve]! !

!Classe methodsFor: 'comparing' stamp: 'hlsf 7/26/2024 18:40:08'!
<= uneClasse
	^ nom size < uneClasse nom size 
	or: [nom <= uneClasse nom]! !

!Classe methodsFor: 'copying' stamp: 'hlsf 4/21/2025 11:58:56'!
postCopy
	eleves := SortedCollection new.
 ! !

!Classe class methodsFor: 'instance creation' stamp: 'hlsf 4/25/2025 11:52:10'!
importer: fichierCSV
	^ (NeoCSVReader on: fichierCSV readStream)
		separator: $; ;
		skipHeader ;
		recordClass: self ;
		addFields: #( #nom: #sections: );
		addIntegerField: #effectif: ;
		upToEnd! !

!Eleve methodsFor: 'accessing' stamp: 'hlsf 4/18/2025 15:21:01'!
ancienneClasse
	^ ancienneClasse! !

!Eleve methodsFor: 'accessing' stamp: 'hlsf 4/18/2025 15:26:00'!
ancienneClasse: anObject
"
	Pour les élèves venant de l'école primaire, l'ancien groupe 	est codé 8P.Ecole.Maitre.
	Seule l'école nous interesse alors
"
	ancienneClasse := (anObject notNil and: [anObject beginsWith: '8P.']) 
		ifTrue: [	(anObject substringsSeparatedBy: $.) second]
		ifFalse: [anObject]! !

!Eleve methodsFor: 'accessing' stamp: 'hlsf 6/29/2024 09:42:24'!
classeAttribuee
	"Answer the value of classeAttribuée"

	^ classeAttribuee! !

!Eleve methodsFor: 'accessing' stamp: 'hlsf 4/21/2025 23:13:10'!
classeAttribuee: uneClasse
	" M'attribuer une classe, si j'étais déjà dans une classe, me supprimer de cette classe "
	(uneClasse notNil and: [classeAttribuee =  uneClasse]) ifTrue: [
		Transcript show: self; show: ' est déjà dans '; show: classeAttribuee ; cr.
		^ self	].
	classeAttribuee := uneClasse.
	classeAttribuee isString 
		ifTrue: [" C'est une chaîne de caractère lors de l'importation, 
			cela signifie que l'élève se voit préattribué une classe, il n'est donc pas mobile "
			mobile := false ]! !

!Eleve methodsFor: 'accessing' stamp: 'hlsf 6/28/2024 17:33:16'!
classesExclues
	"Answer the value of classeExclues"

	^ classesExclues! !

!Eleve methodsFor: 'accessing' stamp: 'hlsf 6/28/2024 17:33:21'!
classesExclues: anObject
	"Set the value of classeExclues"

	classesExclues := anObject! !

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

!Eleve methodsFor: 'accessing' stamp: 'hlsf 6/28/2024 17:15:44'!
nom
	"Answer the value of nom"

	^ nom! !

!Eleve methodsFor: 'accessing' stamp: 'hlsf 6/29/2024 09:38:03'!
nom: anObject
	"Set the value of nom"

	nom := anObject asLowercase asUnaccented asUppercase ! !

!Eleve methodsFor: 'accessing' stamp: 'hlsf 4/19/2025 13:13:22'!
note
	^ note! !

!Eleve methodsFor: 'accessing' stamp: 'hlsf 4/21/2025 10:03:16'!
note: aStringOrNumber
	aStringOrNumber ifNil: [^ self].
	note := aStringOrNumber isNumber 
		ifTrue: [aStringOrNumber ]
		ifFalse: [ [aStringOrNumber asNumber] on: Error  do: nil ]	! !

!Eleve methodsFor: 'accessing' stamp: 'hlsf 4/18/2025 23:58:54'!
option
	"Answer the value of option"

	^ option! !

!Eleve methodsFor: 'accessing' stamp: 'hlsf 4/18/2025 23:58:54'!
option: anObject
	"Set the value of option"

	option := anObject! !

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

!Eleve methodsFor: 'accessing' stamp: 'hlsf 5/14/2025 08:23:07'!
trouble
	^ trouble! !

!Eleve methodsFor: 'accessing' stamp: 'hlsf 5/14/2025 09:37:54'!
trouble: anObject
	" Faire un OU logique lorsqu'une valeur précédente fut déjà attribuée "
	trouble := trouble ifNotNil: [trouble | anObject] ifNil: [anObject]
	! !

!Eleve methodsFor: 'printing' stamp: 'hlsf 5/14/2025 08:24:39'!
descriptionOn: str
	self printOn: str.
	str 	nextPutAll: ' ('; nextPut: sexe; nextPut: $); lf.
	str nextPutAll: 'Provenance : '; nextPutAll: (ancienneClasse ifNil: ['inconnue']); lf.
	self avecTrouble ifTrue: [str nextPutAll: 'Dyslexique'; lf].
	str nextPutAll: 'Note : '; print: note; lf.
	str nextPutAll: 'Section(s) : '.
	sections printElementsOn: str.

	option ifNotNil: [
		str lf; nextPutAll: 'Option : '; print: option].

	classesExclues ifNotNil: [
		str lf; nextPutAll: 'Exclu de '.
		classesExclues printElementsOn: str].
	mettreAvec ifNotNil: [
		str lf; nextPutAll: 'A placer avec '.
		mettreAvec printElementsOn: str].
	separerDe ifNotNil: [
		str lf; nextPutAll: 'A séparer de '.
		separerDe printElementsOn: str]! !

!Eleve methodsFor: 'printing' stamp: 'hlsf 6/29/2024 17:07:44'!
printOn: aStream
	aStream nextPutAll: (nom ifNil: ['XXX']);
		nextPut: $.;
		nextPutAll: (prenom ifNil: ['YYY'])! !

!Eleve methodsFor: 'testing' stamp: 'hlsf 5/14/2025 08:24:39'!
avecTrouble
	^ trouble = true! !

!Eleve methodsFor: 'testing' stamp: 'hlsf 5/14/2025 08:24:39'!
estContraint
" Existe-t-il une contrainte posée me concernant ? "
	^ self avecTrouble 
	or: [ classesExclues notNil
	or: [ separerDe notNil
	or: [ mettreAvec notNil
	or: [ mobile not ] ] ] ]! !

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

!Eleve methodsFor: 'testing' stamp: 'hlsf 4/23/2025 11:30:26'!
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

!Eleve methodsFor: 'testing' stamp: 'hlsf 4/23/2025 12:42:06'!
match: unNom
	| patronyme patronymeCherche|
	patronyme := self patronyme.
	patronyme := patronyme substringsSeparatedBy: Character space.
	patronymeCherche := unNom asLowercase asUnaccented asUppercase 
		substringsSeparatedBy: Character space.
	^ patronyme includesAllOf: patronymeCherche ! !

!Eleve methodsFor: 'testing' stamp: 'hlsf 4/23/2025 12:34:03'!
procheDe: unNom
	| patronyme patronymeCherche|
	patronyme := self patronyme.
	patronyme := patronyme substringsSeparatedBy: Character space.
	patronymeCherche := unNom asLowercase asUnaccented asUppercase 
		substringsSeparatedBy: Character space.
	^ patronyme closeToAllOf: patronymeCherche! !

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

!Eleve methodsFor: 'initialization' stamp: 'hlsf 4/19/2025 13:13:22'!
initialize
	super initialize .
	note := 14.
	mobile := true.! !

!Eleve methodsFor: 'copying' stamp: 'hlsf 4/21/2025 13:14:12'!
postCopy
	classeAttribuee := classeAttribuee copy.
	classesExclues := classesExclues copy.
	separerDe := separerDe copy.
	mettreAvec := mettreAvec copy! !

!Eleve class methodsFor: 'instance creation' stamp: 'hlsf 4/25/2025 11:54:39'!
importer: fichierCSV
" Importer données extraites de SMOG avec les champs Nom, Prénom, Sexe, Statut, AncienGroupe "
	| eleves |
	eleves := (NeoCSVReader on:  fichierCSV readStream)
		separator: $; ;
		skipHeader ;
		recordClass: self ;
		addFields:  #(nom: prenom: );
		addField: #sexe: converter: [:sexe | sexe first];
		addFields: #(sections: ancienneClasse: note:);
		addIgnoredFields: 2;
		upToEnd.
	^ (eleves select: [:record | record estValide ]) asOrderedCollection! !

!Eleve class methodsFor: 'instance creation' stamp: 'hlsf 5/14/2025 09:58:07'!
importerContraintes: fichierCSV
" Importation des données issues des données doyens (Confection classe - situations particulières) "
	| eleves |
	eleves := (NeoCSVReader on: fichierCSV readStream)
		separator: $; ;
		skipHeader ;
		recordClass: self ;
		addFields:  #(nom: prenom: ancienneClasse:);
		addIgnoredFields: 3 ;		
		" PAI "
		addField: #trouble: converter: [:trouble | trouble ifNil: [false] ifNotNil: [trouble first asLowercase = $o] ]; 
		addIgnoredField ;
		" Aménagements "
		addField: #trouble: converter: [:trouble | trouble ifNil: [false] ifNotNil: [trouble first asLowercase = $o] ]; 
		addIgnoredFields: 2;
		addFields: #(mettreAvec: separerDe: );
		" vvvv Fichier de données à stabiliser vvvv  "
		addFields: #(classeAttribuee: classesExclues: );
		upToEnd.
	^ (eleves select: [:record | record estValide ]) asOrderedCollection! !

!Eleve class methodsFor: 'instance creation' stamp: 'hlsf 5/14/2025 09:23:31'!
importerContraintes9eme: fichierCSV
" Importation des données issues du relevé d'information en école primaire "
	| eleves |
	eleves := (NeoCSVReader on: fichierCSV readStream)
		separator: $; ;
		skipHeader ;
		recordClass: self ;
		addFields:  #(ancienneClasse: nom: prenom:);
		addField: #sexe: converter: [:sexe | sexe first];
		addIgnoredFields: 2 ;
		addFields: #(note: sections: );
		addIgnoredField ;
		addField: #trouble: converter: [:dys | dys ifNil: [false] ifNotNil: [dys = '1'] ];
		addFields: #(classeAttribuee: classesExclues: separerDe: mettreAvec:);
		upToEnd.
	^ (eleves select: [:record | record estValide ]) asOrderedCollection! !

!GroupeOption methodsFor: 'accessing' stamp: 'hlsf 4/18/2025 12:43:54'!
classe
	"Answer the value of classe"

	^ classe! !

!GroupeOption methodsFor: 'accessing' stamp: 'hlsf 4/19/2025 12:35:15'!
classe: anObject
	"Set the value of classe"

	classe := anObject isString ifTrue: [anObject withBlanksTrimmed ] ifFalse: [anObject ]! !

!GroupeOption methodsFor: 'accessing' stamp: 'hlsf 4/18/2025 12:43:54'!
effectif
	"Answer the value of effectif"

	^ effectif! !

!GroupeOption methodsFor: 'accessing' stamp: 'hlsf 4/18/2025 12:43:54'!
effectif: anObject
	"Set the value of effectif"

	effectif := anObject! !

!GroupeOption methodsFor: 'accessing' stamp: 'hlsf 4/18/2025 12:43:54'!
groupe
	"Answer the value of groupe"

	^ groupe! !

!GroupeOption methodsFor: 'accessing' stamp: 'hlsf 4/18/2025 12:43:54'!
groupe: anObject
	"Set the value of groupe"

	groupe := anObject! !

!GroupeOption methodsFor: 'accessing' stamp: 'hlsf 4/18/2025 12:43:54'!
option
	"Answer the value of option"

	^ option! !

!GroupeOption methodsFor: 'accessing' stamp: 'hlsf 4/18/2025 12:44:06'!
option: anObject
	"Set the value of option"

	option := anObject asUppercase asSymbol ! !

!GroupeOption methodsFor: 'printing' stamp: 'hlsf 4/18/2025 13:57:37'!
printOn: stream
	stream 	nextPutAll: 'groupe ';
		print: groupe;
		nextPut: $/;
		nextPutAll: option;
		nextPut: Character space.
	stream 	nextPutAll: (classe isString 		ifTrue: [classe] ifFalse: [classe nom]).
	stream 
		nextPut: $(		;
		print: effectif;
		nextPut: $)
	
	! !

!GroupeOption class methodsFor: 'instance creation' stamp: 'hlsf 4/25/2025 11:55:12'!
importer: fichierCSV
	^ (NeoCSVReader on: fichierCSV readStream)
		separator: $; ;
		skipHeader ;
		recordClass: self ;
		addFields: #(classe: option: );
		addIntegerField: #groupe: ;
		addIntegerField: #effectif: ;
		upToEnd! !

!Volee9 methodsFor: 'classes' stamp: 'hlsf 4/21/2025 22:48:27'!
capaciteClasses
	^ classes inject: 0 into: [:effectif :uneClasse | effectif + uneClasse effectif]! !

!Volee9 methodsFor: 'classes' stamp: 'hlsf 6/30/2024 23:02:00'!
classes
	^ classes! !

!Volee9 methodsFor: 'classes' stamp: 'hlsf 6/29/2024 16:39:56'!
classesAvecPlace
	^ classes select: [:each | each estPleine not]! !

!Volee9 methodsFor: 'classes' stamp: 'hlsf 4/23/2025 11:17:37'!
trouverClasse: nom
	^ classes 
		detect: [:uneClasse | uneClasse nom includesSubString: nom ]
		ifNone: [self error: 'Classe "', nom ,'" inexistante']! !

!Volee9 methodsFor: 'eleves' stamp: 'hlsf 4/22/2025 11:55:01'!
collecterElevesEnsemble
" Collection d'élèves à mettre ensemble "
	elevesEnsemble := (eleves 
		select: [:each | each mettreAvec notNil] 
		thenCollect:[:unEleve | unEleve mettreAvec asSet add: unEleve; yourself]) asSet.
	elevesEnsemble do: [:unGroupe | 
		elevesEnsemble do: [:anotherGroup |
			unGroupe == anotherGroup ifFalse: [
				(unGroupe includesAnyOf: anotherGroup) ifTrue: [
					unGroupe addAll: anotherGroup] ] ] ].
	elevesEnsemble := elevesEnsemble collect: [:each | each asSet]! !

!Volee9 methodsFor: 'eleves' stamp: 'hlsf 5/14/2025 08:25:14'!
elevesAvecTrouble
" Eleves avec troubles, pas encore placés dans une classe " 
	^ self elevesSansClasse select: [:each | each avecTrouble]! !

!Volee9 methodsFor: 'eleves' stamp: 'hlsf 4/18/2025 23:09:26'!
elevesDansClasses

	^ classes 
		inject: OrderedCollection new 
		into: [:elevesDansClasses :classe | 
			elevesDansClasses addAll: classe eleves; yourself]! !

!Volee9 methodsFor: 'eleves' stamp: 'hlsf 6/30/2024 16:00:19'!
elevesSansClasse
	^ eleves difference: self elevesDansClasses! !

!Volee9 methodsFor: 'eleves' stamp: 'hlsf 4/18/2025 23:35:54'!
mettreAvec: unEleve
"
	unEleve doit-il est mis avec d'autres élèves ?
	Si oui retourner cet ensemble d'élève sinon l'ensemble avec ce seul élève
"
	^ elevesEnsemble 
		detect: [:ensemble | ensemble includes: unEleve ] 
		ifNone: [Array with: unEleve ]! !

!Volee9 methodsFor: 'eleves' stamp: 'hlsf 4/23/2025 11:46:46'!
trouverEleve: unPatronyme
	^ self trouverEleve: unPatronyme dans: eleves! !

!Volee9 methodsFor: 'eleves' stamp: 'hlsf 4/23/2025 11:19:46'!
trouverEleve: unPatronyme dans: listeEleves
" 
	Trouver l'élève par son patronyme dans listeEleves
"
	^ listeEleves 
		detect: [:unEleve | unEleve match:  unPatronyme ] 
		ifNone: [nil]! !

!Volee9 methodsFor: 'eleves' stamp: 'hlsf 4/23/2025 12:43:05'!
trouverProcheEleve: unPatronyme
	^ eleves 
		detect: [:unEleve | unEleve procheDe:  unPatronyme ] 
		ifNone: [nil]! !

!Volee9 methodsFor: 'affecter' stamp: 'hlsf 5/14/2025 08:22:51'!
calculer
	" Calculer une nouvelle volée "
	
	self preparerDonnees;
		ventilerElevesAvecTrouble ;
		ventilerElevesEnsemble ;
		ventilerSelonSexe.
				
	self verifierScore.
! !

!Volee9 methodsFor: 'affecter' stamp: 'hlsf 4/25/2025 13:07:52'!
preparerDonnees
	eleves ifNil: [self importerEtInitialiser].
	eleves do: [:eleve | 
		eleve estMobile ifTrue: [
			eleve classeAttribuee ifNotNil: [:classe | classe enleverEleve: eleve]] ].
	self	collecterElevesEnsemble! !

!Volee9 methodsFor: 'affecter' stamp: 'hlsf 5/14/2025 08:25:14'!
ventilerElevesAvecTrouble
" Ventiler les élèves avec troubles et non encore affectés dans les classes avec place.
  Trier les classes selon le nombre d'élève avec trouble, vérifier les incompatibilités entre élèves "
	self elevesAvecTrouble shuffled do: [:unEleve | | ensemble |
		ensemble := self mettreAvec: unEleve.
		(self classesAvecPlace shuffled sort: [:cl1 :cl2 | cl1 trouble < cl2 trouble]) 
			detect: [:uneClasse | uneClasse sontCompatibles: ensemble ]
			ifFound: [:saClasse | 
				saClasse ajouterEleves: ensemble.
				ensemble size > 1 ifTrue: [elevesEnsemble remove: ensemble ]]
			ifNone: [Transcript show: unEleve; show: ' pas de classe compatible. Avec: '; 
				show: ensemble; cr] ]
		! !

!Volee9 methodsFor: 'affecter' stamp: 'hlsf 4/18/2025 18:21:28'!
ventilerElevesEnsemble
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

!Volee9 methodsFor: 'affecter' stamp: 'hlsf 4/18/2025 23:28:52'!
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

!Volee9 methodsFor: 'initialization' stamp: 'hlsf 4/25/2025 10:49:26'!
importerEtInitialiser
"	Importer les données 	"
	self	importerEleves;
		importerClasses;
		filtrer;
		fusionnerContraintesEleves.
"	Initialiser les objets avec les données 	"
	self	initPreattribuerClasses;
		initPreexclureClasses;
		initElevesEnsemble ;
		initElevesSepares	! !

!Volee9 methodsFor: 'initialization' stamp: 'hlsf 4/23/2025 21:21:37'!
initElevesEnsemble
" Certains élèves sont placés ensemble 
 Trouver et remplacer le nom de chaque eleve par l'objet ad-hoc "
	Transcript show: '** Elèves à mettre ensemble'; cr.
	eleves 
		select: [:each | each mettreAvec notNil] 
		thenDo: [:unEleve | | autresEleves |
			autresEleves := unEleve mettreAvec virguleSeparer collect: [:unPatronyme | 
				(self trouverProcheEleve: unPatronyme) 
					ifNil: [
						Transcript tab; show: unPatronyme; show: ' **non trouvé** chez ';
							print: unEleve; cr.
						nil] 
					ifNotNil: [:eleveTrouve |
						Transcript tab; show: 'J''ai trouvé '; print: eleveTrouve; 
							show: ' pour '; show: unPatronyme; cr.
							eleveTrouve 	] ].
			autresEleves removeAllSuchThat: [:each | each isNil].
			autresEleves	 ifEmpty: [autresEleves := nil].
			unEleve mettreAvec: autresEleves]! !

!Volee9 methodsFor: 'initialization' stamp: 'hlsf 4/23/2025 21:19:13'!
initElevesSepares
" Certains élèves ne doivent pas être ensemble
 Remplacer le nom de chaque eleve par l'objet ad-hoc "
	| autresEleves |
	Transcript show: '** Elèves à séparer'; cr.
	eleves 
		select: [:each | each separerDe notNil] 
		thenDo: [:unEleve |
			autresEleves := unEleve separerDe virguleSeparer collect: [:unPatronyme | 
				(self trouverProcheEleve: unPatronyme)
					ifNil: [
						Transcript  tab; show: unPatronyme; show: ' **non trouvé** chez ';
							print: unEleve; cr.
							nil]
					ifNotNil: [:eleveTrouve |
						Transcript tab; show: 'J''ai trouvé '; print: eleveTrouve; 
							show: ' pour '; show: unPatronyme; cr.
							eleveTrouve 	] ].
			autresEleves removeAllSuchThat: [:each | each isNil].
			autresEleves	 ifEmpty: [autresEleves := nil].
			unEleve separerDe: autresEleves]! !

!Volee9 methodsFor: 'initialization' stamp: 'hlsf 4/23/2025 11:54:24'!
initPreattribuerClasses
" Des élèves se voient préattribués des classes
  Remplacer chaque nom de classe par leur objet ad-hoc et attribuer la classe à l'élève"
	eleves 
		select: [:each | each classeAttribuee notNil] 
		thenDo: [:unEleve | | classe |
			classe := self trouverClasse: unEleve classeAttribuee.
			classe ajouterEleve: unEleve.
			Transcript show: unEleve; 
				show: ' à placer en classe '; 
				show: classe; cr]! !

!Volee9 methodsFor: 'initialization' stamp: 'hlsf 4/23/2025 11:54:38'!
initPreexclureClasses
" Des élèves se voient préexcluent de certaines classes
 Remplacer chaque nom de classe par leur objet ad-hoc. "
	eleves 
		select: [:each | each classesExclues notNil] 
		thenDo: [:unEleve | | sesClassesExclues |
			sesClassesExclues := unEleve classesExclues virguleSeparer 				collect: [:unNom | self trouverClasse: unNom ].
			unEleve classesExclues: sesClassesExclues.
			Transcript show: unEleve; 
				show: ' est à exclure des classes '; 
				show: sesClassesExclues; cr ]! !

!Volee9 methodsFor: 'metriques' stamp: 'hlsf 4/19/2025 13:12:55'!
ecartType
	| scoreVolee |
	scoreVolee := self note.
	^ [((classes sum: [:uneClasse | (scoreVolee - uneClasse note) squared]) / self nbClasses ) sqrt] 
		on: Error 
		do: 0! !

!Volee9 methodsFor: 'metriques' stamp: 'hlsf 7/1/2024 14:33:01'!
elevesSeuls
	^ classes sum: [:uneClasse | uneClasse elevesSeuls ]! !

!Volee9 methodsFor: 'metriques' stamp: 'hlsf 6/30/2024 16:52:00'!
nbClasses
	^ classes 
		ifNotNil:  [classes size]
		ifNil: [0]! !

!Volee9 methodsFor: 'metriques' stamp: 'hlsf 6/30/2024 16:51:50'!
nbEleves
	^ eleves 
		ifNotNil:  [eleves size]
		ifNil: [0]! !

!Volee9 methodsFor: 'metriques' stamp: 'hlsf 4/19/2025 13:12:55'!
note
" La note moyenne de toutes les classes pour MA, FR ALL "
	^ [(classes sum: [:uneClasse | uneClasse note]) / self nbClasses ] on: Error do: 0! !

!Volee9 methodsFor: 'metriques' stamp: 'hlsf 4/21/2025 13:42:01'!
scoring
"
	Métrique de [0 ; 1] pour comparer deux volées entre elles, le plus bas le meilleur
"
	| c1 c2 |
	" 18 est la note maximale ⇒ σ ∈ [0 ; 9]"
	c1 := self ecartType / 9.
	c2 := self elevesSeuls / 38.0 .
	^ (0.5 * c1) + (0.5 * c2) ! !

!Volee9 methodsFor: 'metriques' stamp: 'hlsf 4/22/2025 11:52:15'!
verifierScore
" Nous cherchons la volée avec le meilleur score "
	^ (voleePreferee isNil 
	or: [voleePreferee notNil and: [ voleePreferee scoring > self scoring ]])
		ifTrue: [
			'\o/ Volée avec un meilleur arrangement !!' print.
			voleePreferee := self veryDeepCopy.
			self changed: #voleePreferee ]! !

!Volee9 methodsFor: 'metriques' stamp: 'hlsf 4/20/2025 13:17:28'!
voleePreferee
	^ voleePreferee ! !

!Volee9 methodsFor: 'testing' stamp: 'hlsf 4/21/2025 22:51:12'!
checkElevesEnsembles
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
			unEleve classeAttribuee = autreEleve classeAttribuee ]) not ] ].
	^ elevesNonAccompagnes isEmpty! !

!Volee9 methodsFor: 'testing' stamp: 'hlsf 4/21/2025 22:34:53'!
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
					unEleve classeAttribuee = autreEleve classeAttribuee ] ] ].
	^ elevesNonSepares isEmpty! !

!Volee9 methodsFor: 'testing' stamp: 'hlsf 4/21/2025 22:43:49'!
checks
	^ self checkElevesEnsembles and: [self checkElevesSepares ]! !

!Volee9 methodsFor: 'testing' stamp: 'hlsf 4/25/2025 11:19:34'!
est9eme
	^ true! !

!Volee9 methodsFor: 'testing' stamp: 'hlsf 4/25/2025 11:03:57'!
estCalculable
	^ csvEleves notNil
	and: [csvClasses notNil
	and: [csvContraintes notNil] ] ! !

!Volee9 methodsFor: 'printing' stamp: 'hlsf 4/21/2025 22:52:24'!
printOn: stream
	stream nextPutAll: 'Élèves : '; 	print: self nbEleves ; lf;
		nextPutAll: 'Élèves isolés : '; print: self elevesSeuls ; lf;		
		nextPutAll: 'Classes : '; print: self nbClasses; lf;
		nextPutAll: 'Capacité classes : '; print: self capaciteClasses ;lf;
		nextPutAll: 'Élèves sans classe: '; print: self elevesSansClasse size; lf;
		nextPutAll: 'Note moy (MA+FR+AL): '; nextPutAll: (self note printStringFractionDigits: 1); lf;
		nextPutAll: 'Score : '; nextPutAll: (self scoring printStringFractionDigits: 2); lf;
		nextPutAll: 'Ecart type : '; nextPutAll: (self ecartType printStringFractionDigits: 2); lf;		
		nextPutAll: 'Vérifications: '; newLineTab ;
		nextPutAll: '- élèves ensemble '; print: self checkElevesEnsembles ; newLineTab ;
		nextPutAll: '- élèves séparés '; print: self checkElevesSepares ! !

!Volee9 methodsFor: 'printing' stamp: 'hlsf 4/21/2025 22:50:53'!
resume
	^ String streamContents: [: str |
	str nextPutAll: 'C'; print: self nbClasses;
		nextPutAll: ' E'; print: self nbEleves  ;
		nextPutAll: ' I'; print: self elevesSeuls ;
		nextPutAll: ' X'; print: self elevesSansClasse size;
		nextPutAll: ' Score='; nextPutAll: (self scoring printStringFractionDigits: 2);
		nextPutAll: ' σ='; nextPutAll: (self ecartType printStringFractionDigits: 2);
		nextPutAll: ' Vérif. '; print: self checks]! !

!Volee9 methodsFor: 'import/export' stamp: 'hlsf 4/25/2025 16:30:30'!
exportPath
	^ DirectoryEntry projectBaseDirectory / 'export' / 'Volee9e'! !

!Volee9 methodsFor: 'import/export' stamp: 'hlsf 4/25/2025 13:39:59'!
exporterClasses
	| path |
	path := self exportPath / (String streamContents: [:str |
		DateAndTime now filenamishPrintOn: str]).
	path assureExistence.
		
	voleePreferee classes do: [:uneClasse | | stream writer fichier |
		fichier := path // (uneClasse nom, '.csv').
		fichier delete.
		stream := fichier writeStream.
		writer := NeoCSVWriter on: stream.
		writer 
			fieldWriter: #raw;
			nextPut: #(NOM PRENOM SEXE).
		uneClasse eleves do: [:unEleve | writer nextPut: {unEleve nom . unEleve prenom . unEleve sexe} ].
		stream close].
	self inform: 'Volée sauvegardée dans le dossier 
', path pathName ! !

!Volee9 methodsFor: 'import/export' stamp: 'hlsf 4/25/2025 10:34:19'!
filtrer
	self filtrerSections: #(R3 MI)! !

!Volee9 methodsFor: 'import/export' stamp: 'hlsf 4/23/2025 11:21:06'!
filtrerSections: filtreSections
" Retirer les classes et les élèves qui ne sont pas dans la collection filtreSections "
	classes := classes select: [:uneClasse |  
		filtreSections includesAnyOf: uneClasse sections].
	eleves := eleves select: [:unEleve | 
		filtreSections includesAnyOf: unEleve sections]! !

!Volee9 methodsFor: 'import/export' stamp: 'hlsf 5/14/2025 08:24:39'!
fusionnerContraintesEleves
	| contraintesEleves |
	self assert: classes notNil description: 'Importer classes d''abord'.
	self assert: eleves notNil description: 'Importer eleves de SMOG d''abord'.
	contraintesEleves := self importerContraintesEleves .
	" Fusionner les contraintes dans Eleves "
	eleves do: [:unEleve | 
		(self trouverEleve: unEleve patronyme dans: contraintesEleves)
			ifNotNil:  [:infoEleve |
				unEleve 
					classeAttribuee: infoEleve classeAttribuee ;
					classesExclues: infoEleve classesExclues ;
					trouble: infoEleve avecTrouble;
					ancienneClasse: infoEleve ancienneClasse ;
					mettreAvec: infoEleve mettreAvec ;
					separerDe: infoEleve separerDe ;
					note: infoEleve note ]
			ifNil: [Transcript 
					show: 'Pas de contrainte pour ';
					show: unEleve; cr] ]! !

!Volee9 methodsFor: 'import/export' stamp: 'hlsf 4/25/2025 11:51:32'!
importPath
	^ DirectoryEntry projectBaseDirectory / 'import'! !

!Volee9 methodsFor: 'import/export' stamp: 'hlsf 4/25/2025 11:57:17'!
importerClasses
	classes := Classe importer: self importPath // csvClasses ! !

!Volee9 methodsFor: 'import/export' stamp: 'hlsf 5/14/2025 08:15:50'!
importerContraintesEleves

	^ Eleve importerContraintes9eme: self importPath // csvContraintes! !

!Volee9 methodsFor: 'import/export' stamp: 'hlsf 4/25/2025 11:52:38'!
importerEleves
	eleves := Eleve importer: self importPath // csvEleves ! !

!Volee9 methodsFor: 'fichiers' stamp: 'hlsf 4/25/2025 10:36:45'!
csvClasses: fichierClasses
	csvClasses := fichierClasses! !

!Volee9 methodsFor: 'fichiers' stamp: 'hlsf 4/25/2025 10:37:10'!
csvContraintes: fichierContraintes
	csvContraintes := fichierContraintes ! !

!Volee9 methodsFor: 'fichiers' stamp: 'hlsf 4/25/2025 10:36:07'!
csvEleves: fichierEleves
	csvEleves := fichierEleves ! !

!Volee10 methodsFor: 'fichiers' stamp: 'hlsf 4/25/2025 10:37:54'!
csvGroupes: fichierGroupes
	csvGroupes := fichierGroupes! !

!Volee10 methodsFor: 'import/export' stamp: 'hlsf 4/25/2025 16:30:54'!
exportPath
	^ DirectoryEntry projectBaseDirectory / 'export' / 'Volee10e'! !

!Volee10 methodsFor: 'import/export' stamp: 'hlsf 4/25/2025 11:56:06'!
importerGroupes
	| groupes |
	groupes := GroupeOption importer: self importPath // csvGroupes.
	groupes do: [:unGroupe | 
		(self trouverClasse: unGroupe classe) ajouterGroupe: unGroupe].
	" Vérifier effectifs des groupes et classes "
	classes do: [:classe |
		classe effectif = classe effectifGroupes ifFalse: [ 
			Transcript show:classe nom;
				show: ' - effectif des groupes différent de la classe'; cr ] ]! !

!Volee10 methodsFor: 'initialization' stamp: 'hlsf 4/25/2025 10:51:19'!
importerEtInitialiser
"	Importer les données 	"
	self	importerEleves;
		importerClasses;
		importerGroupes;
		filtrer;
		fusionnerContraintesEleves.
"	Initialiser les objets avec les données 	"
	self	initPreattribuerClasses;
		initPreexclureClasses;
		initElevesEnsemble ;
		initElevesSepares	! !

!Volee10 methodsFor: 'testing' stamp: 'hlsf 4/25/2025 11:19:53'!
est9eme
	^ false! !

!Volee10 methodsFor: 'testing' stamp: 'hlsf 4/25/2025 11:04:29'!
estCalculable
	^ super estCalculable
	and: [csvGroupes notNil]! !

!Volee11 methodsFor: 'import/export' stamp: 'hlsf 4/25/2025 16:31:02'!
exportPath
	^ DirectoryEntry projectBaseDirectory / 'export' / 'Volee11e'! !

!SuiviEleve methodsFor: 'initialization' stamp: 'hlsf 7/26/2024 17:01:02'!
initialize
	super initialize.
	classes := SortedCollection new! !

!SuiviEleve methodsFor: 'import/export' stamp: 'hlsf 7/28/2024 00:05:19'!
exportVisiteClassesVers: stream
	stream nextPutAll: '** TODO [/] Visites Classes'; lf.
	classes 
		do: [:uneClasse |
			stream nextPutAll: ' - [ ] ';
				nextPutAll: uneClasse nom; lf]! !

!SuiviEleve methodsFor: 'import/export' stamp: 'hlsf 7/27/2024 23:26:53'!
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

!SuiviEleve methodsFor: 'import/export' stamp: 'hlsf 7/27/2024 23:27:53'!
exporterEleve: unEleve vers: stream
	stream nextPutAll: '*** ';
		nextPutAll: unEleve nom asCapitalizedNames ;
		nextPutAll: ', ';
		nextPutAll: unEleve prenom asCapitalizedNames; lf.
	stream nextPutAll: ':email:'; lf;
		nextPutAll: unEleve email; lf;
		nextPutAll: ':END:'; lf.
	stream nextPutAll: '**** Bilatérales'; lf;
		nextPutAll: '**** Conseils'; lf.
	self tableVers: stream.
	stream
		nextPutAll: '**** Mesures disciplinaires'; lf;
		nextPutAll: '**** Autres'! !

!SuiviEleve methodsFor: 'import/export' stamp: 'hlsf 7/28/2024 00:03:15'!
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

!SuiviEleve methodsFor: 'import/export' stamp: 'hlsf 7/26/2024 17:00:33'!
importerClasses: list
	list substrings do: [:each |
		classes add: (self importerUneClasse: each, '.csv') 		] ! !

!SuiviEleve methodsFor: 'import/export' stamp: 'hlsf 7/26/2024 23:17:25'!
importerUneClasse: fichierCSV
" fichierCSV doit être du type 1121.csv, sans chemin !! "
	| eleves |
	eleves := (NeoCSVReader on: (DirectoryEntry projectBaseDirectory / 'import' // fichierCSV) readStream )
		separator: $; ;
		skipHeader;
		recordClass: Eleve;
		addIgnoredFields: 2;
		addFields: #(#nom: #prenom: #email:);
		addIgnoredFields: 2;
		upToEnd.
	^ Classe new
		nom: (fichierCSV subStrings: '.') first;
		eleves: eleves asSortedCollection;
		yourself! !

!SuiviEleve methodsFor: 'import/export' stamp: 'hlsf 7/27/2024 23:36:52'!
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

!SuiviEleve class methodsFor: 'instance creation' stamp: 'hlsf 7/26/2024 16:57:55'!
importerClasses: classes
" 
	SuiviEleve importerClasses: '1121 1122 1123'
"
	^ self new
		importerClasses: classes;
		yourself! !

!ClasseView methodsFor: 'accessing' stamp: 'hlsf 4/20/2025 11:56:11'!
model: uneClasse
	model := uneClasse ! !

!ClasseView methodsFor: 'initialization' stamp: 'hlsf 4/21/2025 23:05:04'!
initialize
	| textView |
	super initialize.
	self beColumn;
		layoutSpec: LayoutSpec keepMorphExtent.
	textView := TextParagraphMorph contents: (model printString bold color: Color white) ::
		setHeightOnContent ;
		borderWidth: 0;
		color: Color black .
	self addMorph: textView layoutSpec: LayoutSpec keepMorphExtent.
	model eleves do: [:unEleve | 
		self 
			addMorph: (EleveView on: unEleve)
			layoutSpec: LayoutSpec keepMorphExtent]! !

!ClasseView class methodsFor: 'as yet unclassified' stamp: 'hlsf 4/20/2025 12:05:13'!
on: uneClasse
	^ self basicNew 
		model: uneClasse;
		initialize ! !

!VoleeWindow methodsFor: 'GUI building' stamp: 'hlsf 4/25/2025 12:48:34'!
ajoutBouton: nom action: symbol
	| button |
	filesToolbar 
		addMorph: (LabelMorph contents:  nom capitalized , ' : ');
		addMorph: (button := PluggableButtonMorph
			model: self
			action: symbol
			label: 'Choisir fichier').
	^ button! !

!VoleeWindow methodsFor: 'GUI building' stamp: 'hlsf 4/25/2025 13:35:18'!
buildComputeToolbar
	| row |
	 qtyEntry := SimpleNumberEntryMorph 
		integerRangeFrom: 1 
		to: 9999 
		maxNumChars: 4.
		
	row := LayoutMorph newRow.
	row addMorph: (LabelMorph contents: 'Nombre de volées à calculer : ');
		addMorph: qtyEntry ;
		addMorph: (PluggableButtonMorph 
			model: self
			action: #compute 
			label: 'Calculer' ::
			enableSelector: #canCompute );
		addMorph: scoreLabel;
		addMorph: (PluggableButtonMorph 
			model: self 
			action: #exporterClasses 
			label: 'Enregistrer' ::
			enableSelector: #isComputed;
			setBalloonText: 'Enregistrer cette volée sous la forme d''une collection de fichiers csv, un par classe.').
	^ row! !

!VoleeWindow methodsFor: 'GUI building' stamp: 'hlsf 4/25/2025 12:55:16'!
buildFilesToolbar
	filesToolbar 
		ifNil: [filesToolbar := LayoutMorph newRow]
		ifNotNil: [filesToolbar removeAllMorphs ].
	model ifNil: [
		filesToolbar 
			addMorph: (LabelMorph contents: 'Choisir une volée ci-dessus.');
			layoutSpec: (LayoutSpec keepMorphExtent offAxisEdgeWeight: 0) ]
		ifNotNil: [
			elevesBtn := self	ajoutBouton: 'élèves' action: #choixFichierEleves.
			contraintesBtn := self	ajoutBouton: 'contraintes élèves' action: #choixFichierContraintes.
			classesBtn := self ajoutBouton: 'classes' action: #choixFichierClasses.
			model est9eme ifFalse: [
				groupesBtn := self 	
					ajoutBouton: 'groupes d''options' 
					action: #choixFichierGroupes ]].
	^ filesToolbar! !

!VoleeWindow methodsFor: 'GUI building' stamp: 'hlsf 4/25/2025 13:18:17'!
buildMorphicWindow
	scoreLabel := LabelMorph contents: self scoreVideLabel.
	self 
		addMorph: self buildComputeToolbar layoutSpec: LayoutSpec new useMorphHeight;
		addMorph: self buildVoleeToolbar ;
		addMorph: self buildFilesToolbar ;
		addMorph: (classesView := FlowLayoutMorph new align: #rowTop)! !

!VoleeWindow methodsFor: 'GUI building' stamp: 'hlsf 4/25/2025 10:05:39'!
buildVoleeToolbar
	| row group groupButtons |
		
	group := RadioGroup fromList: #('9ème' '10ème' '11ème').
	groupButtons := group buttons.
	groupButtons first when: #radioSelection send: #select9 to: self.
	groupButtons second when: #radioSelection send: #select10 to: self.
	groupButtons third when: #radioSelection send: #select11 to: self.

	row := LayoutMorph newRow.
	row addMorph: (LabelMorph contents: 'Volée : ');
		addMorph: group beRow;
		layoutSpec: (LayoutSpec keepMorphExtent offAxisEdgeWeight: #columnLeft).
	^ row! !

!VoleeWindow methodsFor: 'GUI building' stamp: 'hlsf 4/25/2025 13:18:17'!
scoreVideLabel

	^ 'Auncun score, calculer au moins une volée'! !

!VoleeWindow methodsFor: 'updating' stamp: 'hlsf 4/25/2025 13:38:19'!
update: aspect
	super update: aspect.
	aspect == #voleePreferee ifTrue: [ | views |
		scoreLabel contents: model voleePreferee resume.
		scoreLabel setBalloonText: (String streamContents: [:str |
			model voleePreferee printOn: str]).
		views := model voleePreferee classes sorted collect: [:classe | 
			ClasseView on: classe].
		classesView cells: views.
		classesView updateLayout.
		self changed: #isComputed]
		! !

!VoleeWindow methodsFor: 'ui' stamp: 'hlsf 4/25/2025 13:04:17'!
choixFichierClasses
	| result |
	result :=(StandardFileMenu new
		oldFileFrom: model importPath withPattern: '*csv' excludePattern: '.*';
		startUpWithCaption: 'Fichier classes au format CSV').
	result ifNil: [^ self].
	classesBtn label: result name.
	classesBtn owner layoutNeeded: true.
	model csvClasses: result name.
	self changed: #canCompute! !

!VoleeWindow methodsFor: 'ui' stamp: 'hlsf 4/25/2025 13:04:54'!
choixFichierContraintes
	| result |
	result :=(StandardFileMenu new
		oldFileFrom: model importPath withPattern: '*csv' excludePattern: '.*';
		startUpWithCaption: 'Fichier contraintes élèves au format CSV').
	result ifNil: [^ self].
	contraintesBtn label: result name.
	contraintesBtn owner layoutNeeded: true.
	model csvContraintes: result name.
	self changed: #canCompute! !

!VoleeWindow methodsFor: 'ui' stamp: 'hlsf 4/25/2025 13:02:59'!
choixFichierEleves
	| result |
	result :=(StandardFileMenu new
		oldFileFrom: model importPath withPattern: '*csv' excludePattern: '.*';
		startUpWithCaption: 'Fichier élèves au format CSV').
	result ifNil: [^ self].
	elevesBtn label: result name.
	elevesBtn owner layoutNeeded: true.
	model csvEleves: result name.
	self changed: #canCompute! !

!VoleeWindow methodsFor: 'ui' stamp: 'hlsf 4/25/2025 13:05:31'!
choixFichierGroupes
	| result |
	result :=(StandardFileMenu new
		oldFileFrom: model importPath withPattern: '*csv' excludePattern: '.*';
		startUpWithCaption: 'Fichier groupes d''options au format CSV').
	result ifNil: [^ self].
	groupesBtn label: result name.
	groupesBtn owner layoutNeeded: true.
	model csvGroupes: result name.
	self changed: #canCompute! !

!VoleeWindow methodsFor: 'ui' stamp: 'hlsf 4/21/2025 17:14:27'!
compute
	| nbFois progress |
	nbFois := qtyEntry contents asNumber.
	progress := ProgressMorph 	label: 'Calcul des volées en cours'.
	progress openInWorld.
	[ | step |
		step := 1 / nbFois.
		1 to: nbFois do: [:indice |
			progress incrDone: step;
				subLabel: ('calcul volée ', indice printString, '...').			
			model calculer].
		progress delete] forkAt: Processor userBackgroundPriority ! !

!VoleeWindow methodsFor: 'ui' stamp: 'hlsf 4/25/2025 13:34:12'!
exporterClasses
	model ifNotNil: [model exporterClasses]! !

!VoleeWindow methodsFor: 'ui' stamp: 'hlsf 4/25/2025 13:37:33'!
select10
	self model: Volee10 new.
	self buildFilesToolbar.
	classesView cells: #().
	scoreLabel contents: self scoreVideLabel.
	self changed: #canCompute.
	self changed: #isComputed.! !

!VoleeWindow methodsFor: 'ui' stamp: 'hlsf 4/25/2025 13:37:39'!
select11
	self model: Volee11 new.
	self buildFilesToolbar.
	classesView cells: #().
	scoreLabel contents: self scoreVideLabel.
	self changed: #canCompute.
	self changed: #isComputed.! !

!VoleeWindow methodsFor: 'ui' stamp: 'hlsf 4/25/2025 13:37:44'!
select9
	self model: Volee9 new.
	self buildFilesToolbar.
	classesView cells: #().
	scoreLabel contents: self scoreVideLabel.
	self changed: #canCompute.
	self changed: #isComputed.! !

!VoleeWindow methodsFor: 'testing' stamp: 'hlsf 4/25/2025 11:04:49'!
canCompute
	^ model notNil
	and: [model estCalculable ]! !

!VoleeWindow methodsFor: 'testing' stamp: 'hlsf 4/25/2025 13:39:24'!
isComputed
	^ model notNil 
	and: [model voleePreferee notNil]! !

!VoleeWindow class methodsFor: 'instance creation' stamp: 'hlsf 4/25/2025 10:12:37'!
open
	^ self 
		open: nil 
		label: 'Conception de volée'! !

!VoleeWindow class methodsFor: 'instance creation' stamp: 'hlsf 4/21/2025 10:18:30'!
open: uneVolee
	^ self 
		open: uneVolee 
		label: 'Conception de volée'! !

!EleveView methodsFor: 'accessing' stamp: 'hlsf 4/21/2025 22:54:47'!
model: unEleve
	model := unEleve ! !

!EleveView methodsFor: 'initialization' stamp: 'hlsf 4/21/2025 23:07:52'!
initialize
	| genderColor constraintColoring |
	super initialize.
	genderColor := model estGarcon ifTrue: [#blue]  ifFalse: [#magenta]. 
	self	contents: (model printString perform: genderColor).
	constraintColoring := model estContraint ifTrue: [Color veryVeryLightGray ] ifFalse: [Color white].
	self setHeightOnContent ;
		borderWidth: 1;
		color: constraintColoring . ! !

!EleveView methodsFor: 'as yet unclassified' stamp: 'hlsf 4/21/2025 23:32:11'!
balloonText
	^ String streamContents: [:str | model descriptionOn: str]! !

!EleveView class methodsFor: 'as yet unclassified' stamp: 'hlsf 4/21/2025 22:55:10'!
on: unEleve
	^ self basicNew
		model: unEleve ;
		initialize ! !

!Object methodsFor: '*Doyen' stamp: 'hlsf 6/30/2024 10:31:56'!
estClasse
	^ false! !

!Collection methodsFor: '*Doyen' stamp: 'hlsf 4/23/2025 21:27:37'!
closeToAllOf: aCollection 
	"Answer wether all the elements of aCollection are close to the ones in the receiver."
	
	aCollection do: [:elem | 
		(self anySatisfy: [:otherElem | (elem distanceTo: otherElem) < 2]) 
			ifFalse: [^ false] ].
	^ true! !

!CharacterSequence methodsFor: '*Doyen' stamp: 'hlsf 4/23/2025 21:04:10'!
distanceTo: anotherString 
" Iterative calculation of the Levenshtein distance between two strings."
" https://en.wikibooks.org/wiki/Algorithm_Implementation/Strings/Levenshtein_distance#Smalltalk"

	| arrayTwo arrayOne |
	" degenerate cases"
	anotherString = self ifTrue: [ ^0 ].
	anotherString size = 0 ifTrue: [ ^self size ].
	self size = 0 ifTrue: [ ^anotherString size ].
	
	"create two work vectors of integer distances"
	arrayOne := Array new: anotherString size + 1.
	arrayTwo := Array new: anotherString size + 1.
	
	"initialize v0 (the previous row of distances)
    	this row is A[0][i]: edit distance for an empty s
    	the distance is just the number of characters to delete from t"
	1 to: arrayOne size do: [ :i | arrayOne at: i put: i - 1 ].
	
	1 to: self size do: [ : i | 	
		" calculate v1 (current row distances) from the previous row v0
		first element of v1 is A[i+1][0] edit distance is delete (i+1) chars from s to match empty t"
  		arrayTwo at: 1 put: i.
		
		 " use formula to fill in the rest of the row"
		1 to: anotherString size do: [:j | | cost minimum minimumAux |
			(self at: i) = (anotherString at: j) 
				ifTrue: [cost := 0]
				ifFalse: [cost := 1].			
			minimumAux := (arrayTwo at: j) + 1 min: (arrayOne at: j + 1) + 1.
			minimum :=  minimumAux min: (arrayOne at: j) + cost.
			arrayTwo at: j + 1 put: minimum].
		
		1 to: arrayOne size do: [:j | arrayOne at: j put: (arrayTwo at: j) ] ].

	^arrayTwo at: anotherString size + 1! !

!String methodsFor: '*Doyen' stamp: 'hlsf 7/26/2024 21:06:22'!
asCapitalizedNames
" 'Toto dupont figue' -> 'Toto Dupont Figue' "
	^ self substrings collect: [:each | each asLowercase capitalized] andFold: [:a :b | a, ' ', b] ! !

!String methodsFor: '*Doyen' stamp: 'hlsf 4/22/2025 12:26:16'!
virguleSeparer
" séparer aux virgules et placer dans une collection "
	^ (self findBetweenSubStrs: ',') collect: [:uneChaine | uneChaine withBlanksTrimmed]! !

!UnicodeString methodsFor: '*Doyen' stamp: 'hlsf 7/26/2024 21:06:22'!
asCapitalizedNames
" 'Toto dupont figue' -> 'Toto Dupont Figue' "
	^ self substrings collect: [:each | each asLowercase capitalized] andFold: [:a :b | a, ' ', b] ! !

!UnicodeString methodsFor: '*Doyen' stamp: 'hlsf 4/22/2025 12:25:01'!
virguleSeparer
" séparer aux virgules et placer dans une collection "
	^ (self findBetweenSubStrs: ',') collect: [:uneChaine | uneChaine withBlanksTrimmed]! !
