def is_unique?(str)
    seen = {}
    str.each_char do |ch|
        return false if seen[ch]
        seen[ch] = true
    end
    
    true
end
# O(n) time complexity worst case
# O(n) space complexity

# If we cannot use additional data structures, double iteration is O(n^2)
# If we can modify the input string or sort in place, we can use a sorted
# string to see if the next character is the same. This will reduce from
# O(n^2) to O(n log n) for the sort (and then just O(n) for the iteration)

# p is_unique?("test")
# p is_unique?("abc")
# p is_unique?("123/.,abc")
# p is_unique?("123/.,..")

def check_permutations(str1, str2)
    return false if str1.length != str2.length

    count1 = Hash.new(0)
    count2 = Hash.new(0)

    str1.each_char do |ch|
        count1[ch] += 1
    end

    str2.each_char do |ch|
        return false if count1[ch] == 0
        count2[ch] += 1
    end

    count1 == count2
end
# O(a + b) => O(2a) => O(a) time complexity (two separate un-nested iterations)
    # 2a because will return false if they aren't the same length
# O(2a) space complexity because it will make 2 maps of a length

# p check_permutations("eat", "ate")
# p check_permutations("nope", "nice try")
# p check_permutations("12345", "54321")