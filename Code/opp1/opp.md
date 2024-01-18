# Uppgift 11
de glömde att kålla efter atribut i taggarna vilket gjorde att de missademåna taggar, exempelvis \<div style="...">. Regex vi hade var /<([a-z]+).*?>/. Frågetecknet efter stjärnan söker efter tecken fram tills den stängande pilen. Resultatet är i fel format, pilarna ska inte följa med, och av någon anledning ska varje tagg vara i sin egen array. Detta reflekteras i testet, då det som förväntas av testet är bara det funktionen returnerar. Det är dock svårt att testa eftersom det fanns ingen uppenbart sätt att veta vilket svar som var rätt.

# Uppgift 12
De tillåter siffror och underlines i de tre första, genom "\W". Testerna verkar vettiga, dock är lite otilräckliga. De testas inte efter tecken som är helt förbjudna, ex "_".  

# Dagbok
Dagboken är bra skriven. De skriver mycket om Ruby, och delar våra egna åsikter, vilka är att Ruby är enkelt att hantera. Dock är det ospecifikt i förhållande till de specifika uppgifter.

# U 10
Regexen tillåter siffror och underlines innan kolonet, vilket enligt uppgiften inte skule göras. Efter kolonet kollar de efter ett godtyckligt antal whitespace karaktärer, vilket är snyggt. Dock tolkar vi det från uppgiften som att radbryt inte ska tilåtas, då kolonet och användarnamne ska vara på samma rad. I namnet tillåts sedan _inte_ specialtecken, vilket det kan göra. Uppgiften är dock lite svårtolkad

# U 9
De använder shift för att plocka ut första elementet, och insert för att sätta det i slutet. De funkar likt vår version. Dock sparade de på många rader i jämförelse.

# U 8
De gör samma som oss, förutom att vi använder regex. De leder till att denna funktion tar med icke-bokstäver. Annars är det typ samma (split till lista, loopa igenom, spara första bokstav).


# Alla U (objekt metoder)
På uppgifter som lägger till en metod på inbyggda objekt (string, array, etc), lägger de till en parameter som motsvarar vilket objekt metoden ska mutera. Detta är lite konstigt, eftersominput objektet bör anges av vilket objekt som metoden _körs på_. Men detta mänster kan man kalla metoden på ett objekt men använda den för att mutera ett annat, ex 
```ruby
[1,2,3].rotate_left(3, [4,5,6])
```

# U 7
Fint. Återigen samma algoritm som oss, men fint skrivet på 2 rader :)
# Kodstil
Formattering har mindre inkonsekventheter, men det är så lite att man knappt tänker på det. Som de skrev i dagboken så beror det nog på att de skrev mycket separat. Exempelvis är det ibland melanrum mellan = och parameter, och ibland inte.

# U 5
Enda skillnaden mellan vår lösning och deras är att de tar in name och surname i konstruktorn. Vi tolkade det som att deta inte skulle göras, men när vi läser om så ser vi inte det inte står något om detta. Deras fullname getter är även mycket finare än vår då de använder string literal.

# U 6
Ser fint ut och funkar som det ska. En kommentar är att de använder hjälp funktioner, fastän dessa är publika, vilket är lite orimligt, då de inte bör användas utanför klassen.

# U 4
De använder reduce. Detta gör funktionen snygg och fin, kortare än vår. Reduce kombinerar alla element med en vald operation. 
# U 1
testet kållar inte att x ökar utan return värdet vilket kan vara hur många gånger den kör

# U 2
samma som oss. de använder inject, vilket kör en beräkning på varje element i en iterator.

# U 3
feta snygg funktion. Vi letade efter en funktion såsom max_by, men fattade inte hur den användes. Den verkar köra en operation på varje element i en iterator, vars resultat är det som används för att jämföra. mycket fint :)