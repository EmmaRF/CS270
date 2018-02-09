# Homework 1 for CS 270
# By Emma Fronberg (I worked alone)
# Due: 2/5/2018

# Part 1
puts "Part 1"
# (a) Write a method that determines whether a given word or phrase is a palindrome, that is, it
# reads the same backwards as forwards, ignoring case, punctuation, and nonword characters.
# (a "nonword character" is defined for our purposes as "a character that Ruby regexps would
# treat as a nonword character".) Your solution shouldn't use loops or iteration of any kind. You
# will find regular-expression syntax very useful; it's reviewed briefly in the book, and the website
# rubular.com lets you try out Ruby regular expressions "live". Methods you might find useful
# (which you'll have to look up in Ruby documentation, ruby-doc.org) include:
# String#downcase, String#gsub, String#reverse
# Suggestion: once you have your code working, consider making it more beautiful by using
# techniques like method chaining, as described in ELLS 3.2.
# Examples:
# palindrome?("A man, a plan, a canal -- Panama") #=> true
# palindrome?("Madam, I'm Adam!") # => true
# palindrome?("Abracadabra") # => false (nil is also ok)
# def palindrome?(string)
# # your code here
# end


# Part 1 (a), Answer:
puts "Part 1 (a)"
def palindrome?(string)

  puts "The Original String: #{string}"
  clean_and_downcase_string = string.gsub(/[^a-zA-Z]/,"").downcase
  puts "The Cleaned Up String: #{clean_and_downcase_string}"
  
  reverse_string = clean_and_downcase_string.reverse
  puts "The Reverse of the Cleaned Up String: #{reverse_string}"
  
  puts reverse_string == clean_and_downcase_string # The answer
end

# Tests given by Part 1 (a)
puts "Tests given by Part 1 (a)"
puts
palindrome?("A man, a plan, a canal -- Panama") #=> true 
puts
palindrome?("Madam, I'm Adam!") # => true 
puts
palindrome?("Abracadabra") # => false (nil is also ok)
puts

# Tests for Part 1 (a) that I wrote myself
puts "Tests for Part 1 (a) that I wrote myself"
puts
palindrome?("a") # => true
puts
palindrome?("a$@%") # => true
puts
palindrome?("ab") # => false
puts
palindrome?("") # => false
puts
palindrome?(" ") # => false
puts
palindrome?("Pancake") # => false
puts
palindrome?("Small dog god llams") # => true
puts
puts


# (b) Given a string of input, return a hash whose keys are words in the string and whose values are the number of times each word appears. Don't use for-loops. 
# (But iterators like each are permitted.) Nonwords should be ignored. 
# Case shouldn't matter. A word is defined as a string of characters between word boundaries. 
# (Hint: the sequence \b in a Ruby regexp means "word boundary".)
# Example:
  
# count_words("A man, a plan, a canal -- Panama")
# # => {'a' => 3, 'man' => 1, 'canal' => 1, 'panama' => 1, 'plan' => 1} 
#count_words "Doo bee doo bee doo" # => {'doo' => 3, 'bee' => 2}
# def count_words(string)
#   # your code here
# end


# Part 1 (b), Answer:
puts "Part 1 (b)"
def count_words(string)
  puts "The Original String: #{string}"
  clean_and_downcase_string = string.gsub(/[^a-zA-Z ]/,"").downcase # only keeps letters and spaces, and makes sure everything is lowercase
  puts "The Cleaned Up String: #{clean_and_downcase_string}"
  
  # make a list of the words
  list_of_words = clean_and_downcase_string.split(" ")
  # puts list_of_words
  
  words = Hash.new
  
  list_of_words.each do |key|
    if words[key] == nil
      words[key] = 1
    else
      words[key] = words[key] + 1
    end
  end
  puts words # The answer
  return words
  
end

# Tests given by Part 1 (b)
puts "Tests given by Part 1 (b)"
puts
count_words("A man, a plan, a canal -- Panama") # => {'a' => 3, 'man' => 1, 'canal' => 1, 'panama' => 1, 'plan' => 1} 
puts
count_words "Doo bee doo bee doo" # => {'doo' => 3, 'bee' => 2}
puts

