require 'rails_helper'

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    # populates testing db with data
    10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "User sees all products" do
    # ACT
    visit root_path

    # DEBUG / VERIFY
    # naming a screenshot => each time test runs, the img is overriden
    save_screenshot('homepage.png')

    expect(page).to have_css 'article.product', count: 10
  end

end
