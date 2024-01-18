require 'date'  # Importera date

# Uppgift 5: klass som tar in för och efternamn
class PersonName
  def initialize(name, surname)
    @name = name
    @surname = surname
  end

  def fullname
    "#{@name} #{@surname}"
  end

  def fullname=(new_name)
    names = new_name.split(' ')
    @surname = names[1]
    @name = names[0]
  end
end

# Uppgift 6: Utvidgade Person-klassen
class Person
  attr_reader :age, :birthyear, :name # Getter för variablerna

  def initialize(age, name)
    @age = age
    @birthyear = calc_year(age)
    names = name.split(' ')
    @name = PersonName.new(names[0], names[1])
  end

  def age=(new_age)
    @age = new_age
    @birthyear = calc_year(new_age)
  end

  def birthyear=(new_year)
    @birthyear = new_year
    @age = calc_age(new_year)
  end

  def calc_year(age)
    year = Date.today.year
    year - age
  end

  def calc_age(year)
    Date.today.year - year
  end
end
