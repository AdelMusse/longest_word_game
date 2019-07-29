class GamesController < ApplicationController
  def new
    array=('A'..'Z').to_a
    @letters = array.sample(10)
  end

  def score
    
    @input_word = params["words"].downcase
    @dictionary_url = "https://recode-dictionary.herokuapp.com/#{@input_word}"
    @response = HTTParty.get(@dictionary_url)
    @rand_letters = params["alphabet"].downcase.split()
    # byebug
    if !@input_word.split("").all? { |e| @rand_letters.include?(e)} && @response["found"] == true
      @message = "#{@input_word} is not included"
    elsif @input_word.split("").all? { |e| @rand_letters.include?(e)} && @response["found"] != true
      @message = "The word is not valid in English"
    elsif @input_word.split("").all? { |e| @rand_letters.include?(e)} && @response["found"] == true
      @message = "Congrats you won!"
    # if !@rand_letters.include?(@input_word.split) 
    #     @message = "#{@input_word} is not included"
    # elsif @response["found"] != true && @rand_letters.include?(@input_word.split)
    #     @message = "The word is not valid in English"
    # elsif @response["found"] == true && @rand_letters.include?(@input_word.split)
    #   @message = "Congrats you won!"
    end
  end
end
