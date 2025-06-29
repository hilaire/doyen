'From Cuis7.3 [latest update: #7099] on 29 June 2025 at 11:06:51 pm'!
'Description '!
!provides: 'Doyen' 1 61!
!requires: 'Goodies' 1 11 nil!
!requires: 'Neo-CSV-Core' 1 2 nil!
!requires: 'UI-Panel' 1 123 nil!
!requires: 'UI-Entry' 1 56 nil!
SystemOrganization addCategory: #'Doyen-Classes'!
SystemOrganization addCategory: #'Doyen-Org'!


!classDefinition: #Classe category: #'Doyen-Classes'!
Object subclass: #Classe
	instanceVariableNames: 'nom sections groupes capacite eleves'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Doyen-Classes'!
!classDefinition: 'Classe class' category: #'Doyen-Classes'!
Classe class
	instanceVariableNames: ''!

!classDefinition: #Classe10e category: #'Doyen-Classes'!
Classe subclass: #Classe10e
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Doyen-Classes'!
!classDefinition: 'Classe10e class' category: #'Doyen-Classes'!
Classe10e class
	instanceVariableNames: ''!

!classDefinition: #Classe9e category: #'Doyen-Classes'!
Classe subclass: #Classe9e
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Doyen-Classes'!
!classDefinition: 'Classe9e class' category: #'Doyen-Classes'!
Classe9e class
	instanceVariableNames: ''!

!classDefinition: #Eleve category: #'Doyen-Classes'!
Object subclass: #Eleve
	instanceVariableNames: 'nom prenom ancienneClasse classeAttribuee classesExclues sexe note section option trouble separerDe mettreAvec mobile email'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Doyen-Classes'!
!classDefinition: 'Eleve class' category: #'Doyen-Classes'!
Eleve class
	instanceVariableNames: ''!

!classDefinition: #Eleve9e category: #'Doyen-Classes'!
Eleve subclass: #Eleve9e
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Doyen-Classes'!
!classDefinition: 'Eleve9e class' category: #'Doyen-Classes'!
Eleve9e class
	instanceVariableNames: ''!

!classDefinition: #EleveNote category: #'Doyen-Classes'!
Eleve subclass: #EleveNote
	instanceVariableNames: 'patronyme'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Doyen-Classes'!
!classDefinition: 'EleveNote class' category: #'Doyen-Classes'!
EleveNote class
	instanceVariableNames: ''!

!classDefinition: #GroupeOption category: #'Doyen-Classes'!
Object subclass: #GroupeOption
	instanceVariableNames: 'classe option groupe capacite eleves'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Doyen-Classes'!
!classDefinition: 'GroupeOption class' category: #'Doyen-Classes'!
GroupeOption class
	instanceVariableNames: ''!

!classDefinition: #Volee category: #'Doyen-Classes'!
Object subclass: #Volee
	instanceVariableNames: 'classes csvClasses csvContraintesDoyen csvEleves eleves elevesEnsemble filtre voleePreferee csvGroupes'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Doyen-Classes'!
!classDefinition: 'Volee class' category: #'Doyen-Classes'!
Volee class
	instanceVariableNames: ''!

!classDefinition: #Volee10 category: #'Doyen-Classes'!
Volee subclass: #Volee10
	instanceVariableNames: 'csvNotes'
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

!classDefinition: #Volee9 category: #'Doyen-Classes'!
Volee subclass: #Volee9
	instanceVariableNames: 'csvContraintesEcole'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Doyen-Classes'!
!classDefinition: 'Volee9 class' category: #'Doyen-Classes'!
Volee9 class
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
	instanceVariableNames: 'scoreLabel qtyEntry classesView filesToolbar elevesBtn contraintesDoyenBtn contraintesEcoleBtn classesBtn groupesBtn notesBtn filtreBtn'
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

!Classe10e commentStamp: 'hlsf 6/6/2025 14:33:03' prior: 0!
Concernant les classe de 10e et 11:
- sections: elle est #(LS), #(LS), #(CT)
- groupes: contrairement à une classe de 9e, j'ai toujours des groupes d'options et l'effectif de mes groupes est égale à celui de la classe. De même tous les élèves de 9e ont une option!

!Classe9e commentStamp: 'hlsf 6/25/2025 18:11:15' prior: 0!
Concernant les classe de 9e:
- sections: elle est #(R1), #(R2), #(R3), #(R3, MI) -> classe SAE ; voire de #(R1 R2)-> classe DR
- groupes: 
 * pour classe SAE : le groupe est d'option #SAE. groupes a un seul GroupeOption de type #SAE. Les classes d'option #SAE sont dit de type #MI, néanmoins les élèves non #SAE de ce type de classe sont de section #R3. L'effectif de mon groupe #SAE est donc la plupart du temps inférieur à celui de la classe
 * pour classe DR (double regroupement) : il y a deux groupes de section pour alimenter la classe, "option" #R1 et #R2. Dans cette situation les groupes d'option sont utilisé comme des groupe de section au sein de classes DR
 * pour les autres classes : groupes est vide!

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
- option: #SAE, #L #S #LV #SA #AA. Dans les 9e, seul les SAE ont cette option
- ancienGroupe: l'école ou la classe l'année précédente
- mobile: un boolean l'élève peut-il être déplacé de classe ?
!

!Eleve9e commentStamp: 'hlsf 6/5/2025 14:43:27' prior: 0!
Traitement spécifique au élèves de 9e à l'importation des données SMOG
- importantion des contraintes
- traitement du champ 'statut': R1, R2, R3
- eventuellement traitement du champ 'remarques' pour les SAE!

!EleveNote commentStamp: '<historical>' prior: 0!
Je suis un objet pour importer les notes des élèves issues de GECO!

!GroupeOption commentStamp: '<historical>' prior: 0!
Je représente un groupe d'une option en 9e, 10e ou 11e
- classe : classe à laquelle je suis associée
- option : L, S, LV, SAE (10/11LS/MI), AA, SA (10/11LC), également section pour les classes DR
- groupe : mon numéro de groupe
- effectif : nombre d'élèves dans couple (classe, groupe)
- eleves: collection d'élèves affectés à ce groupe

Un même groupe peut-être réparti sur plusieurs classes. 

Exemple 1:
les deux objets options (1131, S, 1, 8) et (1132, S, 1, 6) donnent une répartition 
du groupe 1 option S sur les classes 1131 et 1132, pour un effectif total de 14 élèves.

Exemple 2:
(1071, LV, 3, 14) et (1071, SAE, 1, 9) sont les deux options de la classes 1071, pour un
effectif total de 23 élèves!

!Volee commentStamp: 'hlsf 6/19/2025 15:07:13' prior: 0!
J'organiser une volée d'élèves à enroler dans des classes en respectant certains critères:
- des contraintes supplémentaires fournies par les doyens
- Limitations connues: pas de notes importées pour les éventuelles redoublant et élèves provenant de classe d'accueil
- Les sections
- Les groupes d'options des classes, fichier de csvGroupes, du type 'import/groupes10e.csv'
Les données sont importées et ventillées dans 
- eleves : issus de SMOG (csvEleves), voir méthode Eleve class>>importerSmog:
- classes : issues d'une table csvClasses, 'classe9e.csv', 'classes10e.csv'. 
- groupes d'options importés et fusionnés dans les classes
- sections : collection de symbole de cette volée ussue des classes importées #R1 #R2 #R3 #MI
- csvInfoEleves : table de données de contraintes pour certains élèves, fusionnéss avec les instances d'eleve correspondant
- elevesEnsembles : cela concerne des groupes d'élèves devant à placer ensemble dans une classe, informations issues de la table csvInfoEleves

Pour les 9e, les données sont importées de SMOG et du tableau de recueil de recommandations issues
de l'école primaire qui comprend également les notes!

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

!Volee9 commentStamp: 'hlsf 6/19/2025 15:07:17' prior: 0!
Pour les 9e, les données sont importées de SMOG et du tableau de recueil de recommandations issues
de l'école primaire qui comprend également les notes
- des contraintes fournies sous forme d'un tableau lors des visites en école
!

!Classe methodsFor: 'accessing' stamp: 'hlsf 6/25/2025 18:23:51'!
ajouterDansUnGroupe: unEleve
	| groupesCompatibles | 
	groupesCompatibles := groupes select: [:groupe | groupe option = unEleve option and: [groupe estPlein not] ].
	groupesCompatibles ifEmpty: [self error: 'Aucune place dans un groupe'].
	groupesCompatibles shuffled first ajouterEleve: unEleve ! !

!Classe methodsFor: 'accessing' stamp: 'hlsf 6/8/2025 12:09:20'!
ajouterEleve: unEleve
" 	
	Ajouter unEleve à ma liste d'élèves. Vérifier s'il n'est pas déjà dans une autre classe
"
	unEleve classeAttribuee = self
		ifFalse: [	
			eleves add: unEleve.
			unEleve classeAttribuee estClasse ifTrue: [unEleve classeAttribuee enleverEleve: unEleve].
			unEleve classeAttribuee: self.
			self ajouterDansUnGroupe: unEleve ]! !

!Classe methodsFor: 'accessing' stamp: 'hlsf 6/6/2025 12:08:24'!
ajouterEleves: unEnsemble
	unEnsemble do: [:unEleve | self ajouterEleve: unEleve]! !

!Classe methodsFor: 'accessing' stamp: 'hlsf 6/5/2025 16:13:28'!
ajouterGroupe: unGroupe
" 	
	Ajouter unGroupe d'option à mes groupes, si celui n'est pas déjà ajouté
"
	unGroupe classe == self
		ifFalse: [	
			groupes add: unGroupe.
			unGroupe classe: self	]! !

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

!Classe methodsFor: 'accessing' stamp: 'hlsf 6/6/2025 16:03:56'!
capacite: anObject
	capacite := anObject! !

!Classe methodsFor: 'accessing' stamp: 'hlsf 6/30/2024 10:41:42'!
eleves
	^ eleves! !

!Classe methodsFor: 'accessing' stamp: 'hlsf 7/26/2024 18:37:30'!
eleves: uneCollection
" A ne pas utiliser,  à moins de savoir ce que tu fais "
	eleves := uneCollection ! !

!Classe methodsFor: 'accessing' stamp: 'hlsf 6/8/2025 12:12:47'!
enleverDeGroupe: unEleve
	^ self subclassResponsibility ! !

