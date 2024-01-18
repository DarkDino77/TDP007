require'./avsnitt1'
require'./avsnitt2'
require'./avsnitt3'
require'./avsnitt4'
require'test/unit'

# Avsnitt 1: Iteratorer
class Test_One < Test::Unit::TestCase
  def test_repeat
    do_five = Repeat.new(5)
    x = 0
    #detta kållar inte att x ökar utan return värdet vilket kan vara hut många gånger den kör
    assert_equal(5, n_times(5) { x += 1 })
    assert_equal(5, do_five.each { x += 1 })
  end

  def test_faculty
    assert_equal(6, factorial(3))
    assert_equal(24, factorial(4))
  end

  def test_longest_string
    assert_equal('dddd', longest_string(['a', 'bb', 'ccc', 'dddd']))
    assert_equal('bbb', longest_string(['a', 'bbb', 'cc']))
    assert_equal('dddd', longest_string_alt('a', 'bb', 'ccc', 'dddd'))
    assert_equal('bbb', longest_string_alt('a', 'bbb', 'cc'))
  end

  def test_find_it
    assert_equal('aaa', find_it(['bb', 'aaa', 'c']) {|a,b| a.length > b.length})
    assert_equal('c', find_it(['bb', 'aaa', 'c']) {|a,b| a.length < b.length})
    #Dennis Tester
    assert_equal(3, find_it([1, 2, 3]) { |a,b| a > b })
    assert_equal(1, find_it([1, 2, 3]) { |a,b| a < b })
  end
end

# Avsnitt 2: Åtkomstfunktioner
class Test_Two < Test::Unit::TestCase
  def test_personname
    person1 = PersonName.new('Ola', 'Henriksson')
    assert_equal('Ola Henriksson', person1.fullname)

    person1.fullname=('Johan Karlsson')
    assert_equal('Johan Karlsson', person1.fullname)
  end

  def test_personexpanded
    person2 = Person.new(34, 'Linus Ulriksson')
    assert_equal(34, person2.age)
    assert_equal('Linus Ulriksson', person2.name.fullname)
  end
end

# Avsnitt 3: Utökade klasser
class Test_Three < Test::Unit::TestCase
  def test_integer
    assert_equal(1, 1.fib)
    assert_equal(3, 4.fib)
    assert_equal(5, 5.fib)
  end

  def test_string
    assert_equal('LOL', 'laughing out loud'.acronym)
    assert_equal('DWIM', 'Do what I mean!!'.acronym)
    assert_equal('KUK', 'Krossad under kranen.'.acronym)
    assert_equal('Ö', 'Österåt'.acronym)
    assert_equal('', ''.acronym)
    # Dennis : neder passar ej
    #assert_equal('DWIM!', 'Do what I mean! !'.acronym)
  end

  def test_array
    assert_equal([1, 2, 3], [1, 2, 3].rotate_left(0))
    assert_equal([2, 3, 1], [1, 2, 3].rotate_left(1))
    assert_equal([2, 3, 1], [1, 2, 3].rotate_left)
    assert_equal([1, 2, 3], [1, 2, 3].rotate_left(3))
    #gurra test
    #assert_equal([1,2,3], [1,2,3].rotate_left(3, [4,5,6]))
  end
end

# Avsnitt 4: Regex
class Test_Four < Test::Unit::TestCase
  def test_username
    assert_equal('Brian', get_username('USERNAME: Brian'))
    assert_equal('Brian', get_username('USERNAME:Brian'))
    assert_equal('Brian', get_username('USERNAME:          Brian'))
    assert_equal('Brian', get_username('text: Brian'))
    assert_equal('Brian', get_username('mera text: Brian'))
    #Dennis tester
    assert_equal("Brian", get_username("USERNAME: Brian"))
    assert_equal("Brian", get_username("USERaksjdNAME: Brian"))
    assert_equal("Brian", get_username("USER\nNAME: Brian"))
    # Dennis : neder passar ej
    #assert_equal("", get_username(": Brian"))
    #assert_equal("", get_username(" : Brian"))
    #assert_equal("", get_username("USERNAME!!: Brian"))
    #assert_equal("Brian!", get_username("USERNAME: Brian!"))
  end

  def test_tags
    html = URI.open('http://www.google.com/', &:read)
    #Dennis : Detta är fel vart är div?
    assert_equal(['<head>', '<title>', '<style>',
                  '<nobr>', '<u>', '<center>', '<br>'], find_tags(html))
  end

  def test_plate
    assert_equal('REL582', validate_regplate('REL582'))
    assert_equal('REL582', validate_regplate('hej hej REL582'))
    assert_equal(false, validate_regplate('QEL582'))
    assert_equal(false, validate_regplate('QEL'))
    assert_equal(false, validate_regplate('123'))
    # +Dennis tester 
    assert_equal(false, validate_regplate('   582'))
    assert_equal(false, validate_regplate('!!!582'))
    # passar ej
    # regex utrycket är fel då det inte kollar för endast bokstäver
    # assert_equal(false, validate_regplate('1EL582'))
    # assert_equal(false, validate_regplate('___582'))
    # assert_equal(false, validate_regplate('123582'))
    
  end
end
