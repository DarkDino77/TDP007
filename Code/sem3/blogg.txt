Gör om till .md!!!!!!!!
# Uppgift 1
## DSL Dokumentation

En rad börjar med en identifierare som anger vad för typ av information som regeln handlar om (exempelvis bilmärke, ålder, etc). De tillgängliga kategorierna är:
* carbrand
* zip
* license_age
* gender
* age
* rule

"rule" är speciell i den mån att poängen som anges där multipliceras med allt som har först adderats ihop från de tidigare reglerna.

Efter kategorin anges en serie av matchningar. De kan vara:
* strängar
* tal
* spann
För regler skrivs en kombination av kategorier och matchningar inuti hakparanteser

## Program dokumentation
Finns kommentarer i koden

## Diskussion
Någonting som diskuterades medan vi gjorde koden var hur vänligt vi behövde göra DSLen för icke-tekniska. Desto fler regler och specifikationer vi lägger på DSLen, desto enklare blir den att använda, men den blir svårare att läsa. Ni ser vad vi landade på i [policy](./policy.rb) filen.

Det svåraste var att kunna parsa "rule" rader. Vi var sugna på att hårdkoda dessa regler, och alltså inte ge möjligheten för såna i DSLen. Det var inte tydligt från uppgiftsbeskriningen om multiplikationen med 1.2 för volvoägare i Östergötland sklle kunna anges i DSLen, men vi valde att försöka göra det så. Eftersom multiplikationen görs på slutet samt att flera andra regler kollas i kombination, behöver dessa behandlas som specialfall i implementationen. Detta gör koden svårare att första, men DSLen mer lättanvänd.

# Uppgift 2
Vår lösning till uppgift 2 kan hittas i rdparse.rb under klassen LogicalParser

Vi stötte på ett problem vi blev förvirrade av. När vi använde "&&" för att parsa "or" samt "||" för att parsa "and", verkade vi få rätt resultat, vilket är ju omvänt. Efter en stund märkte vi att det berodde på att alla tokens ges till ruby som strängar. Detta skedde eftersom matchningen för variabler gjordes innan strängarna "true" och "false", och variabler (:var) returnerar som strängar. Vi följde specefikationen i uppgiften, men vi märkte att detta går emot principen att de mest specifika matchningar ska göras först. Flyttar vi om ordningen så vi matchar "true" och "false" först kan vi göra om just dessa till booleaner, medans alla andra strängar matchas som ":var".

Ett annat problem vi stötte på var hur man skulle lösa skillnaden mellan att använda ":var" för att tilldela en variabel jämfört med en sträng. Först försökte vi ha den logiken i "rule :var", men då gick det inte att skriva över en existerande variabel. Sedan försökte vi med att ha en funktion som låg under "rule :expr", som alla match cases skulle kalla på. Denna lösning fungerade, men var otillfredsställande. Senare insåg vi att funktionerna som vi hade byggt inte var nödvändiga, eftersom "rule :term" i princip gjorde allt vi ville. Genom att använda ett block runt "match(:var)" kunde vi manipulera strängen till den önskade variabeln och fortfarande ändra på variabelns värde, eftersom "rule :assign" kallar direkt på ":var" utan att gå igenom ":term".

Genom att spara alla variabler i en statisk klass variabel var det väldigt simpelt att skriva tester.

## Tester
För denna uppgift kom vi på att testa efter krascher, så vi frågade gpt hur man gjorde det. ´assert_raise()´ kollar efter en krasch. Detta var något nytt vi lärde oss som också hade varit bra vid föregående upgifter också. Om man gör ett riktigt program, speciellt något på en server där det finns flera användare, är det ju väldigt viktigt att se till att otillåtna inmatangingar kraschar istället för att göra något oförväntat.
