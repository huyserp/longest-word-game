require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = Array.new(10) { ('A'..'Z').to_a.sample }
  end

  def score
    @guess = params[:word].upcase
    @letters = params[:letters]
    @valid_with_grid = word_in_grid?(@guess, @letters)
    @valid_english = check_dictionary(@guess)
  end

  private

  def word_in_grid?(guess, letters)
    guess.chars.all? { |letter| guess.count(letter) <= letters.count(letter) }
  end

  def check_dictionary(word)
    url = "https://wagon-dictionary.herokuapp.com/#{word.downcase}"
    dictionary = JSON.parse(open(url).read)
    dictionary['found']
  end

  # def check_results; end
end
