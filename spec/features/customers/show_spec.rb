require 'rails_helper'

RSpec.describe "customer show page" do 

  before :each do 
    @market1 = Supermarket.create!(name: "Illegal goods wholesale", location: "123 Silk Road" )
    @market2 = Supermarket.create!(name: "Costco", location: "999 Sams club way" )

    @customer1 = Customer.create!(name: "Bert")
    @customer1 = Customer.create!(name: "Tom")

    @item1 = @market1.items.create!(name: "DMT", price: 150)
    @item2 = @market1.items.create!(name: "Mushrooms", price: 100)
    @item3 = @market2.items.create!(name: "Potato", price: 100)
    @item4 = @market2.items.create!(name: "Mayo", price: 200)

    CustomerItem.create!(customer_id: @customer1.id, item_id: @item1.id)
    CustomerItem.create!(customer_id: @customer1.id, item_id: @item2.id)
    

  end

  it 'when I visit a customer show page, i see customers name' do 

    visit "/customers/#{@customer1.id}"

    expect(page).to have_content("Tom")
  end

  it 'on customer show page, I see a list of customer items, including name, price and name of supermarket it belongs to ' do 

    visit "customers/#{@customer1.id}"
    save_and_open_page
    expect(page).to have_content("Name: DMT")
    expect(page).to have_content("Price: 150")
    expect(page).to have_content("Market: Illegal goods wholesale")
    expect(page).to_not have_content("#{@item3.name} ")
    expect(page).to_not have_content("#{@market2.name}")
  end


end