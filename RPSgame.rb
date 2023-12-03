#Rock Paper Scissors ARGV Game

arrayValues = ["rock", "paper", "scissors"] 

if ARGV.empty?
       puts "No data was given, try again with \"rock\" \"paper\" \"scissors\"!"
       exit
end

ARGV.each_with_index do |usersValue, index|
       puts "Element number #{index+1} equals #{usersValue}"
       if arrayValues.include? usersValue
             gameValue = arrayValues[rand(0..2)]
             puts "Computer's element #{index+1} equals #{gameValue}"
              if(usersValue == gameValue)
                     puts"Draw!"
              elsif((usersValue == "paper" && gameValue == "rock") || (usersValue == "scissors" && gameValue == "paper") || 
              (usersValue == "rock" && gameValue == "scissors"))
                     puts"You won!"
              else
              puts"You lose!"
              end
       else
           puts "Wrong imput, try again with \"rock\" \"paper\" \"scissors\"!"
       end
end