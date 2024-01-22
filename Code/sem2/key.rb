# Suggested solution to the exercise on tree parsing from lecture 4

require 'rexml/document'

def use_key(file_name)
  src = File.open(file_name)
  doc = REXML::Document.new(src)
  follow_node(doc.root,'start')
end

def follow_node(root, node_id)
  node = root.elements["node[@id='#{node_id}']"]
  puts node.attribute("header")
  if !node.elements.empty? then
    alternatives = node.get_elements("alt")
    alternatives.each_index do | i |
      puts "Alternative #{i+1}:"
      puts alternatives[i].text
    end
    puts "Choose one alternative:"
    input = gets
    choice = input.to_i
    chosen_node = node.elements["alt[#{choice}]"]
    puts "----------"
    follow_node(root,chosen_node.attribute("dest"))
  end
end

