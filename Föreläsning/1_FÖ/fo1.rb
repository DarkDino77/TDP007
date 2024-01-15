# Korta programkodsexempel från bilderna till första föreläsningen i
# TDP007 Konstruktion av datorspråk

# Bild 21: Klasser och arv

class Person
  def initialize(name)
    @name = name
  end

  def greet
    "Hello, my name is #{@name}."
  end
end

class Matz < Person
  def initialize
    super('Yukihiro Matsumoto')
  end
end

# Bild 22: Exempel på grundläggande syntax

def multi_foo(count = 3)
  'foo' * count
end

# Bild 25: Arrayer som stackar eller k÷er

print 'Array as stack: '
stack = Array.new()
stack.push('a')
stack.push('b')
stack.push('c')
print stack.pop until stack.empty?

print "\n"
print 'Array as queue: '
queue = Array.new()
queue.push('a').push('b').push('c')
print queue.shift until queue.empty?

# Bild 28: Olika sätt att skriva block

[1,2,3,4,5].each do | e | puts e end

[1,2,3,4,5].map { | e | e * e }

# Bild 29: Hur man skriver egna iteratorer

def f(count, &block)
  value = 1
  1.upto(count) do | i |
    value = value * i
    block.call(i, value)
  end
end

f(5) do | i, f_i | puts "f(#{i}) = #{f_i}" end

# Bild 30: Blocket kan sparas undan

class Repeater
  def initialize(&block)
    @block = block
    @count = 0
  end

  def repeat
    @count += 1
    @block.call(@count)
  end
end

repeater = Repeater.new do | count | 
  puts "You called me #{count} times" 
end
3.times do repeater.repeat end

# Bild 32: Villkor

if (1 + 1 == 2)
  "Like in school."
else
  "What a surprise!"
end

"Like in school." if (1 + 1 == 2)
"Surprising!" unless (1 + 1 == 2)

(1 + 1 == 2) ? 'Working' : 'Defect'

spam_probability = rand(100)
case spam_probability
when 0...10 then "Lowest probability"
when 10...50 then "Low probability"
when 50...90 then "High probability"
when 90...100 then "Highest probability"
end

# Bild 33: Upprepning

i = 1

while (i<10)
  i*=2
end

i*=2 while (i<100)

begin
  i*=2
end while (i<100)

i*=2 until (i>=1000)

loop do
  break i if (i>=4000)
  i*=2
end

4.times do i*=2 end

r=[]
for i in 0..7
  next if i%2==0
  r<<i
end

(0..7).select { |i| i%2!=0 }

# Bild 34: Klassdefinitioner

class Cell
  def initialize
    @state = :empty
  end
end

class Board
  def initialize(width, height)
    @width = width; @height = height
    @cells = Array.new(height) { Array.new(width) { Cell.new } }
  end
end

# Bild 35: Åtkomst av egenskaper

class Cell
  def state
    @state
  end
end

class Cell
  attr_reader :state
end

class Board
  def size
    self.width * self.height
  end
end

class Cell
  def state=(new_state)
    @state=new_state
  end
end

class Cell
  attr_writer :state
end

class Cell
  attr_accessor :state
end

# Bild 36: Array-liknande åtkomstmetoder

class Board
  def [](col, row)
    @cells[col][row]
  end
end

class Board
  def []=(col, row, cell)
    @cells[col][row] = cell
  end
end