!Classe methodsFor: 'accessing' stamp: 'hlsf 6/21/2025 12:17:06'!
enleverEleve: unEleve
	eleves remove: unEleve.
	unEleve effacerClasseAttribuee.
	self enleverDeGroupe: unEleve
! !

!Classe methodsFor: 'accessing' stamp: 'hlsf 6/10/2025 14:43:43'!
groupeDe: unEleve
	^ groupes 
		detect: [:unGroupe |unGroupe contient: unEleve]
		ifNone: [nil]
		! !

!Classe methodsFor: 'accessing' stamp: 'hlsf 6/7/2025 12:50:09'!
groupes: option
	" Retourne le(s) groupe(s) de la classe avec cette option, si n'existe pas erreur "
	^ groupes select: [:unGroupe | unGroupe option = option] ! !

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

!Classe methodsFor: 'accessing' stamp: 'hlsf 6/25/2025 17:20:52'!
sections: anObject
	sections := (anObject virguleSeparer collect: [:uneSection |  uneSection asUppercase asSymbol]) sorted! !

!Classe methodsFor: 'initialization' stamp: 'hlsf 4/18/2025 17:32:48'!
initialize
	super initialize.
	eleves := SortedCollection new.
	groupes := OrderedCollection new! !

!Classe methodsFor: 'metric' stamp: 'hlsf 6/6/2025 16:01:49'!
capacite
	"Answer the value of effectif"

	^ capacite! !

!Classe methodsFor: 'metric' stamp: 'hlsf 6/21/2025 10:20:56'!
ecartFilleGarcon
	^ [(self garcons - self filles) abs / self effectif] on: ZeroDivide do: [0]! !

!Classe methodsFor: 'metric' stamp: 'hlsf 6/8/2025 11:50:18'!
ecartType
	| moyClasse |
	moyClasse := self note.
	^ [((eleves sum: [:unEleve | (moyClasse - unEleve note) squared]) / self effectif ) sqrt] 
		on: Error 
		do: 0! !

!Classe methodsFor: 'metric' stamp: 'hlsf 6/8/2025 11:13:42'!
effectif
	^ eleves size! !

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

!Classe methodsFor: 'metric' stamp: 'hlsf 6/8/2025 11:14:23'!
note
	^ [(eleves sum: [:unEleve | unEleve note]) / self effectif] on: Error do: 0! !

!Classe methodsFor: 'metric' stamp: 'hlsf 6/7/2025 12:51:40'!
placesGroupes: uneOption
" 	Place disponible dans le(s) groupe(s) uneOption, il est possible d'avoir plusieurs groupes de même option. 
	Si ce groupe n'existe pas -> 0 "
	^ (self groupes: uneOption) 
		ifEmpty:  [0]
		ifNotEmpty: [:desGroupes | 
			desGroupes sum: [:unGroupe | unGroupe places] ]
! !

!Classe methodsFor: 'metric' stamp: 'hlsf 5/14/2025 08:24:39'!
trouble
	" Indique le nombre d'élèves dys "
	^ eleves count: [:each | each avecTrouble]! !

!Classe methodsFor: 'printing' stamp: 'hlsf 6/8/2025 11:52:27'!
descriptionOn: stream
	stream nextPutAll: nom bold.
	sections 
		do: [:uneSection | stream nextPutAll: uneSection bold]
		separatedBy: [stream nextPut: $/].
	stream lf.
	stream
		nextPutAll: 'Effectif : '; print: self effectif; lf;
		nextPutAll: 'Capacité : '; print: capacite; lf;
		nextPutAll: 'Filles : '; print: self filles; lf;
		nextPutAll: 'Garçons : '; print: self garcons; lf;
		nextPutAll: 'Elève(s) isolé(s) : '; print: self elevesSeuls ; lf;
		nextPutAll: 'Elève(s) avec trouble : ' ; print: self trouble; lf;
		nextPutAll: 'Moyenne disciplines principales : ';	nextPutAll: (self note printStringFractionDigits: 1); lf;
		nextPutAll: 'σ = '; nextPutAll: (self ecartType printStringFractionDigits: 2); lf.
	groupes ifNotEmpty: [
		stream nextPutAll: 'Options : ' under ;lf.
		groupes 
			do: [:groupe |stream tab; print: groupe]
			separatedBy: [stream lf] ]

	! !

!Classe methodsFor: 'printing' stamp: 'hlsf 6/8/2025 11:41:08'!
printOn: stream
	stream nextPutAll: nom.
	sections ifNotNil: [sections 
		do: [:uneSection | stream nextPutAll: uneSection]
		separatedBy: [stream nextPut: $/] ].
	stream
		nextPutAll: ' ('; 
		print: self effectif;
		nextPut: $/;
		print: capacite; 
		nextPutAll: ' f';
		print: self filles;
		nextPutAll: ' g';
		print: self garcons;
		nextPutAll: ' i';
		print: self elevesSeuls ;
		nextPutAll: ' t' ;
		print: self trouble;
		nextPutAll: ' s';
		nextPutAll: (self note printStringFractionDigits: 1);
		nextPut: $)
	! !

!Classe methodsFor: 'testing' stamp: 'hlsf 6/30/2024 10:32:04'!
estClasse
	^ true! !

!Classe methodsFor: 'testing' stamp: 'hlsf 6/7/2025 11:35:40'!
estCompatible: unEleve
	^ (unEleve estExcluDe: self) not 
		and: [(self estCursusCompatible: unEleve)
		and: [(self estLogeable: unEleve)
		and: [eleves noneSatisfy: [:chaqueEleve | 
			(chaqueEleve estSepareDe: unEleve) or: [unEleve estSepareDe: chaqueEleve] ] ] ] ]! !

!Classe methodsFor: 'testing' stamp: 'hlsf 6/25/2025 17:28:51'!
estCursusCompatible: unEleve
" vérifions qu'unEleve partage les mêmes section et groupe (d'option) que la classe"
	^ (sections includes: unEleve section) 
	and: [self estGroupeCompatible: unEleve option]! !

!Classe methodsFor: 'testing' stamp: 'hlsf 6/25/2025 18:42:45'!
estDR
	^ sections asArray = #(R1 R2)! !

!Classe methodsFor: 'testing' stamp: 'hlsf 6/25/2025 17:26:48'!
estGroupeCompatible: uneOption
	self subclassResponsibility ! !

!Classe methodsFor: 'testing' stamp: 'hlsf 6/7/2025 11:36:33'!
estLogeable: unEleve
	^ self sontLogeables: (Array with: unEleve)! !

!Classe methodsFor: 'testing' stamp: 'hlsf 6/8/2025 11:14:08'!
estPleine
	^ self effectif = capacite ! !

!Classe methodsFor: 'testing' stamp: 'hlsf 6/25/2025 18:43:01'!
estSAE
	^ sections asArray = #(MI R3)! !

!Classe methodsFor: 'testing' stamp: 'hlsf 6/6/2025 18:41:14'!
sontCompatibles: unEnsemble
"
	unEnsemble d'élèves satisfait-il les critères de ma classe et est-il logeable dans ma classe
"
	^ (unEnsemble allSatisfy: [:unEleve | self estCompatible: unEleve])
	and: [self sontLogeables: unEnsemble]! !

!Classe methodsFor: 'testing' stamp: 'hlsf 6/25/2025 17:11:22'!
sontLogeables: unEnsemble
" Avons nous la place pour placer les élèves de cet ensemble, en tenant compte de l'option de chacun "
	(self optionsDe: unEnsemble) keysAndValuesDo: [:option :effectif | 
		effectif <= (self placesGroupes: option) ifFalse: [^false] ].
	^ true! !

!Classe methodsFor: 'comparing' stamp: 'hlsf 7/26/2024 18:40:08'!
<= uneClasse
	^ nom size < uneClasse nom size 
	or: [nom <= uneClasse nom]! !

!Classe methodsFor: 'copying' stamp: 'hlsf 4/21/2025 11:58:56'!
postCopy
	eleves := SortedCollection new.
 ! !

!Classe methodsFor: 'helper' stamp: 'hlsf 6/6/2025 16:53:13'!
optionsDe: unEnsemble
	| lesOptions |
	" Dans unEnsemble, compter les effectifs pour chaque option présente "
	lesOptions := Dictionary new.
	unEnsemble do: [:unEleve | 
		lesOptions 
			at: unEleve option
			put: (lesOptions at: unEleve option ifAbsentPut: [0]) + 1].
	^ lesOptions ! !

!Classe class methodsFor: 'instance creation' stamp: 'hlsf 6/6/2025 15:59:47'!
importer: fichierCSV
	^ (NeoCSVReader on: fichierCSV readStream)
		separator: $; ;
		skipHeader ;
		recordClass: self ;
		addFields: #( #nom: #sections: );
		addIntegerField: #capacite: ;
		upToEnd! !

!Classe10e methodsFor: 'testing' stamp: 'hlsf 6/25/2025 17:26:48'!
estGroupeCompatible: uneOption
" uneOption : #L, #S, #LV, #AA, #SA ou #SAE "
	^ groupes anySatisfy: [:groupe | groupe option == uneOption ]! !

!Classe10e methodsFor: 'metric' stamp: 'hlsf 6/6/2025 16:03:32'!
capaciteGroupes
	" Total des effectifs dans les groupes "

	^ groupes inject: 0 into: [:sum :unGroupe | sum + unGroupe capacite]! !

!Classe10e methodsFor: 'accessing' stamp: 'hlsf 6/8/2025 12:14:33'!
enleverDeGroupe: unEleve
	groupes detect: [:unGroupe |unGroupe contient: unEleve]
		ifFound: [:sonGroupe | sonGroupe enleverEleve: unEleve]
		ifNone: [	" élève sans groupe, anormal "
			Transcript show: unEleve; show: ' sans groupe'; cr	].
! !

!Classe9e methodsFor: 'testing' stamp: 'hlsf 6/25/2025 17:51:25'!
estCursusCompatible: unEleve
	^ self estDR 
		ifTrue: [sections includes: unEleve section] "suffit pour vérifier, groupes inutiles à ce stade pour une DR" 
		ifFalse: [super estCursusCompatible: unEleve]! !

