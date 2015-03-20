require 'sinatra'
require 'sinatra/reloader'


get '/' do
  "Hello, World!"
  "Your secret number is #{rand(100)}"
end
