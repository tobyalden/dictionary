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

  describe("the path to a page for a specific word", {:type => :feature}) do
    it("displays a page listing all the words the user has added to the dictionary, each of which is a link to that word's page") do
      visit('/')
      fill_in('new_word', :with => 'garrulous')
      click_button('add_word')
      click_link('garrulous')
      expect(page).to(have_content('garrulous'))
    end
  end

  describe("adding a new definition from a word's page", {:type => :feature}) do
    it("displays a page listing all the dictionary's words, each of which is a link to that word's page, which contains a list of definitions, a form to enter a new definition, and a button that will reload the word's page with the new definition added to its list") do
      visit('/')
      fill_in('new_word', :with => 'garrulous')
      click_button('add_word')
      click_link('garrulous')
      fill_in('new_definition', :with => 'excessively talkative, esp. on trivial matters')
      click_button('add_definition')
      expect(page).to(have_content('excessively talkative, esp. on trivial matters'))
    end
  end

end
