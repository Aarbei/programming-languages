#This program converts Roman numberts into Integer and vice versa

class RomanIntConverter
    ROMAN_NUMBERS = {
      'I' => 1,
      'IV' => 4,
      'V' => 5,
      'IX' => 9,
      'X' => 10,
      'XL' => 40,
      'L' => 50,
      'XC' => 90,
      'C' => 100,
      'CD' => 400,
      'D' => 500,
      'CM' => 900,
      'M' => 1000
    }
    MAX_NUMBER = 4000
    
    def to_roman(number)
        return 'Invalid input' if number <= 0 || number > MAX_NUMBER
        result = ''
        until number.zero?
          best_roman, value = ROMAN_NUMBERS.max_by { |_, v| v <= number ? v : 0 }
          result += best_roman
          number -= value
        end
        result
      end
      
  
    def to_integer(roman)
      result = 0
      prev_value = 0
  
      roman.chars.reverse_each do |symbol|
        value = ROMAN_NUMBERS[symbol]
        if !value
          puts 'Invalid Roman numeral'
          return nil
        end
  
        if value < prev_value
          result -= value
        else
          result += value
        end
  
        prev_value = value
      end
  
      result
    end
  end
  
  conv = RomanIntConverter.new
  puts conv.to_integer('XXV')
  puts conv.to_roman(86)

  
