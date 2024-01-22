# Uppgift 1
Vi återanvände all kod. Programmet funkade så att vi spara raderna från tabellen i en array. Den arrayen loopas igenom, och vi splittar raden för att få ut varje värde (temperatur, må, etc). För att få all kod för fotbolls-uppgiften att funka med vädret, gjorde vi all kod till en funktion, och gjorde vilka index i de splittade raderna (alltså kolumner i tabellen) till parametrar. Filen som läses ifrån gjordes också till en parameter. Därefter kunde vi helt enkelt ange att i väder-uppgiften, använder vi differensen mellan kolumn 2 och 1. I fotbolls-uppgiften var det kolumn 6 och 8.

Vi la till en check för att kolla om filen vi söker efter finns. Det kom vi på att göra efter vi började skriva tester.

Vi lärde oss av labbass att ett "!" efter en funktion innebär ofta att funktionen kommer ändra på objektet själv, medans om "!" utelämnas kommer funktionen returnera ett nytt objekt. 

## Tester
Det var lite svårt att utforma tester här på grund av något som också dök upp i sista deluppgiften från förra seminariet. De funktioner vi har byggt är de vi använder för att (förhoppningsvis) få rätt svår på frågan. Eftersom vi inte har ett angivet svar som vi vet är rätt så har vi ingenting att testa emot. Det vi har gjort nu för att fluffa till testfilen är helt enkelt att ange returvärdet från funktionerna som det förväntade resultatet, vilket inte testar något överhuvudtaget.

# Uppgift 2

Det var väldigt svårt att läsa standarderna hcalendar och hcard. 

## Felhantering
Vi funderade på om någon felhantering skulle tillämpas, exempelvis för att kolla filsökvägar/urler till XML-dokumenten. Vi kom fram till att det inte riktigt finns någon poäng på denna skala. Kollar vi efter inkorrekta urler, avbryter funktionen, och returnerar ett felmeddelande, gör vi precis samma sak som ruby-interpretatorn redan gör åt oss. Det hade varit nödvändigt vid en större program där vi inte vill att _hela_ programmet ska avbrytas vid ett sådant fel, men i detta program är det precis det vi vill.