!Classe9e methodsFor: 'testing' stamp: 'hlsf 6/25/2025 17:26:48'!
estGroupeCompatible: uneOption
" uneOption : #SAE ou nil "
	uneOption ifNil: [ ^ true]. " Pas de contrainte d'option pour cet élève "
	^ groupes 
		ifEmpty:  [false] " classe sans groupe d'option alors que l'élève en a une "
		ifNotEmpty: [groupes first option == uneOption ]
! !

!Classe9e methodsFor: 'testing' stamp: 'hlsf 6/25/2025 18:03:03'!
sectionsDe: unEnsemble
	^ self estDR 
		ifTrue: [" Les groupes sont les deux sections de la classe DR "
			| lesSections |
			lesSections := Dictionary new.
			unEnsemble do: [:unEleve | 
				lesSections 
					at: unEleve section 
					put: (lesSections at: unEleve section ifAbsentPut: [0]) + 1].
			lesSections ] 
		ifFalse: [self error: nom, ' n''est pas une classe DR (groupe de section impossible)']! !

!Classe9e methodsFor: 'testing' stamp: 'hlsf 6/25/2025 18:33:20'!
sontLogeables: unEnsemble
	self estDR
		ifTrue: [
			(self sectionsDe: unEnsemble) keysAndValuesDo: [:section :effectif | 
				effectif <= (self placesGroupes: section) ifFalse: [^false] ].
			^ true]
		ifFalse: [^ super sontLogeables: unEnsemble ]! !

!Classe9e methodsFor: 'metric' stamp: 'hlsf 6/25/2025 18:44:01'!
placesGroupes: optionOuSection
	^ self estDR 
		ifTrue: [super placesGroupes: optionOuSection]
		ifFalse: [
			optionOuSection isNil 
				ifTrue:  [capacite - self effectif]
				ifFalse: [	optionOuSection = #SAE ifFalse: [self error: 'Option SAE attentdue'].
					super placesGroupes: #SAE ] ]! !

!Classe9e methodsFor: 'accessing' stamp: 'hlsf 6/25/2025 18:45:17'!
ajouterDansUnGroupe: unEleve 
	self estDR
		ifTrue:  [ | groupesCompatibles | 
			groupesCompatibles := groupes select: [:groupe | 
				groupe section = unEleve section "***" and: [groupe estPlein not] ].
			groupesCompatibles ifEmpty: [self error: 'Aucune place dans un groupe'].
			groupesCompatibles shuffled first ajouterEleve: unEleve ]
		ifFalse: [
			unEleve option ifNotNil: [
			unEleve option = #SAE ifFalse: [self error: 'Option SAE attendue'].
			groupes first ajouterEleve: unEleve] ]! !

!Classe9e methodsFor: 'accessing' stamp: 'hlsf 6/8/2025 12:13:16'!
enleverDeGroupe: unEleve
	groupes detect: [:unGroupe |unGroupe contient: unEleve]
		ifFound: [:sonGroupe | sonGroupe enleverEleve: unEleve]
		ifNone: [	" élève hors SAE, rien à faire "].
! !

!Eleve methodsFor: 'accessing' stamp: 'hlsf 4/18/2025 15:21:01'!
ancienneClasse
	^ ancienneClasse! !

!Eleve methodsFor: 'accessing' stamp: 'hlsf 6/18/2025 11:32:54'!
ancienneClasse: anObject
"
	Pour les élèves venant de l'école primaire, l'ancien groupe 	est codé 8P.Ecole.Maitre.
	Seule l'école nous interesse alors
"
	anObject ifNil: [^ self].
	ancienneClasse := (anObject notNil and: [anObject beginsWith: '8P.']) 
		ifTrue: [	(anObject substringsSeparatedBy: $.) second]
		ifFalse: [anObject]! !

!Eleve methodsFor: 'accessing' stamp: 'hlsf 6/29/2024 09:42:24'!
classeAttribuee
	"Answer the value of classeAttribuée"

	^ classeAttribuee! !

!Eleve methodsFor: 'accessing' stamp: 'hlsf 6/18/2025 11:33:18'!
classeAttribuee: uneClasse
	" M'attribuer une classe, si j'étais déjà dans une classe, me supprimer de cette classe "
	uneClasse ifNil: [^ self].
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

!Eleve methodsFor: 'accessing' stamp: 'hlsf 6/18/2025 11:33:23'!
classesExclues: anObject
	"Set the value of classeExclues"
	anObject ifNil: [^ self].
	classesExclues := anObject! !

!Eleve methodsFor: 'accessing' stamp: 'hlsf 6/21/2025 12:17:06'!
effacerClasseAttribuee
	classeAttribuee := nil! !

!Eleve methodsFor: 'accessing' stamp: 'hlsf 6/21/2025 12:16:44'!
effacerMettreAvec
	mettreAvec := nil! !

!Eleve methodsFor: 'accessing' stamp: 'hlsf 6/21/2025 12:19:45'!
effacerSeparerDe
	separerDe := nil! !

!Eleve methodsFor: 'accessing' stamp: 'hlsf 7/26/2024 23:17:01'!
email
	"Answer the value of email"

	^ email! !

!Eleve methodsFor: 'accessing' stamp: 'hlsf 6/18/2025 11:33:29'!
email: anObject
	"Set the value of email"
	anObject ifNil: [^ self].
	email := anObject! !

!Eleve methodsFor: 'accessing' stamp: 'hlsf 6/28/2024 17:15:44'!
mettreAvec
	"Answer the value of mettreAvec"

	^ mettreAvec! !

!Eleve methodsFor: 'accessing' stamp: 'hlsf 6/18/2025 11:33:33'!
mettreAvec: anObject
	"Set the value of mettreAvec"
	anObject ifNil: [^ self].
	mettreAvec := anObject! !

!Eleve methodsFor: 'accessing' stamp: 'hlsf 6/28/2024 17:15:44'!
nom
	"Answer the value of nom"

	^ nom! !

!Eleve methodsFor: 'accessing' stamp: 'hlsf 6/18/2025 11:34:21'!
nom: anObject
	"Set the value of nom"
	anObject ifNil: [^ self].
	nom := anObject asLowercase asUnaccented asUppercase ! !

!Eleve methodsFor: 'accessing' stamp: 'hlsf 4/19/2025 13:13:22'!
note
	^ note! !

!Eleve methodsFor: 'accessing' stamp: 'hlsf 6/25/2025 19:11:33'!
note: aStringOrNumber
	aStringOrNumber ifNil: [^ self].
	note := aStringOrNumber isNumber 
		ifTrue: [aStringOrNumber ]
		ifFalse: [ [aStringOrNumber asNumber] on: Error  do: nil ]	! !

!Eleve methodsFor: 'accessing' stamp: 'hlsf 4/18/2025 23:58:54'!
option
	"Answer the value of option"

	^ option! !

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

!Eleve methodsFor: 'accessing' stamp: 'hlsf 6/18/2025 11:34:32'!
prenom: anObject
	"Set the value of prénom"
	anObject ifNil: [^ self].
	prenom := anObject  asLowercase asUnaccented asUppercase ! !

!Eleve methodsFor: 'accessing' stamp: 'hlsf 6/5/2025 14:28:44'!
section
	"Answer the value of section"

	^ section! !

!Eleve methodsFor: 'accessing' stamp: 'hlsf 6/5/2025 23:29:34'!
section: uneOption
	option := uneOption asUppercase asSymbol.

	(#(S LV L) includes: option ) ifTrue: [
		section := #LS.
		^ self].
	(#(SA AA) includes: option ) ifTrue: [
		section := #LC.
		^ self].
	option == #CT ifTrue: [
		section := #CT.
		^ self].
	option == #SAE ifTrue: [
		section := #MI.
		^ self].
	Transcript show: 'Option ', option, ' non conforme'; cr! !

!Eleve methodsFor: 'accessing' stamp: 'hlsf 6/5/2025 14:27:22'!
sections: anObject
	"Set the value of section, a collection of symbol"
	
	section := anObject virguleSeparer collect: [:uneSection |  uneSection asUppercase asSymbol]! !

!Eleve methodsFor: 'accessing' stamp: 'hlsf 6/29/2024 09:43:33'!
separerDe
	"Answer the value of séparerDe"

	^ separerDe! !

!Eleve methodsFor: 'accessing' stamp: 'hlsf 6/18/2025 11:34:39'!
separerDe: anObject
	"Set the value of séparerDe"
	anObject ifNil: [^ self].
	separerDe := anObject! !

!Eleve methodsFor: 'accessing' stamp: 'hlsf 6/28/2024 17:15:44'!
sexe
	"Answer the value of sexe"

	^ sexe! !

!Eleve methodsFor: 'accessing' stamp: 'hlsf 6/28/2024 17:15:44'!
sexe: anObject
	"Set the value of sexe"

	sexe := anObject! !

!Eleve methodsFor: 'accessing' stamp: 'hlsf 6/2/2025 15:10:09'!
statut: smogStatut
	self subclassResponsibility ! !

!Eleve methodsFor: 'accessing' stamp: 'hlsf 5/14/2025 08:23:07'!
trouble
	^ trouble! !

!Eleve methodsFor: 'accessing' stamp: 'hlsf 6/18/2025 11:35:01'!
trouble: anObject
	" Faire un OU logique lorsqu'une valeur précédente fut déjà attribuée "
	anObject ifNil: [^ self].
	trouble := trouble ifNotNil: [trouble | anObject] ifNil: [anObject]
	! !

!Eleve methodsFor: 'printing' stamp: 'hlsf 6/25/2025 21:17:25'!
descriptionOn: str
	str nextPutAll: nom bold; space; nextPutAll: prenom bold; space.
	str nextPut: (self estFille ifTrue: [$♀] ifFalse: [$♂]); lf.
	str nextPutAll: 'Provenance : '; nextPutAll: (ancienneClasse ifNil: ['inconnue']); lf.
	self avecTrouble ifTrue: [str nextPutAll: 'Dyslexique'; lf].
	str nextPutAll: 'Moyenne : '; print: note; lf.
	str nextPutAll: 'Section : '; print: section.

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

!Eleve methodsFor: 'printing' stamp: 'hlsf 6/25/2025 18:47:30'!
printOn: aStream
	aStream nextPutAll: (nom ifNil: ['XXX']);
		nextPut: $.;
		nextPutAll: (prenom ifNil: ['YYY']).
	option ifNotNil: [
		aStream nextPut: $/;
			nextPutAll: option].
	(classeAttribuee notNil and: [classeAttribuee estDR]) ifTrue: [
		aStream nextPut: $/;
			nextPutAll: section]! !

