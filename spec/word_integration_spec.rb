require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe("the path to the index page", {:type => :feature}) do
  it("displays a page listing all the words the user has added to the dictionary") do
    visit('/')
    expect(page).to(have_content("List of words:"))
  end
end
