############################################################
#
#  Name:        Sean Glover
#  Assignment:  Rock Paper Scissors
#  Date:        01/29/2013
#  Class:       CIS 282
#  Description: Program plays Rock Paper Scissors with user
#
############################################################

# hash and array for game
rps_array = %w(Rock Paper Scissors)
score_hash = { win: 0, loss: 0, tie: 0 }

# boolean for loop to require player to enter a correct value to play
play = true
# begin prompt user to play
while play do
  print "Would you like to play Rock Paper Scissors? (y/n) "
  user_option = gets.chomp.downcase

  # conditional to check if player wants to play
  if user_option == "y"
    # boolean for loop to keep player in game main menu
    play_menu = true
    # begin main menu
    while play_menu do
      puts

      # print game selection options from array
      rps_array.each_index do |i|
        puts "#{i + 1})  #{rps_array[i]}"
      end
      puts "4)  Quit"
      puts

      # prompt user for selection from main menu
      print "Enter the number of your choice from the menu above: "
      player_choice = gets.to_i

      # condition to validate player selection
      if player_choice == 4
        play_menu = false
        break # break from game loop at player request

      # error check to limit player to menu choices
      elsif player_choice != 1 and player_choice != 2 and player_choice != 3
        puts "That is not one of the options."
        puts "Please try again"

      else
        # rand computer pick
        computer_choice = rand(rps_array.length)
        # adjust player pick for indexing in array
        player_choice -= 1

        # print selections made to screen
        puts
        puts "You picked #{rps_array[player_choice]} and I picked #{rps_array[computer_choice]}."

        # game results checks
        if computer_choice == player_choice
          puts "We Tied!"
          score_hash[:tie] += 1

        elsif computer_choice > player_choice
          # condition check to account for Rock and Scissors
          if computer_choice == 2 and player_choice == 0
            puts "You win!"
            score_hash[:win] += 1

          else
            puts "You lose!"
            score_hash[:loss] += 1
          end # end Rock and Scissors conditional when computer pick > player pick

        elsif computer_choice < player_choice
          # condition check to account for Rock and Scissors
          if computer_choice == 0 and player_choice == 2
            puts "You lose!"
            score_hash[:loss] += 1

          else
            puts "You win!"
            #score_hash["win"] += 1
            score_hash[:win] += 1
          end # end Rock and Scissors conditional when player pick > computer pick
        end # end game results conditional
      end # end conditional from player selection from main menu
    end # end main menu game loop
    # print results from games
    puts
    puts "Your record:"
    puts " Wins   = #{score_hash[:win]}"
    puts " Losses = #{score_hash[:loss]}"
    puts " Ties   = #{score_hash[:tie]}"
    break

  elsif user_option == "n" then # exit program
    puts "Thanks for not playing! Good bye."
    break

  else # message when y or n not entered
    puts "That is an incorrect response."
  end # end conditional requiring player to accept game challenge
end # end game loop