!Eleve methodsFor: 'testing' stamp: 'hlsf 5/14/2025 08:24:39'!
avecTrouble
	^ trouble = true! !

!Eleve methodsFor: 'testing' stamp: 'hlsf 6/6/2025 11:58:04'!
est9e
	^ false! !

!Eleve methodsFor: 'testing' stamp: 'hlsf 5/14/2025 08:24:39'!
estContraint
" Existe-t-il une contrainte posée me concernant ? "
	^ self avecTrouble 
	or: [ classesExclues notNil
	or: [ separerDe notNil
	or: [ mettreAvec notNil
	or: [ mobile not ] ] ] ]! !

!Eleve methodsFor: 'testing' stamp: 'hlsf 6/7/2025 11:32:29'!
estExcluDe: uneClasse
"
	Suis-je exclu de uneClasse ?
"
	^ classesExclues 
		ifNil: [ " suis-je affecté à une autre classe auquel cas, je suis exclu "
			classeAttribuee notNil ]
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

!Eleve methodsFor: 'testing' stamp: 'hlsf 6/5/2025 14:27:22'!
estSection: uneSection
	^ section includes: uneSection! !

!Eleve methodsFor: 'testing' stamp: 'hlsf 6/30/2024 13:42:57'!
estSepareDe: unEleve
	^ separerDe 
		ifNil: [ false ]
		ifNotNil: [ separerDe includes: unEleve ]! !

!Eleve methodsFor: 'testing' stamp: 'hlsf 6/29/2024 14:59:23'!
estValide
	^ (prenom isNil or: [nom isNil]) not! !

!Eleve methodsFor: 'testing' stamp: 'hlsf 6/19/2025 15:31:09'!
match: unNom
	| patronyme patronymeCherche|
	patronyme := self patronyme.
	patronyme := patronyme substringsSeparatedBy: Character space.
	patronymeCherche := unNom asLowercase asUnaccented asUppercase 
		substringsSeparatedBy: Character space.
	^ patronyme closeToAllOf: patronymeCherche
	"^ patronyme includesAllOf: patronymeCherche"! !

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

!Eleve methodsFor: 'initialization' stamp: 'hlsf 6/5/2025 23:23:40'!
initialize
	super initialize .
	note := 4.
	mobile := true.! !

!Eleve methodsFor: 'copying' stamp: 'hlsf 4/21/2025 13:14:12'!
postCopy
	classeAttribuee := classeAttribuee copy.
	classesExclues := classesExclues copy.
	separerDe := separerDe copy.
	mettreAvec := mettreAvec copy! !

!Eleve class methodsFor: 'instance creation' stamp: 'hlsf 6/5/2025 14:32:07'!
importer: fichierCSV
" Importer données extraites de SMOG, dans cet ordre, avec les champs :
Nom, Prénom, Sexe, Statut (ou Pronostique au cas où statut non stablilisé), AncienGroupe 
Voir si ajout du champ Remarque pour disposer de la secion pour élève au Statut=SAE, normalement inutile 
"
	| eleves |
	eleves := (NeoCSVReader on:  fichierCSV readStream)
		separator: $; ;
		skipHeader ;
		recordClass: self ;
		addFields:  #(nom: prenom: );
		addField: #sexe: converter: [:sexe | sexe first];
		addFields: #(section: ancienneClasse:);
		upToEnd.
	^ (eleves select: [:record | record estValide ]) asOrderedCollection! !

!Eleve class methodsFor: 'instance creation' stamp: 'hlsf 6/18/2025 11:26:24'!
importerContraintesDoyen: fichierCSV
" Importation des données issues des données doyens (Confection classe - situations particulières) pour 10e et 11e "
	| eleves |
	eleves := (NeoCSVReader on: fichierCSV readStream)
		separator: $; ;
		skipHeader ;
		recordClass: self ;
		addFields:  #(nom: prenom:);
		addIgnoredFields: 4 ;		
		" PAI "
		addField: #trouble: converter: [:valeur | valeur ifNil: [false] ifNotNil: [valeur first asLowercase = $o] ]; 
		addIgnoredField ;
		" Aménagements "
		addField: #trouble: converter: [:valeur | valeur ifNil: [false] ifNotNil: [valeur first asLowercase = $o] ]; 
		addIgnoredFields: 2;
		" Contraintes d'affectation en classe "
		addFields: #(mettreAvec: separerDe: classeAttribuee: classesExclues:);
		addIgnoredFields: 10;
		upToEnd.
	^ (eleves select: [:record | record estValide ]) asOrderedCollection! !

!Eleve9e methodsFor: 'accessing' stamp: 'hlsf 6/25/2025 19:43:05'!
note: aStringOrNumber
	aStringOrNumber ifNil: [^ self].
	note := aStringOrNumber isNumber 
		ifTrue: [aStringOrNumber ]
		ifFalse: [
			 [aStringOrNumber asNumber] on: Error  do: 12]! !

!Eleve9e methodsFor: 'accessing' stamp: 'hlsf 6/5/2025 14:39:32'!
section: uneSection
	section := uneSection asUppercase asSymbol.
	section == #SAE ifTrue: [ " C'est une option, la seule possible pour les 9e "
		section := #MI.
		option := #SAE]! !

!Eleve9e methodsFor: 'testing' stamp: 'hlsf 6/6/2025 11:58:16'!
est9e
	^ true! !

!Eleve9e methodsFor: 'initialization' stamp: 'hlsf 6/25/2025 19:26:19'!
initialize
	super initialize.
	note := 12! !

!Eleve9e class methodsFor: 'instance creation' stamp: 'hlsf 6/25/2025 19:14:31'!
importerContraintesEcole: fichierCSV
" Importation des données issues du relevé d'information en école primaire "
	| eleves |
	eleves := (NeoCSVReader on: fichierCSV readStream)
		separator: $; ;
		skipHeader ;
		recordClass: self ;
		addField: #ancienneClasse:;
		addIgnoredFields: 2;
		addFields:  #( nom: prenom:);
		addIgnoredFields: 3 ;
		addField: #note:;
		addIgnoredFields: 4 ;
		addField: #trouble: converter: [:dys | dys ifNil: [false] ifNotNil: [dys = '1'] ];
		addIgnoredFields: 3 ;		
		addFields: #(separerDe: mettreAvec:);
		addIgnoredField;
		upToEnd.
	^ (eleves select: [:record | record estValide ]) asOrderedCollection! !

!EleveNote methodsFor: 'accessing' stamp: 'hlsf 6/18/2025 11:45:47'!
note: anObject
	anObject ifNil: [^ note := 4].
	note := anObject isNumber 
		ifTrue: [anObject ]
		ifFalse: [ [anObject asNumber] on: Error  do: 4 ]	! !

!EleveNote methodsFor: 'accessing' stamp: 'hlsf 6/3/2025 15:44:15'!
patronyme
	"Answer the value of patronyme"

	^ patronyme! !

!EleveNote methodsFor: 'accessing' stamp: 'hlsf 6/3/2025 16:01:51'!
patronyme: anObject
	"Set the value of patronyme"

	patronyme := anObject asLowercase asUnaccented asUppercase ! !

!EleveNote methodsFor: 'printing' stamp: 'hlsf 6/3/2025 16:00:16'!
printOn: aStream
	aStream nextPutAll: (patronyme ifNil: ['XXX']);
		nextPut: Character space;
		nextPutAll: note printString! !

!EleveNote methodsFor: 'as yet unclassified' stamp: 'hlsf 6/18/2025 11:44:42'!
initialize
	super initialize.
	" Pas de note de 4 par defaut comme dans le parent, nous voulons l'importer "
	note := nil.! !

!EleveNote class methodsFor: 'as yet unclassified' stamp: 'hlsf 6/25/2025 19:14:36'!
importerNotes: fichierCSV
"
	Importation des notes élèves depuis un fichier GECO comprenant les champs utiles suivants :
	Patronyme (3e champs, C), Moyenne générale (7e, G), Moyenne disciplines (13e M)
"
	| notes |
	notes := (NeoCSVReader on: fichierCSV readStream )
		separator: $; ;
		skipHeader ;
		recordClass: self;
		addIgnoredFields: 2;
		addField: #patronyme:;
		addIgnoredFields: 3;
		addField: #note: ;
		upToEnd.
	^ notes! !

!GroupeOption methodsFor: 'accessing' stamp: 'hlsf 6/6/2025 11:51:49'!
ajouterEleve: unEleve
"
	Ajouter un élève à mon groupe
"
	eleves add: unEleve! !

!GroupeOption methodsFor: 'accessing' stamp: 'hlsf 6/6/2025 16:03:42'!
capacite
	^ capacite! !

!GroupeOption methodsFor: 'accessing' stamp: 'hlsf 6/6/2025 16:03:47'!
capacite: anObject
	capacite := anObject! !

!GroupeOption methodsFor: 'accessing' stamp: 'hlsf 4/18/2025 12:43:54'!
classe
	"Answer the value of classe"

	^ classe! !

!GroupeOption methodsFor: 'accessing' stamp: 'hlsf 4/19/2025 12:35:15'!
classe: anObject
	"Set the value of classe"

	classe := anObject isString ifTrue: [anObject withBlanksTrimmed ] ifFalse: [anObject ]! !

!GroupeOption methodsFor: 'accessing' stamp: 'hlsf 6/6/2025 16:13:20'!
effectif
	^ eleves size! !

!GroupeOption methodsFor: 'accessing' stamp: 'hlsf 6/6/2025 11:52:35'!
enleverEleve: unEleve
	eleves remove: unEleve ! !

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

!GroupeOption methodsFor: 'accessing' stamp: 'hlsf 6/7/2025 11:45:54'!
places
	^ capacite - self effectif ! !

!GroupeOption methodsFor: 'accessing' stamp: 'hlsf 6/25/2025 18:28:54'!
section
	" for code semantic"

	^ option! !

!GroupeOption methodsFor: 'printing' stamp: 'hlsf 6/8/2025 11:33:11'!
printOn: stream
	stream 	nextPutAll: 'groupe ';
		print: groupe; nextPut: $/; nextPutAll: option;
		nextPut: Character space.
	stream 
		nextPut: $(; print: self effectif; nextPut: $/; print: capacite; nextPut: $)
	
	! !

