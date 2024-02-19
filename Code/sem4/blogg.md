# Uppgift 1
Första arbetspasset var vi båda relativt trötta, och fick inte mycket gjort. Nästa gång vi sågs gick det mycket snabbare, och vi blev klara. Det svåraste med uppgiften var att första den givna koden samt constraint-nätverk. En av oss i gruppen var inte på föreläsningen, men att göra den här upppgiften gjorde det lätt att förstå hur constraint-nätverk funkar. 

Vi lärde oss att `^` representerar en xor gate i ruby, vilket var användbart för en viktig if sats: 
```ruby 
    # Om out har värde samt att en utav a och b har värde, men inte båda.
    if out.has_value? and (b.has_value? ^ a.has_value?)
``` 
Det svåraste med uppgiften var nog att klura fram just den där if-satsen, men i sin helhet var det ändå relativt enkelt. Större delen av arbetet här har definitivt gått till uppgift 2.
## Tester 
De viktigas testerna var ganska tydliga i denna uppgift. Vi tänker att det gäller att testa constrainst i alla riktingar, alltså testar att var och en connector kan påverka de andra. Testet för temperatur-konvertering inkluderar sedan test för att se att mer komplicerade nätverk även funkar.

# Uppgift 2
Lyckades inte lista ut hur man skulle plocka ut rätt värde från Aretmetiska utryck när det aretmetiska utrycket man ska plocka ut inte stämmer överäns med det man ska skapa så jag valde att skapa Sub och divider classer då kan man plocka ut "out" värdet från ett varje Aretmetiska utryck gång och inte behöve oroasig med att behöva plocka ut "b" värdet från negativa/dividerande Aretmetiska utryck som representeras som adders respective multipliers.

Man behövde också kolla efter om båda sidorna av ett utryck var en connector i replace conn då ett Aretmetiska utryck inte kommer skapas om man endast har singuära konnektors på båda sidorn. då skapar vi en Aretmetiska utryck genom att avända oss av att f=7 <=> f=7+0. 

## Tester
Det var också här ganska tydligt vilka tester som är rimliga. Det är enklare att testa här jämfört med exempelvis något typ av användargränssnitt, eftersom där finns det väldigt många olika saker användaren kan skicka in. Här antar vi att klasserna vi skapar används på det sättet dem är tänkt att göra. Här behövdes dock lite fler tester än i uppgift 1, då det finns mycket fler saker som kan gå fel.

Vi börjar med simpla ekvationer, och testar var och en de olika operationerna. Sedan testar vi sammansatta uttryck, och testar ifall paranteser styr prioritering rätt. Sist testar vi temperatur-konverteringen. Vi antar att felhaneting och pedagogiska felmeddelanden är utanför uppgiftens omfattning.