ALPHABETS = 25
DOWN_THRESHOLD = { min: "a".ord, max: "z".ord }
UP_THRESHOLD = { min: "A".ord, max: "Z".ord }

def encrypt(string, key) 
  result = ""
  string.each_char { |character| result += get_nth_alphabet(character, key) }
  result
end

def get_nth_alphabet(alphabet, n)
  ascii_code = alphabet.ord
  if alphabet?(ascii_code) == false || n == 0
    return alphabet
  end

   get_nth_ascii_code(ascii_code, n).chr
end

def alphabet? ascii_code
  upcase?(ascii_code) == true || downcase?(ascii_code) == true
end

def get_nth_ascii_code(ascii_code, n)
  if wrap?(ascii_code, n) == true
    return wrap(ascii_code, n)
  end
  ascii_code + n
end

def wrap? (ascii_code, n)
  new_ascii_code = ascii_code + n 
  (downcase?(ascii_code) == true && downcase?(new_ascii_code) == false) ||
  (upcase?(ascii_code) == true && upcase?(new_ascii_code) == false)
end

def downcase? (ascii_code)
  ascii_code >= DOWN_THRESHOLD[:min] &&
  ascii_code <= DOWN_THRESHOLD[:max]
end

def upcase? (ascii_code)
  ascii_code >= UP_THRESHOLD[:min] &&
  ascii_code <= UP_THRESHOLD[:max]
end

def wrap(ascii_code, n)
  offset = 1
  if n > 0
    return (ascii_code - ALPHABETS) + (n - offset)
  end

  ascii_code + ALPHABETS - (n + offset)
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

p encrypt("What a string!", 5)