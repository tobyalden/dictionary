require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('./lib/definition')
also_reload("lib/**/*.rb")

get('/') do
  dictionary = Dictionary.load()
  erb(:index)
end

post('/add_word') do
  dictionary = Dictionary.load()
  dictionary.add_word(Word.new(param.fetch('new_word')))
  dictionary.save()
  erb(:index)
end
