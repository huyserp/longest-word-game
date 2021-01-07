class GamesController < ApplicationController
  def new
    @letters = Array.new(10) { ('A'..'Z').to_a.sample }
  end

  def score
    @guess = params[:word].upcase
    @letters = params[:letters]
    valid_with_grid = word_in_grid?(@guess, @letters) ? "valid" : "not valid"
  end

  private

  def word_in_grid?(guess, letters)
    guess.chars.all? { |letter| guess.count(letter) <= letters.count(letter) }
  end

  def check_dictionary
  end

  def check_results
  end
end
# def score
#     @guess = params[:word]
#     @letters = params[:letters].downcase
#     if @guess.chars.all? { |letter| @guess.count(letter) <= @letters.count(letter) }
#       @score = "Well done!"
#     else
#       @score = "Try again!"
#     end
#   end
# end
