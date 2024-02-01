carbrand "Citroen", 4
carbrand "Opel", 4
carbrand "Fiat", "Ford", 3
carbrand "Mercedes", "BMW", "Volvo", 5
zip 58937, 9
carbrand "Nissan", 4
zip 58726, 5
zip 58647, 3
license_age 0..1, 3
license_age 2..3, 4
license_age 4..15, 4.5
license_age 16..99, 5
rule ["gender", "M"], ["license_age", 0..3], 0.9 
gender "F", 1
gender "M", 1
age 18..20, 2.5
age 21..23, 3
age 24..26, 3.5
age 27..29, 4
age 30..39, 4.5
age 40..64, 5
rule ["carbrand", "Volvo"], ["zip", "58***"], 1.2
age 65..70, 4
age 71..99, 3