!GroupeOption methodsFor: 'initialization' stamp: 'hlsf 6/6/2025 11:48:42'!
initialize
	eleves := OrderedCollection new! !

!GroupeOption methodsFor: 'testing' stamp: 'hlsf 6/6/2025 11:55:27'!
contient: unEleve
	^ eleves includes: unEleve! !

!GroupeOption methodsFor: 'testing' stamp: 'hlsf 6/6/2025 16:13:20'!
estCompatible: unEleve
	^ self effectif < capacite and: [option == unEleve option]! !

!GroupeOption methodsFor: 'testing' stamp: 'hlsf 6/7/2025 11:44:17'!
estPlein
	^ self effectif = capacite ! !

!GroupeOption class methodsFor: 'instance creation' stamp: 'hlsf 6/6/2025 15:59:47'!
importer: fichierCSV
	^ (NeoCSVReader on: fichierCSV readStream)
		separator: $; ;
		skipHeader ;
		recordClass: self ;
		addFields: #(classe: option: );
		addIntegerField: #groupe: ;
		addIntegerField: #capacite: ;
		upToEnd! !

!Volee methodsFor: 'accessing' stamp: 'hlsf 6/19/2025 14:52:17'!
filtre
	^ filtre
	! !

!Volee methodsFor: 'accessing' stamp: 'hlsf 6/19/2025 14:52:25'!
filtre: array
	filtre := array
	! !

!Volee methodsFor: 'accessing' stamp: 'hlsf 6/25/2025 18:15:01'!
filtres

	self subclassResponsibility! !

!Volee methodsFor: 'affecter' stamp: 'hlsf 6/19/2025 14:51:22'!
calculer
	" Calculer une nouvelle volée "
	self preparerDonnees;
		ventilerElevesSAE;
		ventilerElevesAvecTrouble ;
		ventilerElevesEnsemble ;
		ventilerSelonSexe.
				
	self verifierScore.
! !

!Volee methodsFor: 'affecter' stamp: 'hlsf 6/19/2025 14:51:29'!
preparerDonnees
	eleves ifNil: [self importerEtInitialiser].
	" Nettoyage pour calculer une nouvelle volée "
	eleves do: [:eleve | 
		eleve estMobile ifTrue: [
			eleve classeAttribuee ifNotNil: [:classe | classe enleverEleve: eleve]] ].
	self	collecterElevesEnsemble! !

!Volee methodsFor: 'affecter' stamp: 'hlsf 6/25/2025 21:40:34'!
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
			ifNone: [
				Transcript 
					show: 'Elève avec trouble : ';
					show: unEleve; 
					show: ' pas de classe compatible avec '; 
					show: ensemble; cr] ]
		! !

!Volee methodsFor: 'affecter' stamp: 'hlsf 6/19/2025 14:52:01'!
ventilerElevesEnsemble
"
	Ventiler les groupes d'élèves ensemble dans les classes avec place.
"
	elevesEnsemble copy do: [:unGroupe |
		self classesAvecPlace shuffled
			detect: [:uneClasse | uneClasse sontCompatibles: unGroupe	]
			ifFound: [:saClasse | 
				saClasse ajouterEleves: unGroupe.
				elevesEnsemble remove: unGroupe]
			ifNone: [Transcript show: unGroupe ; show: ' pas de place pour ce groupe'; cr]
			]! !

!Volee methodsFor: 'affecter' stamp: 'hlsf 6/21/2025 13:00:28'!
ventilerElevesSAE
"
	Ventiler les élèves dans la classe SAE
"
	self elevesSAE shuffled do: [:unEleve | | ensemble |
		ensemble := self mettreAvec: unEleve.
		self classesAvecPlace
			detect: [:uneClasse | uneClasse sontCompatibles: ensemble 	]
			ifFound: [:saClasse | 
				saClasse ajouterEleves: ensemble.
				ensemble size > 1 ifTrue: [elevesEnsemble remove: ensemble ] ]
			ifNone: [	Transcript show: unEleve; show: ' pas de classe SAE '; cr] ]
		! !

!Volee methodsFor: 'affecter' stamp: 'hlsf 6/19/2025 14:52:11'!
ventilerSelonSexe
"
	Ventiler tous les élèves restant en tenant compte du sexe
"
	self elevesSansClasse shuffled do: [:unEleve | | sonSexe |
		sonSexe := unEleve estFille ifTrue: [#filles] ifFalse: [#garcons].
		(self classesAvecPlace shuffled sort: [:cl1 :cl2 | (cl1 perform: sonSexe) < (cl2 perform: sonSexe) ]) 
			detect: [:uneClasse | uneClasse estCompatible: unEleve	]
			ifFound: [:saClasse | 
				saClasse ajouterEleve: unEleve]
			ifNone: [Transcript show: unEleve; show: ' pas de classe compatible pour '; show: sonSexe ; cr]
			]
		! !

!Volee methodsFor: 'classes' stamp: 'hlsf 6/19/2025 14:49:43'!
capaciteClasses
	^ classes inject: 0 into: [:capcite :uneClasse | capcite + uneClasse capacite]! !

!Volee methodsFor: 'classes' stamp: 'hlsf 6/19/2025 14:49:53'!
classes
	^ classes! !

!Volee methodsFor: 'classes' stamp: 'hlsf 6/19/2025 14:49:59'!
classesAvecPlace
	^ classes select: [:each | each estPleine not]! !

!Volee methodsFor: 'classes' stamp: 'hlsf 6/21/2025 13:25:41'!
trouverClasse: nom
	^ classes 
		detect: [:uneClasse | uneClasse nom includesSubString: nom ]
		ifNone: [	('Classe "', nom ,'" inexistante') print.
			nil]! !

!Volee methodsFor: 'eleves' stamp: 'hlsf 6/21/2025 12:09:26'!
collecterElevesEnsemble
" Collection d'élèves à mettre ensemble "
	" Les ensemble avec l'élève bénéficiaire "
	elevesEnsemble := (eleves 
		select: [:each | each mettreAvec notNil] 
		thenCollect:[:unEleve | unEleve mettreAvec asSet add: unEleve; yourself]) asSet.
	" Fusionner les ensembles s'englobant "
	elevesEnsemble do: [:unGroupe | 
		elevesEnsemble do: [:anotherGroup |
			unGroupe == anotherGroup ifFalse: [
				(unGroupe includesAnyOf: anotherGroup) ifTrue: [
					unGroupe addAll: anotherGroup] ] ] ].
	" Elimine les doublons "
	elevesEnsemble := elevesEnsemble collect: [:each | each asSet]! !

!Volee methodsFor: 'eleves' stamp: 'hlsf 6/19/2025 14:50:17'!
elevesAvecTrouble
" Eleves avec troubles, pas encore placés dans une classe " 
	^ self elevesSansClasse select: [:each | each avecTrouble]! !

!Volee methodsFor: 'eleves' stamp: 'hlsf 6/19/2025 14:50:29'!
elevesDansClasses

	^ classes 
		inject: OrderedCollection new 
		into: [:elevesDansClasses :classe | 
			elevesDansClasses addAll: classe eleves; yourself]! !

!Volee methodsFor: 'eleves' stamp: 'hlsf 6/19/2025 14:50:35'!
elevesSAE
" Eleves SAE " 
	^ (eleves select: [:each | each option = #SAE]) intersection: self elevesSansClasse ! !

!Volee methodsFor: 'eleves' stamp: 'hlsf 6/19/2025 14:50:40'!
elevesSansClasse
	^ eleves difference: self elevesDansClasses! !

!Volee methodsFor: 'eleves' stamp: 'hlsf 6/19/2025 14:50:44'!
filles
	^ classes sum: [:unClasse | unClasse filles]! !

!Volee methodsFor: 'eleves' stamp: 'hlsf 6/19/2025 14:50:48'!
garcons
	^ classes sum: [:unClasse | unClasse garcons ]! !

!Volee methodsFor: 'eleves' stamp: 'hlsf 6/19/2025 14:50:55'!
mettreAvec: unEleve
"
	unEleve doit-il est mis avec d'autres élèves ?
	Si oui retourner cet ensemble d'élève sinon l'ensemble avec ce seul élève
"
	^ elevesEnsemble 
		detect: [:ensemble | ensemble includes: unEleve ] 
		ifNone: [Array with: unEleve ]! !

!Volee methodsFor: 'eleves' stamp: 'hlsf 6/19/2025 14:51:07'!
trouverEleve: unPatronyme
	^ self trouverEleve: unPatronyme dans: eleves! !

!Volee methodsFor: 'eleves' stamp: 'hlsf 6/19/2025 14:51:07'!
trouverEleve: unPatronyme dans: listeEleves
" 
	Trouver l'élève par son patronyme dans listeEleves
"
	^ listeEleves 
		detect: [:unEleve | unEleve match:  unPatronyme ] 
		ifNone: [nil]! !

!Volee methodsFor: 'eleves' stamp: 'hlsf 6/19/2025 14:51:11'!
trouverProcheEleve: unPatronyme
	^ eleves 
		detect: [:unEleve | unEleve procheDe:  unPatronyme ] 
		ifNone: [nil]! !

!Volee methodsFor: 'fichiers' stamp: 'hlsf 6/19/2025 15:01:06'!
csvClasses: fichierClasses
	csvClasses := fichierClasses! !

!Volee methodsFor: 'fichiers' stamp: 'hlsf 6/19/2025 15:02:18'!
csvContraintesDoyen: fichierContraintes
	csvContraintesDoyen := fichierContraintes ! !

!Volee methodsFor: 'fichiers' stamp: 'hlsf 6/19/2025 15:02:22'!
csvEleves: fichierEleves
	csvEleves := fichierEleves ! !

!Volee methodsFor: 'fichiers' stamp: 'hlsf 6/19/2025 15:02:27'!
csvGroupes: fichierGroupes
	csvGroupes := fichierGroupes! !

!Volee methodsFor: 'import/export' stamp: 'hlsf 6/19/2025 14:55:48'!
exportPath
	self subclassResponsibility ! !

!Volee methodsFor: 'import/export' stamp: 'hlsf 6/29/2025 22:50:19'!
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
			separator: $; ;
			fieldWriter: #raw;
			nextPut: #(NOM PRENOM SEXE PROFIL GROUPE NOTE).
		uneClasse eleves do: [:unEleve | writer nextPut: {unEleve nom . unEleve prenom . 
			unEleve sexe. unEleve option. uneClasse groupeDe: unEleve. unEleve note} ].
		stream close].
	self inform: 'Volée sauvegardée dans le dossier 
', path pathName ! !

!Volee methodsFor: 'import/export' stamp: 'hlsf 6/19/2025 14:57:12'!
filtrerSelon: unFiltre
" Retirer les classes et les élèves qui ne sont pas dans la collection filtreSections "
	classes := classes select: [:uneClasse |  
		unFiltre includesAnyOf: uneClasse sections].
	eleves := eleves select: [:unEleve | 
		unFiltre includes: unEleve section]! !

!Volee methodsFor: 'import/export' stamp: 'hlsf 6/19/2025 14:57:17'!
importPath
	^ DirectoryEntry projectBaseDirectory / 'import'! !

!Volee methodsFor: 'import/export' stamp: 'hlsf 6/25/2025 08:09:59'!
importerGroupes
	| groupes |
	groupes := GroupeOption importer: self importPath // csvGroupes.
	groupes do: [:unGroupe | 
		(self trouverClasse: unGroupe classe) 
			ifNil: [self error: 'Classe non trouvée pour ', unGroupe printString, ', indique ', unGroupe classe] 
			ifNotNil: [:uneClasse | uneClasse ajouterGroupe: unGroupe] ]! !

!Volee methodsFor: 'import/export' stamp: 'hlsf 6/25/2025 19:40:00'!
insererContraintesDoyenDe: infoEleve dans: unEleve
	unEleve 
		classeAttribuee: infoEleve classeAttribuee ;
		classesExclues: infoEleve classesExclues ;
		trouble: infoEleve avecTrouble;
		mettreAvec: infoEleve mettreAvec ;
		separerDe: infoEleve separerDe! !

!Volee methodsFor: 'import/export' stamp: 'hlsf 6/25/2025 19:40:33'!
insererContraintesDoyens
	| contraintesEleves |
	csvContraintesDoyen ifNil: [^ self].
	self assert: classes notNil description: 'Importer classes d''abord'.
	self assert: eleves notNil description: 'Importer eleves de SMOG d''abord'.
	contraintesEleves := self eleveClass importerContraintesDoyen: self importPath // csvContraintesDoyen.
	" insertions des contraintes "
	eleves do: [:unEleve | 
		(self trouverEleve: unEleve patronyme dans: contraintesEleves)
			ifNotNil:  [:infoEleve |	self insererContraintesDoyenDe: infoEleve dans: unEleve ]
			ifNil: [Transcript 
					show: 'Pas de contrainte pour ';
					show: unEleve; cr] ]! !

!Volee methodsFor: 'initialization' stamp: 'hlsf 6/21/2025 10:10:44'!
importer
	self subclassResponsibility ! !

!Volee methodsFor: 'initialization' stamp: 'hlsf 6/21/2025 10:12:05'!
importerEtInitialiser
	self importer.
	self initialiserDonnees.! !

!Volee methodsFor: 'initialization' stamp: 'hlsf 6/21/2025 12:24:56'!
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
			autresEleves	 
				ifEmpty: [unEleve effacerMettreAvec]
				ifNotEmpty: [unEleve mettreAvec: autresEleves]
			]! !

!Volee methodsFor: 'initialization' stamp: 'hlsf 6/21/2025 12:20:30'!
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
			autresEleves	 
				ifEmpty: [unEleve effacerSeparerDe]
				ifNotEmpty: [unEleve separerDe: autresEleves]
			]! !

