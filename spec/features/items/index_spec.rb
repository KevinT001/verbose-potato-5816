require 'rails_helper' 

RSpec.describe "Items Index spec" do 

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

  it 'When I visit items index page, I see a list of all items, 
  including items name, price and the name of the supermarket it
   belongs to. And the count of customers that bought that item' do 

   visit '/items'

   expect(page).to have_content("#{@item1.name}")
   expect(page).to have_content("#{@item2.name}")
   expect(page).to have_content("#{@item3.name}")
   expect(page).to have_content("#{@item1.price}")
   expect(page).to have_content("#{@item2.price}")
   expect(page).to have_content("#{@item3.price}")
   expect(page).to have_content("#{@item4.price}")

   

  end
end