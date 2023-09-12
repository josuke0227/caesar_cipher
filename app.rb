# shift(alphabet, number)

# shift(‘a’, 1) #=> ‘b’

# shift(‘A’, 1) #=> ‘B’

# shift(‘z’, 1) #=> ‘a’

# shift(‘Z’, 1) #=> ‘a’

# shift(‘1’, 1) #=> ‘1’

# shift(‘!’, 1) #=> ‘!’

# convert the ‘alphabet’ into ASCII code, which is number.
# add the ‘number’ to the ASCII to get “nth” alphabet or the ‘alphabet’ parameter.


# if the ‘alphabet’ is ‘z’, then 1st alphabet is ‘a’
# 	Should memorise the ASCII code of ‘a’ to wrap

# if the ‘alphabet’ is ‘Z’, then 1st alphabet is ‘A’ 
# 	Should memorise the ASCII code of ‘A’ to wrap

# encrypt(string, key)
# Create the “result” variable and initialise it with “”.

# Traverse the string from the beginning to the end
# 	Call “get_nth_alphabet” method and concatenate the result with “result” variable.

# When the traversal above is over, return the “result”

ALPHABETS = 25

def get_nth_alphabet(alphabet, n)
  if alphabet?(alphabet) == false || n == 0
    return alphabet
  end

   get_nth_ascii_code(alphabet, n).chr
end

def alphabet? character
  character.upcase != character || character.downcase != character
end

def get_nth_ascii_code(alphabet, n)
  ascii_code = alphabet.ord
  if wrap?(alphabet, n) == true
    return wrap(ascii_code, n)
  end
  ascii_code + n
end

def wrap? (alphabet, n)
  first_alphabets = { "a" => true, "A" =>  true }
  last_alphabets = { "z" => true, "Z" =>  true }

  (first_alphabets[alphabet] == true && n < 0) || 
  (last_alphabets[alphabet] == true && n > 0)
end

def wrap(ascii_code, n)
  offset = 1
  if n > 0
    return (ascii_code - ALPHABETS) + (n - offset)
  end

  ascii_code + ALPHABETS + (n - 1)
end


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