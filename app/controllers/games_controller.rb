require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = ('a'..'z').to_a.sample(10)
  end

  def score
    @word = params[:word]
    @letters = params[:letters].delete(" ").chars
    if check_valid(@word) && compare(@word, @letters)

    end
  end

  def check_valid(word)
    url = "https://wagon-dictionary.herokuapp.com/#{word}"
    word_hash = URI.open(url).read
    response = JSON.parse(word_hash)
    response['found']
  end

  def compare(word, letters)
    word.chars.each do |letter|
      if word.count(letter) > letters.count(letter)
        return false
      end
    end
    true
  end
end
