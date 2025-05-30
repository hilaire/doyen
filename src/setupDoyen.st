| area morph extent world |
"Report by any mean error"
Transcript
   showOnDisplay: false;
   logToFile: true;
   logToStdout: true.
"Smalltalk at: #LogStartupDebugAids put: true."
"Install change set"
ChangeSet installNewUpdates.
"System configurations"
Utilities setAuthorName: 'Hilaire Fernandes' initials: 'hlsf'.
Preferences at: #logDebuggerStackToFile put: true.
Preferences at: #autoNumberUserChanges put: false.
"Install Doyen code"
Feature require: #'Doyen'.
world := UISupervisor ui.
[
	Display fullScreenMode: true.
	(Delay forSeconds: 1) wait.
	UISupervisor whenUIinSafeState: [
		"Delete all windows but the taskbar"
		(world submorphs reject: [:aMorph | aMorph is: #TaskbarMorph]) 
			do: [:each | each delete].
		"Adjust font size"
		Preferences at: #defaultFontSize put: 10.
		Preferences at: #fullScreenLeavesDeskMargins put: false.		
		"Adjust taskbar size"
		morph := world taskbar.
		morph scale: 1/2.
		"Compute the available free space for windows placement"
		area := RealEstateAgent maximumUsableArea 
			extendBy: 0 @ morph morphHeight negated.
		extent := area extent // 2.
		"Open a few System Browsers"
		Browser open 
			morphPosition: 0@0;
			morphExtent: extent.
		Browser open 
			morphPosition: area width // 2 @ 0; 
			morphExtent: extent.
		"Open a System Browser on a specific class"
		morph := Browser open 
			morphPosition: area extent // 2;
			morphExtent: extent.
		morph model setClass: (Smalltalk at: #Volee9) selector: nil.
		"Open a Workspace with some default contents"
		morph := Workspace open.
		morph model actualContents: 'ChangeSet installNewUpdates.
SuiviEleve importerClasses: ''911 1023 1134''.
VoleeWindow open: (Volee9 classes: ''classes9e.csv'' eleves: ''Eleve9e-smog.csv'' contraintesEleves: ''volée9e-nettoyé.csv'').
'.
		morph 
			morphPosition: 0 @ (area height // 2);
			morphExtent: extent x @ (2 / 3 * extent y).
		"Open a transcript for logs"
		TranscriptWindow openTranscript 
			morphPosition: 0 @ (area height // 2 + (2 / 3 * extent y));
			morphExtent: extent x @ (1 / 3 * extent y ).
		Smalltalk saveImage ]
] fork
