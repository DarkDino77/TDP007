* De hade inte reglerna i policy filen, som vi hade för vi e best. Detta kanske de gjorde medvetet för att de tolkade uppgiten så.
* Dem har samma inputs till klassen. Klassens argument, alltså personens information, lagras i en hash där nycklarna används tillsamans med DSLen för att jämföra rätt info. Samma som oss.
* Deras DSL består av en rad med ett namn och en enda parameter. Vi har ett namn och flera parametrar. 
* Dagboken är ganska lättläst

* calc_age_func är lite konstig
* deras uppgift 1 är lik vår, med största skillnaden att vi har en funktion som kan hantera alla rader i DSLen, medan de har if satser. [Punkt 1](#De) är också stor skillnad
* De har använt DSL, med `method_missing` och `instance_eval` funktionerna.
* De har inget sätt att veta vilken _typ_ av information de tittar på i DSLen. Ex om en bil börjar på litet "p" skulle de tolkas på samma sätt som ett postnummer. Har man en bil som heter "Kvinna" får man dubbla poäng.
* Tester är bra. Dock haded de kunnat testa med en policyfil som är felaktig. Det är inget vi gjorde men ändå.

# U 2
* De har ningen ckeck att tokens inte börjar med siffror, vilket ruby inte tillåter
* De skriver tydligt var som var lätt och svårt i dagboken
* De hade samma problem som oss, att variabler värden sparades som strängar och inte bools.
* Lite fattiga tester, kunde ha testat nästlade uttryck. De testar inte om man kan omtilldela variabler, eller om det blir en krasch när odefinerade variabler utvärderas.
* De matchar '(', :expr, ')', vilket gör att de kan skriva `(x)` och få tillbaka värdet av x, medan vi skriver `x`. Ej sant, men man skulle kunna tro det. Deras är lite snyggare kanske om det hade funkat