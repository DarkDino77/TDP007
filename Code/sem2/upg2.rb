require 'rexml/document'


file_name = "./events.html"
src = File.open(file_name)
doc = REXML::Document.new(src)

pp doc.root.name

node_id = "vevent"
# Vill loopa igenom alla i grejen
node = doc.root.get_elements["div[@class='#{node_id}']"]