def is_unique?(string)
    seen = {}
    string.each_char do |ch|
        return false if seen[ch]
        seen[ch] = true
    end
    
    true
end

# p is_unique?("test")
# p is_unique?("abc")
# p is_unique?("123/.,abc")
# p is_unique?("123/.,..")

def check_permutations
    
end