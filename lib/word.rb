class Word

  attr_reader(:word, :definitions)

  define_method(:initialize) do |word|
    @word = word
    @definitions = []
  end

  define_method(:add_definition) do |definition|
    # the below line fixes a bug where adding a definition to a word containing a space caused the app to crash
    definition = Definition.new(definition.definition.gsub("%20", ""))
    @definitions.push(definition)
  end

end