# Tests for Part 1 (b) that I wrote myself
puts "Tests for Part 1 (b) that I wrote myself"
puts
count_words("!@#@!#@!#Pat")
# puts
# count_words() #Error, needs a single argument
puts
count_words("")
puts
count_words(" ")
puts
count_words("The dog is full of Jam.")
puts
count_words("*NO))0_ONE s$a$y%s StUfF______")
puts
count_words("no yes yes not no potatoes")


# Part 2
puts
puts
puts "Part 2"
# In a game of rock-paper-scissors, each player chooses to play Rock (R), Paper (P), or Scissors (S). The rules are: Rock beats Scissors, Scissors beats Paper, but Paper beats Rock.
# A rock-paper-scissors game is encoded as a list, where the elements are 2-element lists that encode a player’s name and a player’s strategy.
# [ [ "Armando", "P" ], [ "Dave", "S" ] ]
# # => returns the list ["Dave", "S"] wins since S>P


# (a) Write a method rps_game_winner that takes a two-element list and behaves as follows: 
# - If the number of players is not equal to 2, raise WrongNumberOfPlayersError
# - If either player's strategy is something other than "R", "P" or "S" (case-insensitive), raise NoSuchStrategyError
# - Otherwise, return the name and strategy of the winning player. If both players use the same strategy, the first player is the winner.
# We'll get you started:
# class WrongNumberOfPlayersError < StandardError ; end class NoSuchStrategyError < StandardError ; end
# def rps_game_winner(game)
# raise WrongNumberOfPlayersError unless game.length == 2 # your code here
# end

# Part 2 (a), Answer:
puts "Part 2 (a)"

class WrongNumberOfPlayersError < StandardError ; end 
class NoSuchStrategyError < StandardError ; end

def rps_game_winner(game)
  raise WrongNumberOfPlayersError unless game.length == 2 # Checks to make sure there are only two players
 
  raise NoSuchStrategyError unless (game[0].length == 2 && game[1].length == 2 && ((game[0][1]=~/[RPS]/i) ? true : false) && ((game[1][1]=~/[RPS]/i) ? true : false )) 
  # Checks to make sure that the input really is correct, including that each of the inputs only includes and name and a choice, and I make sure that that chois is valid
  
  player1 = game[0]
  player2 = game[1]
  
  player1_strategy = player1[1]
  player2_strategy = player2[1]
  
  puts "#{player1} Vs. #{player2}"
  
  winner = player1
  winner_strategy = player1_strategy
  loser = player2
  loser_strategy = player2_strategy
  
  if player1_strategy.downcase == "r" # if player1 chose rock
    if player2_strategy.downcase == "r" # if it is a tie of rocks, then player1 wins
      winner = player1
      winner_strategy = player1_strategy
      loser = player2
      loser_strategy = player2_strategy
    elsif player2_strategy.downcase == "p" # if player2 chose paper, then player2 wins
      winner = player2
      winner_strategy = player2_strategy
      loser = player1
      loser_strategy = player1_strategy
    else # if player2 chose scissors, then player1 wins
      winner = player1
      winner_strategy = player1_strategy
      loser = player2
      loser_strategy = player2_strategy
    end
    
  elsif player1_strategy.downcase == "p" # if player1 chose paper
    if player2_strategy.downcase == "r" # if player2 chose rock, then player1 wins
      winner = player1
      winner_strategy = player1_strategy
      loser = player2
      loser_strategy = player2_strategy
    elsif player2_strategy.downcase == "p" # if it is a tie of papers, then player1 wins
      winner = player1
      winner_strategy = player1_strategy
      loser = player2
      loser_strategy = player2_strategy
    else # if player2 chose scissors, then player2 wins
      winner = player2
      winner_strategy = player2_strategy
      loser = player1
      loser_strategy = player1_strategy
    end
    
  else # if player1 chose scissors
    if player2_strategy.downcase == "r" # if player2 chose rock, then player1 wins
      winner = player1
      winner_strategy = player1_strategy
      loser = player2
      loser_strategy = player2_strategy
    elsif player2_strategy.downcase == "p" # f player2 chose paper, then player2 wins
      winner = player2
      winner_strategy = player2_strategy
      loser = player1
      loser_strategy = player1_strategy
    else # if it is a tie of scissors, then player1 wins
      winner = player1
      winner_strategy = player1_strategy
      loser = player2
      loser_strategy = player2_strategy
    end

  end
  
  puts "#{winner} wins since #{winner_strategy.upcase} > #{loser_strategy.upcase}"
  return winner
  
