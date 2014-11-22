class CharDiff
  attr_reader(:str1, :str2)

  def initialize(str1, str2)
    # This can be moved to count method or rewritten to conditions if needed
    raise ArgumentError, "Empty string" if str1.to_s.empty? or str2.to_s.empty?
    raise ArgumentError, "Different strings length" unless str1.to_s.length == str2.to_s.length
    raise ArgumentError, "#{str1} is not a string" unless str1.is_a? String
    raise ArgumentError, "#{str2} is not a string" unless str2.is_a? String
    raise ArgumentError, "#{str1} is not a word (alpha)" unless str1 =~ /\A\p{Alpha}+\z/
    raise ArgumentError, "#{str2} is not a word (alpha)" unless str2 =~ /\A\p{Alpha}+\z/

      @str1 = str1.to_s
      @str2 = str2.to_s
  end

  def count
    c = 0
    @str1.length.times do |i|
      if @str1[i] != @str2[i]
        c += 1
      end
    end
    c
  end

end


test = CharDiff.new('ABCD', 'AACD')

# Displays our strings
puts test.str1
puts test.str2

# Displays number of different characters
puts test.count