!Volee methodsFor: 'initialization' stamp: 'hlsf 6/21/2025 13:26:40'!
initPreattribuerClasses
" Des élèves se voient préattribués des classes
  Remplacer chaque nom de classe par leur objet ad-hoc et attribuer la classe à l'élève"
	eleves 
		select: [:each | each classeAttribuee notNil] 
		thenDo: [:unEleve | | classe |
			classe := self trouverClasse: unEleve classeAttribuee.
			classe 
				ifNotNil:  [classe ajouterEleve: unEleve]
				ifNil: [unEleve effacerClasseAttribuee].
			Transcript show: unEleve; 
				show: ' à placer en classe '; 
				show: classe; cr]! !

!Volee methodsFor: 'initialization' stamp: 'hlsf 6/19/2025 14:52:52'!
initPreexclureClasses
" Des élèves se voient préexcluent de certaines classes
 Remplacer chaque nom de classe par leur objet ad-hoc. "
	eleves 
		select: [:each | each classesExclues notNil] 
		thenDo: [:unEleve | | sesClassesExclues |
			sesClassesExclues := unEleve classesExclues virguleSeparer collect: [:unNom | self trouverClasse: unNom ].
			unEleve classesExclues: sesClassesExclues.
			Transcript show: unEleve; 
				show: ' est à exclure des classes '; 
				show: sesClassesExclues; cr ]! !

!Volee methodsFor: 'initialization' stamp: 'hlsf 6/21/2025 10:11:42'!
initialiserDonnees
"	Initialiser les objets avec les données 	"
	self	initPreattribuerClasses;
		initPreexclureClasses;
		initElevesEnsemble ;
		initElevesSepares	! !

!Volee methodsFor: 'initialization' stamp: 'hlsf 6/19/2025 14:53:08'!
initialize
	filtre := self filtres first! !

!Volee methodsFor: 'initialization' stamp: 'hlsf 6/19/2025 14:53:14'!
reset
	voleePreferee := nil.
	eleves := nil
	! !

!Volee methodsFor: 'meta' stamp: 'hlsf 6/19/2025 15:00:22'!
classeClass
	self subclassResponsibility ! !

!Volee methodsFor: 'meta' stamp: 'hlsf 6/19/2025 15:00:29'!
eleveClass
	self subclassResponsibility ! !

!Volee methodsFor: 'metriques' stamp: 'hlsf 6/19/2025 14:53:21'!
ecartType
	| scoreVolee |
	scoreVolee := self note.
	^ [((classes sum: [:uneClasse | (scoreVolee - uneClasse note) squared]) / self nbClasses ) sqrt] 
		on: Error 
		do: 0! !

!Volee methodsFor: 'metriques' stamp: 'hlsf 6/21/2025 10:21:15'!
ecartsFilleGarcon
" Moyenne des écarts garcons - filles, normalisé dans [0 ; 1] "
	^ (classes sum: [:uneClasse | uneClasse ecartFilleGarcon * 4 ]) / classes size! !

!Volee methodsFor: 'metriques' stamp: 'hlsf 6/19/2025 14:53:30'!
elevesSeuls
	^ classes sum: [:uneClasse | uneClasse elevesSeuls ]! !

!Volee methodsFor: 'metriques' stamp: 'hlsf 6/19/2025 14:53:36'!
nbClasses
	^ classes 
		ifNotNil:  [classes size]
		ifNil: [0]! !

!Volee methodsFor: 'metriques' stamp: 'hlsf 6/19/2025 14:53:44'!
nbEleves
	^ eleves 
		ifNotNil:  [eleves size]
		ifNil: [0]! !

!Volee methodsFor: 'metriques' stamp: 'hlsf 6/19/2025 14:54:04'!
note
" La note moyenne de toutes les classes pour MA, FR ALL "
	^ [(classes sum: [:uneClasse | uneClasse note]) / self nbClasses ] on: Error do: 0! !

!Volee methodsFor: 'metriques' stamp: 'hlsf 6/19/2025 14:53:59'!
score
" Score en pourcent, le plus haut le meilleur "
	^ (100 - (self scoring * 100)) printStringFractionDigits: 1! !

!Volee methodsFor: 'metriques' stamp: 'hlsf 6/26/2025 11:48:02'!
scoring
"
	Métrique de [0 ; 1] pour comparer deux volées entre elles, le plus bas le meilleur
"
	| c1 c2 c3 c4 |
	" 6 est la note maximale ⇒ σ ∈ [0 ; 3]"
	c1 := self ecartType / 1.5.
	c2 := self elevesSeuls / 10.0 .
	c3 := self ecartsFilleGarcon.
	c4 := self elevesSansClasse size / eleves size.
	^ (0.7 * c1) + (0.1 * c2) + (0.1 * c3) + (0.1 * c4)! !

