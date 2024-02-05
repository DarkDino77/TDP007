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

Vi stötte på ett problem vi blev förvirrade av. När vi använde "&&" för att parsa "or" samt "||" för att parsa "and", verkade vi få rätt resultat, vilket är ju omvänt. Efter en stund märkte vi att det berodde på att alla tokens ges till ruby som strängar. Detta skedde eftersom matchningen för variabler gjordes innan strängarna "true" och "false", och variabler (:var) returnerar som strängar. Vi följde specefikationen i uppgiften, men vi märkte att detta går emot principen att de mest specifika matchningar ska göras först. Matchar vi "true" och "false" först kan vi göra om just dessa till booleaner.

Detta måste skrivas om 
Vi valde att lösa rule expr genom att skriva en evalute funktion som kållar om ett inskickat värde är true false eller en giltig variabel. En alternativ lösning skulle kunnat vara att ha en till regel som skulle använda parsningen till att kålla om vad något exakt är. Det skulle lättast lösas genom att assign skulle ta en en ny regel name som skulle match den nuvarande :var regeln och :var skulle returnera \@\@varibels inlägget som matchar det relevant namnet. Jag hade personligen föredragit att använda en extra regel



Genom att spara alla variabler i en statisk klass variabel var det väldigt simpelt att skriva tester.

## Tester
För denna uppgift kom vi på att testa efter krascher, så vi frågade gpt hur man gjorde det. ´assert_raise()´ kollar efter en krasch. Detta var något nytt vi lärde oss som också hade varit bra vid föregående upgifter också. Om man gör ett riktigt program, speciellt något på en server där det finns flera användare, är det ju väldigt viktigt att se till att otillåtna inmatande kraschar istället för att göra något oförväntat.
