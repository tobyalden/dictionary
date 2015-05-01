require('pry')
require('require_all')
require('sinatra')
require('sinatra/reloader')
# require('./lib/word')
# require('./lib/word')
# require('./lib/definition')
require_all('./lib')
also_reload("lib/**/*.rb")

get('/') do
  dictionary = Dictionary.load()
  if(dictionary == nil)
    dictionary = Dictionary.new()
    dictionary.save()
  end
  @words = dictionary.words
  erb(:index)
end

post('/add_word') do
  dictionary = Dictionary.load()
  dictionary.add_word(Word.new(params.fetch('new_word')))
  dictionary.save()
  @words = dictionary.words
  erb(:index)
end

post('/clear_dictionary') do
  dictionary = Dictionary.new()
  dictionary.save()
  @words = dictionary.words
  erb(:index)
end

get('/word/:word') do
  dictionary = Dictionary.load()
  @word = dictionary.get_word(params.fetch('word'))
  erb(:word)
end

post('/add_definition') do
  dictionary = Dictionary.load()
  @word = dictionary.get_word(params.fetch('word'))
  @word.add_definition(Definition.new(params.fetch('new_definition')))
  dictionary.save()
  erb(:word)
end
