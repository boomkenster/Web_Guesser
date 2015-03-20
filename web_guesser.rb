require 'sinatra'
require 'sinatra/reloader'
SECRET_NUMBER = rand(100)

def check_guess(guess)
  case
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
  message = check_guess(guess)
  erb :index, :locals => {:number => SECRET_NUMBER, :message => message}
end
