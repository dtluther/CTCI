# Implement an algorith to determine if a string has al
# What if you cannot use additional data structures?l unique characters. 

# Naive Implementation - Hash Table
def is_unique?(str)
    letter_hash = Hash.new(0)
    # O(n), where n is the length of the string
    # Creates an array of the letters, so O(n) space as well
    str.chars.each do |ch|
        letter_hash[ch] += 1
    end

    letter_hash.values.none? {|count| count > 1}
end

unique_str = "abcdefghijklmnop"
puts is_unique?(unique_str)
puts is_unique?("racecar")