!Volee methodsFor: 'metriques' stamp: 'hlsf 6/25/2025 21:29:57'!
verifierScore
" Nous cherchons la volée avec le meilleur score "
	^ (voleePreferee isNil 
	or: [voleePreferee scoring > self scoring ]
	or: [voleePreferee checks not and: [self checks] ] )
		ifTrue: [
			'\o/ Volée avec un meilleur arrangement !!' print.
			voleePreferee := self veryDeepCopy.
			self changed: #voleePreferee ]! !

!Volee methodsFor: 'metriques' stamp: 'hlsf 6/19/2025 14:53:48'!
voleePreferee
	^ voleePreferee ! !

!Volee methodsFor: 'printing' stamp: 'hlsf 6/25/2025 09:17:44'!
printOn: stream
	stream nextPutAll: 'Élèves : '; 	print: self nbEleves ; lf;
		nextPutAll: 'Filles : ' magenta bold; print: self filles; lf;
		nextPutAll: 'Garçons : ' blue bold ; print: self garcons ; lf;
		nextPutAll: 'Élèves isolés : '; print: self elevesSeuls ; lf;		
		nextPutAll: 'Classes : '; print: self nbClasses; lf;
		nextPutAll: 'Capacité classes : '; print: self capaciteClasses ;lf;
		nextPutAll: 'Élèves sans classe : '; print: self elevesSansClasse size; lf;
		nextPutAll: 'Moy (MA+ 2 × FR) : '; nextPutAll: (self note printStringFractionDigits: 1); lf;
		nextPutAll: 'Score : '; nextPutAll: self score; nextPut: $%; lf;
		nextPutAll: 'Ecart type : '; nextPutAll: (self ecartType printStringFractionDigits: 2); lf;		
		nextPutAll: 'Vérifications : '; newLineTab ;
		nextPutAll: '- élèves ensemble '; print: self checkElevesEnsembles ; newLineTab ;
		nextPutAll: '- élèves séparés '; print: self checkElevesSepares ! !

!Volee methodsFor: 'printing' stamp: 'hlsf 6/19/2025 14:55:26'!
resume
	^ String streamContents: [: str |
	str nextPutAll: 'C'; print: self nbClasses;
		nextPutAll: ' E'; print: self nbEleves  ;
		nextPutAll: ' I'; print: self elevesSeuls ;
		nextPutAll: ' X'; print: self elevesSansClasse size;
		nextPutAll: ' Score='; nextPutAll: self score; nextPut: $%;
		nextPutAll: ' σ='; nextPutAll: (self ecartType printStringFractionDigits: 2);
		nextPutAll: ' Vérif. '; print: self checks]! !

!Volee methodsFor: 'testing' stamp: 'hlsf 6/25/2025 12:36:25'!
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

!Volee methodsFor: 'testing' stamp: 'hlsf 6/25/2025 12:36:32'!
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

!Volee methodsFor: 'testing' stamp: 'hlsf 6/19/2025 14:54:27'!
checks
	^ self checkElevesEnsembles and: [self checkElevesSepares ]! !

!Volee methodsFor: 'testing' stamp: 'hlsf 6/19/2025 14:54:54'!
est9e
	^ false! !

!Volee methodsFor: 'testing' stamp: 'hlsf 6/19/2025 14:54:35'!
estCalculable
	^ csvEleves notNil
	and: [csvClasses notNil
	and: [csvGroupes notNil ] ] ! !

!Volee10 methodsFor: 'import/export' stamp: 'hlsf 4/25/2025 16:30:54'!
exportPath
	^ DirectoryEntry projectBaseDirectory / 'export' / 'Volee10e'! !

!Volee10 methodsFor: 'import/export' stamp: 'hlsf 6/6/2025 16:03:32'!
importerGroupes
	super importerGroupes.
	" Vérifier capacités des groupes et classes "
	classes do: [:classe |
		classe capacite = classe capaciteGroupes ifFalse: [ 
			Transcript show:classe nom;
				show: ' - capacité des groupes différente de la classe'; cr ] ]! !

!Volee10 methodsFor: 'import/export' stamp: 'hlsf 6/21/2025 16:11:37'!
insererNotesEleves
	| notes |
	csvNotes ifNil: [^ self].
	self assert: eleves notNil description: 'Importer eleves de SMOG d''abord'.
	notes := EleveNote importerNotes: self importPath // csvNotes.
	" Inserer les notes dans la collection eleves "
	eleves do: [:unEleve | 
		(self trouverEleve: unEleve patronyme dans: notes)
			ifNotNil:  [:noteEleve | unEleve note: noteEleve note]
			ifNil: [Transcript 
					show: 'Pas de note pour ';
					show: unEleve; cr] ]! !

!Volee10 methodsFor: 'initialization' stamp: 'hlsf 6/25/2025 18:16:18'!
filtres
	^ #( (LS MI) (LC) (CT)  )! !

!Volee10 methodsFor: 'initialization' stamp: 'hlsf 6/21/2025 16:17:19'!
importer
"	Importer les données 	"
	eleves := self eleveClass importer: self importPath // csvEleves.
	classes := self classeClass importer: self importPath // csvClasses.
	self insererNotesEleves;
		importerGroupes;
		filtrerSelon: filtre;
		insererContraintesDoyens! !

!Volee10 methodsFor: 'fichiers' stamp: 'hlsf 6/5/2025 16:38:26'!
csvNotes: fichierNotes
	csvNotes := fichierNotes ! !

!Volee10 methodsFor: 'meta' stamp: 'hlsf 6/6/2025 13:55:53'!
classeClass
	^ Classe10e! !

!Volee10 methodsFor: 'meta' stamp: 'hlsf 6/5/2025 23:27:07'!
eleveClass
	^ Eleve ! !

!Volee10 methodsFor: 'as yet unclassified' stamp: 'hlsf 6/25/2025 09:17:17'!
printOn: stream
	stream nextPutAll: 'Élèves : '; 	print: self nbEleves ; lf;
		nextPutAll: 'Filles : ' magenta bold; print: self filles; lf;
		nextPutAll: 'Garçons : ' blue bold ; print: self garcons ; lf;
		nextPutAll: 'Élèves isolés : '; print: self elevesSeuls ; lf;		
		nextPutAll: 'Classes : '; print: self nbClasses; lf;
		nextPutAll: 'Capacité classes : '; print: self capaciteClasses ;lf;
		nextPutAll: 'Élèves sans classe : '; print: self elevesSansClasse size; lf;
		nextPutAll: 'Moy. géné. : '; nextPutAll: (self note printStringFractionDigits: 1); lf;
		nextPutAll: 'Score : '; nextPutAll: self score; nextPut: $%; lf;
		nextPutAll: 'Ecart type : '; nextPutAll: (self ecartType printStringFractionDigits: 2); lf;		
		nextPutAll: 'Vérifications : '; newLineTab ;
		nextPutAll: '- élèves ensemble '; print: self checkElevesEnsembles ; newLineTab ;
		nextPutAll: '- élèves séparés '; print: self checkElevesSepares ! !

!Volee11 methodsFor: 'import/export' stamp: 'hlsf 4/25/2025 16:31:02'!
exportPath
	^ DirectoryEntry projectBaseDirectory / 'export' / 'Volee11e'! !

!Volee9 methodsFor: 'testing' stamp: 'hlsf 6/5/2025 16:24:50'!
est9e
	^ true! !

!Volee9 methodsFor: 'import/export' stamp: 'hlsf 4/25/2025 16:30:30'!
exportPath
	^ DirectoryEntry projectBaseDirectory / 'export' / 'Volee9e'! !

!Volee9 methodsFor: 'import/export' stamp: 'hlsf 6/25/2025 19:41:08'!
insererContraintesEcole
	| contraintesEcole |
	csvContraintesEcole ifNil: [^ self].
	self assert: classes notNil description: 'Importer classes d''abord'.
	self assert: eleves notNil description: 'Importer eleves de SMOG d''abord'.
	contraintesEcole := self eleveClass importerContraintesEcole: self importPath // csvContraintesEcole.
	" insertions des contraintes "
	eleves do: [:unEleve | 
		(self trouverEleve: unEleve patronyme dans: contraintesEcole )
			ifNotNil:  [:infoEleve |	self insererContraintesEcoleDe: infoEleve dans: unEleve ]
			ifNil: [Transcript 
					show: 'Pas de contrainte pour ';
					show: unEleve; cr] ]! !

!Volee9 methodsFor: 'import/export' stamp: 'hlsf 6/25/2025 19:41:23'!
insererContraintesEcoleDe: infoEleve dans: unEleve
	unEleve 
		classeAttribuee: infoEleve classeAttribuee ;
		classesExclues: infoEleve classesExclues ;
		trouble: infoEleve avecTrouble;
		mettreAvec: infoEleve mettreAvec ;
		separerDe: infoEleve separerDe ;
		note: infoEleve note
! !

!Volee9 methodsFor: 'meta' stamp: 'hlsf 6/6/2025 13:55:37'!
classeClass
	^ Classe9e! !

!Volee9 methodsFor: 'meta' stamp: 'hlsf 6/5/2025 23:26:54'!
eleveClass
	^ Eleve9e ! !

!Volee9 methodsFor: 'fichiers' stamp: 'hlsf 6/19/2025 15:06:23'!
csvContraintesEcole: fichierCSV
	csvContraintesEcole := fichierCSV ! !

!Volee9 methodsFor: 'initialization' stamp: 'hlsf 6/21/2025 10:47:30'!
importer
"	Importer les données 	"
	eleves := self eleveClass importer: self importPath // csvEleves.
	classes := self classeClass importer: self importPath // csvClasses.
	self importerGroupes;
		filtrerSelon: filtre;
		insererContraintesEcole;
		insererContraintesDoyens! !

!Volee9 methodsFor: 'accessing' stamp: 'hlsf 6/25/2025 18:15:58'!
filtres
	^ #( (R3 MI) (R1 R2) (R2) (R1) )! !

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

!SuiviEleve methodsFor: 'import/export' stamp: 'hlsf 6/2/2025 11:03:48'!
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

!ClasseView methodsFor: 'halos and balloon help' stamp: 'hlsf 6/8/2025 11:34:37'!
balloonText
	^ Text streamContents: [:str | model descriptionOn: str]! !

!ClasseView class methodsFor: 'as yet unclassified' stamp: 'hlsf 4/20/2025 12:05:13'!
on: uneClasse
	^ self basicNew 
		model: uneClasse;
		initialize ! !

!VoleeWindow methodsFor: 'GUI building' stamp: 'hlsf 6/8/2025 14:23:07'!
ajoutA: row bouton: nom action: symbol
	| button |
	row 
		addMorph: (LabelMorph contents:  nom capitalized , ' : ');
		addMorph: (button := PluggableButtonMorph
			model: self
			action: symbol
			label: 'Choisir fichier').
	^ button! !

!VoleeWindow methodsFor: 'GUI building' stamp: 'hlsf 6/25/2025 21:09:47'!
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
		addMorph: (PluggableButtonMorph 
			model: self
			action: #reset 
			label: 'Reset');
		addMorph: scoreLabel;
		addMorph: (PluggableButtonMorph 
			model: self 
			action: #exporterClasses 
			label: 'Enregistrer' ::
			enableSelector: #isComputed;
			setBalloonText: 'Enregistrer cette volée sous la forme d''une collection de fichiers csv, un par classe.').
	^ row! !

!VoleeWindow methodsFor: 'GUI building' stamp: 'hlsf 6/21/2025 11:23:00'!
buildFilesToolbar
	| row |
	filesToolbar 
		ifNil: [filesToolbar := LayoutMorph newColumn]
		ifNotNil: [filesToolbar removeAllMorphs ].
	model ifNil: [
		filesToolbar 
			addMorph: (LabelMorph contents: 'Choisir une volée ci-dessus.');
			layoutSpec: (LayoutSpec keepMorphExtent offAxisEdgeWeight: 0) ]
		ifNotNil: [
			" 1ere rangée "
			row := LayoutMorph newRow color: Color transparent.
			elevesBtn := self	ajoutA: row bouton: 'élèves' action: #choixFichierEleves.
			classesBtn := self ajoutA: row bouton: 'classes' action: #choixFichierClasses.
			groupesBtn := self ajoutA: row bouton: 'groupes d''options' action: #choixFichierGroupes.
			filesToolbar addMorph: row.
			" 2e rangée "
			row := LayoutMorph newRow color: Color transparent .
			filesToolbar addMorph: row.
			contraintesDoyenBtn := self ajoutA: row bouton: 'contraintes doyens' action: #choixFichierContraintesDoyen.
			"Pour les 9e, notes importées avec les contraintes école "
			model est9e 
				ifFalse: [notesBtn := self ajoutA: row bouton: 'notes' action: #choixFichierNotes ]
				ifTrue: [ 
					contraintesEcoleBtn := self 
						ajoutA: row 
						bouton: 'contraintes écoles' 
						action: #choixFichierContraintesEcole] ].
	^ filesToolbar! !

!VoleeWindow methodsFor: 'GUI building' stamp: 'hlsf 4/25/2025 13:18:17'!
buildMorphicWindow
	scoreLabel := LabelMorph contents: self scoreVideLabel.
	self 
		addMorph: self buildComputeToolbar layoutSpec: LayoutSpec new useMorphHeight;
		addMorph: self buildVoleeToolbar ;
		addMorph: self buildFilesToolbar ;
		addMorph: (classesView := FlowLayoutMorph new align: #rowTop)! !

!VoleeWindow methodsFor: 'GUI building' stamp: 'hlsf 6/8/2025 18:15:49'!
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
		layoutSpec: (LayoutSpec keepMorphExtent offAxisEdgeWeight: #columnLeft);
		addMorph: (LabelMorph contents: 'Filtre : ');
		addMorph:(filtreBtn := PluggableButtonMorph 
			model: self
			action: #choixFiltres
			label: 'filtres' ::
			enableSelector: #isModelSelected).			
	^ row! !

!VoleeWindow methodsFor: 'GUI building' stamp: 'hlsf 4/25/2025 13:18:17'!
scoreVideLabel

	^ 'Auncun score, calculer au moins une volée'! !

!VoleeWindow methodsFor: 'updating' stamp: 'hlsf 6/8/2025 18:25:41'!
update: aspect
	super update: aspect.
	aspect == #voleePreferee ifTrue: [ | views |
		scoreLabel contents: model voleePreferee resume.
		scoreLabel setBalloonText: (Text streamContents: [:str |
			model voleePreferee printOn: str]).
		views := model voleePreferee classes sorted collect: [:classe | 
			ClasseView on: classe].
		classesView cells: views.
		self changed: #isComputed]
		! !

!VoleeWindow methodsFor: 'ui' stamp: 'hlsf 6/8/2025 18:10:08'!
ajusterBtnFiltre
	filtreBtn label: (self printFilter: model filtre).
	filtreBtn owner layoutNeeded: true! !

!VoleeWindow methodsFor: 'ui' stamp: 'hlsf 6/20/2025 08:39:28'!
choixFichierClasses
	| result |
	result :=(StandardFileMenu new
		oldFileFrom: model importPath withPattern: '*csv' excludePattern: '.*';
		startUpWithCaption: 'Fichier classes').
	result ifNil: [^ self].
	classesBtn label: result name.
	classesBtn owner layoutNeeded: true.
	model csvClasses: result name.
	self changed: #canCompute! !

!VoleeWindow methodsFor: 'ui' stamp: 'hlsf 6/20/2025 08:39:12'!
choixFichierContraintesDoyen
	| result |
	result :=(StandardFileMenu new
		oldFileFrom: model importPath withPattern: '*csv' excludePattern: '.*';
		startUpWithCaption: 'Fichier contraintes élèves
.:: Doyens ::.').
	result ifNil: [^ self].
	contraintesDoyenBtn label: result name.
	contraintesDoyenBtn owner layoutNeeded: true.
	model csvContraintesDoyen: result name.
	self changed: #canCompute! !

!VoleeWindow methodsFor: 'ui' stamp: 'hlsf 6/20/2025 08:47:57'!
choixFichierContraintesEcole
	| result |
	result :=(StandardFileMenu new
		oldFileFrom: model importPath withPattern: '*csv' excludePattern: '.*';
		startUpWithCaption: 'Fichier contraintes élèves
.:: Ecoles ::.').
	result ifNil: [^ self].
	contraintesEcoleBtn label: result name.
	contraintesEcoleBtn owner layoutNeeded: true.
	model csvContraintesEcole: result name.
	self changed: #canCompute! !

!VoleeWindow methodsFor: 'ui' stamp: 'hlsf 6/20/2025 08:40:45'!
choixFichierEleves
	| result |
	result :=(StandardFileMenu new
		oldFileFrom: model importPath withPattern: '*csv' excludePattern: '.*';
		startUpWithCaption: 'Fichier élèves
.:: export SMOG ::.').
	result ifNil: [^ self].
	elevesBtn label: result name.
	elevesBtn owner layoutNeeded: true.
	model csvEleves: result name.
	self changed: #canCompute! !

!VoleeWindow methodsFor: 'ui' stamp: 'hlsf 6/20/2025 08:40:04'!
choixFichierGroupes
	| result |
	result :=(StandardFileMenu new
		oldFileFrom: model importPath withPattern: '*csv' excludePattern: '.*';
		startUpWithCaption: 'Fichier groupes d''options').
	result ifNil: [^ self].
	groupesBtn label: result name.
	groupesBtn owner layoutNeeded: true.
	model csvGroupes: result name.
	self changed: #canCompute! !

!VoleeWindow methodsFor: 'ui' stamp: 'hlsf 6/20/2025 08:43:43'!
choixFichierNotes
	| result |
	result :=(StandardFileMenu new
		oldFileFrom: model importPath withPattern: '*csv' excludePattern: '.*';
		startUpWithCaption: 'Fichier de notes
.:: export GECO 9e, 10e ::.').
	result ifNil: [^ self].
	notesBtn label: result name.
	notesBtn owner layoutNeeded: true.
	model csvNotes: result name.
	self changed: #canCompute! !

!VoleeWindow methodsFor: 'ui' stamp: 'hlsf 6/21/2025 18:14:08'!
choixFiltres
	| index |
	index := PopUpMenu 
		withCaption:  'Choisir un filtre' 
		chooseFrom:  (model filtres collect: [:unFiltre | self printFilter: unFiltre] ).
	index ifNotZero: [
		model filtre: (model filtres at: index).
		self ajusterBtnFiltre.
		self reset]! !

!VoleeWindow methodsFor: 'ui' stamp: 'hlsf 6/21/2025 18:16:58'!
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
		self world doOneCycleNow.
		classesView updateLayout.
		self redrawNeeded.
		self world restoreDisplay.
		progress delete] forkAt: Processor userBackgroundPriority ! !

!VoleeWindow methodsFor: 'ui' stamp: 'hlsf 4/25/2025 13:34:12'!
exporterClasses
	model ifNotNil: [model exporterClasses]! !

!VoleeWindow methodsFor: 'ui' stamp: 'hlsf 6/8/2025 14:28:41'!
reset
	model reset.
	scoreLabel contents: self scoreVideLabel.
	classesView cells: #()! !

!VoleeWindow methodsFor: 'ui' stamp: 'hlsf 6/8/2025 17:56:21'!
select10
	self model: Volee10 new.
	self buildFilesToolbar.
	classesView cells: #().
	scoreLabel contents: self scoreVideLabel.
	self ajusterBtnFiltre.
	self changed: #canCompute.
	self changed: #isComputed.! !

!VoleeWindow methodsFor: 'ui' stamp: 'hlsf 6/8/2025 17:56:32'!
select11
	self model: Volee11 new.
	self buildFilesToolbar.
	classesView cells: #().
	scoreLabel contents: self scoreVideLabel.
	self ajusterBtnFiltre.
	self changed: #canCompute.
	self changed: #isComputed.! !

!VoleeWindow methodsFor: 'ui' stamp: 'hlsf 6/8/2025 17:56:38'!
select9
	self model: Volee9 new.
	self buildFilesToolbar.
	classesView cells: #().
	scoreLabel contents: self scoreVideLabel.
	self ajusterBtnFiltre.
	self changed: #canCompute.
	self changed: #isComputed.! !

!VoleeWindow methodsFor: 'testing' stamp: 'hlsf 6/8/2025 18:14:10'!
canCompute
	^ self isModelSelected 
	and: [model estCalculable ]! !

!VoleeWindow methodsFor: 'testing' stamp: 'hlsf 6/8/2025 18:14:00'!
isComputed
	^ self isModelSelected 
	and: [model voleePreferee notNil]! !

!VoleeWindow methodsFor: 'testing' stamp: 'hlsf 6/8/2025 18:13:50'!
isModelSelected
	^ model notNil ! !

!VoleeWindow methodsFor: 'helpers' stamp: 'hlsf 6/8/2025 18:11:54'!
printFilter: anArray
" An array of symbol to present in a gentle maner "
	^ String streamContents: [:str |
		anArray do: [:aSymbol | str nextPutAll: aSymbol asString] separatedBy: [str nextPutAll: ', ']]! !

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

!EleveView methodsFor: 'initialization' stamp: 'hlsf 6/21/2025 13:14:25'!
initialize
	| genderColor constraintColoring nomEleve|
	super initialize.
	nomEleve := model printString.
	model avecTrouble ifTrue: [nomEleve := nomEleve bold].
	model separerDe ifNotNil: [nomEleve := nomEleve italic].
	model mettreAvec ifNotNil: [nomEleve := nomEleve under].
	genderColor := model estGarcon ifTrue: [#blue]  ifFalse: [#magenta]. 
	self	contents: (nomEleve perform: genderColor).
	constraintColoring := model estContraint ifTrue: [Color veryVeryLightGray ] ifFalse: [Color white].
	self setHeightOnContent ;
		borderWidth: 1;
		color: constraintColoring . ! !

!EleveView methodsFor: 'as yet unclassified' stamp: 'hlsf 6/8/2025 10:59:53'!
balloonText
	^ Text streamContents: [:str | model descriptionOn: str]! !

!EleveView class methodsFor: 'as yet unclassified' stamp: 'hlsf 4/21/2025 22:55:10'!
on: unEleve
	^ self basicNew
		model: unEleve ;
		initialize ! !

!Object methodsFor: '*Doyen' stamp: 'hlsf 6/30/2024 10:31:56'!
estClasse
	^ false! !

!Collection methodsFor: '*Doyen' stamp: 'hlsf 6/25/2025 13:00:52'!
closeToAllOf: aCollection 
	"Answer wether all the elements of aCollection are close to the ones in the receiver."
	
	aCollection do: [:elem | 
		(self anySatisfy: [:otherElem | (elem distanceTo: otherElem) < 3]) 
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