end

# Tests given by Part 2 (a)
puts
puts "Tests given by Part 2 (a)"
puts
rps_game_winner([ [ "Armando", "P" ], [ "Dave", "S" ] ]) # => returns the list ["Dave", "S"] wins since S>P


# Tests for Part 2 (a) that I wrote myself
puts
puts "Tests for Part 2 (a) that I wrote myself"
puts 
rps_game_winner([ [ "Tim", "p" ], [ "Jan", "s" ] ]) # => returns the list [ "Jan", "s" ] wins since S>P

# rps_game_winner([ [ "player_1", "Z" ], [ "player_2", "W" ] ]) # Error because of the "Z" and "W"

puts 
rps_game_winner([ [ "player_3", "R" ], [ "player_4", "s" ] ]) # => returns the list ["player_3", "R"] wins since R>S
puts 
rps_game_winner([ [ "player_5", "R" ], [ "player_6", "r" ] ]) # => returns the list ["player_5", "R"] wins since R>R
puts 
rps_game_winner([ [ "player_7", "r" ], [ "player_8", "p" ] ]) # => returns the list [ "player_8", "p" ] wins since P>R
puts 
puts
rps_game_winner([ [ "player_9", "P" ], [ "player_10", "R" ] ]) # => returns the list [ "player_9", "P" ] wins since P>R
puts
rps_game_winner([ [ "player_11", "p" ], [ "player_12", "p" ] ]) # => returns the list [ "player_11", "P" ] wins since P>P
puts
puts
rps_game_winner([ [ "player_13", "s" ], [ "player_14", "r" ] ]) # => returns the list [ "player_14", "r" ] wins since R>S
puts
rps_game_winner([ [ "player_15", "S" ], [ "player_16", "p" ] ]) # => returns the list [ "player_15", "S" ] wins since S>P
puts
rps_game_winner([ [ "player_17", "S" ], [ "player_18", "S" ] ]) # => returns the list [ "player_17", "S" ] wins since S>S



# (b) A rock, paper, scissors tournament is encoded as a bracketed array of games - that is, each element can be considered its own tournament.
# [ [
# [ ["Armando", "P"], ["Dave", "S"] ],
#   [ ["Richard", "R"],  ["Michael", "S"] ],
# ],
# [
#   [ ["Allen", "S"], ["Omer", "P"] ],
#   [ ["David E.", "R"], ["Richard X.", "P"] ]
# ] ]
# Under this scenario, Dave would beat Armando (S>P), Richard would beat Michael (R>S), 
# and then Dave and Richard would play (Richard wins since R>S); 
# similarly, Allen would beat Omer, Richard X would beat David E., 
# and Allen and Richard X. would play (Allen wins since S>P); 
# and finally Richard would beat Allen since R>S, that is, continue until there is only a single winner.
# - Write a method rps_tournament_winner that takes a tournament encoded as a bracketed array and returns the winner 
#   (for the above example, it should return [“Richard”, “R”]).
# - Tournaments can be nested arbitrarily deep, i.e., it may require multiple rounds to get to a single winner. 
#   You can assume that the initial array is well formed 
#   (that is, there are 2^n players, and each one participates in exactly one match per round).


# Part 2 (b), Answer:
puts "Part 2 (b)"

