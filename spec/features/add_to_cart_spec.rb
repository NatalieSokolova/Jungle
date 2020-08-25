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

  scenario "User adds an item to cart" do
    # ACT
    visit root_path
    expect(page).to have_css("div#navbar", text: "My Cart (0)")
    page.first("article.product").click_on("Add")
    # DEBUG 
    save_screenshot('cart.png')

    # VERIFY
    expect(page).to have_css("div#navbar", text: "My Cart (1)")
  end

end
