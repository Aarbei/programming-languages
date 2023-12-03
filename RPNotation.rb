#Usual math form to Reverse Polish Notation

def transform
    print "Enter your mathematical expression: "
    input = gets.chomp
    symbols = input.split('')
    operands = Array.new
    operators = Array.new
    
    symbols.each do |symbol|
        unless symbol == ' '
            if symbol.match?(/\d+/)
                operands.push(symbol)
            else
                operators.push(symbol)
            end
        end
    end
    
    puts"Using RPN:" + [operands.join(' '), operators].join(' ')
    end
    
    transform