def rps_tournament_winner(tournament)

  puts
  puts "Our tournament is: #{tournament}"
  puts
  
  # if tournament.class == Array # All is fine, continue on
  if (tournament.class == Array && tournament.length == 2) # All is fine, continue on
    if (tournament[0][0].class == String && tournament[0][1].class == String && tournament[1][0].class == String && tournament[1][1].class == String)
      rps_game_winner(tournament)

    else
      first_half = tournament[0]
      second_half = tournament[1]
      
      one_side = rps_tournament_winner(first_half)
      other_side = rps_tournament_winner(second_half)
      
      rps_game_winner([one_side, other_side])
      
    end
    
  
  else # Something went wrong with the input
    puts "Incorrect Input, please try again"
  end
  
end

# Tests given by Part 2 (b)
puts
puts "Tests given by Part 2 (b)"
puts

given_tournament_test = [ [
[ ["Armando", "P"], ["Dave", "S"] ],
  [ ["Richard", "R"],  ["Michael", "S"] ],
],
[
  [ ["Allen", "S"], ["Omer", "P"] ],
  [ ["David E.", "R"], ["Richard X.", "P"] ]
] ]


rps_tournament_winner(given_tournament_test) 
# Note, this outputs ["Omer", "P"] as the winner, as it ends up beating ["Richard X.", "P"], due to it's possitioning, which works out

# Tests for Part 2 (b) that I wrote myself
puts
puts "Tests for Part 2 (b) that I wrote myself"
puts 
rps_tournament_winner([ [ "player_1", "S" ], [ "player_2", "S" ] ]) # => returns the list [ "player_17", "S" ] wins since S>S
puts
puts "Another test, just to make sure."

another_tournament = [
  [ ["Player_1", "R"], ["Player_2", "P"] ],
  [ ["Player_3", "S"], ["Player_4", "P"] ]
] 

rps_tournament_winner(another_tournament) # This should return ["Player_3", "S"] as the winner
puts
wrong_tournament = [
  [ ["Player_5", "P"], ["Player_6", "P"] ],
  [ ["Player_7", "S"] ]
] 

# rps_tournament_winner(wrong_tournament) # This Throws and error, so it can't run

# Part 3
puts "Part 3"

# An anagram is a word obtained by rearranging the letters of another word. 
# For example, "rats", "tars" and "star" are an anagram group because they are made up of the same letters.
# Given an array of strings, write a method that groups them into anagram groups and returns the array of groups. 
# Case doesn't matter in classifying string as anagrams (but case should be preserved in the output), 
# and the order of the anagrams in the groups doesn't matter.
# Example:
# # input: ['cars', 'for', 'potatoes', 'racs', 'four','scar', 'creams', 'scream']
# # => output: [["cars", "racs", "scar"], ["four"], ["for"], ["potatoes"], ["creams", "scream"]]
# # HINT: you can quickly tell if two words are anagrams by sorting their
# # letters, keeping in mind that upper vs lowercase doesn't matter
# def combine_anagrams(words)
# #   <YOUR CODE HERE>
# end

puts "Part 3, Answer"
def combine_anagrams(words)
  
  puts "The Input: "
  print words
  puts
    
  sorted_spelling = Array.new # Create an new, empty array
  words.each do |word|
    downcase_word = word.downcase
    sorted_word = downcase_word.chars.sort.join # I got this code from here: https://stackoverflow.com/questions/9464065/how-to-sort-a-strings-characters-alphabetically
    sorted_spelling.push(sorted_word)
  end
  
  puts "Here is the sorted words (with no capitals): "
  print sorted_spelling
  puts
  
  answerHash = Hash.new
  
  index = 0 # this is the index for the sorted_words_from_sorted_spelling

  while (index <= sorted_spelling.length - 1 &&  sorted_spelling.length == words.length)
    key = sorted_spelling[index]
    value = words[index]
    
    if answerHash[key] == nil
      answerHash[key] = [value]
    else
      answerHash[key] = answerHash[key].push(value)
    end
    index += 1
  end
  
  puts
  puts "In Hash form, the answer is: "
  puts answerHash
  
  final_answer = Array.new

  answerHash.each do |i,j|
    final_answer = final_answer.push(j)
  end
  puts
  puts "The Answer is: "
  print final_answer
  return final_answer
