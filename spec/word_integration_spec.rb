require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe("integration specs for web front-end") do

  before() do
    Dictionary.clear()
  end

  describe("the path to the index page", {:type => :feature}) do
    it("displays a page listing all the words the user has added to the dictionary") do
      visit('/')
      expect(page).to(have_content("List of words:"))
    end
  end

  describe("adding a new word from the index page", {:type => :feature}) do
    it("displays a page listing all the words the user has added to the dictionary, a form to enter a new word, and a button that will reload the page with the new word added to the list") do
      visit('/')
      fill_in('new_word', :with => 'garrulous')
      click_button('add_word')
      expect(page).to(have_content('garrulous'))
    end
  end

end
