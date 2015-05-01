class Dictionary

  @@words_global = nil

  attr_reader(:words)

  define_method(:initialize) do
    @words = []
  end

  define_singleton_method(:load) do
    return @@words_global
  end

  define_singleton_method(:clear) do
    @@words_global = Dictionary.new()
  end

  define_method(:save) do
    @@words_global = self
  end

  define_method(:add_word) do |word|
    @words.push(word)
  end

  define_method(:get_word) do |find_word|
    @words.each() do |word|
      if(word.word == find_word)
        return word
      else
        return nil
      end
    end
  end


end
