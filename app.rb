ALPHABETS = 26
DOWN_THRESHOLD = { min: "a".ord, max: "z".ord }
UP_THRESHOLD = { min: "A".ord, max: "Z".ord }

def encrypt(string, key) 
  if (key.instance_of? Float) == true
    raise ArgumentError, "Key must be an integer."
  else
    result = ""
    string.each_char { |character| result += get_nth_alphabet(character, key) }
    result
  end
end

def get_nth_alphabet(alphabet, n)
  if alphabet?(alphabet) == false
    alphabet
  else
    get_nth_ascii_code(alphabet.ord, n).chr
  end
end

def alphabet? character
  character.ord.between?(UP_THRESHOLD[:min], UP_THRESHOLD[:max]) ||
  character.ord.between?(DOWN_THRESHOLD[:min], DOWN_THRESHOLD[:max])
end

def get_nth_ascii_code(ascii_code, n)
  base = ascii_code <= UP_THRESHOLD[:max] ? UP_THRESHOLD[:min] : DOWN_THRESHOLD[:min]
  position_current = ascii_code - base # can get "nth" from the base alphabet like "A" or "a".
  position_to_be = ((position_current) + n) % ALPHABETS
  ascii_to_be = position_to_be + base
end

# Test cases for the get_nth_alphabet method.
p get_nth_alphabet('a', 3)
p get_nth_alphabet('A', 3)
p get_nth_alphabet('z', 1)
p get_nth_alphabet('Z', 1)
p get_nth_alphabet('!', 1)
p get_nth_alphabet('x', 0)
p get_nth_alphabet('a', -1)
p get_nth_alphabet('A', -1)
p get_nth_alphabet('C', -1)
p get_nth_alphabet('z', -1)
p get_nth_alphabet('Z', -1)

# Test case for encrypt method.
p encrypt("What a string!", 5)