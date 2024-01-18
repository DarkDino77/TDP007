require 'open-uri'

# Uppgift 10: Ta fram text innan och efter specialtecknet ':'
def get_username(str)
  re = /(\w+:\s*)(\w+)/
  re.match(str)[2]
end

# Uppgift 11: Ta fram alla '<TAGGAR>' från en URL
def find_tags(input)
  result = input.scan(/<\w*>/)
  result.uniq
end

# Uppgift 12: Validera svenska registreringsplåtar
def validate_regplate(input)
  result = /[^QIV\W]{3}\d{3}/
  if result.match?(input)
    input.scan(result)[0]
  else
    false
  end
end
