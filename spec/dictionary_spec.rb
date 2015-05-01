require('rspec')
require('dictionary')

describe(Dictionary) do

  describe(:initialize) do
    it("will initialize a new dictionary with an empty list of words") do
      test_dictionary = Dictionary.new()
      expect(test_dictionary.words).to(eq([]))
    end
  end

end
