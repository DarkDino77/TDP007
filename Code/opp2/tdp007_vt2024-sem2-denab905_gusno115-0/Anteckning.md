* Båda Lösningarna är för specificka men väldigt snygga annars.
  * Fotbollsuträkningen funkar bara eftersom det råkar finnas ett "-" mellan de två kolumner som används.
  * Funkar inte heler om lagnamnen inte hade haft en siffra framför.
  * I vädret, har de en räknare som anger viken dag evalueringen görs för. Om tabellen inte är sorterad på dagar så blir det fel.

* De har tolkat fotbollsuppgiften annorlunda än vi har. Frågan är _minst skillnad_. Det är tvetydigt om minst betyder mest negativ eller närmast noll, samt om skillnad är absolut eller inte.

* De hittar inte org eller street-adress

* De har 0 felhantering, samma som oss.

* De tyckte också tester var det svåraste. Åtminstone var det svårt att skriva _bra_ tester.

* De testar inget riktigt på xml delen, bara att parsningen inte ger att fel, samt att två olika parsningar av samma dokument ger samma resultat.
  * Funkar parsern gentemot sig själv?

* De använde dom parsning, som säkert alla andra, eftersom det är enkast. SAX parsning är ju mer effektivt, och det går att avbryta när man har hittat det man vil.

* All info finns bara agrade på index i en lista, inga nycklarm symboler, medlemsvariabler...

* De har ingen implementation för att parsa html-filer frånw webben

* Garbage