end




# Tests given by Part 3
puts
puts "Tests given by Part 3"
puts
# input: ['cars', 'for', 'potatoes', 'racs', 'four','scar', 'creams', 'scream']
# => output: [["cars", "racs", "scar"], ["four"], ["for"], ["potatoes"], ["creams", "scream"]]
# HINT: you can quickly tell if two words are anagrams by sorting their
# letters, keeping in mind that upper vs lowercase doesn't matter
given_test_for_anagrams = ["cars", "for", "potatoes", "racs", "four", "scar", "creams", "scream"]

combine_anagrams(given_test_for_anagrams)


# Tests for Part 3 that I wrote myself
puts
puts
puts "Tests for Part 3 that I wrote myself"
puts 

no_anagrams = ["a", "Dog", "IS", "GoOd"]
combine_anagrams(no_anagrams)
puts
several_anagrams = ["cat", "tac", "pat", "tap", "apT", "Pta", "Lap"]
combine_anagrams(several_anagrams)



# Part 4
puts "Part 4"
# (a) Create a class Dessert with getters and setters for name and calories. 
# Define instance methods healthy?, 
# which returns true if a dessert has less than 200 calories, 
# and delicious?, which returns true for all desserts.

# Part 4 (a), Answer:
puts
puts "Part 4 (a)"

class Dessert
  # Getters and Setters for name and calories.
  attr_accessor :name 
	attr_accessor :calories 
	
  def initialize(name, calories)
    @name = name
    @calories = calories
  end
  def healthy?
    return (@calories < 200)
  end
  def delicious?
    return true
  end 
end

puts
puts "Testing Problem 4 (a), Desert:"
puts
strawberry = Dessert.new("Strawberry", 100)
puts "strawberry's name is #{strawberry.name} and its calories are #{strawberry.calories}"
puts "strawbery's are health: #{strawberry.healthy?}"
puts "strawbery's are delicious: #{strawberry.delicious?}"
puts "I am changing strawbery's calories from #{strawberry.calories} to #{strawberry.calories = 300}."
puts "strawbery's are still health: #{strawberry.healthy?}"
puts "strawbery's are still delicious: #{strawberry.delicious?}"



# (b) Create a class JellyBean that extends Dessert, and add a getter and setter for flavor. 
# Modify delicious? to return false if the flavor is black licorice 
# (but delicious? should still return true for all other flavors and for all non-JellyBean desserts).

# Part 4 (b), Answer:
puts
puts "Part 4 (b)"

class JellyBean < Dessert
  # Getter and Setter for flavor.
  attr_accessor :flavor 
  
  def initialize(name, calories, flavor)
    super(name, calories)
    @flavor = flavor
  end
  def delicious?
    if (@flavor.downcase == "black licorice" || @flavor.downcase == "blacklicorice" || @flavor.downcase == "black_licorice" || @flavor.downcase == "black-licorice")
      return false
    else
      super
    end
  end 
end

puts
puts "Testing Problem 4 (b), Desert:"
puts
JB = JellyBean.new("Strawberry JellyBean", 100, "Strawberry")
puts "My JB has a flavor of #{JB.flavor}. Its name is #{JB.name}, and its calories are #{JB.calories}."
puts "JB's are health: #{JB.healthy?}"
puts "JB's are delicious: #{JB.delicious?}"
puts
puts "I am changing JB's flavor from #{JB.flavor} to #{JB.flavor = "black licorice"}," 
puts"and its name from #{JB.name} to #{JB.name = "Black Licorice JellyBean"}," 
puts"and its calories from #{JB.calories} to #{JB.calories = 1200}." 
puts "JB's are still health: #{JB.healthy?}"
puts "JB's are still delicious: #{JB.delicious?}"
