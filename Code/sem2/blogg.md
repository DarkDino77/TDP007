# Uppgift 1
Vi återanvände all kod. Programmet funkade så att vi spara raderna från tabellen i en array. Den arrayen loopas igenom, och vi splittar raden för att få ut varje värde (temperatur, må, etc). För att få all kod för fotbolls-uppgiften att funka med vädret, gjorde vi all kod till en funktion, och gjorde vilka index i de splittade raderna (alltså kolumner i tabellen) till parametrar. Filen som läses ifrån gjordes också till en parameter. Därefter kunde vi helt enkelt ange att i väder-uppgiften, använder vi differensen mellan kolumn 2 och 1. I fotbolls-uppgiften var det kolumn 6 och 8.

Vi la till en check för att kolla om filen vi söker efter finns. Det kom vi på att göra efter vi började skriva tester.

Vi lärde oss av labbass att ett "!" efter en funktion innebär ofta att funktionen kommer ändra på objektet själv, medans om "!" utelämnas kommer funktionen returnera ett nytt objekt. 