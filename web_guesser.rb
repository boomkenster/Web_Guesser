require 'sinatra'
require 'sinatra/reloader'
SECRET_NUMBER = rand(100)

@@guess_count = 5

def check_guess(guess)
    @@guess_count - 1
    case
    # when @@guess_count == 0
    #   @guess_count = 5
    when guess.to_i == SECRET_NUMBER
      "You got it right!"
    when guess.to_i > SECRET_NUMBER + 5
      "Way Too High"
    when guess.to_i < SECRET_NUMBER - 5
      "Way Too Low"
    when guess.to_i > SECRET_NUMBER
      "Too High"
    else guess.to_i < SECRET_NUMBER
      "Too Low"
    end
end


get '/' do
  guess = params["guess"]
  cheat = params["cheat"]
  message = check_guess(guess)

  erb :index, :locals => {:guess => guess.to_i, :number => SECRET_NUMBER, :message => message, :cheat => cheat}
end
